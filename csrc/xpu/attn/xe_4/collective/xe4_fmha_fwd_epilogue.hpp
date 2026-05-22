/*
 * Copyright 2020-2025 Intel Corporation
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 */

#pragma once

#include <cutlass/cutlass.h>
#include <sycl/sycl.hpp>

#include "csrc/xpu/attn/xe_4/collective/fmha_fusion.hpp"

namespace cutlass::flash_attention::collective {

template <
    class ProblemShape_,
    class TileShape_,
    class ElementOutput_,
    class StrideO_,
    class SmemLayoutOutput_,
    class TMACopyAtomO_>
class CollectiveEpilogueAttention {
 public:
  using ProblemShape = ProblemShape_;

  using TileShape = TileShape_;
  using TileShapePV_MNK =
      decltype(select<0, 1, 2>(TileShape{})); // <BLK_M_PV, BLK_N_V, BLK_N_QK>

  using ElementOutput = ElementOutput_;
  using StrideO = StrideO_;
  using SmemLayoutOutput = SmemLayoutOutput_;

  using Pipeline = cutlass::PipelineTmaAsync<2>;

  // number of QO stages per workgroup; tunable based on tile shapes
  static constexpr int NumStageQO = 2;

  using TMACopyAtomO = TMACopyAtomO_;

  using TMA_O = decltype(make_tma_copy(
      TMACopyAtomO{},
      make_tensor(
          make_gmem_ptr(static_cast<ElementOutput const*>(nullptr)),
          repeat_like(StrideO{}, int32_t(0)),
          StrideO{}),
      SmemLayoutOutput{}(_, _, cute::Int<0>{}),
      select<0, 1>(TileShapePV_MNK{}),
      _1{}));

  static constexpr size_t SmemAlignment = 512;
  struct SharedStorage {
    struct TensorStorage : cute::aligned_struct<SmemAlignment, _0> {
      cute::array_aligned<
          ElementOutput,
          cute::cosize_v<SmemLayoutOutput>,
          SmemAlignment>
          smem_O;
    };
  };

  using TensorStorage = typename SharedStorage::TensorStorage;

  static constexpr uint32_t TmaTransactionBytesO =
      sizeof(TensorStorage::smem_O) / NumStageQO;

  // Host side epilogue arguments
  struct Arguments {
    ElementOutput const* ptr_O;
    StrideO dO;
    int total_seqlen_q = 0;
  };

  // Device side epilogue params
  struct Params {
    ProblemShape problem_shape;
    TMA_O tma_store_O;
  };

  static constexpr bool IsVarLen =
      collective::is_variable_length_v<typename ProblemShape::SeqLenType>;

  template <class ProblemShape>
  static constexpr Params to_underlying_arguments(
      ProblemShape const& problem_shape,
      Arguments const& args) {
    auto
        [batch,
         num_heads_q,
         num_heads_kv,
         seq_len_qo,
         seq_len_kv,
         head_size_qk,
         head_size_vo] = problem_shape;

    int tma_batch = IsVarLen ? 1 : int(batch);
    int tma_seq_q = int(seq_len_qo);
    if constexpr (IsVarLen) {
      tma_seq_q = args.total_seqlen_q;
    }

    Tensor mO = make_tensor(
        make_gmem_ptr(args.ptr_O),
        make_layout(
            make_shape(tma_seq_q, head_size_vo, tma_batch * num_heads_q),
            args.dO));

    TMA_O tma_store_O = make_tma_copy(
        TMACopyAtomO{},
        mO,
        SmemLayoutOutput{}(_, _, cute::Int<0>{}),
        select<0, 1>(TileShapePV_MNK{}),
        _1{});

    return {problem_shape, tma_store_O};
  }

  CUTLASS_HOST_DEVICE
  CollectiveEpilogueAttention(Params const& params_) : params(params_) {}

  template <typename TensorStorage, typename DescTuple, typename BlockCoord>
  CUTLASS_DEVICE void store(
      Params params, // by value: per-WG mutable copy (we may rebind gmem_ptr)
      TensorStorage& shared_tensors,
      DescTuple const& tdesc_tuple,
      BlockCoord const& block_coord,
      Pipeline& pipeline_epi,
      Pipeline::PipelineState& pipeline_epi_consumer_state) {
    auto
        [batch,
         num_heads_q,
         num_heads_kv,
         seq_len_qo,
         seq_len_kv,
         head_size_qk,
         head_size_vo] = params.problem_shape;

    auto blk_m_coord = get<0>(block_coord); // seq_len_blk_idx
    auto blk_n_coord = get<1>(block_coord); // head_size_blk_idx
    auto batch_coord = get<2>(block_coord); // batch_blk_idx
    auto num_heads_coord = get<3>(block_coord); // num_heads_blk_idx

    // VarLen: L dim = num_heads only, tile offset from cumulative_length
    int blk_l_coord;
    int o_tile_offset = 0;
    int tma_seq_q = int(seq_len_qo);
    int tma_l_q = int(batch) * num_heads_q;
    int actual_q_len = tma_seq_q;
    int o_row_offset = 0;

    if constexpr (IsVarLen) {
      blk_l_coord = num_heads_coord;
      auto* cum_q = seq_len_qo.cumulative_length;
      // Per-batch element-level offset on output gmem ptr so that this WG's
      // tile coord 0 maps to the start of THIS batch's row range. Combined
      // with a per-WG hardware M-bound override (set below) this prevents
      // OOB stages of one batch's WG from overwriting another batch's
      // rows when q_len is not a multiple of NumStageQO * TileM.
      o_row_offset = cum_q[batch_coord];
      actual_q_len = cum_q[batch_coord + 1] - o_row_offset;
      o_tile_offset = 0;
      tma_seq_q = cum_q[int(batch)];
      tma_l_q = num_heads_q;
    } else {
      blk_l_coord = batch_coord * num_heads_q + num_heads_coord;
    }

    constexpr uint32_t mcast_mask = 0;

    int o0_index = o_tile_offset + NumStageQO * blk_m_coord;
    int o1_index = o_tile_offset + NumStageQO * blk_m_coord + 1;

    // Initialize matrix descriptor
    auto [tdesc_o] = tdesc_tuple;
    if constexpr (IsVarLen) {
      auto base_ptr = params.tma_store_O.cache_.gmem_ptr_;
      params.tma_store_O.cache_.set_gmem_ptr(
          base_ptr + o_row_offset * num_heads_q * head_size_vo);
    }
    params.tma_store_O.cache_.set_tensor_desc(tdesc_o);
    if constexpr (IsVarLen) {
      // Override per-WG hardware M-bound to actual_q_len so writes past this
      // batch's last valid row are clipped by the TMA descriptor.
      // Descriptor dim ordering for (M, N, L) with stride
      // (num_heads*head_size, 1, head_size) is: dim0=N(head_size, stride 1),
      // dim1=M(seq_q, stride num_heads*head_size), dim2=L(num_heads).
      // tensordesc_set_dim_size<dim_num> writes index dim_num-1, so M is <2>.
      tensordesc_set_dim_size<2>(
          tdesc_o, static_cast<uint32_t>(actual_q_len));
    }

    Tensor mO_mnl = params.tma_store_O.get_tma_tensor(
        make_shape(tma_seq_q, head_size_vo, tma_l_q)); // (M,N,L)

    Tensor gO = local_tile(
        mO_mnl(_, _, blk_l_coord),
        TileShapePV_MNK{},
        make_coord(_, blk_n_coord, _),
        Step<_1, _1, X>{}); // (BLK_M,BLK_N,o)

    Tensor sO = make_tensor(
        make_smem_ptr(shared_tensors.smem_O.data()),
        SmemLayoutOutput{}); // (BLK_M,BLK_N,PIPE)

    auto [tOgO, tOsO] = tma_partition(
        params.tma_store_O,
        _0{},
        Layout<_1>{},
        group_modes<0, 2>(sO),
        group_modes<0, 2>(gO)); // (TMA,o), (TMA,PIPE)

    pipeline_epi.consumer_wait(pipeline_epi_consumer_state);
    pipeline_epi.consumer_commit(
        pipeline_epi_consumer_state, TmaTransactionBytesO);

    copy(
        params.tma_store_O.with(
            pipeline_epi.consumer_get_barrier(pipeline_epi_consumer_state),
            mcast_mask),
        tOsO(_, _0{}),
        tOgO(_, o0_index));

    ++pipeline_epi_consumer_state;

    pipeline_epi.consumer_wait(pipeline_epi_consumer_state);
    pipeline_epi.consumer_commit(
        pipeline_epi_consumer_state, TmaTransactionBytesO);

    copy(
        params.tma_store_O.with(
            pipeline_epi.consumer_get_barrier(pipeline_epi_consumer_state),
            mcast_mask),
        tOsO(_, _1{}),
        tOgO(_, o1_index));

    ++pipeline_epi_consumer_state;
  }

 private:
  Params const& params;
};

} // namespace cutlass::flash_attention::collective