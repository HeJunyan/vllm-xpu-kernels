// SPDX-License-Identifier: Apache-2.0
#include "collective/moe_greedy.hpp"

namespace gpu::cutlass_kernel::grouped_gemm {
template <>
struct GreedyTraits<GreedyDtype::FP8Block>
    : GreedyFamily<moe_fp8block_policy, 32, 2048, 512> {
  static constexpr int NormalN = 256, MidN = 128;
  static constexpr bool AllowMid384 = false, SplitTinyM = true;
};

template void
launch_greedy<GreedyDtype::FP8Block>(sycl::queue&, GreedyArguments);
}  // namespace gpu::cutlass_kernel::grouped_gemm
