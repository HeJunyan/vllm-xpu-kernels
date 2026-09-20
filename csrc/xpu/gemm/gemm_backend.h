#pragma once

#include <torch/all.h>

#include <cstdint>

// Backend-specific GEMM implementations for the XPU fp8/fp4 matmuls.
//
// Backend selection is controlled at runtime by the VLLM_XPU_GEMM_BACKEND
// environment variable:
//   - "onednn"  : always use the oneDNN backend.
//   - "sycltla" : always use the SYCL-TLA backend.
//   - unset     : auto-select per call based on the problem shape (and, for
//                 fp8, the scale scheme and group size); shapes listed in the
//                 config table (gemm_shapes.conf) use SYCL-TLA, everything else
//                 uses oneDNN.
//   - any other value raises an error.
// VLLM_XPU_GEMM_CONFIG overrides the shape config file path. If unset or empty,
// gemm_shapes.conf next to the extension .so is used. The config is loaded once
// on the first automatic backend selection in each process.

namespace vllm::xpu::gemm {

enum class Backend {
  onednn,
  sycltla,
};

enum class GemmType : uint8_t {
  fp8 = 0,
  fp4 = 1,
  fp8_bmm = 2,
};

enum class ScaleType : uint8_t {
  FP32,
  E8M0,
};

// Classifies the fp8 scale scheme (E8M0 microscaling vs everything else) from
// the activation/weight scale tensors.
ScaleType classify_fp8_scale(
    const std::optional<torch::Tensor>& a_scale,
    const std::optional<torch::Tensor>& b_scale);

// Selects the backend for a GEMM of the given kind and shape. Honors
// VLLM_XPU_GEMM_BACKEND; the auto path probes the config shape table. For fp8
// the scale scheme and group size are part of the key; fp4 passes fixed
// defaults (ScaleType::FP32, group_size 0). Inclusive M ranges are expanded
// once at config load time, keeping the per-call lookup an average O(1) hash
// probe.
Backend select_gemm_backend(
    GemmType kind,
    int64_t batch,
    int64_t m,
    int64_t n,
    int64_t k,
    ScaleType scale_type,
    uint32_t group_size);

}  // namespace vllm::xpu::gemm

// ---------------------------------------------------------------------------
// oneDNN backend (defined in gemm/onednn/onednn_matmul.cpp)
// ---------------------------------------------------------------------------

torch::Tensor fp8_gemm_onednn(
    const torch::Tensor& A,
    const torch::Tensor& B,
    std::optional<c10::ScalarType> out_dtype,
    const std::optional<torch::Tensor>& A_scale_,
    const std::optional<torch::Tensor>& B_scale_,
    const std::optional<torch::Tensor>& bias_);

torch::Tensor fp8_bmm_onednn(
    const torch::Tensor& A,
    const torch::Tensor& B,
    std::optional<c10::ScalarType> out_dtype,
    const std::optional<torch::Tensor>& A_scale_,
    const std::optional<torch::Tensor>& B_scale_,
    const std::optional<torch::Tensor>& bias_);

torch::Tensor fp4_gemm_onednn(
    const torch::Tensor& A,
    const torch::Tensor& B,
    const torch::Tensor& A_scale,
    const torch::Tensor& B_scale,
    std::optional<c10::ScalarType> out_dtype,
    const std::optional<torch::Tensor>& bias);

// ---------------------------------------------------------------------------
// SYCL-TLA backend (defined in gemm/sycltla/sycltla_matmul.cpp)
// ---------------------------------------------------------------------------

torch::Tensor fp8_gemm_sycltla(
    const torch::Tensor& A,
    const torch::Tensor& B,
    std::optional<c10::ScalarType> out_dtype,
    const std::optional<torch::Tensor>& A_scale_,
    const std::optional<torch::Tensor>& B_scale_,
    const std::optional<torch::Tensor>& bias_);

torch::Tensor fp8_bmm_sycltla(
    const torch::Tensor& A,
    const torch::Tensor& B,
    std::optional<c10::ScalarType> out_dtype,
    const std::optional<torch::Tensor>& A_scale_,
    const std::optional<torch::Tensor>& B_scale_,
    const std::optional<torch::Tensor>& bias_);

torch::Tensor fp4_gemm_sycltla(
    const torch::Tensor& A,
    const torch::Tensor& B,
    const torch::Tensor& A_scale,
    const torch::Tensor& B_scale,
    std::optional<c10::ScalarType> out_dtype,
    const std::optional<torch::Tensor>& bias);
