#pragma once

#include <cstdlib>
#include <cstring>

namespace gdn {

static constexpr float l2norm_eps = 0.000001f;

// Runtime GDN backend switch (host-only). Both the cutlass xe35 kernels and the
// in-tree kernels are compiled into the build; this selects which one the op
// dispatches to at runtime, so no rebuild is needed to switch. Controlled by
// the VLLM_GDN_USE_CUTLASS environment variable and defaults to the cutlass
// path. Set VLLM_GDN_USE_CUTLASS=0 (or false/off/no) to use the in-tree
// kernels. Parsed once per process: the conv stage and the delta stage are
// separate op calls that must agree on the input contract (raw vs l2norm'd q/k,
// raw vs sigmoid'd b), so a stable per-process value keeps them consistent.
inline bool gdn_use_cutlass() {
  static const bool enabled = [] {
    const char* e = std::getenv("VLLM_GDN_USE_CUTLASS");
    if (e == nullptr || e[0] == '\0') {
      return true;  // default: cutlass path
    }
    return !(
        std::strcmp(e, "0") == 0 || std::strcmp(e, "false") == 0 ||
        std::strcmp(e, "FALSE") == 0 || std::strcmp(e, "off") == 0 ||
        std::strcmp(e, "OFF") == 0 || std::strcmp(e, "no") == 0 ||
        std::strcmp(e, "NO") == 0);
  }();
  return enabled;
}

#ifdef VLLM_XPU_ENABLE_XE2
static constexpr int chunk_size_xe2 = 64;
#endif

enum class ActMode {
  silu = 0,
  swish = 1,
};

}  // namespace gdn