#pragma once

#include <string>
#include <unordered_set>
#include <mutex>
#include <iostream>
#include <memory>
#include <type_traits>
#include <ATen/ATen.h>
#include <c10/xpu/XPUStream.h>
#include <c10/xpu/XPUFunctions.h>
#include <sycl/sycl.hpp>

#define CHECK_DEVICE(x) TORCH_CHECK(x.is_xpu(), #x " must be on XPU")
#define CHECK_CONTIGUOUS(x) \
  TORCH_CHECK(x.is_contiguous(), #x " must be contiguous")
// Xe2 2D block loads require 64-byte aligned base pointers.
// All non-unit strides must produce 64-byte aligned offsets.
#define CHECK_STRIDE_ALIGNMENT(x)                             \
  for (int _d = 0; _d < (x).dim() - 1; ++_d) {                \
    TORCH_CHECK(                                              \
        (x).stride(_d) * (x).element_size() % 64 == 0,        \
        #x " stride(",                                        \
        _d,                                                   \
        ")=",                                                 \
        (x).stride(_d),                                       \
        " is not 64-byte aligned (element_size=",             \
        (x).element_size(),                                   \
        "). Xe2 2D block loads require 64-byte aligned base " \
        "pointers.");                                         \
  }

inline void
warn_once_per_line(const char* file, int line, const std::string& msg) {
  // 组合 key: "file:line"
  static std::unordered_set<std::string> seen;
  static std::mutex mx;
  std::string key = std::string(file) + ":" + std::to_string(line);

  std::lock_guard<std::mutex> lock(mx);
  if (seen.insert(key).second)
    std::cerr << "[WARN_ONCE] " << file << ":" << line << ": " << msg
              << std::endl;
}

#define WARN_ONCE_LINE(msg) warn_once_per_line(__FILE__, __LINE__, msg)

namespace vllm {
namespace xpu {

static inline std::optional<std::string> getEnv(const char* name) {
  if (const char* val = std::getenv(name)) return val;
  return std::nullopt;
}

static inline sycl::queue& vllmGetQueue(at::DeviceIndex device_index = -1) {
  auto current_stream = c10::xpu::getCurrentXPUStream(device_index);
  auto& queue = current_stream.queue();
  return queue;
}

namespace syclex = sycl::ext::oneapi::experimental;

// Some SYCL/oneAPI toolchains (e.g. the public 2026.x releases) do not yet
// expose the `intel_gpu_cri` enumerator in `syclex::architecture`. Detect it at
// compile time so the CRI arch checks compile everywhere: where the enumerator
// exists behavior is unchanged, and where it is absent a device can never be
// CRI, so the check is a no-op returning false.
template <typename Arch, typename = void>
struct has_intel_gpu_cri : std::false_type {};
template <typename Arch>
struct has_intel_gpu_cri<Arch, std::void_t<decltype(Arch::intel_gpu_cri)>>
    : std::true_type {};

static inline bool arch_is_cri(syclex::architecture arch) {
  return [](auto a) {
    using Arch = decltype(a);
    if constexpr (has_intel_gpu_cri<Arch>::value) {
      return a == Arch::intel_gpu_cri;
    } else {
      return false;
    }
  }(arch);
}

static inline syclex::architecture
get_device_architecture(at::DeviceIndex device_index = -1) {
  auto device_id =
      (device_index == -1) ? c10::xpu::current_device() : device_index;
  auto raw_device = c10::xpu::get_raw_device(device_id);
  return raw_device.get_info<syclex::info::device::architecture>();
}

static inline bool is_bmg_g21(at::DeviceIndex device_index = -1) {
  return get_device_architecture(device_index) ==
         syclex::architecture::intel_gpu_bmg_g21;
}

static inline bool is_bmg_g31(at::DeviceIndex device_index = -1) {
  return get_device_architecture(device_index) ==
         syclex::architecture::intel_gpu_bmg_g31;
}

static inline bool is_bmg(at::DeviceIndex device_index = -1) {
  return is_bmg_g21(device_index) || is_bmg_g31(device_index);
}

static inline bool is_pvc(at::DeviceIndex device_index = -1) {
  return get_device_architecture(device_index) ==
         syclex::architecture::intel_gpu_pvc;
}

static inline bool is_cri(at::DeviceIndex device_index = -1) {
  return arch_is_cri(get_device_architecture(device_index));
}

static inline bool is_nvl_p(at::DeviceIndex device_index = -1) {
  return get_device_architecture(device_index) ==
         syclex::architecture::intel_gpu_nvl_p;
}

static inline bool is_xe2_arch(at::DeviceIndex device_index = -1) {
  auto arch = get_device_architecture(device_index);
  return arch == syclex::architecture::intel_gpu_bmg_g21 ||
         arch == syclex::architecture::intel_gpu_bmg_g31 ||
         arch == syclex::architecture::intel_gpu_lnl_m ||
         arch == syclex::architecture::intel_gpu_pvc;
}

static inline bool is_xe3_arch(at::DeviceIndex device_index = -1) {
  auto arch = get_device_architecture(device_index);
  return arch == syclex::architecture::intel_gpu_ptl_h ||
         arch == syclex::architecture::intel_gpu_ptl_u ||
         arch == syclex::architecture::intel_gpu_wcl;
}

static inline bool is_xe3p_arch(at::DeviceIndex device_index = -1) {
  auto arch = get_device_architecture(device_index);
  return arch_is_cri(arch) ||
         arch == syclex::architecture::intel_gpu_nvl_p;
}


static inline bool force_xe_default_kernel() {
  auto env_val = getEnv("VLLM_XPU_FORCE_XE_DEFAULT_KERNEL");
  if (env_val.has_value()) {
    return env_val.value() == "1" || env_val.value() == "true" ||
           env_val.value() == "TRUE";
  }
  return false;
}

// Control whether MHC kernels use the TF32 DPAS GEMM path (split-K).
// Default: enabled (1). Set VLLM_MHC_USE_TF32=0 to force the vector path.
static inline bool mhc_use_tf32() {
  auto env_val = getEnv("VLLM_MHC_USE_TF32");
  if (env_val.has_value()) {
    return env_val.value() != "0" && env_val.value() != "false" &&
           env_val.value() != "FALSE";
  }
  return true;
}

template <typename T>
struct SyclTypeTrait {
  using Type = T;
};

template <>
struct SyclTypeTrait<c10::Half> {
  using Type = sycl::half;
};

template <>
struct SyclTypeTrait<c10::BFloat16> {
  using Type = sycl::ext::oneapi::bfloat16;
};

template <typename T>
struct AccumulateType {
 private:
  static constexpr bool is_narrow_float =
      std::is_same_v<T, at::Half> || std::is_same_v<T, at::BFloat16> ||
      std::is_same_v<T, c10::Float8_e4m3fn> ||
      std::is_same_v<T, c10::Float8_e5m2>;

  static constexpr bool is_integer =
      std::is_same_v<T, int8_t> || std::is_same_v<T, uint8_t> ||
      std::is_same_v<T, char> || std::is_same_v<T, int16_t> ||
      std::is_same_v<T, int32_t> || std::is_same_v<T, int64_t>;

  static constexpr bool is_complex = std::is_same_v<T, c10::complex<float>> ||
                                     std::is_same_v<T, c10::complex<double>>;

 public:
  using type = std::conditional_t<
      is_narrow_float,
      float,
      std::conditional_t<
          std::is_floating_point_v<T>,
          T,
          std::conditional_t<
              is_integer,
              int64_t,
              std::conditional_t<is_complex, T, T>>>>;
};

template <typename T>
using acc_type = typename AccumulateType<T>::type;

// aligned vector generates vectorized load/store on XPU
template <typename scalar_t, int vec_size>
struct alignas(sizeof(scalar_t) * vec_size) aligned_vec {
  scalar_t val[vec_size];

  scalar_t& operator[](int index) { return val[index]; }

  scalar_t const& operator[](int index) const { return val[index]; }
};

// From float to float.
inline void from_float(float& dst, float src) { dst = src; }
// From float32 to float16.
inline void from_float(sycl::half& dst, float src) { dst = sycl::half(src); }
// From float32 to bfloat16.
inline void from_float(sycl::ext::oneapi::bfloat16& dst, float src) {
  dst = sycl::ext::oneapi::bfloat16(src);
}

// From float to float.
inline float to_float(float u) { return u; }
// From float16 to float32.
inline float to_float(sycl::half u) { return float(u); }
// From bfloat16 to float32.
inline float to_float(sycl::ext::oneapi::bfloat16 u) { return float(u); }

}  // namespace xpu

}  // namespace vllm
