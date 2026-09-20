#include "xpu/gemm/gemm_backend.h"

#include <cstdlib>
#include <cstring>
#include <dlfcn.h>
#include <fstream>
#include <sstream>
#include <string>
#include <unordered_set>
#include <vector>

namespace vllm::xpu::gemm {

namespace {

// ---------------------------------------------------------------------------
// VLLM_XPU_GEMM_BACKEND: onednn | sycltla | unset (auto).
// ---------------------------------------------------------------------------

enum class BackendMode { kForceOnednn, kForceSycltla, kAuto };

BackendMode backend_mode() {
  static const BackendMode mode = [] {
    const char* env = std::getenv("VLLM_XPU_GEMM_BACKEND");
    if (env == nullptr || env[0] == '\0') {
      return BackendMode::kAuto;
    }
    if (std::strcmp(env, "onednn") == 0) {
      return BackendMode::kForceOnednn;
    }
    if (std::strcmp(env, "sycltla") == 0) {
      return BackendMode::kForceSycltla;
    }
    TORCH_CHECK(
        false,
        "Unknown VLLM_XPU_GEMM_BACKEND='",
        env,
        "'. Valid values are 'onednn', 'sycltla', or unset (auto-select).");
  }();
  return mode;
}

// ---------------------------------------------------------------------------
// Shape table: a unified key covering all three ops (batch is 0 for the
// non-batched kinds; fp4 uses fixed scale/group_size defaults).
// ---------------------------------------------------------------------------

struct ShapeKey {
  GemmType kind;
  int64_t batch;
  int64_t m;
  int64_t n;
  int64_t k;
  ScaleType scale_type;
  uint32_t group_size;

  bool operator==(const ShapeKey& o) const {
    return kind == o.kind && batch == o.batch && m == o.m && n == o.n &&
           k == o.k && scale_type == o.scale_type && group_size == o.group_size;
  }
};

struct ShapeKeyHash {
  template <typename T>
  static size_t mix(size_t seed, T v) {
    return seed ^ (std::hash<T>{}(v) + 0x9e3779b97f4a7c15ULL + (seed << 6) +
                   (seed >> 2));
  }
  size_t operator()(const ShapeKey& s) const {
    size_t h = 0;
    h = mix(h, static_cast<uint8_t>(s.kind));
    h = mix(h, s.batch);
    h = mix(h, s.m);
    h = mix(h, s.n);
    h = mix(h, s.k);
    h = mix(h, static_cast<uint8_t>(s.scale_type));
    h = mix(h, s.group_size);
    return h;
  }
};

using ShapeSet = std::unordered_set<ShapeKey, ShapeKeyHash>;

// ---------------------------------------------------------------------------
// Shape config parsing (loaded once; defaults to next to the extension .so).
// ---------------------------------------------------------------------------

std::string strip(const std::string& s) {
  const auto b = s.find_first_not_of(" \t\r\n");
  if (b == std::string::npos) {
    return "";
  }
  const auto e = s.find_last_not_of(" \t\r\n");
  return s.substr(b, e - b + 1);
}

std::vector<std::string> split_csv(const std::string& s) {
  std::vector<std::string> out;
  std::stringstream ss(s);
  std::string item;
  while (std::getline(ss, item, ',')) {
    out.push_back(strip(item));
  }
  return out;
}

// Parses "a,b,c" into integers. Returns nullopt if any token is not an int.
std::optional<std::vector<int64_t>>
parse_ints(const std::vector<std::string>& toks) {
  std::vector<int64_t> out;
  out.reserve(toks.size());
  for (const auto& s : toks) {
    try {
      out.push_back(std::stoll(s));
    } catch (...) {
      return std::nullopt;
    }
  }
  return out;
}

std::optional<ScaleType> parse_scale(const std::string& s) {
  if (s == "fp32") {
    return ScaleType::FP32;
  }
  if (s == "e8m0") {
    return ScaleType::E8M0;
  }
  return std::nullopt;
}

// Expand M once at load time; runtime lookup remains an exact hash probe.
void insert_m_range(ShapeSet* t, ShapeKey key, const std::string& m) {
  int64_t m_max;
  try {
    size_t pos;
    key.m = std::stoll(m, &pos);
    const auto rest = strip(m.substr(pos));
    m_max = key.m;
    if (!rest.empty()) {
      if (rest[0] != '-') {
        return;
      }
      const auto end = strip(rest.substr(1));
      m_max = std::stoll(end, &pos);
      if (pos != end.size()) {
        return;
      }
    }
  } catch (...) {
    return;
  }
  if (key.m > m_max) {
    return;
  }
  for (;;) {
    t->insert(key);
    if (key.m == m_max) {
      break;
    }
    ++key.m;
  }
}

void parse_config_file(const std::string& path, ShapeSet* t) {
  std::ifstream f(path);

  std::string line;
  while (std::getline(f, line)) {
    // Strip inline comments and surrounding whitespace.
    line = strip(line.substr(0, line.find('#')));
    if (line.empty()) {
      continue;
    }

    // Split "<kind> <csv fields>".
    std::stringstream ss(line);
    std::string kind;
    std::string rest;
    ss >> kind;
    std::getline(ss, rest);
    const auto fields = split_csv(strip(rest));

    if (kind == "fp8" && fields.size() == 5) {
      // M,N,K,scale,group_size
      auto nk = parse_ints({fields[1], fields[2]});
      auto scale = parse_scale(fields[3]);
      auto gs = parse_ints({fields[4]});
      if (nk && scale && gs) {
        insert_m_range(
            t,
            ShapeKey{
                GemmType::fp8,
                0,
                0,
                (*nk)[0],
                (*nk)[1],
                *scale,
                static_cast<uint32_t>((*gs)[0])},
            fields[0]);
      }
    } else if (kind == "fp8_bmm" && fields.size() == 6) {
      // batch,M,N,K,scale,group_size
      auto bnk = parse_ints({fields[0], fields[2], fields[3]});
      auto scale = parse_scale(fields[4]);
      auto gs = parse_ints({fields[5]});
      if (bnk && scale && gs) {
        insert_m_range(
            t,
            ShapeKey{
                GemmType::fp8_bmm,
                (*bnk)[0],
                0,
                (*bnk)[1],
                (*bnk)[2],
                *scale,
                static_cast<uint32_t>((*gs)[0])},
            fields[1]);
      }
    } else if (kind == "fp4" && fields.size() == 3) {
      // M,N,K (fp4 has no scale/group_size: fixed defaults)
      if (auto nk = parse_ints({fields[1], fields[2]})) {
        insert_m_range(
            t,
            ShapeKey{
                GemmType::fp4, 0, 0, (*nk)[0], (*nk)[1], ScaleType::FP32, 0},
            fields[0]);
      }
    }
    // Unknown kind or malformed line: silently skipped.
  }
}

std::string shape_config_path() {
  const char* env = std::getenv("VLLM_XPU_GEMM_CONFIG");
  if (env != nullptr && env[0] != '\0') {
    return env;
  }

  Dl_info info;
  if (dladdr(reinterpret_cast<const void*>(&shape_config_path), &info) &&
      info.dli_fname != nullptr) {
    std::string so = info.dli_fname;
    const auto slash = so.find_last_of("/\\");
    const std::string dir =
        (slash == std::string::npos) ? "" : so.substr(0, slash + 1);
    return dir + "gemm_shapes.conf";
  }
  return "";
}

const ShapeSet& shape_set() {
  static const ShapeSet shapes = [] {
    ShapeSet t;
    parse_config_file(shape_config_path(), &t);
    return t;
  }();
  return shapes;
}

}  // namespace

ScaleType classify_fp8_scale(
    const std::optional<torch::Tensor>& a_scale,
    const std::optional<torch::Tensor>& b_scale) {
  auto is_e8m0 = [](const std::optional<torch::Tensor>& s) {
    return s.has_value() && s->scalar_type() == at::ScalarType::Float8_e8m0fnu;
  };
  if (is_e8m0(a_scale) || is_e8m0(b_scale)) {
    return ScaleType::E8M0;
  }
  return ScaleType::FP32;
}

Backend select_gemm_backend(
    GemmType kind,
    int64_t batch,
    int64_t m,
    int64_t n,
    int64_t k,
    ScaleType scale_type,
    uint32_t group_size) {
  switch (backend_mode()) {
    case BackendMode::kForceOnednn:
      return Backend::onednn;
    case BackendMode::kForceSycltla:
      return Backend::sycltla;
    case BackendMode::kAuto:
    default: {
      const auto& s = shape_set();
      return s.find(ShapeKey{kind, batch, m, n, k, scale_type, group_size}) !=
                     s.end()
                 ? Backend::sycltla
                 : Backend::onednn;
    }
  }
}

}  // namespace vllm::xpu::gemm
