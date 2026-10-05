#pragma once

#include <sycl/sycl.hpp>
#include <torch/all.h>

#include "gemm.hpp"
#include "gdn_attn_utils.h"
#include "csrc/utils.h"

namespace gdn {
using namespace cute;
static constexpr int sub_group_size = 16;
static constexpr int chunk_size = gdn::chunk_size_xe2;

template <typename T, class TiledMMA>
CUTE_DEVICE void chunk_inverse_opt_kernel(
    T* A,
    const int* query_start_loc,
    const int total_virtual_seqlen,
    const int batch_size,
    const int num_k_heads,
    const int head_k_dim,
    const int num_v_heads,
    const int head_v_dim) {
  auto item = sycl::ext::oneapi::this_work_item::get_nd_item<3>();
  int local_id = item.get_local_linear_id();
  int local_range = item.get_local_range(2);
  int v_head_id = item.get_group(1) % num_v_heads;
  int chunk_id = item.get_group(1) / num_v_heads;
  const int global_chunk_range = item.get_group_range(1) / num_v_heads;

  // l2norm for q, k
  int group_id = item.get_group(1);
  int group_range = item.get_group_range(1);
  auto sg = item.get_sub_group();
  int sg_id = sg.get_group_linear_id();
  int sg_range = sg.get_group_linear_range();
  int sg_local_id = sg.get_local_linear_id();

  int pre_chunks = 0;

  const int kv_ratio = num_v_heads / num_k_heads;

  TiledMMA mma{};
  auto wg_tile = mma.tile_mnk();
  auto thr_mma = mma.get_slice(local_id);

  for (int batch_id = 0; batch_id < batch_size; ++batch_id) {
    const int seq_start_offset = query_start_loc[batch_id];
    const int seq_end_offset = query_start_loc[batch_id + 1];
    const int seq_len = seq_end_offset - seq_start_offset;

    const int current_chunks = (seq_len + chunk_size - 1) / chunk_size;
    const int cumsum_chunks = pre_chunks + current_chunks;

    if (chunk_id >= cumsum_chunks) {
      pre_chunks = cumsum_chunks;
      continue;
    }

    while (chunk_id < cumsum_chunks) {
      const int chunk_start_offset = chunk_id * chunk_size;

      auto A_ptr =
          A +
          static_cast<int64_t>(v_head_id) * total_virtual_seqlen * chunk_size +
          chunk_start_offset * chunk_size;

      CUTE_UNROLL
      for (int i = 0; i < 4; ++i) {
        int offset = i * 16;
        T* A_ptr_xx = A_ptr + offset * chunk_size + offset;
        float A_local[16];
        float A_other[16];
        float A_sum;
        CUTE_UNROLL
        for (int e = 0; e < sg_local_id + 1; ++e) {
          A_local[e] = 0.0f;
        }

        T A_load[16];
        CUTE_UNROLL
        for (int e = 0; e < sg_local_id; ++e) {
          A_load[e] = A_ptr_xx[sg_local_id * chunk_size + e];
        }

        CUTE_UNROLL
        for (int mm_idx = 1; mm_idx < 16; ++mm_idx) {
          CUTE_UNROLL
          for (int nn_idx = 0; nn_idx < mm_idx; ++nn_idx) {
            float send_value = static_cast<float>(A_load[nn_idx]);
            float receive_value = sycl::group_broadcast(sg, send_value, mm_idx);
            if (sg_local_id == nn_idx) {
              A_local[mm_idx] = receive_value;
            }
          }
        }

        CUTE_UNROLL
        for (int mm_idx = 1; mm_idx < 16; ++mm_idx) {
          A_sum = 0.0f;
          CUTE_UNROLL
          for (int e = 1; e < mm_idx + 1; ++e) {
            A_other[e] = sycl::group_broadcast(sg, A_local[mm_idx], e);
          }

          CUTE_UNROLL
          for (int e = 1; e < mm_idx + 1; ++e) {
            A_sum += A_local[e] * A_other[e];
          }

          A_local[mm_idx] = -A_local[mm_idx] - A_sum;
        }

        CUTE_UNROLL
        for (int e = sg_local_id + 1; e < 16; ++e) {
          A_ptr_xx[e * chunk_size + sg_local_id] = static_cast<T>(A_local[e]);
        }
      }

      auto A_ptr_11 = A_ptr;

      auto A_ptr_21 = A_ptr + 16 * chunk_size;
      auto A_ptr_22 = A_ptr + 16 * chunk_size + 16;

      auto A_ptr_31 = A_ptr + 32 * chunk_size;
      auto A_ptr_32 = A_ptr + 32 * chunk_size + 16;
      auto A_ptr_33 = A_ptr + 32 * chunk_size + 32;

      auto A_ptr_41 = A_ptr + 48 * chunk_size;
      auto A_ptr_42 = A_ptr + 48 * chunk_size + 16;
      auto A_ptr_43 = A_ptr + 48 * chunk_size + 32;
      auto A_ptr_44 = A_ptr + 48 * chunk_size + 48;

      auto A_XX_tensor_shape = make_shape(16, 16);

      auto A_11_tensor_T = make_tensor(
          make_gmem_ptr(A_ptr_11),
          make_layout(A_XX_tensor_shape, make_stride(_1{}, chunk_size)));

      auto A_21_tensor = make_tensor(
          make_gmem_ptr(A_ptr_21),
          make_layout(A_XX_tensor_shape, make_stride(chunk_size, _1{})));
      auto A_21_tensor_T = make_tensor(
          make_gmem_ptr(A_ptr_21),
          make_layout(A_XX_tensor_shape, make_stride(_1{}, chunk_size)));
      auto A_22_tensor = make_tensor(
          make_gmem_ptr(A_ptr_22),
          make_layout(A_XX_tensor_shape, make_stride(chunk_size, _1{})));
      auto A_22_tensor_T = make_tensor(
          make_gmem_ptr(A_ptr_22),
          make_layout(A_XX_tensor_shape, make_stride(_1{}, chunk_size)));

      auto A_31_tensor = make_tensor(
          make_gmem_ptr(A_ptr_31),
          make_layout(A_XX_tensor_shape, make_stride(chunk_size, _1{})));
      auto A_31_tensor_T = make_tensor(
          make_gmem_ptr(A_ptr_31),
          make_layout(A_XX_tensor_shape, make_stride(_1{}, chunk_size)));
      auto A_32_tensor = make_tensor(
          make_gmem_ptr(A_ptr_32),
          make_layout(A_XX_tensor_shape, make_stride(chunk_size, _1{})));
      auto A_32_tensor_T = make_tensor(
          make_gmem_ptr(A_ptr_32),
          make_layout(A_XX_tensor_shape, make_stride(_1{}, chunk_size)));
      auto A_33_tensor = make_tensor(
          make_gmem_ptr(A_ptr_33),
          make_layout(A_XX_tensor_shape, make_stride(chunk_size, _1{})));
      auto A_33_tensor_T = make_tensor(
          make_gmem_ptr(A_ptr_33),
          make_layout(A_XX_tensor_shape, make_stride(_1{}, chunk_size)));

      auto A_41_tensor = make_tensor(
          make_gmem_ptr(A_ptr_41),
          make_layout(A_XX_tensor_shape, make_stride(chunk_size, _1{})));
      auto A_41_tensor_T = make_tensor(
          make_gmem_ptr(A_ptr_41),
          make_layout(A_XX_tensor_shape, make_stride(_1{}, chunk_size)));
      auto A_42_tensor = make_tensor(
          make_gmem_ptr(A_ptr_42),
          make_layout(A_XX_tensor_shape, make_stride(chunk_size, _1{})));
      auto A_42_tensor_T = make_tensor(
          make_gmem_ptr(A_ptr_42),
          make_layout(A_XX_tensor_shape, make_stride(_1{}, chunk_size)));
      auto A_43_tensor = make_tensor(
          make_gmem_ptr(A_ptr_43),
          make_layout(A_XX_tensor_shape, make_stride(chunk_size, _1{})));
      auto A_43_tensor_T = make_tensor(
          make_gmem_ptr(A_ptr_43),
          make_layout(A_XX_tensor_shape, make_stride(_1{}, chunk_size)));
      auto A_44_tensor = make_tensor(
          make_gmem_ptr(A_ptr_44),
          make_layout(A_XX_tensor_shape, make_stride(chunk_size, _1{})));

      Tensor cA = make_identity_tensor(A_XX_tensor_shape);
      Tensor cB = make_identity_tensor(A_XX_tensor_shape);
      Tensor cC = make_identity_tensor(A_XX_tensor_shape);
      Tensor gA = local_tile(cA, select<0, 2>(wg_tile), make_coord(0, _));
      Tensor gB = local_tile(cB, select<1, 2>(wg_tile), make_coord(0, _));
      Tensor gC =
          local_tile(cC, wg_tile, make_coord(0, 0, 0), Step<_1, _1, X>{});
      auto tCrA = thr_mma.partition_sg_fragment_A(gA(_, _, 0));
      auto tCrB = thr_mma.partition_sg_fragment_B(gB(_, _, 0));
      auto tCrC = thr_mma.partition_sg_fragment_C(gC);

      auto copy_D_21 = get_block_2d_copy_D<void>(mma, A_21_tensor);
      auto thr_copy_D_21 = copy_D_21.get_slice(local_id);
      auto tCrD_21 = thr_copy_D_21.partition_sg_fragment_S(gC);
      auto tCgD_21 = thr_copy_D_21.partition_D(gC);
      clear(tCrC);
      gemm_TTS(A_22_tensor, A_21_tensor_T, tCrC, 0, 0, mma);
      reorder(tCrC, tCrA);
      clear(tCrC);
      gemm_STS(tCrA, A_11_tensor_T, tCrC, 0, 0, mma);
      CUTE_UNROLL
      for (int i = 0; i < tCrC.size(); ++i) {
        tCrC(i) *= -1.0f;
      }
      reorder(tCrC, tCrD_21);
      copy(copy_D_21, tCrD_21, tCgD_21);

      auto copy_D_31 = get_block_2d_copy_D<void>(mma, A_31_tensor);
      auto thr_copy_D_31 = copy_D_31.get_slice(local_id);
      auto tCrD_31 = thr_copy_D_31.partition_sg_fragment_S(gC);
      auto tCgD_31 = thr_copy_D_31.partition_D(gC);
      clear(tCrC);
      gemm_TTS(A_31_tensor, A_11_tensor_T, tCrC, 0, 0, mma);
      gemm_TTS(A_32_tensor, A_21_tensor_T, tCrC, 0, 0, mma);
      reorder(tCrC, tCrD_31);
      copy(copy_D_31, tCrD_31, tCgD_31);
      clear(tCrC);
      gemm_TTS(A_33_tensor, A_31_tensor_T, tCrC, 0, 0, mma);
      CUTE_UNROLL
      for (int i = 0; i < tCrC.size(); ++i) {
        tCrC(i) *= -1.0f;
      }
      reorder(tCrC, tCrD_31);
      copy(copy_D_31, tCrD_31, tCgD_31);

      auto copy_D_41 = get_block_2d_copy_D<void>(mma, A_41_tensor);
      auto thr_copy_D_41 = copy_D_41.get_slice(local_id);
      auto tCrD_41 = thr_copy_D_41.partition_sg_fragment_S(gC);
      auto tCgD_41 = thr_copy_D_41.partition_D(gC);
      clear(tCrC);
      gemm_TTS(A_41_tensor, A_11_tensor_T, tCrC, 0, 0, mma);
      gemm_TTS(A_42_tensor, A_21_tensor_T, tCrC, 0, 0, mma);
      gemm_TTS(A_43_tensor, A_31_tensor_T, tCrC, 0, 0, mma);
      reorder(tCrC, tCrD_41);
      copy(copy_D_41, tCrD_41, tCgD_41);
      clear(tCrC);
      gemm_TTS(A_44_tensor, A_41_tensor_T, tCrC, 0, 0, mma);
      CUTE_UNROLL
      for (int i = 0; i < tCrC.size(); ++i) {
        tCrC(i) *= -1.0f;
      }
      reorder(tCrC, tCrD_41);
      copy(copy_D_41, tCrD_41, tCgD_41);

      auto copy_D_32 = get_block_2d_copy_D<void>(mma, A_32_tensor);
      auto thr_copy_D_32 = copy_D_32.get_slice(local_id);
      auto tCrD_32 = thr_copy_D_32.partition_sg_fragment_S(gC);
      auto tCgD_32 = thr_copy_D_32.partition_D(gC);
      clear(tCrC);
      gemm_TTS(A_33_tensor, A_32_tensor_T, tCrC, 0, 0, mma);
      reorder(tCrC, tCrA);
      clear(tCrC);
      gemm_STS(tCrA, A_22_tensor_T, tCrC, 0, 0, mma);
      CUTE_UNROLL
      for (int i = 0; i < tCrC.size(); ++i) {
        tCrC(i) *= -1.0f;
      }
      reorder(tCrC, tCrD_32);
      copy(copy_D_32, tCrD_32, tCgD_32);

      auto copy_D_42 = get_block_2d_copy_D<void>(mma, A_42_tensor);
      auto thr_copy_D_42 = copy_D_42.get_slice(local_id);
      auto tCrD_42 = thr_copy_D_42.partition_sg_fragment_S(gC);
      auto tCgD_42 = thr_copy_D_42.partition_D(gC);
      clear(tCrC);
      gemm_TTS(A_42_tensor, A_22_tensor_T, tCrC, 0, 0, mma);
      gemm_TTS(A_43_tensor, A_32_tensor_T, tCrC, 0, 0, mma);
      reorder(tCrC, tCrD_42);
      copy(copy_D_42, tCrD_42, tCgD_42);
      clear(tCrC);
      gemm_TTS(A_44_tensor, A_42_tensor_T, tCrC, 0, 0, mma);
      CUTE_UNROLL
      for (int i = 0; i < tCrC.size(); ++i) {
        tCrC(i) *= -1.0f;
      }
      reorder(tCrC, tCrD_42);
      copy(copy_D_42, tCrD_42, tCgD_42);

      auto copy_D_43 = get_block_2d_copy_D<void>(mma, A_43_tensor);
      auto thr_copy_D_43 = copy_D_43.get_slice(local_id);
      auto tCrD_43 = thr_copy_D_43.partition_sg_fragment_S(gC);
      auto tCgD_43 = thr_copy_D_43.partition_D(gC);
      clear(tCrC);
      gemm_TTS(A_44_tensor, A_43_tensor_T, tCrC, 0, 0, mma);
      reorder(tCrC, tCrA);
      clear(tCrC);
      gemm_STS(tCrA, A_33_tensor_T, tCrC, 0, 0, mma);
      CUTE_UNROLL
      for (int i = 0; i < tCrC.size(); ++i) {
        tCrC(i) *= -1.0f;
      }
      reorder(tCrC, tCrD_43);
      copy(copy_D_43, tCrD_43, tCgD_43);

      chunk_id += global_chunk_range;
    }
    pre_chunks = cumsum_chunks;
  }
}

}  // namespace gdn
