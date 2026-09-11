// SPDX-License-Identifier: Apache-2.0
#include "collective/moe_greedy.hpp"

namespace gpu::cutlass_kernel::grouped_gemm {
template <>
struct GreedyTraits<GreedyDtype::MXFP4>
    : GreedyFamily<moe_mxfp4_policy, 128, 1280, 768> {
  static constexpr int NormalN = 256;
  static constexpr bool AllowMid384 = false;
};

template void launch_greedy<GreedyDtype::MXFP4>(sycl::queue&, GreedyArguments);
}  // namespace gpu::cutlass_kernel::grouped_gemm
