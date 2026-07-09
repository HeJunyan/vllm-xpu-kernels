#pragma once
#include <cmath>

#include <ATen/ScalarType.h>
#include <c10/util/Float8_e4m3fn.h>
#include <c10/util/Float8_e5m2.h>

#include "quantization/utils.h"

namespace vllm {

enum class Fp8KVCacheDataType {
  kAuto = 0,
  kFp8E4M3 = 1,
  kFp8E5M2 = 2,
};

namespace fp8 {

template <typename Tout>
struct fp8_max_f;
template <>
struct fp8_max_f<at::Float8_e4m3fn> {
  static constexpr float value = 448.0f;
};
template <>
struct fp8_max_f<at::Float8_e5m2> {
  static constexpr float value = 57344.0f;
};

template <typename scalar_t>
inline float thread_max_vec(
    scalar_t const* input,
    int64_t const num_elems,
    int const tid,
    int const step) {
  // Vectorized input/output to better utilize memory bandwidth.
  using vec4_t = ::vec4_t<scalar_t>;
  vec4_t const* vectorized_in = reinterpret_cast<vec4_t const*>(input);

  int64_t const num_vec_elems = num_elems >> 2;
  float absmax_val = 0.0f;

#pragma unroll 4
  for (int64_t i = tid; i < num_vec_elems; i += step) {
    vec4_t in_vec = vectorized_in[i];
    absmax_val =
        sycl::max(absmax_val, sycl::fabs(static_cast<float>(in_vec.val[0])));
    absmax_val =
        sycl::max(absmax_val, sycl::fabs(static_cast<float>(in_vec.val[1])));
    absmax_val =
        sycl::max(absmax_val, sycl::fabs(static_cast<float>(in_vec.val[2])));
    absmax_val =
        sycl::max(absmax_val, sycl::fabs(static_cast<float>(in_vec.val[3])));
  }

  // Handle the remaining elements if num_elems is not divisible by 4
  for (int64_t i = num_vec_elems * 4 + tid; i < num_elems; i += step) {
    absmax_val =
        sycl::max(absmax_val, sycl::fabs(static_cast<float>(input[i])));
  }

  return absmax_val;
}

template <
    typename T,
    typename = std::enable_if_t<
        std::is_same_v<T, at::Float8_e5m2> ||
        std::is_same_v<T, at::Float8_e4m3fn>>>
struct min_scaling_factor {
  static inline float val() { return 1.0f / (fp8_max_f<T>::value * 512.0f); }
};

// convert a float value to fp8 type with scaling
template <bool is_scale_inverted, typename fp8_type>
struct ConvertWithScaleOp {
  float scale;

  inline void operator()(fp8_type& dst, float const src) const {
    float x = is_scale_inverted ? (src * scale) : (src / scale);
    constexpr float fp8_max = fp8_max_f<fp8_type>::value;
    float r = sycl::fmax(-fp8_max, sycl::fmin(x, fp8_max));
    dst = static_cast<fp8_type>(r);
  }
};

}  // namespace fp8
}  // namespace vllm

// The following macro is used to dispatch the conversion function based on
// the data type of the key and value cache. The FN is a macro that calls a
// function with template<typename scalar_t, typename cache_t,
// Fp8KVCacheDataType kv_dt>.
#define DISPATCH_BY_KV_CACHE_DTYPE(SRC_DTYPE, KV_DTYPE, FN)                    \
  if (KV_DTYPE == "auto") {                                                    \
    if (SRC_DTYPE == at::ScalarType::Float) {                                  \
      FN(float, float, vllm::Fp8KVCacheDataType::kAuto);                       \
    } else if (SRC_DTYPE == at::ScalarType::Half) {                            \
      FN(sycl::half, sycl::half, vllm::Fp8KVCacheDataType::kAuto);             \
    } else if (SRC_DTYPE == at::ScalarType::BFloat16) {                        \
      FN(sycl::ext::oneapi::bfloat16,                                          \
         sycl::ext::oneapi::bfloat16,                                          \
         vllm::Fp8KVCacheDataType::kAuto);                                     \
    } else {                                                                   \
      TORCH_CHECK(false, "Unsupported input type of kv cache: ", SRC_DTYPE);   \
    }                                                                          \
  } else {                                                                     \
    if (KV_DTYPE == "fp8" || KV_DTYPE == "fp8_e4m3") {                         \
      if (SRC_DTYPE == at::ScalarType::Float) {                                \
        FN(float, uint8_t, vllm::Fp8KVCacheDataType::kFp8E4M3);                \
      } else if (SRC_DTYPE == at::ScalarType::Half) {                          \
        FN(sycl::half, uint8_t, vllm::Fp8KVCacheDataType::kFp8E4M3);           \
      } else if (SRC_DTYPE == at::ScalarType::BFloat16) {                      \
        FN(sycl::ext::oneapi::bfloat16,                                        \
           uint8_t,                                                            \
           vllm::Fp8KVCacheDataType::kFp8E4M3);                                \
      } else {                                                                 \
        TORCH_CHECK(false, "Unsupported input type of kv cache: ", SRC_DTYPE); \
      }                                                                        \
    } else if (KV_DTYPE == "fp8_e5m2") {                                       \
      if (SRC_DTYPE == at::ScalarType::Float) {                                \
        FN(float, uint8_t, vllm::Fp8KVCacheDataType::kFp8E5M2);                \
      } else if (SRC_DTYPE == at::ScalarType::Half) {                          \
        FN(sycl::half, uint8_t, vllm::Fp8KVCacheDataType::kFp8E5M2);           \
      } else if (SRC_DTYPE == at::ScalarType::BFloat16) {                      \
        FN(sycl::ext::oneapi::bfloat16,                                        \
           uint8_t,                                                            \
           vllm::Fp8KVCacheDataType::kFp8E5M2);                                \
      } else {                                                                 \
        TORCH_CHECK(false, "Unsupported input type of kv cache: ", SRC_DTYPE); \
      }                                                                        \
    } else {                                                                   \
      TORCH_CHECK(false, "Unsupported data type of kv cache: ", KV_DTYPE);     \
    }                                                                          \
  }