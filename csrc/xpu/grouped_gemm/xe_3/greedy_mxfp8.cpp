// SPDX-License-Identifier: Apache-2.0
#include "collective/moe_greedy.hpp"

namespace gpu::cutlass_kernel::grouped_gemm {
template <>
struct GreedyTraits<GreedyDtype::MXFP8>
    : GreedyFamily<moe_mxfp8_policy, 64, 2048, 512> {};

template void launch_greedy<GreedyDtype::MXFP8>(sycl::queue&, GreedyArguments);
}  // namespace gpu::cutlass_kernel::grouped_gemm
