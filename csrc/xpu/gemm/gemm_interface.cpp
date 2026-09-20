#include "xpu/gemm/gemm_backend.h"
#include "xpu/ops.h"

// Public GEMM ops. Each derives the problem shape (and, for fp8, the scale
// scheme / group size), asks select_gemm_backend() which backend to use, and
// dispatches to the oneDNN or SYCL-TLA implementation. All backend-selection
// logic lives in gemm_backend.cpp.

namespace {
using vllm::xpu::gemm::Backend;
using vllm::xpu::gemm::classify_fp8_scale;
using vllm::xpu::gemm::GemmType;
using vllm::xpu::gemm::ScaleType;
using vllm::xpu::gemm::select_gemm_backend;
}  // namespace

torch::Tensor fp8_gemm(
    const torch::Tensor& A,  // [..., m, k]
    const torch::Tensor& B,  // [k, n]
    std::optional<c10::ScalarType> out_dtype,
    const std::optional<torch::Tensor>& A_scale_,
    const std::optional<torch::Tensor>& B_scale_,
    const std::optional<torch::Tensor>& bias_) {
  // The GEMM path flattens all leading dims of A into M (see
  // fp8_gemm_onednn / check_and_create_output_tensor); K is the last dim of A
  // and N is the last dim of B.
  const int64_t k = A.size(A.dim() - 1);
  const int64_t m = A.numel() / k;
  const int64_t n = B.size(B.dim() - 1);
  const auto scale_type = classify_fp8_scale(A_scale_, B_scale_);
  // group_size along K, from the weight (B) scale grid: B_scale is [k/gk, n/gn].
  const uint32_t group_size = static_cast<uint32_t>(
      B_scale_.has_value() ? (k / B_scale_->size(0)) : k);
  if (select_gemm_backend(GemmType::fp8, 0, m, n, k, scale_type, group_size) ==
      Backend::sycltla) {
    return fp8_gemm_sycltla(A, B, out_dtype, A_scale_, B_scale_, bias_);
  }
  return fp8_gemm_onednn(A, B, out_dtype, A_scale_, B_scale_, bias_);
}

torch::Tensor fp8_bmm(
    const torch::Tensor& A,  // [b, m, k]
    const torch::Tensor& B,  // [b, k, n]
    std::optional<c10::ScalarType> out_dtype,
    const std::optional<torch::Tensor>& A_scale_,
    const std::optional<torch::Tensor>& B_scale_,
    const std::optional<torch::Tensor>& bias_) {
  const int64_t batch = A.size(0);
  const int64_t m = A.size(A.dim() - 2);
  const int64_t k = A.size(A.dim() - 1);
  const int64_t n = B.size(B.dim() - 1);
  const auto scale_type = classify_fp8_scale(A_scale_, B_scale_);
  // bmm B_scale is [b, k/gk, n/gn], so K is size(-2).
  const uint32_t group_size = static_cast<uint32_t>(
      B_scale_.has_value() ? (k / B_scale_->size(-2)) : k);
  if (select_gemm_backend(
          GemmType::fp8_bmm, batch, m, n, k, scale_type, group_size) ==
      Backend::sycltla) {
    return fp8_bmm_sycltla(A, B, out_dtype, A_scale_, B_scale_, bias_);
  }
  return fp8_bmm_onednn(A, B, out_dtype, A_scale_, B_scale_, bias_);
}

torch::Tensor fp4_gemm(
    const torch::Tensor& A,  // [..., m, k]
    const torch::Tensor& B,  // [k, n]
    const torch::Tensor& A_scale,
    const torch::Tensor& B_scale,
    std::optional<c10::ScalarType> out_dtype,
    const std::optional<torch::Tensor>& bias) {
  // fp4 packs two values per storage unit, so logical K is twice A's last
  // (packed) dim, matching fp4_gemm_onednn.
  const int64_t packed_k = A.size(A.dim() - 1);
  const int64_t m = A.numel() / packed_k;
  const int64_t k = packed_k * 2;
  const int64_t n = B.size(B.dim() - 1);
  // fp4 has no scale/group_size: fixed defaults matching the parser.
  if (select_gemm_backend(GemmType::fp4, 0, m, n, k, ScaleType::FP32, 0) ==
      Backend::sycltla) {
    return fp4_gemm_sycltla(A, B, A_scale, B_scale, out_dtype, bias);
  }
  return fp4_gemm_onednn(A, B, A_scale, B_scale, out_dtype, bias);
}
