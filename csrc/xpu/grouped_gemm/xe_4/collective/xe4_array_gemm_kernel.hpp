#pragma once

#include "cutlass/cutlass.h"
#include "xe4_tile_scheduler_group.hpp"
#include "../collective/xe4_array_mma_mainloop.hpp"

/* #define Dynamic */

namespace cutlass::xe4_grouped_gemm::kernel {

template <
    class ProblemShape_,
    class CollectiveMainloop_,
    class CollectiveEpilogue_,
    class TileScheduler_>
class XE4GemmUniversal {
 public:
  using ProblemShape = ProblemShape_;
  using ClusterShape = Shape<_1, _1, _1>;
  using ProblemShapeMNKL = Shape<int, int, int, int>;

  using CollectiveMainloop = CollectiveMainloop_;
  using TileShape = typename CollectiveMainloop::TileShape;
  using ElementA = typename CollectiveMainloop::ElementA;
  using ElementB = typename CollectiveMainloop::ElementB;
  using StrideA = typename CollectiveMainloop::StrideA;
  using StrideB = typename CollectiveMainloop::StrideB;
  using InternalStrideA = typename CollectiveMainloop::InternalStrideA;
  using InternalStrideB = typename CollectiveMainloop::InternalStrideB;

  static constexpr int SgSize = CollectiveMainloop::sg_size;

  using MainloopPipeline = typename CollectiveMainloop::MainloopPipeline;
  using PipelineState = typename CollectiveMainloop::PipelineState;

  static constexpr int NumLoadWarps = CollectiveMainloop::NumLoadWarps;
  static constexpr int NumMMAWarps = CollectiveMainloop::NumMMAWarps;
  static constexpr int AllNumWarps = NumLoadWarps + NumMMAWarps;

  using CollectiveEpilogue = CollectiveEpilogue_;
  using StrideD = typename CollectiveEpilogue::StrideD;
  using InternalStrideD = typename CollectiveEpilogue::InternalStrideD;

  using TileScheduler = TileScheduler_;
  using TileSchedulerArguments = typename TileScheduler::Arguments;
  using TileSchedulerParams = typename TileScheduler::Params;

  using MainloopTensors = typename CollectiveMainloop::MainloopTensors;
  using EpilogueTensors = typename CollectiveEpilogue::EpilogueTensors;

  // shared memory storage
  struct SharedStorage {
    struct TensorStorage {
      using MainloopTensorStorage = typename CollectiveMainloop::TensorStorage;
      using EpilogueTensorStorage = typename CollectiveEpilogue::TensorStorage;

      MainloopTensorStorage mainloop;
      EpilogueTensorStorage epilogue;

#ifdef Dynamic
      using TileSchedulerStorage = typename TileScheduler::SLMStorage;
      TileSchedulerStorage scheduler;
#endif
    };
    struct PipelineStorage {
      using MainloopPipelineStorage =
          typename CollectiveMainloop::PipelineStorage;
      using EpiloguePipelineStorage =
          typename CollectiveEpilogue::PipelineStorage;

      MainloopPipelineStorage mainloop;
      EpiloguePipelineStorage epilogue;
    };
  };

  static constexpr int TensorStorageSize =
      sizeof(typename SharedStorage::TensorStorage);
  static constexpr int PipelineStorageSize =
      sizeof(typename SharedStorage::PipelineStorage);

  struct Arguments {
    typename CollectiveMainloop::Arguments mainloop{};
    typename CollectiveEpilogue::Arguments epilogue{};
    const int64_t* expert_first_token_offset{nullptr};
    int64_t N;
    int64_t K;
    int64_t groups;
    KernelHardwareInfo hw_info{};
    TileSchedulerArguments scheduler{};
  };

  struct Params {
    typename CollectiveMainloop::Params mainloop;
    typename CollectiveEpilogue::Params epilogue;
    KernelHardwareInfo hw_info{};
    TileSchedulerParams scheduler{};
    const int64_t* expert_first_token_offset{nullptr};
    int64_t N;
    int64_t K;
    int64_t groups;
  };

  static Params to_underlying_arguments(Arguments const& args) {
    int sm_count = args.hw_info.sm_count;

    KernelHardwareInfo hw_info{args.hw_info.device_id, sm_count};

    TileSchedulerParams scheduler = TileScheduler::to_underlying_arguments(
        TileShape{}, ClusterShape{}, hw_info, args.scheduler);

    return {
        CollectiveMainloop::to_underlying_arguments(args.mainloop),
        CollectiveEpilogue::template to_underlying_arguments<ProblemShape>(
            args.epilogue),
        hw_info,
        scheduler,
        args.expert_first_token_offset,
        args.N,
        args.K,
        args.groups};
  }

  static dim3 get_grid_shape(Params const& params) {
    // Given device SM count, set grid size s.t. we do not launch more thread
    // blocks than we can run concurrently
    TileSchedulerArguments args{};

    args.raster_order = params.scheduler.group_params.raster_order_ ==
                                TileScheduler::RasterOrder::AlongN
                            ? TileScheduler::RasterOrderOptions::AlongN
                            : TileScheduler::RasterOrderOptions::AlongM;

    return TileScheduler::get_grid_shape(
        params.scheduler, TileShape{}, ClusterShape{}, params.hw_info, args);
  }

  static dim3 get_block_shape() { return dim3(SgSize, AllNumWarps, 1); }

  CUTLASS_DEVICE
  void operator()(Params const& params) const {
    static_assert(
        cute::rank(InternalStrideA{}) == 3,
        "StrideA must be rank-3: [M, K, L]. If batch mode is not needed, set L "
        "stride to Int<0>.");
    static_assert(
        cute::rank(InternalStrideB{}) == 3,
        "StrideB must be rank-3: [N, K, L]. If batch mode is not needed, set L "
        "stride to Int<0>.");
    static_assert(
        cute::rank(InternalStrideD{}) == 3,
        "StrideD must be rank-3: [M, N, L]. If batch mode is not needed, set L "
        "stride to Int<0>.");

    TileScheduler scheduler{
        params.scheduler,
        params.expert_first_token_offset,
        params.N,
        params.K,
        params.groups};
    const int32_t N = params.N;
    const int32_t K = params.K;
    // Get current work_tile for current cta
    auto work_tile_info = scheduler.initial_work_tile_info(ClusterShape{});

    bool did_group_change = true;
    int32_t curr_group = -1;

    ProblemShapeMNKL problem_shape_MNKL;

    MainloopTensors AB_tensors;
    EpilogueTensors CD_tensors;

    CollectiveMainloop collective_mainloop;
    CollectiveEpilogue collective_epilogue{params.epilogue};

    if (work_tile_info.is_valid()) {
      curr_group = work_tile_info.L_idx;
      auto M_ = static_cast<int>(
          params.expert_first_token_offset[curr_group + 1] -
          params.expert_first_token_offset[curr_group]);
      problem_shape_MNKL = append<4>(Shape<int, int, int>{M_, N, K}, 1);
    }

    // Allocate shared memory
    auto item = sycl::ext::oneapi::this_work_item::get_nd_item<3>();
    auto slm_ptr =
        alloc_slm_buffer<uint8_t, TensorStorageSize>(item.get_group());
    auto& shared_tensors =
        *reinterpret_cast<typename SharedStorage::TensorStorage*>(slm_ptr);

#ifdef Dynamic
    int32_t* shared_counter = shared_tensors.scheduler.smem_counter.data();
    if (item.get_local_linear_id() == 0) {
      shared_counter[0] = 0;
      shared_counter[1] = 0;
    }
    item.barrier(sycl::access::fence_space::local_space);
#endif

    // Allocate pipeline storage
    auto abar_base = allocate_abar_bytes<0, PipelineStorageSize>();
    auto& shared_pipelines =
        *reinterpret_cast<typename SharedStorage::PipelineStorage*>(abar_base);

    while (work_tile_info.is_valid()) {
      auto m_coord = work_tile_info.M_idx;
      auto n_coord = work_tile_info.N_idx;
      auto block_coord = make_coord(m_coord, n_coord, _, 0);

      uint32_t sg_id = get_sg_id();
      bool lane_predicate = cute::elect_one_sync();

      // Allocate matrix descriptor
      auto tdesc_a = allocate_tdesc<0>();
      auto tdesc_b = allocate_tdesc<1>();
      auto tdesc_d = allocate_tdesc<2>();

      typename MainloopPipeline::Params pipeline_a_params;
      pipeline_a_params.transaction_bytes =
          CollectiveMainloop::TmaTransactionBytesA;
      if (sg_id == 0) {
        pipeline_a_params.role = MainloopPipeline::ThreadCategory::Producer;
      } else if (sg_id == 1) {
        pipeline_a_params.role = MainloopPipeline::ThreadCategory::Consumer;
      }
      pipeline_a_params.is_leader = lane_predicate && sg_id == 0;
      pipeline_a_params.num_producers = 1;
      pipeline_a_params.num_consumers = 1;
      MainloopPipeline pipeline_a = MainloopPipeline(
          shared_pipelines.mainloop.storage_A,
          pipeline_a_params,
          ClusterShape{});

      typename MainloopPipeline::Params pipeline_b_params;
      pipeline_b_params.transaction_bytes =
          CollectiveMainloop::TmaTransactionBytesB;
      if (sg_id == 0) {
        pipeline_b_params.role = MainloopPipeline::ThreadCategory::Producer;
      } else if (sg_id == 1) {
        pipeline_b_params.role = MainloopPipeline::ThreadCategory::Consumer;
      }
      pipeline_b_params.is_leader = lane_predicate && sg_id == 0;
      pipeline_b_params.num_producers = 1;
      pipeline_b_params.num_consumers = 1;

      MainloopPipeline pipeline_b = MainloopPipeline(
          shared_pipelines.mainloop.storage_B,
          pipeline_b_params,
          ClusterShape{});

      // number of k tiles along K Dim for pipeline
      int num_k_tiles = cute::ceil_div(
          get<2>(problem_shape_MNKL),
          size<2>(typename CollectiveMainloop::TileShape{}));

      // Initialize abarriers
      if (sg_id == 0 && lane_predicate) {
        shared_pipelines.epilogue.barrier_D.init(/*arrival_count=*/1);
        shared_pipelines.mainloop.barrier_D.init(/*arrival_count=*/1);
      }
      item.barrier(sycl::access::fence_space::local_space);

      if (sg_id == 0) {  // Producer
        if (did_group_change) {
          AB_tensors = collective_mainloop.update_tensor_shape_stride(
              params.mainloop,
              curr_group,
              problem_shape_MNKL,
              params.expert_first_token_offset);
        }

        PipelineState smem_pipe_write_a =
            cutlass::make_producer_start_state<MainloopPipeline>();
        PipelineState smem_pipe_write_b =
            cutlass::make_producer_start_state<MainloopPipeline>();

        collective_mainloop.load(
            params.mainloop,
            shared_tensors.mainloop,
            shared_pipelines.mainloop,
            make_tuple(tdesc_a, tdesc_b),
            block_coord,
            num_k_tiles,
            pipeline_a,
            smem_pipe_write_a,
            pipeline_b,
            smem_pipe_write_b,
            AB_tensors,
            problem_shape_MNKL);
      } else if (sg_id == 1) {  // consumer
        PipelineState smem_pipe_read_a;
        PipelineState smem_pipe_read_b;

        collective_mainloop.mma(
            params.mainloop,
            shared_tensors.mainloop,
            shared_tensors.epilogue,
            shared_pipelines.mainloop,
            num_k_tiles,
            pipeline_a,
            smem_pipe_read_a,
            pipeline_b,
            smem_pipe_read_b);

        if (did_group_change) {
          CD_tensors = collective_epilogue.update_tensor_shape_stride(
              curr_group, problem_shape_MNKL, params.expert_first_token_offset);
          did_group_change = false;
        }

        collective_epilogue.store(
            params.epilogue,
            shared_tensors.epilogue,
            shared_pipelines.epilogue,
            make_tuple(tdesc_d),
            block_coord,
            CD_tensors,
            problem_shape_MNKL);
      }
      // Get next work tile
#ifdef Dynamic
      auto next_work_tile_info =
          scheduler.fetch_next_work(work_tile_info, shared_counter, 4);
#else
      auto next_work_tile_info = scheduler.fetch_next_work(work_tile_info);
#endif
      work_tile_info = next_work_tile_info;

      did_group_change = curr_group != work_tile_info.L_idx;
      if (did_group_change && work_tile_info.is_valid()) {
        curr_group = work_tile_info.L_idx;
        auto M_ = static_cast<int>(
            params.expert_first_token_offset[curr_group + 1] -
            params.expert_first_token_offset[curr_group]);
        problem_shape_MNKL = append<4>(Shape<int, int, int>{M_, N, K}, 1);
      }
    }
  }
};
}  // namespace cutlass::xe4_grouped_gemm::kernel
