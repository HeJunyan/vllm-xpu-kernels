#include <sycl/sycl.hpp>
#include <torch/all.h>

#include "gemm_test_xe2.hpp"
#include "gemm_test_xe2.h"

// Test-only entry points (see gemm_test_xe2.hpp). These forward to the
// SYCL launchers that exercise the device GEMM primitives from gemm.hpp.

void gdn_gemm_test_xe2(
    sycl::queue& queue,
    torch::Tensor& C,
    const torch::Tensor& A,
    const torch::Tensor& B,
    const std::optional<torch::Tensor>& K_multi,
    const std::string& variant) {
  gdn::gemm_test_impl_xe2(queue, C, A, B, K_multi, variant);
}

void gdn_gemm_test_fused_2a_xe2(
    sycl::queue& queue,
    torch::Tensor& C1,
    torch::Tensor& C2,
    const torch::Tensor& A1,
    const torch::Tensor& A2,
    const torch::Tensor& B) {
  gdn::gemm_test_fused_2a_impl_xe2(queue, C1, C2, A1, A2, B);
}
