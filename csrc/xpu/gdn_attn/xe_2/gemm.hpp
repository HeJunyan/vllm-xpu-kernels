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

/* How many k-tiles ahead the GEMMs run their block-2D prefetches. */
static constexpr int kPrefetchDist = 3;

/* ---- Standalone operand prefetch and load ----------------------------------
 *
 * The warm-up a gemm_* issues before its k-loop, and the copy+reorder it does
 * inside, are the two parts of its pipeline the caller may want to own.
 *
 * Hoisting the prefetch lets it be issued earlier -- ahead of a barrier the
 * GEMM must trail, or ahead of unrelated work -- which is the whole point of a
 * prefetch: the further in front of the load it sits, the more latency it
 * hides.
 *
 * Hoisting the load lets one operand serve several GEMMs. A fragment loaded
 * once here is reordered once; feeding it to a gemm_S** variant then skips
 * both the block-2D load and the reorder every consumer would otherwise pay.
 * Watch the live range when holding one: a fragment kept across an unrelated
 * GEMM is register pressure exactly where that GEMM needs the registers.
 */
template <class ATensor, class TiledMMA>
CUTE_DEVICE void prefetch_A(
    ATensor const& A,  // (M,K) gmem
    int wg_m,
    TiledMMA const& mma,
    int k_tiles = kPrefetchDist) {
  auto item = sycl::ext::oneapi::this_work_item::get_nd_item<3>();
  int local_id = item.get_local_linear_id();

  Tensor cA = make_identity_tensor(A.shape());
  auto wg_tile = mma.tile_mnk();
  Tensor gA = local_tile(cA, select<0, 2>(wg_tile), make_coord(wg_m, _));

  auto prefetch_a = make_block_2d_prefetch(get_block_2d_copy_A<void>(mma, A));
  auto pAgA = prefetch_a.get_slice(local_id).partition_S(gA);

  int k_tile_count = ceil_div(shape<1>(A), get<2>(wg_tile));
  CUTE_UNROLL
  for (int i = 0; i < k_tiles; ++i) {
    if (i < k_tile_count) {
      prefetch(prefetch_a, pAgA(_, _, _, i));
    }
  }
}

template <class BTensor, class TiledMMA>
CUTE_DEVICE void prefetch_B(
    BTensor const& B,  // (N,K) gmem
    int wg_n,
    TiledMMA const& mma,
    int k_tiles = kPrefetchDist) {
  auto item = sycl::ext::oneapi::this_work_item::get_nd_item<3>();
  int local_id = item.get_local_linear_id();

  Tensor cB = make_identity_tensor(B.shape());
  auto wg_tile = mma.tile_mnk();
  Tensor gB = local_tile(cB, select<1, 2>(wg_tile), make_coord(wg_n, _));

  auto prefetch_b = make_block_2d_prefetch(get_block_2d_copy_B<void>(mma, B));
  auto pBgB = prefetch_b.get_slice(local_id).partition_S(gB);

  int k_tile_count = ceil_div(shape<1>(B), get<2>(wg_tile));
  CUTE_UNROLL
  for (int i = 0; i < k_tiles; ++i) {
    if (i < k_tile_count) {
      prefetch(prefetch_b, pBgB(_, _, _, i));
    }
  }
}

/* Empty MMA operand fragments, so a caller can declare one without spelling
 * out the partitioning. */
template <class TiledMMA>
CUTE_DEVICE auto make_A_frag(TiledMMA const& mma) {
  auto item = sycl::ext::oneapi::this_work_item::get_nd_item<3>();
  int local_id = item.get_local_linear_id();
  Tensor cA = make_identity_tensor(select<0, 2>(mma.tile_mnk()));
  return mma.get_slice(local_id).partition_sg_fragment_A(cA);
}

template <class TiledMMA>
CUTE_DEVICE auto make_B_frag(TiledMMA const& mma) {
  auto item = sycl::ext::oneapi::this_work_item::get_nd_item<3>();
  int local_id = item.get_local_linear_id();
  Tensor cB = make_identity_tensor(select<1, 2>(mma.tile_mnk()));
  return mma.get_slice(local_id).partition_sg_fragment_B(cB);
}

/* Loads one BLK_M x BLK_K tile of a gmem A operand into the caller's fragment:
 * the block-2D copy and the reorder a GEMM would have done inline. */
template <class ATensor, class TiledMMA, class AFrag>
CUTE_DEVICE void load_A(
    ATensor const& A,  // (M,K) gmem
    int wg_m,
    TiledMMA const& mma,
    AFrag& tCrA,  // out
    int k_tile = 0) {
  auto item = sycl::ext::oneapi::this_work_item::get_nd_item<3>();
  int local_id = item.get_local_linear_id();

  Tensor cA = make_identity_tensor(A.shape());
  auto wg_tile = mma.tile_mnk();
  Tensor gA = local_tile(cA, select<0, 2>(wg_tile), make_coord(wg_m, _));

  auto copy_a = get_block_2d_copy_A<void>(mma, A);
  auto thr_copy_a = copy_a.get_slice(local_id);
  auto tArA = thr_copy_a.partition_sg_fragment_D(gA(_, _, 0));
  Tensor tAgA = thr_copy_a.partition_S(gA);

  copy(copy_a, tAgA(_, _, _, k_tile), tArA);
  reorder(tArA, tCrA);
}

template <class BTensor, class TiledMMA, class BFrag>
CUTE_DEVICE void load_B(
    BTensor const& B,  // (N,K) gmem
    int wg_n,
    TiledMMA const& mma,
    BFrag& tCrB,  // out
    int k_tile = 0) {
  auto item = sycl::ext::oneapi::this_work_item::get_nd_item<3>();
  int local_id = item.get_local_linear_id();

  Tensor cB = make_identity_tensor(B.shape());
  auto wg_tile = mma.tile_mnk();
  Tensor gB = local_tile(cB, select<1, 2>(wg_tile), make_coord(wg_n, _));

  auto copy_b = get_block_2d_copy_B<void>(mma, B);
  auto thr_copy_b = copy_b.get_slice(local_id);
  auto tBrB = thr_copy_b.partition_sg_fragment_D(gB(_, _, 0));
  Tensor tBgB = thr_copy_b.partition_S(gB);

  copy(copy_b, tBgB(_, _, _, k_tile), tBrB);
  reorder(tBrB, tCrB);
}

/* ---- Lane-blocked SLM staging for DPAS operands ----------------------------
 *
 * One layout, written once, read three ways.
 *
 * A GEMM result lives in a C accumulator. When a later GEMM wants that result
 * as an operand the two sides disagree about which lane holds which element,
 * and on Xe a sub-group cannot read another sub-group's registers, so the
 * exchange has to land in SLM. Staging it lane-blocked makes the re-layout pure
 * address arithmetic: every value stays in the lane that produced it, and
 * neither side needs a cute::reorder.
 *
 * The tile holds an (M, N) result in 16x16 blocks. Inside a block lane l owns
 * column n = 16*nb + l and its sixteen values are m = 0..15, one 32 B run --
 * exactly the shape of a C fragment, so the store is a narrow plus a scatter of
 * whole runs. Element (m, n) lives at byte
 *
 *   (m/16)*NBlocks*512 + (n/16)*512 + (n%16)*32 + (m%16)*2
 *
 * The readings differ only in which producer axis the consumer contracts over:
 *
 *   load_A_frag_slm    A(m, k=n)    contracts over N   32 B runs
 *   load_B_raw_slm     B(n, k=m)    contracts over M   32 B runs
 *   load_A_frag_slm_T  A(m=n, k=m)  contracts over M   16-bit, coalesced
 *
 * Only the transposed A reading is strided, and unavoidably so: the tile keeps
 * sixteen contiguous m per lane while that operand wants sixteen contiguous n.
 * It still moves nothing across lanes -- the sixteen lanes of one message cover
 * sixteen adjacent slots, so each access is a full 32 B line -- but it costs
 * message count, so gather once and reuse the fragment across GEMMs.
 */
static constexpr int kSlmSgSize = 16;
static constexpr int kSlmLaneElems = 16;  // m-run owned by one lane
static constexpr int kSlmLaneBytes = kSlmLaneElems * 2;
// One 16x16 block across all lanes.
static constexpr int kSlmBlockBytes = kSlmLaneBytes * kSlmSgSize;

/* Bytes needed to stage an (m, n) result. */
CUTE_HOST_DEVICE constexpr int slm_tile_bytes(int m, int n) {
  return (m / kSlmLaneElems) * (n / kSlmSgSize) * kSlmBlockBytes;
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

/* The sub-group's B operand as packed dwords: (8 dwords, 2 n-atoms, 4 k-atoms).
 * The dpas B source is read as dwords and a lane-blocked run already is that
 * dword image, so cute::gemm hands each atom's eight dwords to the dpas
 * untouched, with no dword -> bf16 re-layout in front of it. */
using RawBVec = cute::intel::vector_t<uint32_t, 8>;
using PackedBFrag = decltype(make_tensor<uint32_t>(Layout<Shape<_8, _2, _4>>{}));

/* Stages this sub-group's (16 m, SG_N n) fp32 C accumulator, narrowed to T.
 * nblocks is the tile's full n-block count and nblk_base is where this
 * accumulator's n tile starts in it, so one tile can hold a result wider than a
 * single accumulator. */
template <class T, class CFrag>
CUTE_DEVICE void store_C_frag_slm(
    CFrag const& tSrC,
    SlmPtr tile,
    int nblocks,
    int sg_m,
    int sg_n,
    int lane,
    int nblk_base = 0) {
  static_assert(sizeof(T) == 2, "lane-blocked SLM tiles are 16-bit");
  using CLayout = cute::remove_cvref_t<decltype(tSrC.layout())>;
  constexpr int kNBlk = cute::size<2>(CLayout{});
  constexpr int kMRun = cute::size<0>(CLayout{}) * cute::size<1>(CLayout{});
  static_assert(kMRun == kSlmLaneElems,
                "C fragment must own exactly 16 m-rows per lane");

  CUTE_UNROLL
  for (int nb = 0; nb < kNBlk; ++nb) {
    // Narrow in registers first so the block leaves as one 32 B run.
    alignas(16) T run[kSlmLaneElems];
    CUTE_UNROLL
    for (int i = 0; i < kSlmLaneElems; ++i) {
      run[i] = static_cast<T>(tSrC(nb * kSlmLaneElems + i));
    }
    *reinterpret_cast<SlmLaneRunPtr>(
        tile +
        (sg_m * nblocks + nblk_base + sg_n * kNBlk + nb) * kSlmBlockBytes +
        lane * kSlmLaneBytes) = *reinterpret_cast<const SlmLaneRun*>(run);
  }

  sycl::ext::oneapi::this_work_item::get_nd_item<3>().barrier(
      sycl::access::fence_space::local_space);
}

/* A(m, k = n): the consumer contracts over the producer's N. Gathers 16 m-rows
 * by one BLK_K straight into the MMA fragment. nblk_base selects the k-tile
 * when the staged result spans several. */
template <class T, class AFrag>
CUTE_DEVICE void load_A_frag_slm(
    AFrag& tCrA,
    SlmCPtr tile,
    int nblocks,
    int sg_m,
    int lane,
    int nblk_base = 0) {
  static_assert(sizeof(T) == 2, "lane-blocked SLM tiles are 16-bit");
  using ALayout = cute::remove_cvref_t<decltype(tCrA.layout())>;
  constexpr int kKBlk = cute::size<2>(ALayout{});
  constexpr int kMRun = cute::size<0>(ALayout{}) * cute::size<1>(ALayout{});
  static_assert(kMRun == kSlmLaneElems,
                "A fragment must own exactly 16 m-rows per lane");

  CUTE_UNROLL
  for (int kb = 0; kb < kKBlk; ++kb) {
    *reinterpret_cast<SlmLaneRun*>(&tCrA(kb * kSlmLaneElems)) =
        *reinterpret_cast<SlmLaneRunCPtr>(
            tile + (sg_m * nblocks + nblk_base + kb) * kSlmBlockBytes +
            lane * kSlmLaneBytes);
  }
}

/* B(n, k = m): the consumer contracts over the producer's M. */
template <class T>
CUTE_DEVICE void load_B_raw_slm(
    PackedBFrag& B,
    SlmCPtr tile,
    int nblocks,
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
          tile + (ka * nblocks + 2 * sg_n + h) * kSlmBlockBytes +
          lane * kSlmLaneBytes);
      rB(2 * ka + h) = sycl::bit_cast<RawBVec>(*src);
    }
  }
}

/* A(m = n, k = m): the staged result read transposed -- the producer's N
 * becomes the operand's M and the producer's M is the contracted index. This is
 * the reading the layout does not favour, so values arrive 16 bits at a time;
 * see the note above. */
template <class T, class AFrag>
CUTE_DEVICE void load_A_frag_slm_T(
    AFrag& tCrA,
    SlmCPtr tile,
    int nblocks,
    int sg_m,
    int lane) {
  static_assert(sizeof(T) == 2, "lane-blocked SLM tiles are 16-bit");
  using ALayout = cute::remove_cvref_t<decltype(tCrA.layout())>;
  constexpr int kKBlk = cute::size<2>(ALayout{});
  constexpr int kMRun = cute::size<0>(ALayout{}) * cute::size<1>(ALayout{});
  static_assert(kMRun == kSlmLaneElems,
                "A fragment must own exactly 16 m-rows per lane");
  using TCPtr = typename sycl::decorated_local_ptr<const T>::pointer;

  CUTE_UNROLL
  for (int kb = 0; kb < kKBlk; ++kb) {
    SlmCPtr blk = tile + (kb * nblocks + sg_m) * kSlmBlockBytes +
                  lane * static_cast<int>(sizeof(T));
    CUTE_UNROLL
    for (int i = 0; i < kSlmLaneElems; ++i) {
      tCrA(kb * kSlmLaneElems + i) =
          *reinterpret_cast<TCPtr>(blk + i * kSlmLaneBytes);
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

/* gemm_STS_k_multi: gemm_TTS_k_multi with A already in registers, loaded once
 * by the caller with load_A. B still streams from gmem through its own
 * prefetch pipeline, so this is the half-way step -- A is paid for once across
 * every consumer, B is not yet.
 *
 * A is scaled per k and consumers of the same matrix scale it differently, so
 * the held fragment stays unscaled and the scale is folded into the operand
 * built here -- which is the fragment gemm_TTS_k_multi would have reordered
 * into anyway. */
template <
    class ASGCTensor,
    class BTensor,
    class CSGCTensor,
    class TiledMMA>
CUTE_DEVICE void gemm_STS_k_multi(
    ASGCTensor const& tCrA_src,  // (M,K) held, unscaled
    BTensor const& B,            // (N,K) gmem
    CSGCTensor& tCrC,            // (M,N)
    int wg_m,                    // m tile start id
    int wg_n,                    // n tile start id
    TiledMMA const& mma,
    float* K_multi) {
  auto item = sycl::ext::oneapi::this_work_item::get_nd_item<3>();
  int local_id = item.get_local_linear_id();
  auto sg = item.get_sub_group();
  int sg_local_id = sg.get_local_linear_id();

  Tensor cB = make_identity_tensor(B.shape());

  auto wg_tile = mma.tile_mnk();

  Tensor gB = local_tile(cB, select<1, 2>(wg_tile), make_coord(wg_n, _));

  auto copy_b = get_block_2d_copy_B<void>(mma, B);

  auto thr_mma = mma.get_slice(local_id);
  auto thr_copy_b = copy_b.get_slice(local_id);

  auto tCrA = thr_mma.partition_sg_fragment_A(
      make_identity_tensor(select<0, 2>(wg_tile)));
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

    using TA = typename decltype(tCrA)::value_type;
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
            static_cast<TA>(static_cast<float>(tCrA_src[k * I * J + e]) * scale);
      }
    }

    cute::gemm(mma, tCrA, tCrB, tCrC);

    barrier_wait(barrier_scope);
  }
}

/* gemm_SSS_k_multi: gemm_TTS_k_multi with both operands already in registers,
 * loaded once by the caller with load_A / load_B. No gmem, so no block-2D
 * copy, no reorder, no prefetch and no k-loop -- the held fragments span one
 * BLK_K, which is the whole contraction.
 *
 * A is scaled per k and consumers of the same matrix scale it differently, so
 * the held fragment stays unscaled and the scale is folded into the copy that
 * builds the operand here. That copy is the fragment gemm_TTS_k_multi would
 * have reordered from gmem anyway, so holding A costs only the held fragment.
 */
template <
    class ASGCTensor,
    class BSGCTensor,
    class CSGCTensor,
    class TiledMMA>
CUTE_DEVICE void gemm_SSS_k_multi(
    ASGCTensor const& tCrA_src,  // (M,K) held, unscaled
    BSGCTensor const& tCrB,      // (N,K) held
    CSGCTensor& tCrC,            // (M,N)
    TiledMMA const& mma,
    int lane,
    float* K_multi) {
  auto tCrA = make_A_frag(mma);

  using TA = typename decltype(tCrA)::value_type;
  Tensor A_frag = make_tensor<TA>(tCrA.layout());
  static constexpr auto I = decltype(size<0>(A_frag))::value;
  static constexpr auto J = decltype(size<1>(A_frag))::value;
  static constexpr auto K = decltype(size<2>(A_frag))::value;
  static constexpr int mma_K = 16;

  CUTE_UNROLL
  for (int k = 0; k < K; ++k) {
    float scale = K_multi[k * mma_K + lane];
    CUTE_UNROLL
    for (int e = 0; e < I * J; ++e) {
      tCrA[k * I * J + e] =
          static_cast<TA>(static_cast<float>(tCrA_src[k * I * J + e]) * scale);
    }
  }

  cute::gemm(mma, tCrA, tCrB, tCrC);
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

/* gemm_QTS_fused_2A: gemm_TTS_fused_2A with A1 coming from a lane-blocked SLM
 * A tile instead of gmem. A1 is a C accumulator an earlier step produced, so
 * routing it through SLM drops both its HBM round-trip and the reorder in front
 * of each dpas -- the gather lands directly in the MMA fragment. A2 and the
 * shared B still stream from gmem with their prefetches untouched. */
template <
    class T,
    class A2Tensor,
    class BTensor,
    class SGCTensor1,
    class SGCTensor2,
    class TiledMMA>
CUTE_DEVICE void gemm_QTS_fused_2A(
    SlmCPtr sA1,       // lane-blocked A tile holding A1
    int a1_nblocks,    // staged A1's total n-block count
    A2Tensor const& A2,  // (M,K) second A operand
    BTensor const& B,    // (N,K) shared B operand
    SGCTensor1& tCrC1,   // accumulator for A1 * B^T
    SGCTensor2& tCrC2,   // accumulator for A2 * B^T
    int wg_m2,           // m tile index for A2
    int wg_n,            // n tile index for B (shared)
    TiledMMA const& mma,
    int sg_m,
    int lane) {
  auto item = sycl::ext::oneapi::this_work_item::get_nd_item<3>();
  int local_id = item.get_local_linear_id();

  Tensor cA2 = make_identity_tensor(A2.shape());
  Tensor cB = make_identity_tensor(B.shape());

  auto wg_tile = mma.tile_mnk();

  Tensor gA2 = local_tile(cA2, select<0, 2>(wg_tile), make_coord(wg_m2, _));
  Tensor gB = local_tile(cB, select<1, 2>(wg_tile), make_coord(wg_n, _));

  auto copy_a2 = get_block_2d_copy_A<void>(mma, A2);
  auto copy_b = get_block_2d_copy_B<void>(mma, B);

  auto thr_mma = mma.get_slice(local_id);
  auto thr_copy_a2 = copy_a2.get_slice(local_id);
  auto thr_copy_b = copy_b.get_slice(local_id);

  auto tCrA = thr_mma.partition_sg_fragment_A(gA2(_, _, 0));
  auto tCrB = thr_mma.partition_sg_fragment_B(gB(_, _, 0));

  auto tArA2 = thr_copy_a2.partition_sg_fragment_D(gA2(_, _, 0));
  auto tBrB = thr_copy_b.partition_sg_fragment_D(gB(_, _, 0));

  Tensor tAgA2 = thr_copy_a2.partition_S(gA2);
  Tensor tBgB = thr_copy_b.partition_S(gB);

  auto prefetch_a2 = make_block_2d_prefetch(copy_a2);
  auto prefetch_b = make_block_2d_prefetch(copy_b);

  auto thr_prefetch_A2 = prefetch_a2.get_slice(local_id);
  auto thr_prefetch_B = prefetch_b.get_slice(local_id);

  auto pAgA2 = thr_prefetch_A2.partition_S(gA2);
  auto pBgB = thr_prefetch_B.partition_S(gB);

  const int prefetch_dist = 3;

  constexpr SPIRVScope barrier_scope = ScopeWorkgroup;
  // k-blocks one MMA k-tile spans, i.e. how far the SLM gather steps per trip.
  constexpr int kKBlkPerTile =
      decltype(get<2>(wg_tile))::value / kSlmSgSize;

  int k_tile_count = ceil_div(shape<1>(A2), get<2>(wg_tile));
  int k_tile_prefetch = 0;

  CUTE_UNROLL
  for (; k_tile_prefetch < prefetch_dist; k_tile_prefetch++) {
    prefetch(prefetch_a2, pAgA2(_, _, _, k_tile_prefetch));
    prefetch(prefetch_b, pBgB(_, _, _, k_tile_prefetch));
  }

  for (int k_tile = 0; k_tile < k_tile_count; k_tile++, k_tile_prefetch++) {
    barrier_arrive(barrier_scope);

    copy(copy_b, tBgB(_, _, _, k_tile), tBrB);
    copy(copy_a2, tAgA2(_, _, _, k_tile), tArA2);

    if (k_tile_prefetch < k_tile_count) {
      prefetch(prefetch_a2, pAgA2(_, _, _, k_tile_prefetch));
      prefetch(prefetch_b, pBgB(_, _, _, k_tile_prefetch));
    }

    reorder(tBrB, tCrB);

    // A1 gathers straight into the MMA fragment -- no reorder.
    load_A_frag_slm<T>(
        tCrA, sA1, a1_nblocks, sg_m, lane, k_tile * kKBlkPerTile);
    cute::gemm(mma, tCrA, tCrB, tCrC1);

    // Reorder A2 reusing MMA A fragment, B stays in register
    reorder(tArA2, tCrA);
    cute::gemm(mma, tCrA, tCrB, tCrC2);

    barrier_wait(barrier_scope);
  }
}

}  // namespace gdn