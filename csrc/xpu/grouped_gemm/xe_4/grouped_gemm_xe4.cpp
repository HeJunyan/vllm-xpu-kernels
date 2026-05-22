#include <torch/all.h>
#include "cute/arch/xe4_util.hpp"
#include "grouped_gemm_xe4.h"
#include "csrc/xpu/grouped_gemm/xe_4/grouped_gemm.hpp"

torch::Tensor cutlass_grouped_gemm_xe4(
    torch::Tensor ptr_A,
    const c10::optional<at::Tensor>& ptr_A_scale,
    torch::Tensor ptr_B,
    const c10::optional<at::Tensor>& ptr_B_scale,
    const c10::optional<at::Tensor>& ptr_bias,
    torch::Tensor ptr_D,
    torch::Tensor rows_per_expert,
    int64_t N,
    int64_t K,
    int64_t num_experts) {
  auto ptr_bias_ = ptr_bias;
  if (ptr_bias.has_value()) {
    ptr_bias_ =
        ptr_bias->repeat_interleave(rows_per_expert, 0).to(torch::kFloat32);
  }
  return gpu::cutlass_kernel::grouped_gemm_func(
      ptr_A,
      ptr_A_scale,
      ptr_B,
      ptr_B_scale,
      ptr_bias_,
      ptr_D,
      rows_per_expert,
      N,
      K,
      num_experts);
};
