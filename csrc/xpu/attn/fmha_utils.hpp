#pragma once
#include "xpu/attn/paged_kv_utils.h"
#include "torch/all.h"
#include <cute/tensor.hpp>

#define HEAD_SIZE_LIMIT_0 64
#define HEAD_SIZE_LIMIT_1 96
#define HEAD_SIZE_LIMIT_2 128
#define HEAD_SIZE_LIMIT_3 192
#define HEAD_SIZE_LIMIT_4 256
#define HEAD_SIZE_LIMIT_5 512
#define HEAD_SIZE_LIMIT_6 576

enum class CutlassDType { half, bfloat16, float8_e4m3, float8_e5m2 };

// Struct to carry separate Q and K dtypes without breaking existing API
struct CutlassQKType {
  CutlassDType q_type;
  CutlassDType k_type;
  // Output (accumulator/temp_out) dtype. For non-fp8 Q this mirrors q_type; for
  // fp8 Q the output precision is independent of the (fp8) input and is set
  // from the output tensor by the host.
  CutlassDType o_type;

  // Convenience: construct with identical types
  explicit CutlassQKType(CutlassDType t) : q_type(t), k_type(t), o_type(t) {}
  CutlassQKType(CutlassDType q_t, CutlassDType k_t)
      : q_type(q_t), k_type(k_t), o_type(q_t) {}
  CutlassQKType(CutlassDType q_t, CutlassDType k_t, CutlassDType o_t)
      : q_type(q_t), k_type(k_t), o_type(o_t) {}
};

inline CutlassDType aten_to_dtype(const at::ScalarType st) {
  if (st == torch::kHalf) {
    return CutlassDType::half;
  } else if (st == torch::kBFloat16) {
    return CutlassDType::bfloat16;
  } else if (st == torch::kFloat8_e4m3fn) {
    return CutlassDType::float8_e4m3;
  } else if (st == torch::kFloat8_e5m2) {
    return CutlassDType::float8_e5m2;
  }
  TORCH_INTERNAL_ASSERT(
      false,
      "Unsupported dtype: only half/bfloat16/float8_e4m3/float8_e5m2 supported "
      "for Q/K.");
}

inline CutlassDType aten_to_dtype(const at::Tensor& t) {
  return aten_to_dtype(t.scalar_type());
}

// Helper to build Q/K dtype pair from tensors
inline CutlassQKType
aten_to_Cutlass_qk_dtype(const at::Tensor& q, const at::Tensor& k) {
  return CutlassQKType(aten_to_dtype(q), aten_to_dtype(k));
}

using namespace cute;
struct chunk_policy_head64 {
  using ShapeQK = Shape<_128, _32, _32>;
  using ShapePV = Shape<_128, _32, _32>;
  using ShapeOut = Shape<_128, _64>;
  using SubgroupLayoutQK = Layout<Shape<_8, _1, _1>>;
};

struct chunk_policy_head96 {
  using ShapeQK = Shape<_128, _32, _32>;
  using ShapePV = Shape<_128, _32, _32>;
  using ShapeOut = Shape<_128, _96>;
  using SubgroupLayoutQK = Layout<Shape<_8, _1, _1>>;
};


struct chunk_policy_head128 {
#ifdef VLLM_XPU_ENABLE_XE2
  using ShapeQK = Shape<_256, _64, _64>;
  using ShapePV = Shape<_256, _64, _64>;
  using ShapeOut = Shape<_256, _128>;
  using SubgroupLayoutQK = Layout<Shape<_16, _1, _1>>;
#endif
#ifdef VLLM_XPU_ENABLE_XE3
  using ShapeQK = Shape<_512, _64, _64>;
  using ShapePV = Shape<_512, _64, _64>;
  using ShapeOut = Shape<_512, _128>;
  using SubgroupLayoutQK = Layout<Shape<_32, _1, _1>>;

  using ShapeQK_Causal = Shape<_256, _64, _64>;
  using ShapePV_Causal = Shape<_256, _64, _64>;
  using ShapeOut_Causal = Shape<_256, _128>;
  using SubgroupLayoutQK_Causal = Layout<Shape<_16, _1, _1>>;
#endif
};

struct chunk_policy_head192 {
  using ShapeQK = Shape<_256, _32, _32>;
  using ShapePV = Shape<_256, _32, _32>;
  using ShapeOut = Shape<_256, _192>;
  using SubgroupLayoutQK = Layout<Shape<_32, _1, _1>>;
};

struct chunk_policy_head256 {
  using ShapeQK = Shape<_256, _32, _32>;
  using ShapePV = Shape<_256, _32, _32>;
  using ShapeOut = Shape<_256, _256>;
  using SubgroupLayoutQK = Layout<Shape<_32, _1, _1>>;
};

struct chunk_policy_head512 {
  using ShapeQK = Shape<_256, _32, _32>;
  using ShapePV = Shape<_256, _32, _32>;
  using ShapeOut = Shape<_256, _256>;
  using SubgroupLayoutQK = Layout<Shape<_32, _1, _1>>;
};

// -----------------------------------------------------------------------------
// Full-FP8 chunk_prefill tile policies (TUNE THESE DIRECTLY).
//
// The full-fp8 attention path (fp8 Q/K/V) is tuned INDEPENDENTLY of the
// half/bf16 path. fp8's 1-byte K/V/P fragments leave register headroom that the
// 2-byte half/bf16 fragments lack, so the fp8 path can afford a larger KV (or Q)
// tile without register spills. Edit the structs below to retune the fp8 tiles;
// the half/bf16 policies (chunk_policy_head*) are unaffected.
//
// Tile-shape mode semantics (shared by all three shapes in a policy):
//   ShapeQK  = <Q_tile,  KV_block,  headdim_contract>
//   ShapePV  = <Q_tile,  V_headdim, KV_contract>
//   ShapeOut = <Q_tile,  head_size>
// Constraints the tuner MUST preserve (enforced by static_asserts in FMHAConfig):
//   * get<0>(ShapeQK) == get<0>(ShapePV) == get<0>(ShapeOut)   (Q tile match)
//   * get<1>(ShapeOut) == head_size  (output head dim; do NOT scale with the KV
//     tile -- e.g. head128 keeps ShapeOut = <Q_tile, 128>)
//   * get<1>(ShapeQK) (the KV block) must divide the paged block_size, so a
//     KV block of 128 requires the paged block_size to be a multiple of 128.
//   * get<1>(ShapeQK) == get<2>(ShapePV)  (both are the KV block/contract, so a
//     KV=128 tile is ShapeQK=<Q,128,d>, ShapePV=<Q,Vsub,128>)
//
// These initially mirror the corresponding chunk_policy_head* shapes, so the
// default behavior is identical to the half/bf16 path until you change them.
// -----------------------------------------------------------------------------
struct fp8_chunk_policy_head128 {
  using ShapeQK = Shape<_512, _64, _128>;
  using ShapePV = Shape<_512, _128, _64>;
  using ShapeOut = Shape<_512, _128>;
  using SubgroupLayoutQK = Layout<Shape<_32, _1, _1>>;
};

// Maps a standard (half/bf16) chunk_policy to the isolated full-fp8 policy used
// by the full-fp8 dispatch branch. The primary template defaults to identity so
// any policy without a dedicated fp8 counterpart (e.g. the *_b16 block_size==16
// policies) keeps its existing tile shapes.
template <typename StdPolicy>
struct fp8_policy_of {
  using type = StdPolicy;
};
template <>
struct fp8_policy_of<chunk_policy_head128> {
  using type = fp8_chunk_policy_head128;
};
template <typename StdPolicy>
using fp8_policy_of_t = typename fp8_policy_of<StdPolicy>::type;


// chunk_prefill policies with TileShapeQK[1] = 16 (for block_size = 16).
// These mirror the head-size policies above but halve the K-dim sub-tile so
// that page_size=16 satisfies tiles_per_page = page_size / TileShapeQK[1] = 1.
struct chunk_policy_head64_b16 {
  using ShapeQK = Shape<_128, _16, _32>;
  using ShapePV = Shape<_128, _32, _16>;
  using ShapeOut = Shape<_128, _64>;
  using SubgroupLayoutQK = Layout<Shape<_8, _1, _1>>;
};

struct chunk_policy_head96_b16 {
  using ShapeQK = Shape<_128, _16, _32>;
  using ShapePV = Shape<_128, _32, _16>;
  using ShapeOut = Shape<_128, _96>;
  using SubgroupLayoutQK = Layout<Shape<_8, _1, _1>>;
};

struct chunk_policy_head128_b16 {
  using ShapeQK = Shape<_256, _16, _32>;
  using ShapePV = Shape<_256, _32, _16>;
  using ShapeOut = Shape<_256, _128>;
  using SubgroupLayoutQK = Layout<Shape<_16, _1, _1>>;
};

struct chunk_policy_head192_b16 {
  using ShapeQK = Shape<_256, _16, _32>;
  using ShapePV = Shape<_256, _32, _16>;
  using ShapeOut = Shape<_256, _192>;
  using SubgroupLayoutQK = Layout<Shape<_32, _1, _1>>;
};

struct chunk_policy_head256_b16 {
  using ShapeQK = Shape<_256, _16, _32>;
  using ShapePV = Shape<_256, _32, _16>;
  using ShapeOut = Shape<_256, _256>;
  using SubgroupLayoutQK = Layout<Shape<_32, _1, _1>>;
};

struct chunk_policy_head512_b16 {
  using ShapeQK = Shape<_256, _16, _32>;
  using ShapePV = Shape<_256, _32, _16>;
  using ShapeOut = Shape<_256, _256>;
  using SubgroupLayoutQK = Layout<Shape<_32, _1, _1>>;
};

// define decode policy
template <typename q_packed, typename head_dim, typename kv_tile>
struct decode_policy_qpacked_head {
  static_assert(
      cute::is_same_v<kv_tile, _16> || cute::is_same_v<kv_tile, _32> ||
          cute::is_same_v<kv_tile, _64> || cute::is_same_v<kv_tile, _128>,
      "Unsupported kv_tile for decode_policy_qpacked_head "
      "(supported: _16, _32, _64, _128)");
};

// kv_tile == _16 (block_size == 16)
template <typename q_packed, typename head_dim>
struct decode_policy_qpacked_head<q_packed, head_dim, _16> {
  using ShapeQK = Shape<q_packed, _16, _64>;
  using ShapePV = Shape<q_packed, _32, _16>;
  using ShapeOut = Shape<q_packed, head_dim>;
  using SubgroupLayoutQK = Layout<Shape<_1, _1, _1>>;
};

// kv_tile == _32 (block_size == 32)
template <typename q_packed, typename head_dim>
struct decode_policy_qpacked_head<q_packed, head_dim, _32> {
  using ShapeQK = Shape<q_packed, _32, _64>;
  using ShapePV = Shape<q_packed, _32, _32>;
  using ShapeOut = Shape<q_packed, head_dim>;
  using SubgroupLayoutQK = Layout<Shape<_1, _2, _1>>;
};

// kv_tile == _64
// Also services any block_size that is a positive multiple of 64
// (e.g. 64, 128, 192, 256, 320, ...). The mainloop iterates
// page_size / 64 sub-tiles per page via the page-table indirection.
template <typename q_packed, typename head_dim>
struct decode_policy_qpacked_head<q_packed, head_dim, _64> {
  using ShapeQK = Shape<q_packed, _64, _64>;
  using ShapePV = Shape<q_packed, _32, _64>;
  using ShapeOut = Shape<q_packed, head_dim>;
  using SubgroupLayoutQK = Layout<Shape<_1, _4, _1>>;
};

// kv_tile == _128
// NOTE: Currently UNUSED. The dispatcher in paged_decode_utils.hpp routes
// page_size that is a multiple of 128 through the kv_tile=_64 policy because
// this _128 policy uses SubgroupLayoutQK<_1,_8,_1> (ReduceK=8), which
// triggers a wrong-result bug in the cross-SG SLM reduction
// (chunk_prefill_epilogue.hpp::reduce_A) when SGTileShapeO collapses to
// (1, 32). See dispatch_by_page_size for details. Kept here so it can be
// re-enabled once the upstream ReduceK=8 reduction path is fixed.
template <typename q_packed, typename head_dim>
struct decode_policy_qpacked_head<q_packed, head_dim, _128> {
  using ShapeQK = Shape<q_packed, _128, _64>;
  using ShapePV = Shape<q_packed, _32, _128>;
  using ShapeOut = Shape<q_packed, head_dim>;
  using SubgroupLayoutQK = Layout<Shape<_1, _8, _1>>;
};
