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
    void* expert_first_token_offset,
    int64_t N,
    int64_t K,
    int64_t groups);
}  // namespace grouped_gemm

/* gemm2(group_A, w2, output, offset) */

at::Tensor grouped_gemm_func(
    at::Tensor& ptr_A,
    const c10::optional<at::Tensor>& ptr_A_scale,
    at::Tensor& ptr_B,
    const c10::optional<at::Tensor>& ptr_B_scale,
    const c10::optional<at::Tensor>& ptr_bias,
    at::Tensor& ptr_D,
    at::Tensor& expert_first_token_offset,
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
      expert_first_token_offset.data_ptr(),            \
      N,                                               \
      K,                                               \
      groups)

  if (A_dtype == at::kBFloat16) {
    // TODO: add more fine-grained dispatch
    if (avg_tokens_cnt > 4) {
      using moe_policy = grouped_gemm::moe_bf16_policy;
      CALL_KERNEL_WITH_POLICY(moe_policy);
    } else {
      using moe_policy = grouped_gemm::moe_bf16_decode_policy;
      CALL_KERNEL_WITH_POLICY(moe_policy);
    }
  } else if (A_dtype == at::kHalf) {
    if (avg_tokens_cnt > 4) {
      using moe_policy = grouped_gemm::moe_fp16_policy;
      CALL_KERNEL_WITH_POLICY(moe_policy);
    } else {
      using moe_policy = grouped_gemm::moe_fp16_decode_policy;
      CALL_KERNEL_WITH_POLICY(moe_policy);
    }
  } else if (
      A_dtype == at::kFloat8_e4m3fn && ptr_A_scale &&
      ptr_A_scale->dtype() == at::kFloat8_e8m0fnu) {
    using moe_policy = grouped_gemm::moe_mxfp8_policy;
    CALL_KERNEL_WITH_POLICY(moe_policy);
  } else if (
      A_dtype == at::kFloat4_e2m1fn_x2 && ptr_A_scale &&
      ptr_A_scale->dtype() == at::kFloat8_e8m0fnu) {
    using moe_policy = grouped_gemm::moe_mxfp4_policy;
    CALL_KERNEL_WITH_POLICY(moe_policy);
  } else if (
      A_dtype == at::kFloat8_e4m3fn && ptr_A_scale &&
      ptr_A_scale->dtype() == at::kFloat) {
    using moe_policy = grouped_gemm::moe_fp8block_policy;
    CALL_KERNEL_WITH_POLICY(moe_policy);
  } else {
    TORCH_CHECK(
        false,
        "grouped_gemm_func only supports BF16/FP16/MXFP8/MXFP4 dtypes, but "
        "got: ",
        A_dtype);
  }
  return ptr_D;
}

}  // namespace gpu::cutlass_kernel
