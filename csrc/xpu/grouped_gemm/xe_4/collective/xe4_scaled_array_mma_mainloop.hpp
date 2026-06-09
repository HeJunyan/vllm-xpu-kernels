#pragma once

#include "cutlass/cutlass.h"
#include "cutlass/arch/barrier.h"
#include "cutlass/detail/xe4_blockscaled_layout.hpp"
#include "cutlass/gemm/collective/collective_mma.hpp"

namespace cutlass::xe4_scaled_grouped_gemm::collective {

using namespace cute;
using namespace sycl;
using sycl::ext::oneapi::this_work_item::get_nd_item;
using cutlass::detail::Xe4BlockScaledConfig;

template <
  class ProblemShape_,
  class TileShape_,
  class ElementA_,
  class ElementB_,
  class ElementAccum_,
  class ElementOutput_,
  class ElementSF_,
  class BlockScaleType_,
  class StrideA_,
  class StrideB_,
  class StrideSFA_,
  class StrideSFB_,
  class TiledMma_,
  class SmemLayoutA_,
  class SmemLayoutB_,
  class SmemLayoutAccum_,
  class SmemLayoutOutput_,
  class SmemLayoutSFA_,
  class SmemLayoutSFB_,
  class TMACopyAtomA_,
  class TMACopyAtomB_,
  class TMACopyAtomSFA_,
  class TMACopyAtomSFB_,
  int SFVecSize_>
struct XE4CollectiveMma {

  using ProblemShape = ProblemShape_;
  using TileShape = TileShape_; // <BLK_M, BLK_N, BLK_K>

  using ElementA = ElementA_;
  using ElementB = ElementB_;
  using ElementAccum = ElementAccum_;
  using ElementOutput = ElementOutput_;
  using ElementSFA = ElementSF_;
  using ElementSFB = ElementSF_;
  using BlockScaleType = BlockScaleType_;

  static constexpr int SFVecSize = SFVecSize_;

  using StrideA = StrideA_;
  using StrideB = StrideB_;
  using StrideSFA = StrideSFA_;
  using StrideSFB = StrideSFB_;

  using InternalStrideA = cute::remove_pointer_t<StrideA>;
  using InternalStrideB = cute::remove_pointer_t<StrideB>;
  using InternalStrideSFA = cute::remove_pointer_t<StrideSFA>;
  using InternalStrideSFB = cute::remove_pointer_t<StrideSFB>;
  using TensorMKL = decltype(make_tensor(make_gmem_ptr(static_cast<ElementA const*>(nullptr)), repeat_like(InternalStrideA{}, int32_t(0)), InternalStrideA{}));
  using TensorNKL = decltype(make_tensor(make_gmem_ptr(static_cast<ElementB const*>(nullptr)), repeat_like(InternalStrideB{}, int32_t(0)), InternalStrideB{}));

  using Xe4BlkScaledCfg = cutlass::detail::Xe4BlockScaledConfig<SFVecSize>;
  using BlkScaledConfig = detail::Xe4BlockScaledConfig<SFVecSize>;

  using TensorSFA = decltype(make_tensor(make_gmem_ptr(static_cast<ElementSFA const*>(nullptr)), Xe4BlkScaledCfg::tile_atom_to_shape_SFA(make_shape(int32_t(0), int32_t(0), int32_t(0)))));
  using TensorSFB = decltype(make_tensor(make_gmem_ptr(static_cast<ElementSFB const*>(nullptr)), Xe4BlkScaledCfg::tile_atom_to_shape_SFB(make_shape(int32_t(0), int32_t(0), int32_t(0)))));

  using MainloopTensors = cute::tuple<TensorMKL, TensorNKL, TensorSFA, TensorSFB>;

  using TiledMma = TiledMma_;

  using SmemLayoutA = SmemLayoutA_;
  using SmemLayoutB = SmemLayoutB_;
  using SmemLayoutSFA = SmemLayoutSFA_;
  using SmemLayoutSFB = SmemLayoutSFB_;
  using SmemLayoutAccum = SmemLayoutAccum_;
  using SmemLayoutOutput = SmemLayoutOutput_;

  using TMACopyAtomA = TMACopyAtomA_;
  using TMACopyAtomB = TMACopyAtomB_;
  using TMACopyAtomSFA = TMACopyAtomSFA_;
  using TMACopyAtomSFB = TMACopyAtomSFB_;

  static constexpr uint32_t sg_size = cutlass::NumThreadsPerWarp;

  static constexpr uint32_t PipelineStages = 2;
  using MainloopPipeline = cutlass::PipelineTmaAsync<PipelineStages>;
  using PipelineState = typename cutlass::PipelineState<PipelineStages>;

  static constexpr uint32_t PipelineStagesCounter = 2;
  using MainloopPipelineCounter = cutlass::PipelineAsync<PipelineStagesCounter>;
  using PipelineStateCounter = typename cutlass::PipelineState<PipelineStagesCounter>;

  static constexpr uint32_t PipelineStagesAtomic = 2;
  using MainloopPipelineFetch = cutlass::PipelineAsync<PipelineStagesAtomic>;
  using PipelineStateFetch = typename MainloopPipelineFetch::PipelineState;

  static constexpr int NumLoadWarps = 1;
  static constexpr int NumMMAWarps = 1;

  static constexpr auto PIPE = Int<PipelineStages>{};

  // ---- Tile and cluster shapes ----
  using ClusterShape = cute::Shape<cute::_1, cute::_1, cute::_1>;
  using ClusterLayout_MNK = decltype(tiled_divide(make_layout(ClusterShape{}),
                                                     make_tile(typename TiledMma::AtomThrID{})));
  using TMA_A = decltype(make_adma_atom_A_xe4(
    TMACopyAtomA{},
    TensorMKL{},
    SmemLayoutA{}(_, _, cute::Int<0>{}),
    TileShape{},
    TiledMma{}, ClusterLayout_MNK{}));

  using TMA_B = decltype(make_adma_atom_B_xe4(
    TMACopyAtomB{},
    TensorNKL{},
    SmemLayoutB{}(_, _, cute::Int<0>{}),
    TileShape{},
    TiledMma{}, ClusterLayout_MNK{}));

  using TMA_SFA = decltype(make_adma_atom_A_xe4(
    TMACopyAtomSFA{},
    TensorSFA{},
    SmemLayoutSFA{}(_, _, _, cute::Int<0>{}),
    TileShape{},
    TiledMma{}, ClusterLayout_MNK{}));

  using TMA_SFB = decltype(make_adma_atom_B_xe4(
    TMACopyAtomSFB{},
    TensorSFB{},
    SmemLayoutSFB{}(_, _, _, cute::Int<0>{}),
    TileShape{},
    TiledMma{}, ClusterLayout_MNK{}));

  static constexpr size_t SmemAlignment = 512; // Minimum 512-byte alignment recommended by HW spec
  struct SharedStorage
  {
    struct TensorStorage : cute::aligned_struct<SmemAlignment, _0>
    {
      cute::array_aligned<uint8_t, (cute::cosize_v<SmemLayoutA> * cutlass::sizeof_bits<ElementA>::value + 7) / 8, SmemAlignment> smem_A;
      cute::array_aligned<uint8_t, (cute::cosize_v<SmemLayoutB> * cutlass::sizeof_bits<ElementB>::value + 7) / 8, SmemAlignment> smem_B;
      cute::array_aligned<ElementAccum, cute::cosize_v<SmemLayoutAccum>, SmemAlignment> smem_C;

      // Scale factor buffers
      cute::array_aligned<ElementSFA, cute::cosize_v<SmemLayoutSFA>, SmemAlignment> smem_SFA;
      cute::array_aligned<ElementSFB, cute::cosize_v<SmemLayoutSFB>, SmemAlignment> smem_SFB;
    };

    struct PipelineStorage {
      typename MainloopPipeline::SharedStorage storage_input_a;
      typename MainloopPipeline::SharedStorage storage_input_b;
      typename MainloopPipeline::SharedStorage storage_D;
      typename MainloopPipelineCounter::SharedStorage storage_counter;
      typename MainloopPipelineFetch::SharedStorage storage_fetch;

      cutlass::arch::ClusterTransactionBarrier barrier_C;
    };
  };

  using TensorStorage = typename SharedStorage::TensorStorage;
  using PipelineStorage = typename SharedStorage::PipelineStorage;

  // ADMA transaction bytes per pipeline stage (data + scale factors)
  // Use sizeof_bits_v for sub-byte types (float_e2m1_t = 4 bits).
  static constexpr uint32_t SLMBytesA = (cosize(SmemLayoutA{}) * sizeof_bits_v<ElementA> / 8) / decltype(PIPE)::value;
  static constexpr uint32_t SLMBytesB = (cosize(SmemLayoutB{}) * sizeof_bits_v<ElementB> / 8) / decltype(PIPE)::value;
  static constexpr uint32_t SLMBytesSFA = (cosize(SmemLayoutSFA{}) * sizeof_bits_v<ElementSFA> / 8) / decltype(PIPE)::value;
  static constexpr uint32_t SLMBytesSFB = (cosize(SmemLayoutSFB{}) * sizeof_bits_v<ElementSFB> / 8) / decltype(PIPE)::value;
  static constexpr uint32_t TmaTransactionBytesA = SLMBytesA + SLMBytesSFA;
  static constexpr uint32_t TmaTransactionBytesB = SLMBytesB + SLMBytesSFB;

  // Host side kernel arguments
  struct Arguments {
    ElementA const* ptr_A;
    ElementB const* ptr_B;
    ElementSFA const* ptr_SFA;
    ElementSFB const* ptr_SFB;
    int64_t N;
    int64_t K;
  };

  // Device side kernel params
  struct Params {
    ElementA const* ptr_A;
    ElementB const* ptr_B;
    ElementSFA const* ptr_SFA;
    ElementSFB const* ptr_SFB;
    int64_t N;
    int64_t K;

    TMA_A tma_load_A;
    TMA_B tma_load_B;
    TMA_SFA tma_load_SFA;
    TMA_SFB tma_load_SFB;
  };

  XE4CollectiveMma() = default;

  static constexpr Params to_underlying_arguments(
    Arguments const& args)
  {
    return {args.ptr_A, args.ptr_B, args.ptr_SFA, args.ptr_SFB, args.N, args.K, {}, {}, {}, {}};
  }

  template <typename DescTuple, typename BlockCoord, class LoadTensors, typename ProblemShape_MNKL>
  CUTLASS_DEVICE void load(
    Params const& params,
    Arguments& args,
    TensorStorage& shared_tensors,
    DescTuple const& tdesc_tuple,
    BlockCoord const& block_coord,
    int const num_k_tiles,
    MainloopPipeline pipeline_input_a, PipelineState& smem_pipe_write_a,
    MainloopPipeline pipeline_input_b, PipelineState& smem_pipe_write_b,
    LoadTensors const& load_tensors, ProblemShape_MNKL const& problem_shape_mnkl)
  {
    bool lane_predicate = cute::elect_one_sync();

    if (lane_predicate) {
      auto [M, N, K, L] = problem_shape_mnkl;

      auto blk_m_coord = get<0>(block_coord); // blk_m_idx
      auto blk_n_coord = get<1>(block_coord); // blk_n_idx
      auto blk_l_coord = get<2>(block_coord); // blk_l_idx

      cute::update_gmem_details_and_params(
        params.tma_load_A, TMACopyAtomA{}, get<0>(load_tensors), SmemLayoutA{}(_, _, _0{}),
        TiledMma{}, TileShape{}, ClusterLayout_MNK{}, cute::Int<1>{});

      cute::update_gmem_details_and_params(
        params.tma_load_B, TMACopyAtomB{}, get<1>(load_tensors), SmemLayoutB{}(_, _, _0{}),
        TiledMma{}, TileShape{}, ClusterLayout_MNK{}, cute::Int<0>{});

      cute::update_gmem_details_and_params(
        params.tma_load_SFA, get<2>(load_tensors), SmemLayoutSFA{}(_, _, _, _0{}),
        TiledMma{}, TileShape{}, cute::Int<1>{});

      cute::update_gmem_details_and_params(
        params.tma_load_SFB, get<3>(load_tensors), SmemLayoutSFB{}(_, _, _, _0{}),
        TiledMma{}, TileShape{}, cute::Int<0>{});

      // Initialize matrix descriptor
      auto [tdesc_a, tdesc_b, tdesc_sfa, tdesc_sfb] = tdesc_tuple;
      params.tma_load_A.set_tensor_desc(tdesc_a);
      params.tma_load_B.set_tensor_desc(tdesc_b);
      params.tma_load_SFA.set_tensor_desc(tdesc_sfa);
      params.tma_load_SFB.set_tensor_desc(tdesc_sfb);

      Tensor mA_mkl = params.tma_load_A.get_tma_tensor(make_shape(M, K, L));
      Tensor mB_nkl = params.tma_load_B.get_tma_tensor(make_shape(N, K, L));

      constexpr int SFVecSizeK = SFVecSize;
      auto mSFA = params.tma_load_SFA.get_tma_tensor(
          make_shape(make_shape(Int<1>{}, M), make_shape(Int<SFVecSizeK>{}, K / SFVecSizeK)));
      auto mSFB = params.tma_load_SFB.get_tma_tensor(
          make_shape(make_shape(Int<1>{}, N), make_shape(Int<SFVecSizeK>{}, K / SFVecSizeK)));

      Tensor gA = local_tile(mA_mkl(_, _, 0), TileShape{},
                             make_coord(blk_m_coord, _, _), Step<_1, X, _1>{}); // (BLK_M,BLK_K,k)
      Tensor gB = local_tile(mB_nkl(_, _, 0), TileShape{},
                             make_coord(_, blk_n_coord, _), Step<X, _1, _1>{}); // (BLK_N,BLK_K,k)

      Tensor gSFA = local_tile(mSFA, TileShape{}, make_coord(blk_m_coord, _, _), Step<_1, X, _1>{}); // (BLK_M,BLK_K,k)
      Tensor gSFB = local_tile(mSFB, TileShape{}, make_coord(_, blk_n_coord, _), Step<X, _1, _1>{}); // (BLK_N,BLK_K,k)
      Tensor sA = make_tensor(make_smem_ptr(cute::recast_ptr<ElementA>(shared_tensors.smem_A.data())), SmemLayoutA{}); // (BLK_M,BLK_K,PIPE)
      Tensor sB = make_tensor(make_smem_ptr(cute::recast_ptr<ElementB>(shared_tensors.smem_B.data())), SmemLayoutB{}); // (BLK_N,BLK_K,PIPE)

      Tensor sSFA = make_tensor(make_smem_ptr(shared_tensors.smem_SFA.data()), SmemLayoutSFA{}); // (sf_block, _, blk, PIPE)
      Tensor sSFB = make_tensor(make_smem_ptr(shared_tensors.smem_SFB.data()), SmemLayoutSFB{}); // (sf_block, _, blk, PIPE)

      auto [tAgA, tAsA] = tma_partition(params.tma_load_A, _0{}, Layout<_1>{},
                                        group_modes<0, 2>(sA), group_modes<0, 2>(gA)); // (TMA,k), (TMA,PIPE)
      auto [tBgB, tBsB] = tma_partition(params.tma_load_B, _0{}, Layout<_1>{},
                                        group_modes<0, 2>(sB), group_modes<0, 2>(gB)); // (TMA,k), (TMA,PIPE)

      auto [tSFAgSFA, tSFAsSFA] = tma_partition(params.tma_load_SFA,
                                                group_modes<0,3>(sSFA), group_modes<0,2>(gSFA)); // (TMA,k), (TMA,PIPE)
      auto [tSFBgSFB, tSFBsSFB] = tma_partition(params.tma_load_SFB,
                                                group_modes<0,3>(sSFB), group_modes<0,2>(gSFB)); // (TMA,k), (TMA,PIPE)

      for (int i = 0; i < num_k_tiles; ++i) {
        pipeline_input_a.producer_acquire(smem_pipe_write_a);
        pipeline_input_b.producer_acquire(smem_pipe_write_b);

        uint32_t write_stage_a = smem_pipe_write_a.index();
        uint32_t write_stage_b = smem_pipe_write_b.index();
        auto abar_prod_a = pipeline_input_a.producer_get_barrier(smem_pipe_write_a);
        auto abar_prod_b = pipeline_input_b.producer_get_barrier(smem_pipe_write_b);

        copy(params.tma_load_A.with(
             abar_prod_a, 0),
             tAgA(_, i), tAsA(_, write_stage_a)
        );
        copy(params.tma_load_B.with(
             abar_prod_b, 0),
             tBgB(_, i), tBsB(_, write_stage_b)
        );
        copy(params.tma_load_SFA.with(
             abar_prod_a, 0),
             tSFAgSFA(_, i), tSFAsSFA(_, write_stage_a)
        );
        copy(params.tma_load_SFB.with(
             abar_prod_b, 0),
             tSFBgSFB(_, i), tSFBsSFB(_, write_stage_b)
        );
        ++smem_pipe_write_a;
        ++smem_pipe_write_b;
      }
    }
  }

  template <typename EpilogueTensorStorage>
  CUTLASS_DEVICE void mma(
    TensorStorage& shared_tensors,
    EpilogueTensorStorage& epi_shared_tensors,
    PipelineStorage& shared_pipelines,
    int const num_k_tiles,
    MainloopPipeline pipeline_input_a, PipelineState& smem_pipe_read_a,
    MainloopPipeline pipeline_input_b, PipelineState& smem_pipe_read_b,
    MainloopPipeline pipeline_d, PipelineState& smem_pipe_write_d)
  {
    bool lane_predicate = cute::elect_one_sync();

    if (lane_predicate) {
      int thread_idx = static_cast<int>(ThreadIdxX());

      TiledMma tiled_mma;

      auto thr_mma = tiled_mma.get_thread_slice(thread_idx);

      Tensor sA = make_tensor(make_smem_ptr(cute::recast_ptr<ElementA>(shared_tensors.smem_A.data())), SmemLayoutA{});      // (BLK_M,BLK_K,PIPE)
      Tensor sB = make_tensor(make_smem_ptr(cute::recast_ptr<ElementB>(shared_tensors.smem_B.data())), SmemLayoutB{});      // (BLK_N,BLK_K,PIPE)
      Tensor sSFA = make_tensor(make_smem_ptr(shared_tensors.smem_SFA.data()), SmemLayoutSFA{}); // (sf_block, _, blk, PIPE)
      Tensor sSFB = make_tensor(make_smem_ptr(shared_tensors.smem_SFB.data()), SmemLayoutSFB{}); // (sf_block, _, blk, PIPE)
      Tensor sC = make_tensor(make_smem_ptr(shared_tensors.smem_C.data()), SmemLayoutAccum{}); // (BLK_M,BLK_N)
      Tensor sD = make_tensor(make_smem_ptr(epi_shared_tensors.smem_D.data()), SmemLayoutOutput{}); // (BLK_M,BLK_N,PIPE)

      // Matrix descriptors
      Tensor tSsA = thr_mma.partition_fragment_A(sA); // (MMA,MMA_M,MMA_K,PIPE)
      Tensor tSsB = thr_mma.partition_fragment_B(sB); // (MMA,MMA_N,MMA_K,PIPE)
      Tensor tSsC = thr_mma.partition_fragment_C(sC); // (MMA,MMA_M,MMA_N)
      Tensor tSsD = thr_mma.partition_fragment_C(sD); // (MMA,MMA_M,MMA_N,PIPE)
      Tensor tSsSFA = make_tensor<AMMA::smem_sf_desc>(sSFA);   // (_1, _1, (blk_MN, blk_K), PIPE)
      Tensor tSsSFB = make_tensor<AMMA::smem_sf_desc>(sSFB);   // (_1, _1, (blk_MN, blk_K), PIPE)

      auto wg_expect_tx = size<1>(tSsC) * size<2>(tSsC) * size<2>(tSsA);

      MMAControl mma_ctrl{};
      mma_ctrl.NullC = 1;
      mma_ctrl.A_BlockScaleType = BlockScaleType::value;
      mma_ctrl.B_BlockScaleType = BlockScaleType::value;

      pipeline_d.producer_acquire(smem_pipe_write_d);

      CUTE_UNROLL
      for (int i = 0; i < num_k_tiles; ++i) { //tile level loop , k
        pipeline_input_a.consumer_wait(smem_pipe_read_a);
        pipeline_input_b.consumer_wait(smem_pipe_read_b);

        int read_stage_a = smem_pipe_read_a.index();
        int read_stage_b = smem_pipe_read_b.index();
        auto abar_cons_a = pipeline_input_a.consumer_get_barrier(smem_pipe_read_a);
        auto abar_cons_b = pipeline_input_b.consumer_get_barrier(smem_pipe_read_b);

        // Compute D = A * B^T
        CUTE_UNROLL
        for(int j = 0; j < size<2>(tSsA); ++j){ //mma level loop
          bool is_last_iter = (i == num_k_tiles - 1) && (j == size<2>(tSsA) - 1);
          if (is_last_iter) {
            cute::gemm(tiled_mma.with(
              ElementOutput{},
              AMMA::TrackMethod<AMMA::Tracking::DAB>{},
              mma_ctrl,
              tSsSFA(0, 0, 0, read_stage_a),
              tSsSFB(0, 0, 0, read_stage_b),
              pipeline_d.producer_get_barrier(smem_pipe_write_d),
              abar_cons_a, abar_cons_b),
            tSsD(_,_,_,smem_pipe_write_d.index()), tSsA(_,_,j,read_stage_a), tSsB(_,_,j,read_stage_b), tSsC);
          } else {
            cute::gemm(tiled_mma.with(
              ElementAccum{},
              AMMA::TrackMethod<AMMA::Tracking::AB>{},
              mma_ctrl,
              tSsSFA(0, 0, 0, read_stage_a),
              tSsSFB(0, 0, 0, read_stage_b),
              abar_cons_a, abar_cons_b),
            tSsA(_, _, j, read_stage_a), tSsB(_, _, j, read_stage_b), tSsC);

            mma_ctrl.NullC = 0;
          }
        }

        pipeline_input_a.consumer_commit(smem_pipe_read_a, wg_expect_tx);
        pipeline_input_b.consumer_commit(smem_pipe_read_b, wg_expect_tx);
        ++smem_pipe_read_a;
        ++smem_pipe_read_b;
      }

      ++smem_pipe_write_d;
    }
  }

  template <typename TileSchedulerParams>
  CUTLASS_DEVICE void fetch_next(
    MainloopPipelineCounter pipeline_counter, PipelineStateCounter& smem_pipe_write_counter, PipelineStorage& shared_pipelines,TileSchedulerParams scheduler_params, int32_t* shared_counter, uint64_t& advance_count)
  {
    bool lane_predicate = cute::elect_one_sync();
    if(shared_counter[2] == 0) {
      if (smem_pipe_write_counter.count() != 0) {
        pipeline_counter.producer_acquire(smem_pipe_write_counter);
      }

      if(lane_predicate){
          auto advance_index = cutlass::atomicAdd(scheduler_params.global_task_counter_, 1UL * advance_count);
          shared_counter[0] = advance_index + advance_count;
          shared_counter[1] = advance_index + advance_count;
          shared_counter[2] = advance_count;
          shared_counter[3] = advance_count - 1;
      }

      pipeline_counter.producer_commit(smem_pipe_write_counter);
    }
    else {
      if (smem_pipe_write_counter.count() != 0) {
        pipeline_counter.producer_acquire(smem_pipe_write_counter);
      }

      if(lane_predicate){
          shared_counter[2 + 1 - smem_pipe_write_counter.index()] -= 2;
      }

      pipeline_counter.producer_commit(smem_pipe_write_counter);
    }
  }

  template <typename ProblemShape_MNKL>
  CUTLASS_DEVICE auto update_tensor_shape_stride(
    Params const& mainloop_params,
    int32_t const& next_group,
    ProblemShape_MNKL const& problem_shape_mnkl,
    int64_t expert_first_token_offset) {
      const int32_t M = get<0>(problem_shape_mnkl);
      const int32_t N = get<1>(problem_shape_mnkl);
      const int32_t K = get<2>(problem_shape_mnkl);
      const int32_t L = get<3>(problem_shape_mnkl);

      constexpr int A_bits = cute::sizeof_bits_v<ElementA>;
      constexpr int B_bits = cute::sizeof_bits_v<ElementB>;
      constexpr int SFA_bits = cute::sizeof_bits_v<ElementSFA>;
      constexpr int SFB_bits = cute::sizeof_bits_v<ElementSFB>;
      const int64_t sf_k = int64_t(K) / SFVecSize;

      const int64_t off_A_bytes = expert_first_token_offset * int64_t(K) * A_bits / 8;
      const int64_t off_B_bytes = int64_t(next_group) * int64_t(N) * int64_t(K) * B_bits / 8;
      const int64_t off_SFA_bytes = expert_first_token_offset * sf_k * SFA_bits / 8;
      const int64_t off_SFB_bytes = int64_t(next_group) * int64_t(N) * sf_k * SFB_bits / 8;

      ElementA const* ptr_A_curr_batch = reinterpret_cast<ElementA const*>(
          reinterpret_cast<const char*>(mainloop_params.ptr_A) + off_A_bytes);
      ElementB const* ptr_B_curr_batch = reinterpret_cast<ElementB const*>(
          reinterpret_cast<const char*>(mainloop_params.ptr_B) + off_B_bytes);
      ElementSFA const* ptr_SFA_curr_batch = reinterpret_cast<ElementSFA const*>(
          reinterpret_cast<const char*>(mainloop_params.ptr_SFA) + off_SFA_bytes);
      ElementSFB const* ptr_SFB_curr_batch = reinterpret_cast<ElementSFB const*>(
          reinterpret_cast<const char*>(mainloop_params.ptr_SFB) + off_SFB_bytes);

      auto stride_A = cutlass::make_cute_packed_stride(InternalStrideA{}, {M, K, 1});
      auto stride_B = cutlass::make_cute_packed_stride(InternalStrideB{}, {N, K, 1});

      Tensor mA = make_tensor(make_gmem_ptr(ptr_A_curr_batch), cute::make_shape(M, K,(int32_t)1), stride_A);
      Tensor mB = make_tensor(make_gmem_ptr(ptr_B_curr_batch), cute::make_shape(N, K,(int32_t)1), stride_B);

      using BlkScaledConfig = detail::Xe4BlockScaledConfig<SFVecSize>;
      auto layout_SFA = BlkScaledConfig::tile_atom_to_shape_SFA(make_shape(M, N, K));
      auto layout_SFB = BlkScaledConfig::tile_atom_to_shape_SFB(make_shape(M, N, K));

      Tensor mSFA = make_tensor(make_gmem_ptr(ptr_SFA_curr_batch), layout_SFA);
      Tensor mSFB = make_tensor(make_gmem_ptr(ptr_SFB_curr_batch), layout_SFB);
      return cute::make_tuple(mA, mB, mSFA, mSFB);
  }
};
} // namespace cutlass::xe4_scaled_grouped_gemm::collective
