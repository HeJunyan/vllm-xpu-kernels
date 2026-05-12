#pragma once
#include "cutlass/epilogue/fusion/xe_callbacks.hpp"
#include "cutlass/gemm/device/gemm_universal.h"
#include "cutlass/gemm/device/gemm_universal_adapter.h"
#include "cutlass/gemm/collective/collective_mma.hpp"
#include "cutlass/util/GPU_Clock.hpp"

#include <cute/tensor.hpp>
#include <random>

#include "cutlass/util/command_line.h"
#include "cutlass/util/device_memory.h"
#include "cutlass/util/packed_stride.hpp"
#include "cutlass/util/reference/device/gemm_complex.h"
#include "cutlass/util/reference/device/tensor_compare.h"
#include <cfloat>

#include "moe_array_mma.hpp"
#include "moe_array_mma_mxfp.hpp"
#include "moe_array_mma_fp8block.hpp"
#include "moe_array_epilogue.hpp"
#include "moe_callbacks.hpp"
#include "moe_gemm_array_cooperative.hpp"
#include "moe_tile_scheduler.hpp"

using namespace cute;
using ProblemShape =
    cutlass::gemm::GroupProblemShape<Shape<int, int, int>>;  // <M,N,K> per
                                                             // group

namespace gpu::cutlass_kernel {
namespace grouped_gemm {

template <
    class ElementA,
    class ElementScaleA,
    class ElementB,
    class ElementScaleB,
    class ElementAccumulator,
    class ElementOutput,
    class LayoutA,
    class LayoutB,
    class LayoutC,
    class LayoutD,
    class StrideScale,
    class TiledMma,
    class TileShape,
    class GEMMDispatchPolicy,
    class EpilogueDispatchPolicy,
    class EpilogueOp,
    class GmemTiledCopyA,
    class GmemTiledCopyScaleA,
    class GmemTiledCopyB,
    class GmemTiledCopyScaleB,
    bool NeedScale>
class GenerateGemm {
  using FusionCallBacks = cutlass::epilogue::fusion::FusionCallbacks<
      EpilogueDispatchPolicy,
      EpilogueOp,
      TileShape,
      decltype(tile_shape(TiledMma()))>;
  using CollectiveEpilogue = cutlass::epilogue::collective::CollectiveEpilogue<
      EpilogueDispatchPolicy,
      TileShape,
      void,
      ElementAccumulator,
      cutlass::gemm::TagToStrideC_t<LayoutC>,
      ElementOutput,
      cutlass::gemm::TagToStrideC_t<LayoutD>,
      FusionCallBacks,
      void,
      void>;

  using CollectiveMainloop = cutlass::gemm::collective::CollectiveMma<
      GEMMDispatchPolicy,
      TileShape,
      std::conditional_t<
          NeedScale,
          cute::tuple<ElementA, ElementScaleA>,
          ElementA>,
      std::conditional_t<
          NeedScale,
          cute::tuple<cutlass::gemm::TagToStrideA_t<LayoutA>, StrideScale>,
          cutlass::gemm::TagToStrideA_t<LayoutA>>,
      std::conditional_t<
          NeedScale,
          cute::tuple<ElementB, ElementScaleB>,
          ElementB>,
      std::conditional_t<
          NeedScale,
          cute::tuple<cutlass::gemm::TagToStrideB_t<LayoutB>, StrideScale>,
          cutlass::gemm::TagToStrideB_t<LayoutB>>,
      TiledMma,
      std::conditional_t<
          NeedScale,
          cute::tuple<GmemTiledCopyA, GmemTiledCopyScaleA>,
          GmemTiledCopyA>,
      void,
      void,
      cute::identity,  // A
      std::conditional_t<
          NeedScale,
          cute::tuple<GmemTiledCopyB, GmemTiledCopyScaleB>,
          GmemTiledCopyB>,
      void,
      void,
      cute::identity  // B
      >;

  using GemmKernel = cutlass::gemm::kernel::GemmUniversal<
      ProblemShape,
      CollectiveMainloop,
      CollectiveEpilogue,
      cutlass::gemm::GroupScheduler>;

  using Gemm = cutlass::gemm::device::GemmUniversalAdapter<GemmKernel>;
};

#define CALL_GENERATE_GEMM()  \
  using Gemm = GenerateGemm<  \
      ElementA,               \
      ElementScaleA,          \
      ElementB,               \
      ElementScaleB,          \
      ElementAccumulator,     \
      ElementOutput,          \
      LayoutA,                \
      LayoutB,                \
      LayoutC,                \
      LayoutD,                \
      StrideScale,            \
      TiledMma,               \
      TileShape,              \
      GEMMDispatchPolicy,     \
      EpilogueDispatchPolicy, \
      EpilogueOp,             \
      GmemTiledCopyA,         \
      GmemTiledCopyScaleA,    \
      GmemTiledCopyB,         \
      GmemTiledCopyScaleB,    \
      NeedScale>::Gemm;

class moe_policy_base {
 public:
  using ElementAccumulator = float;
  using ElementComputeEpilogue = float;
  using ElementA = float;
  using ElementB = float;
  using ElementOutput = float;
  using ElementScaleA = void;
  using ElementScaleB = void;
  using StrideScale = void;

  using LayoutA = cutlass::layout::RowMajor;
  using LayoutB = cutlass::layout::RowMajor;
  using LayoutC = cutlass::layout::RowMajor;
  using LayoutD = cutlass::layout::RowMajor;

  using GmemTiledCopyA = void;
  using GmemTiledCopyB = void;
  using GmemTiledCopyScaleA = void;
  using GmemTiledCopyScaleB = void;

  static constexpr int PipelineStages = 4;
  using EpilogueDispatchPolicy = cutlass::epilogue::MoE16Group;
  using EpilogueOp = cutlass::epilogue::fusion::LinearCombination<
      float_t,
      ElementComputeEpilogue,
      ElementAccumulator,
      ElementAccumulator,
      cutlass::FloatRoundStyle::round_to_nearest>;
  static constexpr bool NeedScale = false;
  static constexpr int BlockSize = -1;
};

// BF16 / FP16 policies

class moe_bf16_policy : public moe_policy_base {
 public:
  using ElementA = cutlass::bfloat16_t;
  using ElementB = cutlass::bfloat16_t;
  using ElementOutput = cutlass::bfloat16_t;

  using TileShape = Shape<_256, _256, _32>;
  using SGLayout = Layout<Shape<_8, _4, _1>, Stride<_4, _1, _0>>;
  using TiledMma = typename TiledMMAHelper<
      MMA_Atom<XE_DPAS_TT<8, ElementAccumulator, ElementA>>,
      Layout<TileShape>,
      SGLayout>::TiledMMA;
  using GEMMDispatchPolicy = cutlass::gemm::MainloopMoE16Group<PipelineStages>;
  CALL_GENERATE_GEMM();
};

class moe_fp16_policy : public moe_policy_base {
 public:
  using ElementA = cutlass::half_t;
  using ElementB = cutlass::half_t;
  using ElementOutput = cutlass::half_t;

  using TileShape = Shape<_256, _256, _32>;
  using SGLayout = Layout<Shape<_8, _4, _1>, Stride<_4, _1, _0>>;
  using TiledMma = typename TiledMMAHelper<
      MMA_Atom<XE_DPAS_TT<8, ElementAccumulator, ElementA>>,
      Layout<TileShape>,
      SGLayout>::TiledMMA;
  using GEMMDispatchPolicy = cutlass::gemm::MainloopMoE16Group<PipelineStages>;
  CALL_GENERATE_GEMM();
};

class moe_bf16_mid_policy : public moe_bf16_policy {
 public:
  using TileShape = Shape<_128, _128, _32>;
  using SGLayout = Layout<Shape<_4, _4, _1>, Stride<_4, _1, _0>>;
  using TiledMma = typename TiledMMAHelper<
      MMA_Atom<XE_DPAS_TT<8, ElementAccumulator, ElementA>>,
      Layout<TileShape>,
      SGLayout>::TiledMMA;
  CALL_GENERATE_GEMM();
};

class moe_fp16_mid_policy : public moe_fp16_policy {
 public:
  using TileShape = Shape<_128, _128, _32>;
  using SGLayout = Layout<Shape<_4, _4, _1>, Stride<_4, _1, _0>>;
  using TiledMma = typename TiledMMAHelper<
      MMA_Atom<XE_DPAS_TT<8, ElementAccumulator, ElementA>>,
      Layout<TileShape>,
      SGLayout>::TiledMMA;
  CALL_GENERATE_GEMM();
};

class moe_bf16_decode_policy : public moe_bf16_policy {
 public:
  using TileShape = Shape<_16, _128, _32>;
  using SGLayout = Layout<Shape<_1, _8, _1>, Stride<_8, _1, _0>>;
  using TiledMma = typename TiledMMAHelper<
      MMA_Atom<XE_DPAS_TT<8, ElementAccumulator, ElementA>>,
      Layout<TileShape>,
      SGLayout>::TiledMMA;
  CALL_GENERATE_GEMM();
};

class moe_fp16_decode_policy : public moe_fp16_policy {
 public:
  using TileShape = Shape<_16, _128, _32>;
  using SGLayout = Layout<Shape<_1, _8, _1>, Stride<_8, _1, _0>>;
  using TiledMma = typename TiledMMAHelper<
      MMA_Atom<XE_DPAS_TT<8, ElementAccumulator, ElementA>>,
      Layout<TileShape>,
      SGLayout>::TiledMMA;
  CALL_GENERATE_GEMM();
};

// MXFP8
class moe_mxfp8_policy : public moe_policy_base {
 public:
  static constexpr bool NeedScale = true;
  static constexpr int BlockSize = 32;
  using ElementType = cutlass::mx_float8_t<float_e4m3_t>;
  using MmaType = typename ElementType::DataType;

  using ElementA = typename ElementType::DataType;
  using ElementB = typename ElementType::DataType;
  using ElementOutput = float;
  using ElementScaleA = typename ElementType::ScaleFactorType;
  using ElementScaleB = typename ElementType::ScaleFactorType;
  using StrideScale = cute::Stride<_1, int64_t, int64_t>;
  using TileShape = Shape<_256, _256, _64>;
  using SGLayout = Layout<Shape<_8, _4, _1>, Stride<_4, _1, _0>>;

  using TiledMma = typename TiledMMAHelper<
      MMA_Atom<XE_BDPAS_TT<8, float, ElementA>>,
      Layout<TileShape>,
      SGLayout>::TiledMMA;

  using GEMMDispatchPolicy = cutlass::gemm::MainloopMXFPXGroup<PipelineStages>;
  CALL_GENERATE_GEMM();
};

class moe_mxfp8_unaligned_policy : public moe_mxfp8_policy {
 public:
  using GEMMDispatchPolicy =
      cutlass::gemm::MainloopMXFPXGroupUnaligned<PipelineStages>;
  CALL_GENERATE_GEMM();
};

class moe_mxfp8_unaligned_mid_policy : public moe_mxfp8_unaligned_policy {
 public:
  using TileShape = Shape<_128, _128, _64>;
  using SGLayout = Layout<Shape<_4, _4, _1>, Stride<_4, _1, _0>>;
  using TiledMma = typename TiledMMAHelper<
      MMA_Atom<XE_BDPAS_TT<8, float, ElementA>>,
      Layout<TileShape>,
      SGLayout>::TiledMMA;
  CALL_GENERATE_GEMM();
};

class moe_mxfp8_mid_policy : public moe_mxfp8_policy {
 public:
  using TileShape = Shape<_128, _128, _64>;
  using SGLayout = Layout<Shape<_4, _4, _1>, Stride<_4, _1, _0>>;
  using TiledMma = typename TiledMMAHelper<
      MMA_Atom<XE_BDPAS_TT<8, float, ElementA>>,
      Layout<TileShape>,
      SGLayout>::TiledMMA;
  CALL_GENERATE_GEMM();
};

// MXFP4
class moe_mxfp4_policy : public moe_policy_base {
 public:
  static constexpr bool NeedScale = true;
  static constexpr int BlockSize = 32;
  using ElementType = cutlass::mx_float4_t<float_e2m1_t>;
  using MmaType = typename ElementType::DataType;

  using ElementA = typename ElementType::DataType;
  using ElementB = typename ElementType::DataType;
  using ElementOutput = float;
  using ElementScaleA = typename ElementType::ScaleFactorType;
  using ElementScaleB = typename ElementType::ScaleFactorType;
  using LayoutB = cutlass::layout::ColumnMajor;

  using StrideScale = cute::Stride<_1, int64_t, int64_t>;

  using TileShape = Shape<_256, _256, _128>;
  using SGLayout = Layout<Shape<_8, _4, _1>, Stride<_4, _1, _0>>;
  using TiledMma = typename TiledMMAHelper<
      MMA_Atom<XE_BDPAS_TT<8, float, ElementA>>,
      Layout<TileShape>,
      SGLayout>::TiledMMA;

  using GEMMDispatchPolicy = cutlass::gemm::MainloopMXFPXGroup<PipelineStages>;
  CALL_GENERATE_GEMM();
};

class moe_mxfp4_mid_policy : public moe_mxfp4_policy {
 public:
  using TileShape = Shape<_128, _128, _128>;
  using SGLayout = Layout<Shape<_4, _4, _1>, Stride<_4, _1, _0>>;
  using TiledMma = typename TiledMMAHelper<
      MMA_Atom<XE_BDPAS_TT<8, float, ElementA>>,
      Layout<TileShape>,
      SGLayout>::TiledMMA;
  CALL_GENERATE_GEMM();
};

// FP8 block-scaled
class moe_fp8block_policy : public moe_policy_base {
 public:
  static constexpr bool NeedScale = true;
  static constexpr int BlockSize = 128;
  using ElementType = cutlass::float_e4m3_t;

  using ElementA = ElementType;
  using ElementB = ElementType;
  using ElementOutput = float;
  using ElementScaleA = float;
  using ElementScaleB = float;

  using StrideScale = cute::Stride<_1, int64_t, int64_t>;

  using TileShape = Shape<_128, _128, _32>;
  using SGLayout = Layout<Shape<_4, _4, _1>, Stride<_4, _1, _0>>;
  using TiledMma = typename TiledMMAHelper<
      MMA_Atom<XE_DPAS_TT<8, float, ElementA>>,
      Layout<TileShape>,
      SGLayout>::TiledMMA;

  using GEMMDispatchPolicy =
      cutlass::gemm::MainloopFP8BlockGroup<PipelineStages>;
  CALL_GENERATE_GEMM();
};

class moe_fp8block_mid_policy : public moe_fp8block_policy {
 public:
  using TileShape = Shape<_32, _128, _32>;
  using SGLayout = Layout<Shape<_2, _8, _1>, Stride<_8, _1, _0>>;
  using TiledMma = typename TiledMMAHelper<
      MMA_Atom<XE_DPAS_TT<8, float, ElementA>>,
      Layout<TileShape>,
      SGLayout>::TiledMMA;
  CALL_GENERATE_GEMM();
};

class moe_fp8block_decode_policy : public moe_fp8block_policy {
 public:
  using TileShape = Shape<_16, _128, _32>;
  using SGLayout = Layout<Shape<_1, _8, _1>, Stride<_8, _1, _0>>;
  using TiledMma = typename TiledMMAHelper<
      MMA_Atom<XE_DPAS_TT<8, float, ElementA>>,
      Layout<TileShape>,
      SGLayout>::TiledMMA;
  CALL_GENERATE_GEMM();
};

}  // namespace grouped_gemm
}  // namespace gpu::cutlass_kernel
