#pragma once

#include <cstdint>
#include <sycl/sycl.hpp>
#include <torch/all.h>

#include "gemm.hpp"
#include "gdn_attn_utils.h"
#include "csrc/utils.h"

// Test-only launchers that exercise the device GEMM primitives defined in
// gemm.hpp (gemm_TTS / gemm_STS / gemm_TSS / gemm_TTS_k_multi /
// gemm_TTS_fused_2A). Each launcher runs a single work-group that computes one
// work-group tile so the result can be validated against a plain
// C = A @ B^T reference on the host side. These are NOT used by vLLM; they only
// exist so the primitives in gemm.hpp can be unit-tested.

namespace gdn {
using namespace cute;

// MMA policies reused from the chunk kernels. The 64x64x32 policy drives the
// TTS / k_multi / fused variants (both operands streamed from global memory),
// while the 16x16x16 policy drives the STS / TSS variants which take one operand
// pre-loaded into a sub-group register fragment (matching how they are used in
// the block-inverse step).
struct gemm_test_policy_64x64x32 {
  using WGTile = Shape<_64, _64, _32>;
  using SGLayout = Layout<Shape<_2, _2, _1>, Stride<_2, _1, _0>>;
};

struct gemm_test_policy_16x16x16 {
  using WGTile = Shape<_16, _16, _16>;
  using SGLayout = Layout<Shape<_1, _1, _1>, Stride<_1, _1, _0>>;
};

template <typename T, class TiledMMA>
class GemmTestTTSKernelTag;
template <typename T, class TiledMMA>
class GemmTestKMultiKernelTag;
template <typename T, class TiledMMA>
class GemmTestFused2AKernelTag;
template <typename T, class TiledMMA>
class GemmTestSTSKernelTag;
template <typename T, class TiledMMA>
class GemmTestTSSKernelTag;

// Build a (M, K) row-major global tensor of element type T.
template <typename T>
CUTE_DEVICE auto gemm_test_make_gmem(T* ptr, int rows, int cols) {
  return make_tensor(
      make_gmem_ptr(ptr),
      make_layout(make_shape(rows, cols), make_stride(cols, _1{})));
}

// C = A @ B^T with both operands streamed from global memory.
template <typename T, class TiledMMA>
CUTE_DEVICE void
gemm_test_TTS_kernel(const T* A, const T* B, float* C, int K) {
  auto item = sycl::ext::oneapi::this_work_item::get_nd_item<3>();
  int local_id = item.get_local_linear_id();

  TiledMMA mma{};
  auto wg_tile = mma.tile_mnk();
  auto thr_mma = mma.get_slice(local_id);

  const int M = get<0>(wg_tile);
  const int N = get<1>(wg_tile);

  auto A_tensor = gemm_test_make_gmem(const_cast<T*>(A), M, K);
  auto B_tensor = gemm_test_make_gmem(const_cast<T*>(B), N, K);
  auto C_tensor = gemm_test_make_gmem(C, M, N);

  Tensor cC = make_identity_tensor(C_tensor.shape());
  Tensor gC = local_tile(cC, wg_tile, make_coord(0, 0, 0), Step<_1, _1, X>{});

  auto copy_C = get_block_2d_copy_D<void>(mma, C_tensor);
  auto thr_copy_C = copy_C.get_slice(local_id);
  auto tCrC_out = thr_copy_C.partition_sg_fragment_S(gC);
  auto tCgC = thr_copy_C.partition_D(gC);
  auto tCrC = thr_mma.partition_sg_fragment_C(gC);

  clear(tCrC);
  gemm_TTS(A_tensor, B_tensor, tCrC, 0, 0, mma);

  reorder(tCrC, tCrC_out);
  copy(copy_C, tCrC_out, tCgC);
}

// C = (A scaled per-K-column by K_multi) @ B^T.
template <typename T, class TiledMMA>
CUTE_DEVICE void gemm_test_k_multi_kernel(
    const T* A, const T* B, float* C, float* K_multi, int K) {
  auto item = sycl::ext::oneapi::this_work_item::get_nd_item<3>();
  int local_id = item.get_local_linear_id();

  TiledMMA mma{};
  auto wg_tile = mma.tile_mnk();
  auto thr_mma = mma.get_slice(local_id);

  const int M = get<0>(wg_tile);
  const int N = get<1>(wg_tile);

  auto A_tensor = gemm_test_make_gmem(const_cast<T*>(A), M, K);
  auto B_tensor = gemm_test_make_gmem(const_cast<T*>(B), N, K);
  auto C_tensor = gemm_test_make_gmem(C, M, N);

  Tensor cC = make_identity_tensor(C_tensor.shape());
  Tensor gC = local_tile(cC, wg_tile, make_coord(0, 0, 0), Step<_1, _1, X>{});

  auto copy_C = get_block_2d_copy_D<void>(mma, C_tensor);
  auto thr_copy_C = copy_C.get_slice(local_id);
  auto tCrC_out = thr_copy_C.partition_sg_fragment_S(gC);
  auto tCgC = thr_copy_C.partition_D(gC);
  auto tCrC = thr_mma.partition_sg_fragment_C(gC);

  clear(tCrC);
  gemm_TTS_k_multi(A_tensor, B_tensor, tCrC, 0, 0, mma, K_multi);

  reorder(tCrC, tCrC_out);
  copy(copy_C, tCrC_out, tCgC);
}

// C1 = A1 @ B^T, C2 = A2 @ B^T sharing the B load.
template <typename T, class TiledMMA>
CUTE_DEVICE void gemm_test_fused_2A_kernel(
    const T* A1, const T* A2, const T* B, float* C1, float* C2, int K) {
  auto item = sycl::ext::oneapi::this_work_item::get_nd_item<3>();
  int local_id = item.get_local_linear_id();

  TiledMMA mma{};
  auto wg_tile = mma.tile_mnk();
  auto thr_mma = mma.get_slice(local_id);

  const int M = get<0>(wg_tile);
  const int N = get<1>(wg_tile);

  auto A1_tensor = gemm_test_make_gmem(const_cast<T*>(A1), M, K);
  auto A2_tensor = gemm_test_make_gmem(const_cast<T*>(A2), M, K);
  auto B_tensor = gemm_test_make_gmem(const_cast<T*>(B), N, K);
  auto C1_tensor = gemm_test_make_gmem(C1, M, N);
  auto C2_tensor = gemm_test_make_gmem(C2, M, N);

  Tensor cC = make_identity_tensor(C1_tensor.shape());
  Tensor gC = local_tile(cC, wg_tile, make_coord(0, 0, 0), Step<_1, _1, X>{});

  auto copy_C1 = get_block_2d_copy_D<void>(mma, C1_tensor);
  auto copy_C2 = get_block_2d_copy_D<void>(mma, C2_tensor);
  auto thr_copy_C1 = copy_C1.get_slice(local_id);
  auto thr_copy_C2 = copy_C2.get_slice(local_id);

  auto tC1r_out = thr_copy_C1.partition_sg_fragment_S(gC);
  auto tC2r_out = thr_copy_C2.partition_sg_fragment_S(gC);
  auto tC1g = thr_copy_C1.partition_D(gC);
  auto tC2g = thr_copy_C2.partition_D(gC);
  auto tCrC1 = thr_mma.partition_sg_fragment_C(gC);
  auto tCrC2 = thr_mma.partition_sg_fragment_C(gC);

  clear(tCrC1);
  clear(tCrC2);
  gemm_TTS_fused_2A(
      A1_tensor, A2_tensor, B_tensor, tCrC1, tCrC2, 0, 0, 0, mma);

  reorder(tCrC1, tC1r_out);
  reorder(tCrC2, tC2r_out);
  copy(copy_C1, tC1r_out, tC1g);
  copy(copy_C2, tC2r_out, tC2g);
}

// C = A @ B^T with A pre-loaded into the MMA A register fragment (single
// k-tile), exercising gemm_STS.
template <typename T, class TiledMMA>
CUTE_DEVICE void
gemm_test_STS_kernel(const T* A, const T* B, float* C, int K) {
  auto item = sycl::ext::oneapi::this_work_item::get_nd_item<3>();
  int local_id = item.get_local_linear_id();

  TiledMMA mma{};
  auto wg_tile = mma.tile_mnk();
  auto thr_mma = mma.get_slice(local_id);

  const int M = get<0>(wg_tile);
  const int N = get<1>(wg_tile);

  auto A_tensor = gemm_test_make_gmem(const_cast<T*>(A), M, K);
  auto B_tensor = gemm_test_make_gmem(const_cast<T*>(B), N, K);
  auto C_tensor = gemm_test_make_gmem(C, M, N);

  // Pre-load A into the MMA A register fragment.
  Tensor cA = make_identity_tensor(A_tensor.shape());
  Tensor gA = local_tile(cA, select<0, 2>(wg_tile), make_coord(0, _));
  auto copy_a = get_block_2d_copy_A<void>(mma, A_tensor);
  auto thr_copy_a = copy_a.get_slice(local_id);
  auto tCrA = thr_mma.partition_sg_fragment_A(gA(_, _, 0));
  auto tArA = thr_copy_a.partition_sg_fragment_D(gA(_, _, 0));
  Tensor tAgA = thr_copy_a.partition_S(gA);
  copy(copy_a, tAgA(_, _, _, 0), tArA);
  reorder(tArA, tCrA);

  Tensor cC = make_identity_tensor(C_tensor.shape());
  Tensor gC = local_tile(cC, wg_tile, make_coord(0, 0, 0), Step<_1, _1, X>{});

  auto copy_C = get_block_2d_copy_D<void>(mma, C_tensor);
  auto thr_copy_C = copy_C.get_slice(local_id);
  auto tCrC_out = thr_copy_C.partition_sg_fragment_S(gC);
  auto tCgC = thr_copy_C.partition_D(gC);
  auto tCrC = thr_mma.partition_sg_fragment_C(gC);

  clear(tCrC);
  gemm_STS(tCrA, B_tensor, tCrC, 0, 0, mma);

  reorder(tCrC, tCrC_out);
  copy(copy_C, tCrC_out, tCgC);
}

// C = A @ B^T with B pre-loaded into the MMA B register fragment (single
// k-tile), exercising gemm_TSS.
template <typename T, class TiledMMA>
CUTE_DEVICE void
gemm_test_TSS_kernel(const T* A, const T* B, float* C, int K) {
  auto item = sycl::ext::oneapi::this_work_item::get_nd_item<3>();
  int local_id = item.get_local_linear_id();

  TiledMMA mma{};
  auto wg_tile = mma.tile_mnk();
  auto thr_mma = mma.get_slice(local_id);

  const int M = get<0>(wg_tile);
  const int N = get<1>(wg_tile);

  auto A_tensor = gemm_test_make_gmem(const_cast<T*>(A), M, K);
  auto B_tensor = gemm_test_make_gmem(const_cast<T*>(B), N, K);
  auto C_tensor = gemm_test_make_gmem(C, M, N);

  // Pre-load B into the MMA B register fragment.
  Tensor cB = make_identity_tensor(B_tensor.shape());
  Tensor gB = local_tile(cB, select<1, 2>(wg_tile), make_coord(0, _));
  auto copy_b = get_block_2d_copy_B<void>(mma, B_tensor);
  auto thr_copy_b = copy_b.get_slice(local_id);
  auto tCrB = thr_mma.partition_sg_fragment_B(gB(_, _, 0));
  auto tBrB = thr_copy_b.partition_sg_fragment_D(gB(_, _, 0));
  Tensor tBgB = thr_copy_b.partition_S(gB);
  copy(copy_b, tBgB(_, _, _, 0), tBrB);
  reorder(tBrB, tCrB);

  Tensor cC = make_identity_tensor(C_tensor.shape());
  Tensor gC = local_tile(cC, wg_tile, make_coord(0, 0, 0), Step<_1, _1, X>{});

  auto copy_C = get_block_2d_copy_D<void>(mma, C_tensor);
  auto thr_copy_C = copy_C.get_slice(local_id);
  auto tCrC_out = thr_copy_C.partition_sg_fragment_S(gC);
  auto tCgC = thr_copy_C.partition_D(gC);
  auto tCrC = thr_mma.partition_sg_fragment_C(gC);

  clear(tCrC);
  gemm_TSS(A_tensor, tCrB, tCrC, 0, 0, mma);

  reorder(tCrC, tCrC_out);
  copy(copy_C, tCrC_out, tCgC);
}

template <class TiledMMA>
inline auto gemm_test_kernel_props() {
  namespace syclex = sycl::ext::oneapi::experimental;
  namespace intelex = sycl::ext::intel::experimental;
  return syclex::properties{
      syclex::sub_group_size<cute::detail::subgroup_size>,
      intelex::grf_size<256>};
}

template <typename T, class Policy>
void gemm_test_launch(
    sycl::queue& queue,
    const T* A,
    const T* B,
    float* C,
    int K,
    const std::string& variant,
    const T* A2 = nullptr,
    float* C2 = nullptr,
    float* K_multi = nullptr) {
  using op_t = XE_DPAS_TT<8, float, cutlass::platform::remove_cv_t<T>>;
  using MMA = typename TiledMMAHelper<
      MMA_Atom<op_t>,
      Layout<typename Policy::WGTile>,
      typename Policy::SGLayout>::TiledMMA;
  MMA mma{};
  const int threads = size(mma);

  sycl::range<3> local(1, 1, threads);
  sycl::range<3> global(1, 1, 1);
  auto props = gemm_test_kernel_props<MMA>();

  if (variant == "TTS") {
    queue.submit([&](sycl::handler& cgh) {
      cgh.parallel_for<GemmTestTTSKernelTag<T, MMA>>(
          sycl::nd_range<3>{global * local, local},
          props,
          [=](auto) { gemm_test_TTS_kernel<T, MMA>(A, B, C, K); });
    });
  } else if (variant == "k_multi") {
    queue.submit([&](sycl::handler& cgh) {
      cgh.parallel_for<GemmTestKMultiKernelTag<T, MMA>>(
          sycl::nd_range<3>{global * local, local},
          props,
          [=](auto) {
            gemm_test_k_multi_kernel<T, MMA>(A, B, C, K_multi, K);
          });
    });
  } else if (variant == "fused_2A") {
    queue.submit([&](sycl::handler& cgh) {
      cgh.parallel_for<GemmTestFused2AKernelTag<T, MMA>>(
          sycl::nd_range<3>{global * local, local},
          props,
          [=](auto) {
            gemm_test_fused_2A_kernel<T, MMA>(A, A2, B, C, C2, K);
          });
    });
  } else if (variant == "STS") {
    queue.submit([&](sycl::handler& cgh) {
      cgh.parallel_for<GemmTestSTSKernelTag<T, MMA>>(
          sycl::nd_range<3>{global * local, local},
          props,
          [=](auto) { gemm_test_STS_kernel<T, MMA>(A, B, C, K); });
    });
  } else if (variant == "TSS") {
    queue.submit([&](sycl::handler& cgh) {
      cgh.parallel_for<GemmTestTSSKernelTag<T, MMA>>(
          sycl::nd_range<3>{global * local, local},
          props,
          [=](auto) { gemm_test_TSS_kernel<T, MMA>(A, B, C, K); });
    });
  }
}

inline void gemm_test_impl_xe2(
    sycl::queue& queue,
    torch::Tensor& C,
    const torch::Tensor& A,
    const torch::Tensor& B,
    const std::optional<torch::Tensor>& K_multi,
    const std::string& variant) {
  TORCH_CHECK(A.dim() == 2 && B.dim() == 2, "A and B must be 2D");
  TORCH_CHECK(C.dim() == 2, "C must be 2D");
  TORCH_CHECK(
      A.size(1) == B.size(1), "A and B must share the contraction dim K");
  TORCH_CHECK(
      C.scalar_type() == at::kFloat, "C accumulator must be float32");
  TORCH_CHECK(A.scalar_type() == B.scalar_type(), "A and B dtype must match");

  const int M = A.size(0);
  const int N = B.size(0);
  const int K = A.size(1);

  const bool big_tile =
      (variant == "TTS" || variant == "k_multi" || variant == "fused_2A");
  if (big_tile) {
    TORCH_CHECK(M == 64 && N == 64, "big-tile variants require M=N=64");
    TORCH_CHECK(K % 32 == 0, "big-tile variants require K divisible by 32");
  } else {
    TORCH_CHECK(
        M == 16 && N == 16 && K == 16,
        "STS/TSS variants require M=N=K=16 (single k-tile)");
  }

  float* K_multi_ptr =
      K_multi.has_value() ? K_multi->data_ptr<float>() : nullptr;
  if (variant == "k_multi") {
    TORCH_CHECK(
        K_multi.has_value() && K_multi->numel() == K,
        "k_multi requires a length-K float scale tensor");
  }

#define GEMM_TEST_DISPATCH(T, POLICY)                                      \
  gemm_test_launch<T, POLICY>(                                             \
      queue,                                                               \
      reinterpret_cast<const T*>(A.data_ptr()),                            \
      reinterpret_cast<const T*>(B.data_ptr()),                            \
      C.data_ptr<float>(),                                                 \
      K,                                                                   \
      variant,                                                             \
      nullptr,                                                             \
      nullptr,                                                             \
      K_multi_ptr);

  if (big_tile) {
    if (A.scalar_type() == at::kBFloat16) {
      GEMM_TEST_DISPATCH(cutlass::bfloat16_t, gemm_test_policy_64x64x32)
    } else if (A.scalar_type() == at::kHalf) {
      GEMM_TEST_DISPATCH(cutlass::half_t, gemm_test_policy_64x64x32)
    } else {
      TORCH_CHECK(false, "unsupported dtype for gemm test");
    }
  } else {
    if (A.scalar_type() == at::kBFloat16) {
      GEMM_TEST_DISPATCH(cutlass::bfloat16_t, gemm_test_policy_16x16x16)
    } else if (A.scalar_type() == at::kHalf) {
      GEMM_TEST_DISPATCH(cutlass::half_t, gemm_test_policy_16x16x16)
    } else {
      TORCH_CHECK(false, "unsupported dtype for gemm test");
    }
  }
#undef GEMM_TEST_DISPATCH
}

inline void gemm_test_fused_2a_impl_xe2(
    sycl::queue& queue,
    torch::Tensor& C1,
    torch::Tensor& C2,
    const torch::Tensor& A1,
    const torch::Tensor& A2,
    const torch::Tensor& B) {
  TORCH_CHECK(
      A1.dim() == 2 && A2.dim() == 2 && B.dim() == 2,
      "A1, A2, B must be 2D");
  TORCH_CHECK(
      A1.sizes() == A2.sizes(), "A1 and A2 must have the same shape");
  TORCH_CHECK(A1.size(1) == B.size(1), "A and B must share K");
  TORCH_CHECK(
      C1.scalar_type() == at::kFloat && C2.scalar_type() == at::kFloat,
      "C accumulators must be float32");
  TORCH_CHECK(
      A1.scalar_type() == A2.scalar_type() &&
          A1.scalar_type() == B.scalar_type(),
      "A1/A2/B dtype must match");

  const int M = A1.size(0);
  const int N = B.size(0);
  const int K = A1.size(1);
  TORCH_CHECK(M == 64 && N == 64, "fused_2A requires M=N=64");
  TORCH_CHECK(K % 32 == 0, "fused_2A requires K divisible by 32");

#define GEMM_TEST_FUSED_DISPATCH(T)                    \
  gemm_test_launch<T, gemm_test_policy_64x64x32>(      \
      queue,                                           \
      reinterpret_cast<const T*>(A1.data_ptr()),       \
      reinterpret_cast<const T*>(B.data_ptr()),        \
      C1.data_ptr<float>(),                            \
      K,                                               \
      "fused_2A",                                      \
      reinterpret_cast<const T*>(A2.data_ptr()),       \
      C2.data_ptr<float>(),                            \
      nullptr);

  if (A1.scalar_type() == at::kBFloat16) {
    GEMM_TEST_FUSED_DISPATCH(cutlass::bfloat16_t)
  } else if (A1.scalar_type() == at::kHalf) {
    GEMM_TEST_FUSED_DISPATCH(cutlass::half_t)
  } else {
    TORCH_CHECK(false, "unsupported dtype for gemm test");
  }
#undef GEMM_TEST_FUSED_DISPATCH
}

}  // namespace gdn
