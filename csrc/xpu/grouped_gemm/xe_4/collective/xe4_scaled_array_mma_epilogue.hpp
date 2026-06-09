#pragma once

#include <sycl/sycl.hpp>
#include "cutlass/cutlass.h"

namespace cutlass::xe4_scaled_grouped_gemm::collective {

template <
  class ProblemShape_,
  class TileShape_,
  class ElementOutput_,
  class StrideD_,
  class SmemLayoutOutput_,
  class TMACopyAtomD_>
class XE4CollectiveEpilogue {
public:

  using ProblemShape = ProblemShape_;
  using TileShape = TileShape_;

  using ElementOutput = ElementOutput_;
  using StrideD = StrideD_;
  using SmemLayoutOutput = SmemLayoutOutput_;

  using ElementD = ElementOutput_;
  using InternalStrideD = cute::remove_pointer_t<StrideD>;
  using TensorD = decltype(make_tensor(make_gmem_ptr(static_cast<ElementD const*>(nullptr)),  make_shape(0,0,0), InternalStrideD{}));
  using EpilogueTensors = TensorD;

  using TMACopyAtomD = TMACopyAtomD_;
  using TMA_D = decltype(make_adma_copy(
    TMACopyAtomD{},
    TensorD{},
    SmemLayoutOutput{}(_, _, cute::Int<0>{}),
    select<0, 1>(TileShape{}),
    _1{}
  ));

  static constexpr size_t SmemAlignment = 512;
  struct SharedStorage
  {
    struct TensorStorage : cute::aligned_struct<SmemAlignment, _0>
    {
      cute::array_aligned<ElementOutput, cute::cosize_v<SmemLayoutOutput>, SmemAlignment> smem_D;
    };
    struct PipelineStorage {
      cutlass::arch::ClusterTransactionBarrier barrier_D;
    };
  };

  using TensorStorage = typename SharedStorage::TensorStorage;
  using PipelineStorage = typename SharedStorage::PipelineStorage;

  static constexpr uint32_t TmaTransactionBytesD = sizeof(TensorStorage::smem_D) / 2;

  // Host side epilogue arguments
  struct Arguments {
    ElementOutput const* ptr_D;
    int64_t N;
  };

  // Device side epilogue params
  struct Params {
    ElementD const* ptr_D;
    int64_t N;
    TMA_D tma_store_D;
  };

  template <class ProblemShape>
  static constexpr Params to_underlying_arguments(
    ProblemShape const& /*problem_shape*/,
    Arguments const& args)
  {
    return {args.ptr_D, args.N, {}};
  }

  CUTLASS_HOST_DEVICE
  XE4CollectiveEpilogue(Params const& params_) : params(params_) {}

  template <typename TensorStorage, typename MainloopPipelineStorage, typename DescTuple, typename BlockCoord, class LoadStoreTensor, typename ProblemShape_MNKL, typename MainloopPipeline, typename PipelineState>
  CUTLASS_DEVICE void store(
    Params const& params,
    TensorStorage& shared_tensors,
    PipelineStorage& shared_pipelines,
    MainloopPipelineStorage& mainloop_shared_pipelines,
    DescTuple const& tdesc_tuple,
    BlockCoord const& block_coord,
    LoadStoreTensor const& store_tensor, ProblemShape_MNKL const& problem_shape_MNKL,
    MainloopPipeline pipeline_d, PipelineState& smem_pipe_read_d,
    uint32_t num_k_tiles)
  {
    bool lane_predicate = cute::elect_one_sync();
    uint32_t sg_id = get_sg_id();

    if (lane_predicate) {
      auto [M, N, K, L] = problem_shape_MNKL;

      cute::update_gmem_details_and_params(
        params.tma_store_D,
        store_tensor,
        SmemLayoutOutput{},
        TileShape{});

      auto blk_m_coord = get<0>(block_coord); // blk_m_idx
      auto blk_n_coord = get<1>(block_coord); // blk_n_idx
      auto blk_l_coord = get<2>(block_coord); // blk_l_idx

      // Initialize matrix descriptor
      auto [tdesc_d] = tdesc_tuple;
      params.tma_store_D.set_tensor_desc(tdesc_d);

      Tensor mD_mnl = params.tma_store_D.get_tma_tensor(make_shape(M, N, L)); // (M,N,L)

      Tensor gD = local_tile(mD_mnl(_, _, 0), TileShape{},
        make_coord(blk_m_coord, blk_n_coord, _), Step<_1, _1, X>{}); // (BLK_M,BLK_N)

      Tensor sD = make_tensor(make_smem_ptr(shared_tensors.smem_D.data()), SmemLayoutOutput{}); // (BLK_M,BLK_N,PIPE)

      auto [tOgD, tOsD] = tma_partition(params.tma_store_D, _0{}, Layout<_1>{},
                                        group_modes<0, 2>(sD), group_modes<0, 2>(gD)); // (TMA, 1), (TMA, PIPE)

      pipeline_d.consumer_wait(smem_pipe_read_d);

      constexpr uint32_t mcast_mask = 0;
      copy(params.tma_store_D.with(
           pipeline_d.consumer_get_barrier(smem_pipe_read_d), mcast_mask),
           tOsD(_, smem_pipe_read_d.index()), tOgD);

      pipeline_d.consumer_commit(smem_pipe_read_d, TmaTransactionBytesD);
      ++smem_pipe_read_d;
    }
  }

  template <typename ProblemShape_MNKL>
  CUTLASS_DEVICE auto update_tensor_shape_stride(
    int32_t const& next_group,
    ProblemShape_MNKL const& problem_shape_mnkl,
    int64_t expert_first_token_offset) {
      auto [M, N, K, L] = problem_shape_mnkl;

      constexpr int D_bits = cute::sizeof_bits_v<ElementD>;
      const int64_t off_D_bytes = expert_first_token_offset * int64_t(N) * D_bits / 8;
      ElementD const* ptr_D_curr_batch = reinterpret_cast<ElementD const*>(
          reinterpret_cast<const char*>(params.ptr_D) + off_D_bytes);

      auto stride_D = cutlass::make_cute_packed_stride(InternalStrideD{}, {M, N, 1});
      TensorD mD_mnl = make_tensor(make_gmem_ptr(ptr_D_curr_batch),
                                   make_layout(make_shape(M, N, L), stride_D));
      return mD_mnl;
  }

private:
  Params const &params;
};

} // namespace cutlass::xe4_scaled_grouped_gemm::collective
