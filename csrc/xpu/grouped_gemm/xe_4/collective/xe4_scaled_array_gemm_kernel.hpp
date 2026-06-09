#pragma once

#include "cutlass/cutlass.h"
#include "xe4_scaled_tile_scheduler_group.hpp"
#include "xe4_scaled_array_mma_mainloop.hpp"

namespace cutlass::xe4_scaled_grouped_gemm::kernel {

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
  using ElementAccum = typename CollectiveMainloop::ElementAccum;
  using ElementSFA = typename CollectiveMainloop::ElementSFA;
  using ElementSFB = typename CollectiveMainloop::ElementSFB;
  using StrideSFA = typename CollectiveMainloop::StrideSFA;
  using StrideSFB = typename CollectiveMainloop::StrideSFB;
  using StrideA = typename CollectiveMainloop::StrideA;
  using StrideB = typename CollectiveMainloop::StrideB;
  using InternalStrideA   = typename CollectiveMainloop::InternalStrideA;
  using InternalStrideB   = typename CollectiveMainloop::InternalStrideB;
  using InternalStrideSFA   = typename CollectiveMainloop::InternalStrideSFA;
  using InternalStrideSFB   = typename CollectiveMainloop::InternalStrideSFB;

  static constexpr int SgSize = CollectiveMainloop::sg_size;

  using MainloopPipeline = typename CollectiveMainloop::MainloopPipeline;
  using PipelineState = typename CollectiveMainloop::PipelineState;

  using MainloopPipelineFetch = typename CollectiveMainloop::MainloopPipelineFetch;
  using PipelineStateFetch = typename CollectiveMainloop::PipelineStateFetch;

  using MainloopPipelineCounter = typename CollectiveMainloop::MainloopPipelineCounter;
  using PipelineStateCounter = typename CollectiveMainloop::PipelineStateCounter;

  static constexpr int NumLoadWarps = CollectiveMainloop::NumLoadWarps;
  static constexpr int NumMMAWarps = CollectiveMainloop::NumMMAWarps;
  static constexpr int NumStoreWarps = 1;
  static constexpr int NumCounterWarps = 1;
  static constexpr int AllNumWarps = NumLoadWarps + NumMMAWarps + NumStoreWarps + NumCounterWarps;

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

      using TileSchedulerStorage = typename TileScheduler::CounterStorage;
      TileSchedulerStorage scheduler;

    };
    struct PipelineStorage {
      using MainloopPipelineStorage = typename CollectiveMainloop::PipelineStorage;
      using EpiloguePipelineStorage = typename CollectiveEpilogue::PipelineStorage;

      MainloopPipelineStorage mainloop;
      EpiloguePipelineStorage epilogue;
    };
  };

  static constexpr int TensorStorageSize = sizeof(typename SharedStorage::TensorStorage);
  static constexpr int PipelineStorageSize = sizeof(typename SharedStorage::PipelineStorage);

  struct Arguments {
    typename CollectiveMainloop::Arguments mainloop{};
    typename CollectiveEpilogue::Arguments epilogue{};
    const int* rows_per_expert{nullptr};
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
    const int* rows_per_expert{nullptr};
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
      CollectiveEpilogue::template to_underlying_arguments<int>(0, args.epilogue),
      hw_info,
      scheduler,
      args.rows_per_expert,
      args.N,
      args.K,
      args.groups
    };
  }

  static dim3 get_grid_shape(Params const& params) {
    TileSchedulerArguments args{};

    args.raster_order = params.scheduler.group_params.raster_order_ == TileScheduler::RasterOrder::AlongN ?
      TileScheduler::RasterOrderOptions::AlongN : TileScheduler::RasterOrderOptions::AlongM;

    return TileScheduler::get_grid_shape(params.scheduler, TileShape{}, ClusterShape{}, params.hw_info, args);
  }

  static dim3 get_block_shape() {
    return dim3(SgSize, AllNumWarps, 1);
  }

  CUTLASS_DEVICE
  void operator()(Params const &params) const {

    static_assert(cute::rank(InternalStrideA{}) == 3, "StrideA must be rank-3: [M, K, L]. If batch mode is not needed, set L stride to Int<0>.");
    static_assert(cute::rank(InternalStrideB{}) == 3, "StrideB must be rank-3: [N, K, L]. If batch mode is not needed, set L stride to Int<0>.");
    static_assert(cute::rank(InternalStrideD{}) == 3, "StrideD must be rank-3: [M, N, L]. If batch mode is not needed, set L stride to Int<0>.");

    auto item = sycl::ext::oneapi::this_work_item::get_nd_item<3>();
    bool lane_predicate = cute::elect_one_sync();
    TileScheduler scheduler{params.scheduler, params.rows_per_expert,
                            params.N, params.K, params.groups};

    typename CollectiveMainloop::Arguments args{};
    //Get current work_tile for current cta
    auto work_tile_info = scheduler.initial_work_tile_info(ClusterShape{});

    bool did_group_change = true;
    int32_t curr_group = -1;
    bool first_wave = true;
    uint32_t global_idx = 0;
    uint32_t local_idx = 0;

    uint32_t sg_id = get_sg_id();

    uint64_t advance_count = 4;

    const int32_t N = params.N;
    const int32_t K = params.K;

    // Running prefix sum of rows_per_expert, advanced lazily as
    // curr_group moves forward (like the bf16 kernel).
    int64_t expert_first_token_offset = 0;
    int32_t offset_group = 0;
    auto advance_offset_to = [&](int32_t target) {
      while (offset_group < target) {
        expert_first_token_offset += params.rows_per_expert[offset_group];
        ++offset_group;
      }
    };

    ProblemShapeMNKL problem_shape_MNKL;

    MainloopTensors AB_tensors;
    EpilogueTensors CD_tensors;

    CollectiveMainloop collective_mainloop;
    CollectiveEpilogue collective_epilogue{params.epilogue};

    if (work_tile_info.is_valid()) {
      curr_group = work_tile_info.L_idx;
      auto M_ = params.rows_per_expert[curr_group];
      problem_shape_MNKL = append<4>(Shape<int, int, int>{M_, N, K}, 1);
    }

    // Allocate shared memory
    auto slm_ptr = alloc_slm_buffer<uint8_t, TensorStorageSize>(item.get_group());
    auto& shared_tensors = *reinterpret_cast<typename SharedStorage::TensorStorage*>(slm_ptr);

    int32_t* shared_counter = shared_tensors.scheduler.smem_counter.data();
    if (item.get_local_linear_id() == 0) {
      shared_counter[0] = 0;
      shared_counter[1] = 0;
      shared_counter[2] = 0;
      shared_counter[3] = 0;
    }
    item.barrier(sycl::access::fence_space::local_space);

    // Allocate pipeline storage
    auto abar_base = allocate_abar_bytes<0, PipelineStorageSize>();
    auto& shared_pipelines = *reinterpret_cast<typename SharedStorage::PipelineStorage*>(abar_base);

    // Allocate matrix descriptor
    auto tdesc_a = allocate_tdesc<0>();
    auto tdesc_b = allocate_tdesc<1>();
    auto tdesc_d = allocate_tdesc<2>();
    auto tdesc_sfa = allocate_tdesc<3>();
    auto tdesc_sfb = allocate_tdesc<4>();

    typename MainloopPipeline::Params pipeline_input_a_params;
    pipeline_input_a_params.transaction_bytes = CollectiveMainloop::TmaTransactionBytesA;
    if (sg_id == 0) {
      pipeline_input_a_params.role = MainloopPipeline::ThreadCategory::Producer;
    }
    else if (sg_id == 1) {
      pipeline_input_a_params.role = MainloopPipeline::ThreadCategory::Consumer;
    }
    pipeline_input_a_params.is_leader = lane_predicate && sg_id == 0;
    pipeline_input_a_params.num_producers = 1;
    pipeline_input_a_params.num_consumers = 1;

    typename MainloopPipeline::Params pipeline_input_b_params = pipeline_input_a_params;
    pipeline_input_b_params.transaction_bytes = CollectiveMainloop::TmaTransactionBytesB;

    MainloopPipeline pipeline_input_a = MainloopPipeline(shared_pipelines.mainloop.storage_input_a, pipeline_input_a_params, /*cluster_shape=*/Shape<_1, _1, _1>{});
    MainloopPipeline pipeline_input_b = MainloopPipeline(shared_pipelines.mainloop.storage_input_b, pipeline_input_b_params, /*cluster_shape=*/Shape<_1, _1, _1>{});
    PipelineState smem_pipe_write_a = cutlass::make_producer_start_state<MainloopPipeline>();
    PipelineState smem_pipe_write_b = cutlass::make_producer_start_state<MainloopPipeline>();
    PipelineState smem_pipe_read_a;
    PipelineState smem_pipe_read_b;

    typename MainloopPipeline::Params pipeline_d_params;
    if (sg_id == 1) {
      pipeline_d_params.role = MainloopPipeline::ThreadCategory::Producer;
    }
    if (sg_id == 2) {
      pipeline_d_params.role = MainloopPipeline::ThreadCategory::Consumer;
    }
    pipeline_d_params.transaction_bytes = 1;
    pipeline_d_params.is_leader = lane_predicate && sg_id == 1;
    pipeline_d_params.num_producers = 1;
    pipeline_d_params.num_consumers = 1;

    int num_k_tiles = cute::ceil_div(get<2>(problem_shape_MNKL), size<2>(typename CollectiveMainloop::TileShape{}));

    MainloopPipeline pipeline_d = MainloopPipeline(shared_pipelines.mainloop.storage_D, pipeline_d_params, ClusterShape{});
    PipelineState smem_pipe_read_d;
    PipelineState smem_pipe_write_d = cutlass::make_producer_start_state<MainloopPipeline>();

    typename MainloopPipelineCounter::Params pipeline_counter_params;
    if (sg_id == 0) {
      pipeline_counter_params.role = MainloopPipelineCounter::ThreadCategory::Consumer;
    }
    else if (sg_id == 3) {
      pipeline_counter_params.role = MainloopPipelineCounter::ThreadCategory::Producer;
    }
    pipeline_counter_params.producer_arv_count = 1;
    pipeline_counter_params.consumer_arv_count = 1;

    typename MainloopPipelineFetch::Params pipeline_fetch_params;
    if (sg_id == 2) {
      pipeline_fetch_params.role = MainloopPipelineFetch::ThreadCategory::Producer;
    }
    else if (sg_id == 3) {
      pipeline_fetch_params.role = MainloopPipelineFetch::ThreadCategory::Consumer;
    }
    pipeline_fetch_params.producer_arv_count = 1;
    pipeline_fetch_params.consumer_arv_count = 1;

    MainloopPipelineFetch pipeline_fetch = MainloopPipelineFetch(shared_pipelines.mainloop.storage_fetch, pipeline_fetch_params);
    MainloopPipelineCounter pipeline_counter = MainloopPipelineCounter(shared_pipelines.mainloop.storage_counter, pipeline_counter_params);
    PipelineStateCounter smem_pipe_write_counter = cutlass::make_producer_start_state<MainloopPipelineCounter>();
    PipelineStateFetch smem_pipe_write_fetch = cutlass::make_producer_start_state<MainloopPipelineFetch>();
    PipelineStateCounter smem_pipe_read_counter_load;
    PipelineStateCounter smem_pipe_read_counter_mma;
    PipelineStateCounter smem_pipe_read_counter_store;
    PipelineStateFetch smem_pipe_read_fetch;

    if (sg_id == 0 && lane_predicate) {
      shared_pipelines.mainloop.barrier_C.init(/*arrival_count=*/1);
    }
    item.barrier(sycl::access::fence_space::local_space);

    while (work_tile_info.is_valid()) {
      auto m_coord = work_tile_info.M_idx;
      auto n_coord = work_tile_info.N_idx;
      auto block_coord = make_coord(m_coord, n_coord, _, 0);

      if (sg_id == 0) { //load
        if(!first_wave){
          if (lane_predicate) {
            pipeline_counter.consumer_wait(smem_pipe_read_counter_load);
            pipeline_counter.consumer_release(smem_pipe_read_counter_load);
            ++smem_pipe_read_counter_load;
          }
        }
        first_wave = false;

        if(did_group_change) {
          advance_offset_to(curr_group);
          AB_tensors = collective_mainloop.update_tensor_shape_stride(
              params.mainloop, curr_group, problem_shape_MNKL,
              expert_first_token_offset);
        }
        collective_mainloop.load(
          params.mainloop,
          args,
          shared_tensors.mainloop,
          make_tuple(tdesc_a, tdesc_b, tdesc_sfa, tdesc_sfb),
          block_coord,
          num_k_tiles,
          pipeline_input_a, smem_pipe_write_a,
          pipeline_input_b, smem_pipe_write_b,
          AB_tensors,
          problem_shape_MNKL
        );
        global_idx = shared_counter[0 + smem_pipe_read_counter_load.index()];
        local_idx = shared_counter[2 + smem_pipe_read_counter_load.index()];
      }

      if (sg_id == 1) { //mma
        collective_mainloop.mma(
          shared_tensors.mainloop,
          shared_tensors.epilogue,
          shared_pipelines.mainloop,
          num_k_tiles,
          pipeline_input_a, smem_pipe_read_a,
          pipeline_input_b, smem_pipe_read_b,
          pipeline_d, smem_pipe_write_d
        );

        global_idx = shared_counter[0 + smem_pipe_read_counter_mma.index()];
        local_idx = shared_counter[2 + smem_pipe_read_counter_mma.index()];

        ++smem_pipe_read_counter_mma;
      }

      if (sg_id == 2) { //store
        if(did_group_change) {
          advance_offset_to(curr_group);
          CD_tensors = collective_epilogue.update_tensor_shape_stride(
              curr_group, problem_shape_MNKL, expert_first_token_offset);
        }

        collective_epilogue.store(
          params.epilogue,
          shared_tensors.epilogue,
          shared_pipelines.epilogue,
          shared_pipelines.mainloop,
          make_tuple(tdesc_d),
          block_coord,
          CD_tensors,
          problem_shape_MNKL,
          pipeline_d, smem_pipe_read_d,
          num_k_tiles
        );

        global_idx = shared_counter[0 + smem_pipe_read_counter_store.index()];
        local_idx = shared_counter[2 + smem_pipe_read_counter_store.index()];

        ++smem_pipe_read_counter_store;
        if (lane_predicate) {
          if (smem_pipe_write_fetch.count() != 0) {
            pipeline_fetch.producer_acquire(smem_pipe_write_fetch);
          }
          pipeline_fetch.producer_commit(smem_pipe_write_fetch);
          ++smem_pipe_write_fetch;
        }
      }
      if(sg_id == 3) { //counter
        if (lane_predicate) {
          pipeline_fetch.consumer_wait(smem_pipe_read_fetch);
          pipeline_fetch.consumer_release(smem_pipe_read_fetch);
          ++smem_pipe_read_fetch;
        }

        collective_mainloop.fetch_next(
          pipeline_counter, smem_pipe_write_counter,
          shared_pipelines.mainloop,
          params.scheduler, shared_counter,
          advance_count);

        global_idx = shared_counter[0 + smem_pipe_write_counter.index()];
        local_idx = shared_counter[2 + smem_pipe_write_counter.index()];

        ++smem_pipe_write_counter;
      }

      scheduler.update_from_shared_counter(global_idx, local_idx);
      work_tile_info = scheduler.fetch_next_work();
      if(sg_id != 3){
        did_group_change = curr_group != work_tile_info.L_idx;
        if(did_group_change && work_tile_info.is_valid()) {
          curr_group = work_tile_info.L_idx;
          auto M_ = params.rows_per_expert[curr_group];
          problem_shape_MNKL = append<4>(Shape<int, int, int>{M_, N, K}, 1);
        }
      }
    }
  }
};
} // namespace cutlass::xe4_scaled_grouped_gemm::kernel
