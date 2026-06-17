#include <torch/all.h>

#include <cstdlib>

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

// Work-group tiles for the high-occupancy ("prefill", avg_tokens > 32) path.
// Ids match XE3_GG_FORCE_TILE for profiling overrides.
enum class PrefillTile : int {
  k256x256 = 0,
  k256x128 = 1,
  k128x256 = 2,
  k128x128 = 3,
};

// Dtype families that share a tile-selection rule on the prefill path.
enum class PrefillFamily { kBF16, kMXFP8, kMXFP4 };

// Selects the prefill work-group tile. Only two tiles are ever optimal:
// 256x256 (best arithmetic intensity) and 128x256 (packs the 32 Xe cores more
// fully when 256x256's last wave is short). The choice follows one rule per
// dtype family:
//
//   1. MXFP8: its 256x256 tile is occupancy/scale-load bound and measures
//      ~2.5x slower than 128x256 across every shape, so MXFP8 always uses
//      128x256.
//   2. BF16 / MXFP4: keep 256x256 while it keeps the cores busy; fall back to
//      128x256 once the final wave drops below a utilization threshold. MXFP4
//      is 4-bit and compute-bound, so it tolerates a shorter tail wave (>=0.85)
//      than the more wave-quantization-sensitive BF16 (>=0.90).
inline PrefillTile pick_prefill_tile(
    PrefillFamily family, int64_t M_total, int64_t N, int64_t groups) {
  // Manual override for tuning/profiling.
  if (const char* env = std::getenv("XE3_GG_FORCE_TILE")) {
    return static_cast<PrefillTile>(std::atoi(env));
  }

  if (family == PrefillFamily::kMXFP8) {
    return PrefillTile::k128x256;
  }

  constexpr int kCores = 32;
  const double kMinUtil = (family == PrefillFamily::kMXFP4) ? 0.85 : 0.90;
  const int64_t M_g = M_total / (groups > 0 ? groups : 1);
  auto ceil_div = [](int64_t a, int64_t b) { return (a + b - 1) / b; };
  int64_t tiles_256 =
      groups * ceil_div(M_g > 0 ? M_g : 1, 256) * ceil_div(N, 256);
  int64_t waves_256 = ceil_div(tiles_256, kCores);
  double util_256 =
      static_cast<double>(tiles_256) / static_cast<double>(waves_256 * kCores);

  if (util_256 >= kMinUtil) {
    return PrefillTile::k256x256;
  }
  return PrefillTile::k128x256;
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

// Dispatches the high-occupancy path to the wave-quantization-selected tile.
// FAMILY is a dtype prefix providing FAMILY##_policy (256x256) plus the
// _256x128 / _128x256 / _128x128 tile variants. FAM is the PrefillFamily tag.
#define DISPATCH_PREFILL_TILE(FAMILY, FAM)                                 \
  switch (grouped_gemm::pick_prefill_tile(                                 \
      grouped_gemm::PrefillFamily::FAM, ptr_A.size(0), N, groups)) {       \
    case grouped_gemm::PrefillTile::k256x128: {                            \
      using moe_policy = grouped_gemm::FAMILY##_256x128_policy;            \
      CALL_KERNEL_WITH_POLICY(moe_policy);                                 \
      break;                                                               \
    }                                                                      \
    case grouped_gemm::PrefillTile::k128x256: {                            \
      using moe_policy = grouped_gemm::FAMILY##_128x256_policy;            \
      CALL_KERNEL_WITH_POLICY(moe_policy);                                 \
      break;                                                               \
    }                                                                      \
    case grouped_gemm::PrefillTile::k128x128: {                           \
      using moe_policy = grouped_gemm::FAMILY##_128x128_policy;            \
      CALL_KERNEL_WITH_POLICY(moe_policy);                                 \
      break;                                                               \
    }                                                                      \
    default: {                                                             \
      using moe_policy = grouped_gemm::FAMILY##_policy;                    \
      CALL_KERNEL_WITH_POLICY(moe_policy);                                 \
    }                                                                      \
  }

  if (A_dtype == at::kBFloat16) {
    if (avg_tokens_cnt > 32) {
      DISPATCH_PREFILL_TILE(moe_bf16, kBF16);
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
      DISPATCH_PREFILL_TILE(moe_mxfp8, kMXFP8);
    } else {
      using moe_policy = grouped_gemm::moe_mxfp8_mid_policy;
      CALL_KERNEL_WITH_POLICY(moe_policy);
    }
  } else if (
      A_dtype == at::kFloat4_e2m1fn_x2 && ptr_A_scale &&
      ptr_A_scale->dtype() == at::kFloat8_e8m0fnu) {
    if (avg_tokens_cnt > 32) {
      DISPATCH_PREFILL_TILE(moe_mxfp4, kMXFP4);
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
