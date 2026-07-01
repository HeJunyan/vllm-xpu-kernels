#include <string>

#include <torch/all.h>

void gdn_gemm_test_xe2(
    sycl::queue& queue,
    torch::Tensor& C,
    const torch::Tensor& A,
    const torch::Tensor& B,
    const std::optional<torch::Tensor>& K_multi,
    const std::string& variant);

void gdn_gemm_test_fused_2a_xe2(
    sycl::queue& queue,
    torch::Tensor& C1,
    torch::Tensor& C2,
    const torch::Tensor& A1,
    const torch::Tensor& A2,
    const torch::Tensor& B);
