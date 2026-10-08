/***************************************************************************************************
 * Copyright (C) 2025 Intel Corporation, All rights reserved.
 * SPDX-License-Identifier: BSD-3-Clause
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions are met:
 *
 * 1. Redistributions of source code must retain the above copyright notice,
 *this list of conditions and the following disclaimer.
 *
 * 2. Redistributions in binary form must reproduce the above copyright notice,
 * this list of conditions and the following disclaimer in the documentation
 * and/or other materials provided with the distribution.
 *
 * 3. Neither the name of the copyright holder nor the names of its
 * contributors may be used to endorse or promote products derived from
 * this software without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
 * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
 * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
 *ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE
 *LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
 *CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
 *SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
 *INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
 *CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
 *ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
 *POSSIBILITY OF SUCH DAMAGE.
 *
 **************************************************************************************************/

#include <sycl/sycl.hpp>
#include <cute/util/compat.hpp>
#include <sycl/ext/intel/experimental/grf_size_properties.hpp>

#include <cute/tensor.hpp>
#include <cute/util/xe_split_barrier.hpp>

#include "cutlass/kernel_hardware_info.h"
#include "cutlass/platform/platform.h"
#include "cutlass/tensor_ref.h"
#include "cutlass/util/sycl_event_manager.hpp"
#include "cutlass/util/GPU_Clock.hpp"
#include "cutlass/util/reference/device/gemm_complex.h"
#include "cutlass/util/reference/device/tensor_compare.h"
#include "cutlass/util/reference/host/tensor_fill.h"

#pragma clang diagnostic ignored "-Wpass-failed"
#pragma clang diagnostic ignored "-Wdeprecated-declarations"

namespace gdn {

using namespace cute;

/* ---- Lane-blocked SLM tiles for DPAS A operands ----------------------------
 *
 * A (BLK_M, BLK_K) tile of T stored as the dpas A register image itself. The
 * TiledMMA splits M across the m sub-groups, so one sub-group's A fragment
 * covers 16 m-rows by the full BLK_K and is held as BLK_K/16 blocks of 16
 * values; inside a block lane l owns column k = 16*kb + l and its 16 values are
 * m = 0..15. Element (m, k) therefore lives at byte
 *   (m/16)*(BLK_K/16)*512 + (k/16)*512 + (k%16)*32 + (m%16)*2
 *
 * A C accumulator has exactly the same per-lane shape -- lane l holds column
 * n = 16*nb + l for m = 0..15 -- so handing a C fragment to a later A operand
 * (the consumer contracts over the producer's N) moves no data across lanes:
 * every lane writes its own columns as 32 B runs and reads back the runs the
 * other n sub-groups produced. The register re-layout lives entirely in the
 * address arithmetic, so neither side needs a cute::reorder, and the SLM tile
 * is the only place the cross-sub-group exchange happens.
 */
static constexpr int kSlmALaneElems = 16;  // m-run owned by one lane
static constexpr int kSlmALaneBytes = kSlmALaneElems * 2;
static constexpr int kSlmASgSize = 16;
// One (m-block, k-block) pair across all lanes.
static constexpr int kSlmABlockBytes = kSlmALaneBytes * kSlmASgSize;

/* Bytes needed for a (BLK_M, BLK_K) lane-blocked A tile. */
template <int BlkM, int BlkK>
static constexpr int slm_a_tile_bytes() {
  static_assert(BlkM % kSlmALaneElems == 0 && BlkK % kSlmASgSize == 0,
                "a lane-blocked A tile is a whole number of 16x16 blocks");
  return (BlkM / kSlmALaneElems) * (BlkK / kSlmASgSize) * kSlmABlockBytes;
}

/* Decorated local-space pointers: SLM address arithmetic stays 32-bit. */
using SlmPtr = sycl::decorated_local_ptr<char>::pointer;
using SlmCPtr = sycl::decorated_local_ptr<const char>::pointer;

/* One lane's 32 B run. A plain aggregate copied whole, so it moves as vector
 * messages and lands straight in the fragment's registers; 16 B alignment is
 * what a fragment guarantees. */
struct alignas(16) SlmLaneRun {
  uint32_t w[8];
};
using SlmLaneRunPtr = sycl::decorated_local_ptr<SlmLaneRun>::pointer;
using SlmLaneRunCPtr = sycl::decorated_local_ptr<const SlmLaneRun>::pointer;

/* Stores this sub-group's (16 m, SG_N n) fp32 C accumulator, narrowed to T,
 * as columns k = n of a lane-blocked A tile: the producer's N index is the
 * consumer's contracted index. KBlocks is the tile's BLK_K/16. */
template <int KBlocks, class T, class CFrag>
CUTE_DEVICE void store_C_frag_slm_A(
    CFrag const& tSrC,
    SlmPtr tile,
    int sg_m,
    int sg_n,
    int lane) {
  static_assert(sizeof(T) == 2, "lane-blocked SLM tiles are 16-bit");
  using CLayout = cute::remove_cvref_t<decltype(tSrC.layout())>;
  constexpr int kNBlk = cute::size<2>(CLayout{});
  constexpr int kMRun = cute::size<0>(CLayout{}) * cute::size<1>(CLayout{});
  static_assert(kMRun == kSlmALaneElems,
                "C fragment must own exactly 16 m-rows per lane");
  static_assert(kNBlk <= KBlocks, "C n-blocks must fit the tile's k-blocks");

  CUTE_UNROLL
  for (int nb = 0; nb < kNBlk; ++nb) {
    // Narrow in registers first so the block leaves as one 32 B run.
    alignas(16) T run[kSlmALaneElems];
    CUTE_UNROLL
    for (int i = 0; i < kSlmALaneElems; ++i) {
      run[i] = static_cast<T>(tSrC(nb * kSlmALaneElems + i));
    }
    *reinterpret_cast<SlmLaneRunPtr>(
        tile + (sg_m * KBlocks + sg_n * kNBlk + nb) * kSlmABlockBytes +
        lane * kSlmALaneBytes) = *reinterpret_cast<const SlmLaneRun*>(run);
  }
}

/* Gathers this sub-group's A operand -- 16 m-rows by the full BLK_K -- out of a
 * lane-blocked A tile straight into its MMA fragment, no reorder in front of
 * the dpas. */
template <class T, class AFrag>
CUTE_DEVICE void load_A_frag_slm(AFrag& tCrA, SlmCPtr tile, int sg_m, int lane) {
  static_assert(sizeof(T) == 2, "lane-blocked SLM tiles are 16-bit");
  using ALayout = cute::remove_cvref_t<decltype(tCrA.layout())>;
  constexpr int kKBlk = cute::size<2>(ALayout{});
  constexpr int kMRun = cute::size<0>(ALayout{}) * cute::size<1>(ALayout{});
  static_assert(kMRun == kSlmALaneElems,
                "A fragment must own exactly 16 m-rows per lane");

  CUTE_UNROLL
  for (int kb = 0; kb < kKBlk; ++kb) {
    *reinterpret_cast<SlmLaneRun*>(&tCrA(kb * kSlmALaneElems)) =
        *reinterpret_cast<SlmLaneRunCPtr>(
            tile + (sg_m * kKBlk + kb) * kSlmABlockBytes +
            lane * kSlmALaneBytes);
  }
}

/* ---- Lane-blocked SLM tiles for DPAS B operands ----------------------------
 *
 * The B mirror of the tile above, for a C accumulator whose M index becomes the
 * consumer's contracted index (C = A*B^T feeding X = Y*C^T). A (64 n, 64 k) T
 * tile stored as the dpas B register image itself: for each (k-atom, 16-wide
 * n-block) lane n holds the 32 B run k = 0..15 of column n, dword j covering
 * k = 2j, 2j+1. Element (n, k) lives at byte
 *   (k/16)*2048 + (n/16)*512 + (n%16)*32 + (k%16)*2
 *
 * A C fragment -- lane t holds column t + 16h, m = 0..15 -- therefore stores
 * into it as two 32 B runs with no cross-lane traffic, and the B operand loads
 * back as 8 d32x8 messages per k-tile with 512 contiguous bytes per message.
 *
 * Unlike the A side this works on the raw dword image rather than cute's
 * logical element view: the dpas B source is read as dwords, and a lane-blocked
 * run *is* that dword image, so cute::gemm hands each atom's 8 dwords to the
 * dpas untouched with no dword -> bf16 re-layout in front of it.
 */
static constexpr int kSlmBTileBytes = 64 * 64 * 2;
static constexpr int kSlmBAtomBytes = 16 * 64 * 2;    // one k-atom, all 64 n
static constexpr int kSlmBNBlockBytes = 16 * 16 * 2;  // one k-atom, 16 n
static constexpr int kSlmBLaneBytes = 32;

/* The sub-group's B tile as packed dwords: (8 dwords, 2 n-atoms, 4 k-atoms). */
using RawBVec = cute::intel::vector_t<uint32_t, 8>;
using PackedBFrag = decltype(make_tensor<uint32_t>(Layout<Shape<_8, _2, _4>>{}));

/* Stores a (16 m, 32 n) fp32 C fragment, narrowed to T, as rows k = m of the
 * B tile: the producer's M index is the consumer's contracted index. */
template <class T, class CFrag>
CUTE_DEVICE void store_C_frag_slm_B(
    CFrag const& tSrC,
    SlmPtr tile,
    int sg_m,
    int sg_n,
    int lane) {
  static_assert(sizeof(T) == 2, "lane-blocked SLM tiles are 16-bit");
  using CLayout = cute::remove_cvref_t<decltype(tSrC.layout())>;
  static_assert(cute::size(CLayout{}) == 32,
                "C fragment must be (16 m, 32 n) per sub-group");

  CUTE_UNROLL
  for (int h = 0; h < 2; ++h) {
    alignas(16) T run[kSlmALaneElems];
    CUTE_UNROLL
    for (int i = 0; i < kSlmALaneElems; ++i) {
      run[i] = static_cast<T>(tSrC(kSlmALaneElems * h + i));
    }
    *reinterpret_cast<SlmLaneRunPtr>(
        tile + sg_m * kSlmBAtomBytes + (2 * sg_n + h) * kSlmBNBlockBytes +
        lane * kSlmBLaneBytes) = *reinterpret_cast<const SlmLaneRun*>(run);
  }
}

/* Gathers this sub-group's packed dword B operand out of a lane-blocked B
 * tile, ready to hand straight to cute::gemm. */
template <class T>
CUTE_DEVICE void load_B_raw_slm(
    PackedBFrag& B,
    SlmCPtr tile,
    int sg_n,
    int lane) {
  static_assert(sizeof(T) == 2, "lane-blocked SLM tiles are 16-bit");
  static_assert(sizeof(RawBVec) == sizeof(SlmLaneRun));
  auto rB = recast<RawBVec>(B);  // (k-atom ka, n-block h) at rB(2 * ka + h)
  CUTE_UNROLL
  for (int ka = 0; ka < 4; ++ka) {
    CUTE_UNROLL
    for (int h = 0; h < 2; ++h) {
      auto src = reinterpret_cast<SlmLaneRunCPtr>(
          tile + ka * kSlmBAtomBytes + (2 * sg_n + h) * kSlmBNBlockBytes +
          lane * kSlmBLaneBytes);
      rB(2 * ka + h) = sycl::bit_cast<RawBVec>(*src);
    }
  }
}

template <
    class ATensor,
    class BTensor,
    class SGCTensor,
    class TiledMMA>
CUTE_DEVICE void gemm_TTS(
    ATensor const& A,  // (M,K)
    BTensor const& B,  // (N,K)
    SGCTensor& tCrC,   // (M,N)
    int wg_m,          // m tile start id
    int wg_n,          // n tile start id
    TiledMMA const& mma) {
  auto item = sycl::ext::oneapi::this_work_item::get_nd_item<3>();
  int local_id = item.get_local_linear_id();

  Tensor cA = make_identity_tensor(A.shape());
  Tensor cB = make_identity_tensor(B.shape());

  auto wg_tile = mma.tile_mnk();
  auto wg_coord = make_coord(wg_m, wg_n, 0);

  Tensor gA = local_tile(
      cA, select<0, 2>(wg_tile), make_coord(wg_m, _));  // (BLK_M,BLK_K,k)
  Tensor gB = local_tile(
      cB, select<1, 2>(wg_tile), make_coord(wg_n, _));  // (BLK_N,BLK_K,k)

  auto copy_a = get_block_2d_copy_A<void>(mma, A);
  auto copy_b = get_block_2d_copy_B<void>(mma, B);

  auto thr_mma = mma.get_slice(local_id);
  auto thr_copy_a = copy_a.get_slice(local_id);
  auto thr_copy_b = copy_b.get_slice(local_id);

  auto tCrA = thr_mma.partition_sg_fragment_A(gA(_, _, 0));
  auto tCrB = thr_mma.partition_sg_fragment_B(gB(_, _, 0));

  auto tArA = thr_copy_a.partition_sg_fragment_D(gA(_, _, 0));
  auto tBrB = thr_copy_b.partition_sg_fragment_D(gB(_, _, 0));

  Tensor tAgA = thr_copy_a.partition_S(gA);
  Tensor tBgB = thr_copy_b.partition_S(gB);

  auto prefetch_a = make_block_2d_prefetch(copy_a);
  auto prefetch_b = make_block_2d_prefetch(copy_b);

  auto thr_prefetch_A = prefetch_a.get_slice(local_id);
  auto thr_prefetch_B = prefetch_b.get_slice(local_id);

  auto pAgA = thr_prefetch_A.partition_S(gA);
  auto pBgB = thr_prefetch_B.partition_S(gB);

  const int prefetch_dist = 3;

  constexpr SPIRVScope barrier_scope = ScopeWorkgroup;

  int k_tile_count = ceil_div(shape<1>(A), get<2>(wg_tile));
  int k_tile_prefetch = 0;

  CUTE_UNROLL
  for (; k_tile_prefetch < prefetch_dist; k_tile_prefetch++) {
    prefetch(prefetch_a, pAgA(_, _, _, k_tile_prefetch));
    prefetch(prefetch_b, pBgB(_, _, _, k_tile_prefetch));
  }

  for (int k_tile = 0; k_tile < k_tile_count; k_tile++, k_tile_prefetch++) {
    barrier_arrive(barrier_scope);

    copy(copy_a, tAgA(_, _, _, k_tile), tArA);
    copy(copy_b, tBgB(_, _, _, k_tile), tBrB);

    if (k_tile_prefetch < k_tile_count) {
      prefetch(prefetch_a, pAgA(_, _, _, k_tile_prefetch));
      prefetch(prefetch_b, pBgB(_, _, _, k_tile_prefetch));
    }

    reorder(tArA, tCrA);
    reorder(tBrB, tCrB);

    cute::gemm(mma, tCrA, tCrB, tCrC);

    barrier_wait(barrier_scope);
  }
}

template <
    class ASGCTensor,
    class BTensor,
    class CSGCTensor,
    class TiledMMA>
CUTE_DEVICE void gemm_STS(
    ASGCTensor const& tCrA,  // (M,K)
    BTensor const& B,        // (N,K)
    CSGCTensor& tCrC,        // (M,N)
    int wg_m,                // m tile start id
    int wg_n,                // n tile start id
    TiledMMA const& mma) {
  auto item = sycl::ext::oneapi::this_work_item::get_nd_item<3>();
  int local_id = item.get_local_linear_id();

  Tensor cB = make_identity_tensor(B.shape());

  auto wg_tile = mma.tile_mnk();
  auto wg_coord = make_coord(wg_m, wg_n, 0);

  Tensor gB = local_tile(
      cB, select<1, 2>(wg_tile), make_coord(wg_n, _));  // (BLK_N,BLK_K,k)

  auto copy_b = get_block_2d_copy_B<void>(mma, B);

  auto thr_mma = mma.get_slice(local_id);
  auto thr_copy_b = copy_b.get_slice(local_id);

  auto tCrB = thr_mma.partition_sg_fragment_B(gB(_, _, 0));

  auto tBrB = thr_copy_b.partition_sg_fragment_D(gB(_, _, 0));

  Tensor tBgB = thr_copy_b.partition_S(gB);

  auto prefetch_b = make_block_2d_prefetch(copy_b);

  auto thr_prefetch_B = prefetch_b.get_slice(local_id);

  auto pBgB = thr_prefetch_B.partition_S(gB);

  const int prefetch_dist = 3;

  constexpr SPIRVScope barrier_scope = ScopeWorkgroup;

  int k_tile_count = ceil_div(shape<1>(B), get<2>(wg_tile));
  int k_tile_prefetch = 0;

  CUTE_UNROLL
  for (; k_tile_prefetch < prefetch_dist; k_tile_prefetch++) {
    prefetch(prefetch_b, pBgB(_, _, _, k_tile_prefetch));
  }

  for (int k_tile = 0; k_tile < k_tile_count; k_tile++, k_tile_prefetch++) {
    barrier_arrive(barrier_scope);

    copy(copy_b, tBgB(_, _, _, k_tile), tBrB);

    if (k_tile_prefetch < k_tile_count) {
      prefetch(prefetch_b, pBgB(_, _, _, k_tile_prefetch));
    }

    reorder(tBrB, tCrB);

    cute::gemm(mma, tCrA, tCrB, tCrC);

    barrier_wait(barrier_scope);
  }
}

template <
    class ATensor,
    class BSGCTensor,
    class CSGCTensor,
    class TiledMMA>
CUTE_DEVICE void gemm_TSS(
    ATensor const& A,        // (M,K)
    BSGCTensor const& tCrB,  // (N,K)
    CSGCTensor& tCrC,        // (M,N)
    int wg_m,                // m tile start id
    int wg_n,                // n tile start id
    TiledMMA const& mma) {
  auto item = sycl::ext::oneapi::this_work_item::get_nd_item<3>();
  int local_id = item.get_local_linear_id();

  Tensor cA = make_identity_tensor(A.shape());

  auto wg_tile = mma.tile_mnk();
  auto wg_coord = make_coord(wg_m, wg_n, 0);

  Tensor gA = local_tile(
      cA, select<0, 2>(wg_tile), make_coord(wg_m, _));  // (BLK_M,BLK_K,k)

  auto copy_a = get_block_2d_copy_A<void>(mma, A);

  auto thr_mma = mma.get_slice(local_id);
  auto thr_copy_a = copy_a.get_slice(local_id);

  auto tCrA = thr_mma.partition_sg_fragment_A(gA(_, _, 0));

  auto tArA = thr_copy_a.partition_sg_fragment_D(gA(_, _, 0));

  Tensor tAgA = thr_copy_a.partition_S(gA);

  auto prefetch_a = make_block_2d_prefetch(copy_a);

  auto thr_prefetch_A = prefetch_a.get_slice(local_id);

  auto pAgA = thr_prefetch_A.partition_S(gA);

  const int prefetch_dist = 3;

  constexpr SPIRVScope barrier_scope = ScopeWorkgroup;

  int k_tile_count = ceil_div(shape<1>(A), get<2>(wg_tile));
  int k_tile_prefetch = 0;

  CUTE_UNROLL
  for (; k_tile_prefetch < prefetch_dist; k_tile_prefetch++) {
    prefetch(prefetch_a, pAgA(_, _, _, k_tile_prefetch));
  }

  for (int k_tile = 0; k_tile < k_tile_count; k_tile++, k_tile_prefetch++) {
    barrier_arrive(barrier_scope);

    copy(copy_a, tAgA(_, _, _, k_tile), tArA);

    if (k_tile_prefetch < k_tile_count) {
      prefetch(prefetch_a, pAgA(_, _, _, k_tile_prefetch));
    }

    reorder(tArA, tCrA);

    cute::gemm(mma, tCrA, tCrB, tCrC);

    barrier_wait(barrier_scope);
  }
}

template <
    class ATensor,
    class BTensor,
    class SGCTensor,
    class TiledMMA>
CUTE_DEVICE void gemm_TTS_k_multi(
    ATensor const& A,  // (M,K)
    BTensor const& B,  // (N,K)
    SGCTensor& tCrC,   // (M,N)
    int wg_m,          // m tile start id
    int wg_n,          // n tile start id
    TiledMMA const& mma,
    float* K_multi) {
  auto item = sycl::ext::oneapi::this_work_item::get_nd_item<3>();
  int local_id = item.get_local_linear_id();
  auto sg = item.get_sub_group();
  int sg_local_id = sg.get_local_linear_id();

  Tensor cA = make_identity_tensor(A.shape());
  Tensor cB = make_identity_tensor(B.shape());

  auto wg_tile = mma.tile_mnk();
  auto wg_coord = make_coord(wg_m, wg_n, 0);

  Tensor gA = local_tile(
      cA, select<0, 2>(wg_tile), make_coord(wg_m, _));  // (BLK_M,BLK_K,k)
  Tensor gB = local_tile(
      cB, select<1, 2>(wg_tile), make_coord(wg_n, _));  // (BLK_N,BLK_K,k)

  auto copy_a = get_block_2d_copy_A<void>(mma, A);
  auto copy_b = get_block_2d_copy_B<void>(mma, B);

  auto thr_mma = mma.get_slice(local_id);
  auto thr_copy_a = copy_a.get_slice(local_id);
  auto thr_copy_b = copy_b.get_slice(local_id);

  auto tCrA = thr_mma.partition_sg_fragment_A(gA(_, _, 0));
  auto tCrB = thr_mma.partition_sg_fragment_B(gB(_, _, 0));

  auto tArA = thr_copy_a.partition_sg_fragment_D(gA(_, _, 0));
  auto tBrB = thr_copy_b.partition_sg_fragment_D(gB(_, _, 0));

  Tensor tAgA = thr_copy_a.partition_S(gA);
  Tensor tBgB = thr_copy_b.partition_S(gB);

  auto prefetch_a = make_block_2d_prefetch(copy_a);
  auto prefetch_b = make_block_2d_prefetch(copy_b);

  auto thr_prefetch_A = prefetch_a.get_slice(local_id);
  auto thr_prefetch_B = prefetch_b.get_slice(local_id);

  auto pAgA = thr_prefetch_A.partition_S(gA);
  auto pBgB = thr_prefetch_B.partition_S(gB);

  const int prefetch_dist = 3;

  constexpr SPIRVScope barrier_scope = ScopeWorkgroup;

  int k_tile_count = ceil_div(shape<1>(A), get<2>(wg_tile));
  int k_tile_prefetch = 0;

  CUTE_UNROLL
  for (; k_tile_prefetch < prefetch_dist; k_tile_prefetch++) {
    prefetch(prefetch_a, pAgA(_, _, _, k_tile_prefetch));
    prefetch(prefetch_b, pBgB(_, _, _, k_tile_prefetch));
  }

  for (int k_tile = 0; k_tile < k_tile_count; k_tile++, k_tile_prefetch++) {
    barrier_arrive(barrier_scope);

    copy(copy_a, tAgA(_, _, _, k_tile), tArA);
    copy(copy_b, tBgB(_, _, _, k_tile), tBrB);

    if (k_tile_prefetch < k_tile_count) {
      prefetch(prefetch_a, pAgA(_, _, _, k_tile_prefetch));
      prefetch(prefetch_b, pBgB(_, _, _, k_tile_prefetch));
    }

    reorder(tArA, tCrA);
    reorder(tBrB, tCrB);

    using TA = typename ATensor::element_type;
    Tensor A_frag = make_tensor<TA>(tCrA.layout());
    static constexpr auto I = decltype(size<0>(A_frag))::value;
    static constexpr auto J = decltype(size<1>(A_frag))::value;
    static constexpr auto K = decltype(size<2>(A_frag))::value;
    static constexpr int mma_K = 16;

    CUTE_UNROLL
    for (int k = 0; k < K; ++k) {
      float scale = K_multi[k_tile * get<2>(wg_tile) + k * mma_K + sg_local_id];
      CUTE_UNROLL
      for (int e = 0; e < I * J; ++e) {
        tCrA[k * I * J + e] =
            static_cast<TA>(static_cast<float>(tCrA[k * I * J + e]) * scale);
      }
    }

    cute::gemm(mma, tCrA, tCrB, tCrC);

    barrier_wait(barrier_scope);
  }
}

// Fused dual-A GEMM: computes C1 += A1 * B^T and C2 += A2 * B^T
// sharing the same B operand load. B is loaded once per k_tile and
// reused in registers for both DPAS operations.
template <
    class A1Tensor,
    class A2Tensor,
    class BTensor,
    class SGCTensor1,
    class SGCTensor2,
    class TiledMMA>
CUTE_DEVICE void gemm_TTS_fused_2A(
    A1Tensor const& A1,  // (M,K) first A operand
    A2Tensor const& A2,  // (M,K) second A operand
    BTensor const& B,    // (N,K) shared B operand
    SGCTensor1& tCrC1,   // accumulator for A1 * B^T
    SGCTensor2& tCrC2,   // accumulator for A2 * B^T
    int wg_m1,           // m tile index for A1
    int wg_m2,           // m tile index for A2
    int wg_n,            // n tile index for B (shared)
    TiledMMA const& mma) {
  auto item = sycl::ext::oneapi::this_work_item::get_nd_item<3>();
  int local_id = item.get_local_linear_id();

  Tensor cA1 = make_identity_tensor(A1.shape());
  Tensor cA2 = make_identity_tensor(A2.shape());
  Tensor cB = make_identity_tensor(B.shape());

  auto wg_tile = mma.tile_mnk();

  Tensor gA1 = local_tile(cA1, select<0, 2>(wg_tile), make_coord(wg_m1, _));
  Tensor gA2 = local_tile(cA2, select<0, 2>(wg_tile), make_coord(wg_m2, _));
  Tensor gB = local_tile(cB, select<1, 2>(wg_tile), make_coord(wg_n, _));

  auto copy_a1 = get_block_2d_copy_A<void>(mma, A1);
  auto copy_a2 = get_block_2d_copy_A<void>(mma, A2);
  auto copy_b = get_block_2d_copy_B<void>(mma, B);

  auto thr_mma = mma.get_slice(local_id);
  auto thr_copy_a1 = copy_a1.get_slice(local_id);
  auto thr_copy_a2 = copy_a2.get_slice(local_id);
  auto thr_copy_b = copy_b.get_slice(local_id);

  // MMA fragments: A fragment reused for both A1 and A2, B shared
  auto tCrA = thr_mma.partition_sg_fragment_A(gA1(_, _, 0));
  auto tCrB = thr_mma.partition_sg_fragment_B(gB(_, _, 0));

  // Copy destination registers: separate for A1 and A2
  auto tArA1 = thr_copy_a1.partition_sg_fragment_D(gA1(_, _, 0));
  auto tArA2 = thr_copy_a2.partition_sg_fragment_D(gA2(_, _, 0));
  auto tBrB = thr_copy_b.partition_sg_fragment_D(gB(_, _, 0));

  // Source partitions
  Tensor tAgA1 = thr_copy_a1.partition_S(gA1);
  Tensor tAgA2 = thr_copy_a2.partition_S(gA2);
  Tensor tBgB = thr_copy_b.partition_S(gB);

  // Prefetch setup
  auto prefetch_a1 = make_block_2d_prefetch(copy_a1);
  auto prefetch_a2 = make_block_2d_prefetch(copy_a2);
  auto prefetch_b = make_block_2d_prefetch(copy_b);

  auto thr_prefetch_A1 = prefetch_a1.get_slice(local_id);
  auto thr_prefetch_A2 = prefetch_a2.get_slice(local_id);
  auto thr_prefetch_B = prefetch_b.get_slice(local_id);

  auto pAgA1 = thr_prefetch_A1.partition_S(gA1);
  auto pAgA2 = thr_prefetch_A2.partition_S(gA2);
  auto pBgB = thr_prefetch_B.partition_S(gB);

  const int prefetch_dist = 3;

  constexpr SPIRVScope barrier_scope = ScopeWorkgroup;

  int k_tile_count = ceil_div(shape<1>(A1), get<2>(wg_tile));
  int k_tile_prefetch = 0;

  CUTE_UNROLL
  for (; k_tile_prefetch < prefetch_dist; k_tile_prefetch++) {
    prefetch(prefetch_a1, pAgA1(_, _, _, k_tile_prefetch));
    prefetch(prefetch_a2, pAgA2(_, _, _, k_tile_prefetch));
    prefetch(prefetch_b, pBgB(_, _, _, k_tile_prefetch));
  }

  for (int k_tile = 0; k_tile < k_tile_count; k_tile++, k_tile_prefetch++) {
    barrier_arrive(barrier_scope);

    // Load shared B and both A operands
    copy(copy_b, tBgB(_, _, _, k_tile), tBrB);
    copy(copy_a1, tAgA1(_, _, _, k_tile), tArA1);
    copy(copy_a2, tAgA2(_, _, _, k_tile), tArA2);

    if (k_tile_prefetch < k_tile_count) {
      prefetch(prefetch_a1, pAgA1(_, _, _, k_tile_prefetch));
      prefetch(prefetch_a2, pAgA2(_, _, _, k_tile_prefetch));
      prefetch(prefetch_b, pBgB(_, _, _, k_tile_prefetch));
    }

    // Reorder B (shared) and A1, then first GEMM
    reorder(tBrB, tCrB);
    reorder(tArA1, tCrA);
    cute::gemm(mma, tCrA, tCrB, tCrC1);

    // Reorder A2 reusing MMA A fragment, B stays in register
    reorder(tArA2, tCrA);
    cute::gemm(mma, tCrA, tCrB, tCrC2);

    barrier_wait(barrier_scope);
  }
}

}  // namespace gdn