#include "xpu/gemm/gemm_backend.h"

// SYCL-TLA (cutlass-sycl) fp8/fp4 GEMM backend.

namespace {
constexpr const char* kNotImplemented =
    "SYCL-TLA GEMM backend is selected (VLLM_XPU_GEMM_BACKEND=sycltla) but not "
    "implemented yet. Unset VLLM_XPU_GEMM_BACKEND to use oneDNN.";
}  // namespace

torch::Tensor fp8_gemm_sycltla(
    const torch::Tensor& /*A*/,
    const torch::Tensor& /*B*/,
    std::optional<c10::ScalarType> /*out_dtype*/,
    const std::optional<torch::Tensor>& /*A_scale_*/,
    const std::optional<torch::Tensor>& /*B_scale_*/,
    const std::optional<torch::Tensor>& /*bias_*/) {
  TORCH_CHECK(false, kNotImplemented);
}

torch::Tensor fp8_bmm_sycltla(
    const torch::Tensor& /*A*/,
    const torch::Tensor& /*B*/,
    std::optional<c10::ScalarType> /*out_dtype*/,
    const std::optional<torch::Tensor>& /*A_scale_*/,
    const std::optional<torch::Tensor>& /*B_scale_*/,
    const std::optional<torch::Tensor>& /*bias_*/) {
  TORCH_CHECK(false, kNotImplemented);
}

torch::Tensor fp4_gemm_sycltla(
    const torch::Tensor& /*A*/,
    const torch::Tensor& /*B*/,
    const torch::Tensor& /*A_scale*/,
    const torch::Tensor& /*B_scale*/,
    std::optional<c10::ScalarType> /*out_dtype*/,
    const std::optional<torch::Tensor>& /*bias*/) {
  TORCH_CHECK(false, kNotImplemented);
}
