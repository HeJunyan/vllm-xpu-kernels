/***************************************************************************************************
 * Copyright (c) 2025 - 2025 Codeplay Software Ltd. All rights reserved.
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
/*! \file
    \brief CUTLASS Intel BMG Group Gemm

    This file is almost a complete copy of 04_bmg_grouped_gemm,
    except that it's used for FP8 (E5M2 & E4M3) datatype inputs.

    This example demonstrates fusing multiple GEMM operations into one kernel.

    Note that the scalar arguments to e.g. the standard 00_bmg_gemm example,
   have been replaced with vector equivalents, as each individual GEMM has its
   own inputs and outputs, which needn't be contiguous in memory. For example,
   where 00_bmg_gemm receives an `ElementA *` defining Matrix A, grouped gemm
   receives a `ElementA **`, i.e. a pointer to pointers, each pointing to a
   distinct Matrix A. Likewise, each individual GEMM operation may have its own
   alpha and beta factors for linear combination. This example demonstrates two
   approaches: the user can provide `options.alpha` and `options.beta`, in which
   case they will apply to all GEMMs; otherwise, random values are generated per
   GEMM.

    Group GEMM scheduling (cutlass::gemm::GroupScheduler) is more complex than
   standard GEMM, because each GEMM may have a unique size, only known at
   runtime. Thus, the scheduler will distribute an a priori unknown number of
   tiles to each work-group. See
    include/cutlass/gemm/kernel/xe_gemm_array_cooperative.hpp for
   implementation.

    Note that for simplicity, this example sets every GEMM in the group to the
   same shape.

    Verification for this example is a conventional GEMM kernel, executed
   iteratively per group.

    To build & run this example (from your build dir):

      $ ninja 09_bmg_grouped_gemm_fp8
      $ ./examples/sycl/09_bmg_grouped_gemm_fp8/09_bmg_grouped_gemm_fp8

    Call with `--help` for information about available options.

    Note: the code may spill registers once compiled which will result in
   sub-optimal performance. This is because of an issue inside Intel Graphics
   Compiler (IGC) related to VectorAliasBBThreshold being debugged internally.
    To avoid register spills, build the example by setting the environment
   variable: $ export IGC_VectorAliasBBThreshold=10000
*/

#include "csrc/xpu/grouped_gemm/xe_default/helper.h"
#include "collective/moe_dtype_policy.hpp"

using namespace cute;
using ProblemShape =
    cutlass::gemm::GroupProblemShape<Shape<int, int, int>>;  // <M,N,K> per
                                                             // group

///////////////////////////////////////////////////////////////////////////////////////////////////

namespace gpu::cutlass_kernel {
namespace grouped_gemm {

class Xe4GroupGemmKernel;

template <class moe_policy>
class Xe4GroupGemmKernelTag;

template <typename Gemm, bool NeedScale>
struct ElementScaleSelector {
  using A = void;
  using B = void;
};

template <typename Gemm>
struct ElementScaleSelector<Gemm, true> {
  using A = typename Gemm::CollectiveMainloop::ElementSFA;
  using B = typename Gemm::CollectiveMainloop::ElementSFB;
};

template <class Gemm, bool NeedScale, class KernelTag = Xe4GroupGemmKernel>
struct GroupedGemmRunner {
  using ElementA = typename Gemm::ElementA;
  using ElementB = typename Gemm::ElementB;
  using ElementC = void;

  using CollectiveMainloop = typename Gemm::CollectiveMainloop;
  using CollectiveEpilogue = typename Gemm::CollectiveEpilogue;
  using ElementOutput = CollectiveEpilogue::ElementOutput;

  using ElementScaleA = typename ElementScaleSelector<Gemm, NeedScale>::A;
  using ElementScaleB = typename ElementScaleSelector<Gemm, NeedScale>::B;

  cutlass::DeviceAllocation<uint64_t> dynamic_counter;

  /// Populates a Gemm::Arguments structure from the given commandline options
  typename Gemm::Arguments args_from_options(
      const cutlass::KernelHardwareInfo& hw_info,
      int const* rows_per_expert,
      const ElementA* ptr_A,
      const ElementScaleA* ptr_A_scale,
      const ElementB* ptr_B,
      const ElementScaleB* ptr_B_scale,
      const ElementC* ptr_C,
      ElementOutput* ptr_D,
      int64_t N,
      int64_t K,
      int64_t groups,
      int block_size) {
    typename Gemm::Arguments arguments;

    // Per-GEMM problem shape info may only exist on the device.
    if constexpr (!NeedScale) {
      using RasterOrderOptions = typename cutlass::xe4_grouped_gemm::kernel::
          PersistentTileSchedulerXe4Group::RasterOrderOptions;
      arguments = typename Gemm::Arguments{
          {ptr_A, ptr_B},
          {ptr_D},
          rows_per_expert,
          N,
          K,
          groups,
          hw_info,
          {1, RasterOrderOptions::AlongN, dynamic_counter.get()}};
    }
    return arguments;
  }

  cutlass::Status
  run(sycl::queue& stream,
      const cutlass::KernelHardwareInfo& hw_info,
      int const* rows_per_expert,
      const ElementA* ptr_A,
      const ElementScaleA* ptr_A_scale,
      const ElementB* ptr_B,
      const ElementScaleB* ptr_B_scale,
      const ElementC* ptr_C,
      ElementOutput* ptr_D,
      int64_t N,
      int64_t K,
      int64_t groups,
      int block_size) {
    if constexpr (!NeedScale) {
      auto arguments = args_from_options(
          hw_info,
          rows_per_expert,
          ptr_A,
          ptr_A_scale,
          ptr_B,
          ptr_B_scale,
          ptr_C,
          ptr_D,
          N,
          K,
          groups,
          block_size);

      auto params = Gemm::to_underlying_arguments(arguments);
      dim3 const block = Gemm::get_block_shape();
      dim3 const grid = Gemm::get_grid_shape(params);

      const auto sycl_block = compat::dim3(block.x, block.y, block.z);
      const auto sycl_grid = compat::dim3(grid.x, grid.y, grid.z);

      Gemm kernel;

      stream
          .submit([&](sycl::handler& h) {
            h.parallel_for<KernelTag>(
                sycl::nd_range<3>{sycl_grid * sycl_block, sycl_block},
                [=](sycl::nd_item<3> item) { kernel(params); });
          })
          .wait();
    } else {
      // Scaled (mxfp8 / nvfp4) path: Xiaoli's grouped GEMM expects per-group
      // pointer/stride/problem-shape arrays.
      run_scaled(
          stream, hw_info, rows_per_expert, ptr_A, ptr_A_scale, ptr_B,
          ptr_B_scale, ptr_D, N, K, groups, block_size);
    }

    return cutlass::Status::kSuccess;
  }

  template <bool Enable = NeedScale,
            std::enable_if_t<Enable, int> = 0>
  void run_scaled(
      sycl::queue& stream,
      const cutlass::KernelHardwareInfo& hw_info,
      int const* rows_per_expert,
      const ElementA* ptr_A,
      const ElementScaleA* ptr_A_scale,
      const ElementB* ptr_B,
      const ElementScaleB* ptr_B_scale,
      ElementOutput* ptr_D,
      int64_t N,
      int64_t K,
      int64_t groups,
      int block_size) {
    using RasterOrderOptions = typename cutlass::xe4_scaled_grouped_gemm::
        kernel::PersistentTileSchedulerXe4Group::RasterOrderOptions;

    // Zero the dynamic scheduler counter on the stream (non-blocking; the
    // GEMM kernel below is submitted on the same stream and so is ordered
    // after this memset without any host wait).
    dynamic_counter.reset(1);
    auto* counter_p = dynamic_counter.get();
    stream.memset(counter_p, 0, sizeof(uint64_t));

    typename Gemm::Arguments arguments{
        /*mainloop=*/{ptr_A, ptr_B, ptr_A_scale, ptr_B_scale, N, K},
        /*epilogue=*/{ptr_D, N},
        rows_per_expert,
        N,
        K,
        groups,
        hw_info,
        {1, RasterOrderOptions::AlongN, counter_p}};

    auto params = Gemm::to_underlying_arguments(arguments);
    dim3 const block = Gemm::get_block_shape();
    dim3 const grid = Gemm::get_grid_shape(params);

    const auto sycl_block = compat::dim3(block.x, block.y, block.z);
    const auto sycl_grid = compat::dim3(grid.x, grid.y, grid.z);

    Gemm kernel;

    stream.submit([&](sycl::handler& h) {
      h.parallel_for<KernelTag>(
          sycl::nd_range<3>{sycl_grid * sycl_block, sycl_block},
          [=](sycl::nd_item<3> item) { kernel(params); });
    });
  }
};

template <class moe_policy>
void kernel_functor(
    sycl::queue& stream,
    void* ptr_A,
    void* ptr_A_scale,
    void* ptr_B,
    void* ptr_B_scale,
    void* ptr_bias,
    void* ptr_D,
    void* rows_per_expert,
    int64_t N,
    int64_t K,
    int64_t groups) {
  //
  // Run examples
  //
  compat::set_default_queue(stream);

  // The KernelHardwareInfo struct holds the number of EUs on the GPU with a
  // given device ID. This information is used by the underlying kernel.
  cutlass::KernelHardwareInfo hw_info;

  // Change device_id to another value if you are running on a machine with
  // multiple GPUs and wish to use a GPU other than that with device ID 0.
  hw_info.sm_count =
      cutlass::KernelHardwareInfo::query_device_multiprocessor_count(
          hw_info.device_id);

  using GemmKernel = typename moe_policy::GemmKernel;
  GroupedGemmRunner<GemmKernel, moe_policy::NeedScale,
                    Xe4GroupGemmKernelTag<moe_policy>> runner;

  runner.run(
      stream,
      hw_info,
      reinterpret_cast<const int*>(rows_per_expert),
      reinterpret_cast<const typename moe_policy::ElementA*>(ptr_A),
      reinterpret_cast<const typename moe_policy::ElementScaleA*>(ptr_A_scale),
      reinterpret_cast<const typename moe_policy::ElementB*>(ptr_B),
      reinterpret_cast<const typename moe_policy::ElementScaleB*>(ptr_B_scale),
      reinterpret_cast<const typename moe_policy::ElementAccumulator*>(
          ptr_bias),
      reinterpret_cast<typename moe_policy::ElementOutput*>(ptr_D),
      N,
      K,
      groups,
      moe_policy::BlockSize);
}

#define INSTANTIATE_KERNEL(POLICY)      \
  template void kernel_functor<POLICY>( \
      sycl::queue & stream,             \
      void* ptr_A,                      \
      void* ptr_A_scale,                \
      void* ptr_B,                      \
      void* ptr_B_scale,                \
      void* ptr_bias,                   \
      void* ptr_D,                      \
      void* rows_per_expert,           \
      int64_t N,                        \
      int64_t K,                        \
      int64_t groups);

INSTANTIATE_KERNEL(moe_bf16_policy)
/* INSTANTIATE_KERNEL(moe_bf16_decode_policy) */
INSTANTIATE_KERNEL(moe_fp16_policy)
/* INSTANTIATE_KERNEL(moe_fp16_decode_policy) */
/* INSTANTIATE_KERNEL(moe_mxfp4_policy) */
INSTANTIATE_KERNEL(moe_mxfp8_policy)
INSTANTIATE_KERNEL(moe_nvfp4_policy)
/* INSTANTIATE_KERNEL(moe_fp8block_policy) */

}  // namespace grouped_gemm
}  // namespace gpu::cutlass_kernel
