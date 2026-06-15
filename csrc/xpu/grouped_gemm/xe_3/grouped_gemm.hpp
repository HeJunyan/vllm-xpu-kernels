#include <torch/all.h>

#include "collective/moe_dtype_policy.hpp"
#include "csrc/utils.h"

namespace gpu::cutlass_kernel {

namespace grouped_gemm {
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
    int64_t groups);

// Selects the bf16/fp16 work-group tile. 256x256 has the highest arithmetic
// intensity, so we keep it unless its tile count leaves a half-empty tail wave
// across the 32 Xe cores; then we switch to a smaller tile that packs the cores
// more fully. Returns a variant id: 0 = 256x256, 1 = 256x128, 2 = 128x256,
// 3 = 128x128.
inline int pick_bf16_variant(int64_t M_total, int64_t N, int64_t groups) {
  constexpr int kCores = 32;
  // A tile is only worth shrinking to when its smaller-intensity penalty
  // (~15%) is outweighed by better wave packing, i.e. when 256x256 utilization
  // drops below ~0.85.
  constexpr double kMinUtil = 0.85;

  const int64_t M_g = M_total / (groups > 0 ? groups : 1);
  auto ceil_div = [](int64_t a, int64_t b) { return (a + b - 1) / b; };
  auto util = [&](int64_t tm, int64_t tn) {
    int64_t tiles =
        groups * ceil_div(M_g > 0 ? M_g : 1, tm) * ceil_div(N, tn);
    int64_t waves = ceil_div(tiles, kCores);
    return static_cast<double>(tiles) / static_cast<double>(waves * kCores);
  };

  // 256x256: best intensity, use it whenever it packs the cores well.
  if (util(256, 256) >= kMinUtil) {
    return 0;
  }
  // Otherwise prefer a half tile. 128x256 halves M, which gives finer
  // granularity on the variable per-expert token count in MoE.
  if (util(128, 256) >= kMinUtil) {
    return 2;
  }
  if (util(256, 128) >= kMinUtil) {
    return 1;
  }
  // Fall back to the smallest tile when the wider tiles all tail badly.
  return 3;
}
}  // namespace grouped_gemm

/* gemm2(group_A, w2, output, offset) */

at::Tensor grouped_gemm_func(
    at::Tensor& ptr_A,
    const c10::optional<at::Tensor>& ptr_A_scale,
    at::Tensor& ptr_B,
    const c10::optional<at::Tensor>& ptr_B_scale,
    const c10::optional<at::Tensor>& ptr_bias,
    at::Tensor& ptr_D,
    at::Tensor& rows_per_expert,
    int64_t N,
    int64_t K,
    int64_t groups) {
  auto& dpcpp_queue =
      at::xpu::getCurrentXPUStream(ptr_A.device().index()).queue();
  auto A_dtype = ptr_A.dtype();
  auto avg_tokens_cnt = ptr_A.size(0) / groups;

#define CALL_KERNEL_WITH_POLICY(POLICY)                \
  grouped_gemm::kernel_functor<POLICY>(                \
      dpcpp_queue,                                     \
      ptr_A.data_ptr(),                                \
      ptr_A_scale ? ptr_A_scale->data_ptr() : nullptr, \
      ptr_B.data_ptr(),                                \
      ptr_B_scale ? ptr_B_scale->data_ptr() : nullptr, \
      ptr_bias ? ptr_bias->data_ptr() : nullptr,       \
      ptr_D.data_ptr(),                                \
      rows_per_expert.data_ptr(),                      \
      N,                                               \
      K,                                               \
      groups)

  if (A_dtype == at::kBFloat16) {
    if (avg_tokens_cnt > 32) {
      switch (grouped_gemm::pick_bf16_variant(ptr_A.size(0), N, groups)) {
        case 1: {
          using moe_policy = grouped_gemm::moe_bf16_256x128_policy;
          CALL_KERNEL_WITH_POLICY(moe_policy);
          break;
        }
        case 2: {
          using moe_policy = grouped_gemm::moe_bf16_128x256_policy;
          CALL_KERNEL_WITH_POLICY(moe_policy);
          break;
        }
        case 3: {
          using moe_policy = grouped_gemm::moe_bf16_128x128_policy;
          CALL_KERNEL_WITH_POLICY(moe_policy);
          break;
        }
        default: {
          using moe_policy = grouped_gemm::moe_bf16_policy;
          CALL_KERNEL_WITH_POLICY(moe_policy);
        }
      }
    } else if (avg_tokens_cnt > 4) {
      using moe_policy = grouped_gemm::moe_bf16_mid_policy;
      CALL_KERNEL_WITH_POLICY(moe_policy);
    } else {
      using moe_policy = grouped_gemm::moe_bf16_decode_policy;
      CALL_KERNEL_WITH_POLICY(moe_policy);
    }
  } else if (A_dtype == at::kHalf) {
    if (avg_tokens_cnt > 32) {
      using moe_policy = grouped_gemm::moe_fp16_policy;
      CALL_KERNEL_WITH_POLICY(moe_policy);
    } else if (avg_tokens_cnt > 4) {
      using moe_policy = grouped_gemm::moe_fp16_mid_policy;
      CALL_KERNEL_WITH_POLICY(moe_policy);
    } else {
      using moe_policy = grouped_gemm::moe_fp16_decode_policy;
      CALL_KERNEL_WITH_POLICY(moe_policy);
    }
  } else if (
      A_dtype == at::kFloat8_e4m3fn && ptr_A_scale &&
      ptr_A_scale->dtype() == at::kFloat8_e8m0fnu) {
    // After cutlass PR #570 the optimized block-scaled MXFP mainloop
    // handles unaligned M directly (the 2D scale loader rounds the
    // surface width up to 4-byte alignment internally), so we no longer
    // need the scalar scale-load fallback.
    if (avg_tokens_cnt > 32) {
      using moe_policy = grouped_gemm::moe_mxfp8_policy;
      CALL_KERNEL_WITH_POLICY(moe_policy);
    } else {
      using moe_policy = grouped_gemm::moe_mxfp8_mid_policy;
      CALL_KERNEL_WITH_POLICY(moe_policy);
    }
  } else if (
      A_dtype == at::kFloat4_e2m1fn_x2 && ptr_A_scale &&
      ptr_A_scale->dtype() == at::kFloat8_e8m0fnu) {
    if (avg_tokens_cnt > 32) {
      using moe_policy = grouped_gemm::moe_mxfp4_policy;
      CALL_KERNEL_WITH_POLICY(moe_policy);
    } else {
      using moe_policy = grouped_gemm::moe_mxfp4_mid_policy;
      CALL_KERNEL_WITH_POLICY(moe_policy);
    }
  } else if (
      A_dtype == at::kFloat8_e4m3fn && ptr_A_scale &&
      ptr_A_scale->dtype() == at::kFloat) {
    if (avg_tokens_cnt > 32) {
      using moe_policy = grouped_gemm::moe_fp8block_policy;
      CALL_KERNEL_WITH_POLICY(moe_policy);
    } else if (avg_tokens_cnt > 4) {
      using moe_policy = grouped_gemm::moe_fp8block_mid_policy;
      CALL_KERNEL_WITH_POLICY(moe_policy);
    } else {
      using moe_policy = grouped_gemm::moe_fp8block_decode_policy;
      CALL_KERNEL_WITH_POLICY(moe_policy);
    }
  } else {
    TORCH_CHECK(
        false,
        "grouped_gemm_func only supports BF16/FP16/MXFP8/MXFP4/FP8(block) "
        "dtypes, but got: ",
        A_dtype);
  }
  return ptr_D;
}

}  // namespace gpu::cutlass_kernel
