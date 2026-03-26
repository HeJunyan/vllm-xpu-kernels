/***************************************************************************************************
 * Copyright (c) 2025 - 2025 Codeplay Software Ltd. All rights reserved.
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
#pragma once

#include "cutlass/cutlass.h"
#include "cutlass/gemm/dispatch_policy.hpp"
#include "cutlass/fp8_to_fp16.h"

#include "cute/algorithm/functional.hpp"
#include "cute/atom/mma_atom.hpp"
#include "cute/algorithm/gemm.hpp"
#include "cutlass/gemm/collective/xe_mma_blockscaled_fp8.hpp"
/////////////////////////////////////////////////////////////////////////////////////////////////
namespace cutlass::gemm {

template <
    int Stages_,
    int GroupN_ = 128,
    int GroupK_ = 128,
    class KernelSchedule = KernelMoEArrayCooperative>
struct MainloopFP8BlockGroup {
  constexpr static int Stages = Stages_;
  constexpr static int SubgroupSize = 16;
  using ArchTag = arch::IntelXe;
  using Schedule = KernelSchedule;
  using ClusterShape = Shape<_1, _1, _1>;
  static constexpr int GroupN = GroupN_;
  static constexpr int GroupK = GroupK_;
};

}  // namespace cutlass::gemm

/////////////////////////////////////////////////////////////////////////////////////////////////

namespace cutlass::gemm::collective {

template <
    int Stages,
    int GroupN,
    int GroupK,
    class Schedule,
    class TileShape_,
    class ElementPairA_,
    class StridePairA_,
    class ElementPairB_,
    class StridePairB_,
    class TiledMma_,
    class GmemTiledCopyPairA_,
    class SmemLayoutAtomA_,
    class SmemCopyAtomA_,
    class TransformA_,
    class GmemTiledCopyPairB_,
    class SmemLayoutAtomB_,
    class SmemCopyAtomB_,
    class TransformB_>
struct CollectiveMma<
    MainloopFP8BlockGroup<Stages, GroupN, GroupK, Schedule>,
    TileShape_,
    ElementPairA_,
    StridePairA_,
    ElementPairB_,
    StridePairB_,
    TiledMma_,
    GmemTiledCopyPairA_,
    SmemLayoutAtomA_,
    SmemCopyAtomA_,
    TransformA_,
    GmemTiledCopyPairB_,
    SmemLayoutAtomB_,
    SmemCopyAtomB_,
    TransformB_>
    : public CollectiveMma<
          MainloopIntelXeXMX16BlockScaledImpl<
              Stages,
              cute::tuple<cute::Int<1>, cute::Int<GroupN>, cute::Int<GroupK>>>,
          TileShape_,
          ElementPairA_,
          StridePairA_,
          ElementPairB_,
          StridePairB_,
          TiledMma_,
          GmemTiledCopyPairA_,
          SmemLayoutAtomA_,
          SmemCopyAtomA_,
          TransformA_,
          GmemTiledCopyPairB_,
          SmemLayoutAtomB_,
          SmemCopyAtomB_,
          TransformB_> {
 public:
  //
  // Type Aliases
  //
  using DispatchPolicy =
      MainloopFP8BlockGroup<Stages, GroupN, GroupK, Schedule>;
  using Base = CollectiveMma<
      MainloopIntelXeXMX16BlockScaledImpl<
          Stages,
          cute::tuple<cute::Int<1>, cute::Int<GroupN>, cute::Int<GroupK>>>,
      TileShape_,
      ElementPairA_,
      StridePairA_,
      ElementPairB_,
      StridePairB_,
      TiledMma_,
      GmemTiledCopyPairA_,
      SmemLayoutAtomA_,
      SmemCopyAtomA_,
      TransformA_,
      GmemTiledCopyPairB_,
      SmemLayoutAtomB_,
      SmemCopyAtomB_,
      TransformB_>;

  using BaseArguments = typename Base::Arguments;
  using BaseParams = typename Base::Params;

  using ElementA = typename Base::ElementA;
  using ElementB = typename Base::ElementB;
  using StrideA = remove_cvref_t<decltype(get<0>(StridePairA_{}))>;
  using StrideB = remove_cvref_t<decltype(get<0>(StridePairB_{}))>;
  using InternalStrideA = cute::remove_pointer_t<StrideA>;
  using InternalStrideB = cute::remove_pointer_t<StrideB>;

  using ElementScaleA = typename Base::ElementScaleA;
  using ElementScaleB = typename Base::ElementScaleB;
  using InternalStrideScaleA = typename Base::StrideScaleA;
  using InternalStrideScaleB = typename Base::StrideScaleB;

  using StrideScaleA = remove_cvref_t<decltype(get<1>(StridePairA_{}))>;
  using StrideScaleB = remove_cvref_t<decltype(get<1>(StridePairB_{}))>;

  static constexpr int BASE_GROUP_N = Base::GroupN;
  static constexpr int BASE_GROUP_K = Base::GroupK;

  // Host side kernel arguments
  struct Arguments {
    ElementA const* ptr_A;
    ElementB const* ptr_B;
    ElementScaleA const* ptr_SA = nullptr;
    ElementScaleB const* ptr_SB = nullptr;
  };

  using Params = Arguments;

  //
  // Methods
  //

  CollectiveMma() = default;

  static constexpr Params to_underlying_arguments(Arguments const& args) {
    return Params{args};
  }

  template <typename ProblemShape_MNKL>
  CUTLASS_DEVICE static constexpr BaseArguments to_base_arguments(
      Arguments const& mainloop_params,
      int next_group,
      ProblemShape_MNKL const& problem_shape_mnkl,
      const int64_t* expert_first_token_offset) {
    const int32_t M = get<0>(problem_shape_mnkl);
    const int32_t N = get<1>(problem_shape_mnkl);
    const int32_t K = get<2>(problem_shape_mnkl);

    auto scale_k = cute::ceil_div(K, BASE_GROUP_K);
    auto scale_n = cute::ceil_div(N, BASE_GROUP_N);
    ElementA const* ptr_A_curr_batch =
        static_cast<ElementA const*>(mainloop_params.ptr_A) +
        expert_first_token_offset[next_group] * K;
    ElementB const* ptr_B_curr_batch =
        static_cast<ElementB const*>(mainloop_params.ptr_B) +
        next_group * N * K;
    ElementScaleA const* ptr_SFA_curr_batch =
        static_cast<ElementScaleA const*>(mainloop_params.ptr_SA) +
        expert_first_token_offset[next_group] * scale_k;
    ElementScaleB const* ptr_SFB_curr_batch =
        static_cast<ElementScaleB const*>(mainloop_params.ptr_SB) +
        next_group * scale_n * scale_k;
    StrideA dA =
        cutlass::make_cute_packed_stride(InternalStrideA{}, {M, K, 1});
    StrideB dB =
        cutlass::make_cute_packed_stride(InternalStrideB{}, {N, K, 1});
    StrideScaleA dSA = cutlass::make_cute_packed_stride(
        InternalStrideScaleA{}, {M, scale_k, 1});
    StrideScaleB dSB = cutlass::make_cute_packed_stride(
        InternalStrideScaleB{}, {scale_n, scale_k, 1});

    return BaseArguments{
        ptr_A_curr_batch,
        dA,
        ptr_B_curr_batch,
        dB,
        ptr_SFA_curr_batch,
        dSA,
        ptr_SFB_curr_batch,
        dSB};
  }

  template <class ProblemShape>
  static bool can_implement(int64_t N, int64_t K, Arguments const& args) {
    constexpr int copy_alignment_bits = 128;
    constexpr int batch_alignment_bits = 512;
    int M, L = 1;
    bool implementable = true;

    constexpr int min_aligned_elements_A =
        copy_alignment_bits / sizeof_bits<ElementA>::value;
    constexpr int min_aligned_elements_B =
        copy_alignment_bits / sizeof_bits<ElementB>::value;
    constexpr int min_batch_aligned_elements_A =
        batch_alignment_bits / sizeof_bits<ElementA>::value;
    constexpr int min_batch_aligned_elements_B =
        batch_alignment_bits / sizeof_bits<ElementB>::value;

    implementable &= cutlass::detail::check_alignment<min_aligned_elements_A>(
        cute::make_shape(M, K, L), InternalStrideA{});
    implementable &= cutlass::detail::check_alignment<min_aligned_elements_B>(
        cute::make_shape(N, K, L), InternalStrideB{});

    if (L > 1) {
      implementable &=
          get<2>(InternalStrideA{}) % min_batch_aligned_elements_A == 0;
      implementable &=
          get<2>(InternalStrideB{}) % min_batch_aligned_elements_B == 0;
    }

    if (!implementable) {
      CUTLASS_TRACE_HOST(
          "  CAN IMPLEMENT: Problem Size doesn't meet the minimum alignment "
          "requirements for XE 2D copy.\n");
    }

    return implementable;
  }
};

}  // namespace cutlass::gemm::collective

/////////////////////////////////////////////////////////////////////////////////////////////////
