#pragma once
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

#include <numeric>
#include <cute/arch/mma_xe4.hpp>
#include "cutlass/util/reference/host/tensor_fill.h"
#include "cute/util/compat.hpp"
#include "cutlass/gemm/group_array_problem_shape.hpp"
#include "collective/xe4_array_gemm_kernel.hpp"
#include "collective/xe4_tile_scheduler_group.hpp"
#include "collective/xe4_array_mma_mainloop.hpp"
#include "collective/xe4_array_mma_epilogue.hpp"
#include "collective/xe4_scaled_array_gemm_kernel.hpp"
#include "collective/xe4_scaled_tile_scheduler_group.hpp"
#include "collective/xe4_scaled_array_mma_mainloop.hpp"
#include "collective/xe4_scaled_array_mma_epilogue.hpp"
#include "cutlass/detail/xe4_blockscaled_layout.hpp"

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

  static constexpr int PipelineStages = 2;
  /* using EpilogueDispatchPolicy = cutlass::epilogue::MoE16Group; */
  /* using EpilogueOp = cutlass::epilogue::fusion::LinearCombination< */
  /*     float_t, */
  /*     ElementComputeEpilogue, */
  /*     ElementAccumulator, */
  /*     ElementAccumulator, */
  /*     cutlass::FloatRoundStyle::round_to_nearest>; */
  static constexpr bool NeedScale = false;
  static constexpr int BlockSize = -1;
};

class moe_fp16_policy : public moe_policy_base {
 public:
  using TileShape = Shape<_128, _128, _128>;
  using ClusterShape = Shape<_1, _1, _1>;
  using TileShape_MNK = TileShape;  // 128, 128, 128

  using ElementA = fp16;       // dtype of A
  using ElementB = fp16;       // dtype of B
  using ElementOutput = fp16;  // dtype of C/D

  static constexpr auto majorA = cute::AMMA::Major::K;
  static constexpr auto majorB = cute::AMMA::Major::K;

  static constexpr int PipelineStages = 2;

  using SmemLayoutAtomA =
      decltype(make_layout(cute::select<0, 2>(TileShape_MNK{}), GenRowMajor{}));

  using SmemLayoutA = decltype(tile_to_shape(
      SmemLayoutAtomA{},
      make_shape(
          shape<0>(TileShape_MNK{}),
          shape<2>(TileShape_MNK{}),
          Int<PipelineStages>{})));

  using SmemLayoutAtomB =
      decltype(make_layout(cute::select<1, 2>(TileShape_MNK{}), GenRowMajor{}));

  using SmemLayoutB = decltype(tile_to_shape(
      SmemLayoutAtomB{},
      make_shape(
          shape<1>(TileShape_MNK{}),
          shape<2>(TileShape_MNK{}),
          Int<PipelineStages>{})));

  using SmemLayoutOutput =
      decltype(make_layout(cute::select<0, 1>(TileShape_MNK{}), GenRowMajor{}));

  // Copy from GMEM to SMEM
  using TMACopyAtomA = cute::xe4::ASYNC_TENSOR_LOAD<
      slm_matrix_type::type1,
      size<2>(TileShape_MNK{}) /*stride=K*/>;
  using TMACopyAtomB = cute::xe4::ASYNC_TENSOR_LOAD<
      slm_matrix_type::type1,
      size<2>(TileShape_MNK{}) /*stride=K*/>;
  using TMACopyAtomD = cute::xe4::ASYNC_TENSOR_STORE<
      slm_matrix_type::type1,
      size<1>(TileShape_MNK{}) /*stride=N*/>;

  using TiledMma = decltype(cute::make_tiled_mma(
      cute::AMMA::ss_op_selector<
          ElementOutput /*D dtype*/,
          ElementA,
          ElementB,
          ElementOutput /*C dtype*/,
          TileShape_MNK,
          ClusterShape,
          majorA,
          majorB>()));

  using LayoutA = cutlass::layout::RowMajor;
  using LayoutB = cutlass::layout::ColumnMajor;
  using LayoutD = cutlass::layout::RowMajor;

  using CollectiveMainloop =
      cutlass::xe4_grouped_gemm::collective::XE4CollectiveMma<
          ProblemShape,
          TileShape,
          ElementA,
          ElementB,
          cutlass::gemm::TagToStrideA_t<LayoutA*>,
          cutlass::gemm::TagToStrideB_t<LayoutB*>,
          TiledMma,
          SmemLayoutA,
          SmemLayoutB,
          SmemLayoutOutput,
          TMACopyAtomA,
          TMACopyAtomB>;

  using CollectiveEpilogue =
      cutlass::xe4_grouped_gemm::collective::XE4CollectiveEpilogue<
          ProblemShape,
          TileShape,
          ElementOutput,
          cutlass::gemm::TagToStrideC_t<LayoutD*>,
          SmemLayoutOutput,
          TMACopyAtomD>;

  using TileScheduler =
      cutlass::xe4_grouped_gemm::kernel::PersistentTileSchedulerXe4Group;

  using GemmKernel = cutlass::xe4_grouped_gemm::kernel::XE4GemmUniversal<
      ProblemShape,
      CollectiveMainloop,
      CollectiveEpilogue,
      TileScheduler>;
};

class moe_bf16_policy : public moe_policy_base {
 public:
  using TileShape = Shape<_128, _128, _128>;
  using ClusterShape = Shape<_1, _1, _1>;
  using TileShape_MNK = TileShape;  // 128, 128, 128

  using ElementA = bf16;       // dtype of A
  using ElementB = bf16;       // dtype of B
  using ElementOutput = float;  // dtype of C/D

  static constexpr auto majorA = cute::AMMA::Major::K;
  static constexpr auto majorB = cute::AMMA::Major::K;

  static constexpr int PipelineStages = 2;

  using SmemLayoutAtomA =
      decltype(make_layout(cute::select<0, 2>(TileShape_MNK{}), GenRowMajor{}));

  using SmemLayoutA = decltype(tile_to_shape(
      SmemLayoutAtomA{},
      make_shape(
          shape<0>(TileShape_MNK{}),
          shape<2>(TileShape_MNK{}),
          Int<PipelineStages>{})));

  using SmemLayoutAtomB =
      decltype(make_layout(cute::select<1, 2>(TileShape_MNK{}), GenRowMajor{}));

  using SmemLayoutB = decltype(tile_to_shape(
      SmemLayoutAtomB{},
      make_shape(
          shape<1>(TileShape_MNK{}),
          shape<2>(TileShape_MNK{}),
          Int<PipelineStages>{})));

  using SmemLayoutOutput =
      decltype(make_layout(cute::select<0, 1>(TileShape_MNK{}), GenRowMajor{}));

  // Copy from GMEM to SMEM
  using TMACopyAtomA = cute::xe4::ASYNC_TENSOR_LOAD<
      slm_matrix_type::type1,
      size<2>(TileShape_MNK{}) /*stride=K*/>;
  using TMACopyAtomB = cute::xe4::ASYNC_TENSOR_LOAD<
      slm_matrix_type::type1,
      size<2>(TileShape_MNK{}) /*stride=K*/>;
  using TMACopyAtomD = cute::xe4::ASYNC_TENSOR_STORE<
      slm_matrix_type::type1,
      size<1>(TileShape_MNK{}) /*stride=N*/>;

  using TiledMma = decltype(cute::make_tiled_mma(
      cute::AMMA::ss_op_selector<
          ElementOutput /*D dtype*/,
          ElementA,
          ElementB,
          ElementOutput /*C dtype*/,
          TileShape_MNK,
          ClusterShape,
          majorA,
          majorB>()));

  using LayoutA = cutlass::layout::RowMajor;
  using LayoutB = cutlass::layout::ColumnMajor;
  using LayoutD = cutlass::layout::RowMajor;

  using CollectiveMainloop =
      cutlass::xe4_grouped_gemm::collective::XE4CollectiveMma<
          ProblemShape,
          TileShape,
          ElementA,
          ElementB,
          cutlass::gemm::TagToStrideA_t<LayoutA*>,
          cutlass::gemm::TagToStrideB_t<LayoutB*>,
          TiledMma,
          SmemLayoutA,
          SmemLayoutB,
          SmemLayoutOutput,
          TMACopyAtomA,
          TMACopyAtomB>;

  using CollectiveEpilogue =
      cutlass::xe4_grouped_gemm::collective::XE4CollectiveEpilogue<
          ProblemShape,
          TileShape,
          ElementOutput,
          cutlass::gemm::TagToStrideC_t<LayoutD*>,
          SmemLayoutOutput,
          TMACopyAtomD>;

  using TileScheduler =
      cutlass::xe4_grouped_gemm::kernel::PersistentTileSchedulerXe4Group;

  using GemmKernel = cutlass::xe4_grouped_gemm::kernel::XE4GemmUniversal<
      ProblemShape,
      CollectiveMainloop,
      CollectiveEpilogue,
      TileScheduler>;
};

// ============================================================================
// Block-scaled (low-precision) policies: MXFP8 / NVFP4
// Built on the vendored Xiaoli scaled grouped-GEMM kernel
// (cutlass::xe4_scaled_grouped_gemm::*).
// ============================================================================

// Compile-time BlockScaleType encoding map for AMMA::bs_op_selector control.
// Mirrors the table from the cutlass reference scaled grouped GEMM example.
template <class ElementSF, int SFVecSize>
struct BlockScaleTypeMap { static constexpr int value = 0; };
template <> struct BlockScaleTypeMap<cutlass::float_ue4m3_t, 16> { static constexpr int value = 5; };
template <> struct BlockScaleTypeMap<cutlass::float_ue5m3_t, 16> { static constexpr int value = 3; };
template <> struct BlockScaleTypeMap<cutlass::float_ue5m3_t, 32> { static constexpr int value = 2; };
template <> struct BlockScaleTypeMap<cutlass::float_ue8m0_t, 16> { static constexpr int value = 1; };
template <> struct BlockScaleTypeMap<cutlass::float_ue8m0_t, 32> { static constexpr int value = 0; };

template <
    class ElementInputA_,
    class ElementInputB_,
    class ElementSF_,
    class ElementOutput_,
    int SFVecSize_,
    int TileK_>
class moe_scaled_policy_base : public moe_policy_base {
 public:
  using ElementA = ElementInputA_;
  using ElementB = ElementInputB_;
  using ElementOutput = ElementOutput_;
  using ElementScaleA = ElementSF_;
  using ElementScaleB = ElementSF_;
  using ElementAccumulator = float;

  static constexpr int SFVecSize = SFVecSize_;
  static constexpr bool NeedScale = true;
  static constexpr int BlockSize = SFVecSize_;

  using TileShape = Shape<_128, _256, Int<TileK_>>;
  using ClusterShape = Shape<_1, _1, _1>;
  using TileShape_MNK = TileShape;

  static constexpr auto majorA = cute::AMMA::Major::K;
  static constexpr auto majorB = cute::AMMA::Major::K;
  static constexpr int PipelineStages = 2;

  using LayoutA = cutlass::layout::RowMajor;
  using LayoutB = cutlass::layout::ColumnMajor;
  using LayoutSFA = cutlass::layout::RowMajor;
  using LayoutSFB = cutlass::layout::ColumnMajor;
  using LayoutD = cutlass::layout::RowMajor;

  using BlockScaleType = BlockScaleTypeMap<ElementScaleA, SFVecSize>;

  using TiledMma = decltype(cute::make_tiled_mma(
      cute::AMMA::bs_op_selector<
          ElementAccumulator,
          ElementA,
          ElementB,
          ElementAccumulator,
          ElementScaleA,
          ElementScaleB,
          SFVecSize,
          SFVecSize,
          TileShape_MNK,
          ClusterShape,
          majorA,
          majorB>()));

  using SmemLayoutAtomA =
      decltype(make_layout(cute::select<0, 2>(TileShape_MNK{}), GenRowMajor{}));
  using SmemLayoutA = decltype(tile_to_shape(
      SmemLayoutAtomA{},
      make_shape(
          shape<0>(TileShape_MNK{}),
          shape<2>(TileShape_MNK{}),
          Int<PipelineStages>{})));

  using SmemLayoutAtomB =
      decltype(make_layout(cute::select<1, 2>(TileShape_MNK{}), GenRowMajor{}));
  using SmemLayoutB = decltype(tile_to_shape(
      SmemLayoutAtomB{},
      make_shape(
          shape<1>(TileShape_MNK{}),
          shape<2>(TileShape_MNK{}),
          Int<PipelineStages>{})));

  using SmemLayoutAccum =
      decltype(make_layout(cute::select<0, 1>(TileShape_MNK{}), GenRowMajor{}));
  using SmemLayoutStageOutput =
      decltype(make_layout(cute::select<0, 1>(TileShape_MNK{}), GenRowMajor{}));
  using SmemLayoutOutput = decltype(tile_to_shape(
      SmemLayoutStageOutput{},
      make_shape(
          shape<0>(TileShape_MNK{}),
          shape<1>(TileShape_MNK{}),
          Int<PipelineStages>{})));

  using BlkScaledConfig = cutlass::detail::Xe4BlockScaledConfig<SFVecSize>;

  using SmemLayoutAtomSFA = decltype(BlkScaledConfig::deduce_smem_layoutSFA(
      TiledMma{}, TileShape_MNK{}));
  using SmemLayoutAtomSFB = decltype(BlkScaledConfig::deduce_smem_layoutSFB(
      TiledMma{}, TileShape_MNK{}));

  using SmemLayoutSFA = decltype(make_layout(
      append(shape(SmemLayoutAtomSFA{}), Int<PipelineStages>{}),
      append(stride(SmemLayoutAtomSFA{}),
             size(filter_zeros(SmemLayoutAtomSFA{})))));

  using SmemLayoutSFB = decltype(make_layout(
      append(shape(SmemLayoutAtomSFB{}), Int<PipelineStages>{}),
      append(stride(SmemLayoutAtomSFB{}),
             size(filter_zeros(SmemLayoutAtomSFB{})))));

  using TMACopyAtomA = cute::XE4_ADMA_LOAD;
  using TMACopyAtomB = cute::XE4_ADMA_LOAD;
  using TMACopyAtomSF = cute::XE4_ADMA_LOAD;
  using TMACopyAtomD = cute::XE4_ADMA_STORE;

  using CollectiveMainloop =
      cutlass::xe4_scaled_grouped_gemm::collective::XE4CollectiveMma<
          ProblemShape,
          TileShape,
          ElementA,
          ElementB,
          ElementAccumulator,
          ElementOutput,
          ElementScaleA,
          BlockScaleType,
          cutlass::gemm::TagToStrideA_t<LayoutA*>,
          cutlass::gemm::TagToStrideB_t<LayoutB*>,
          cutlass::gemm::TagToStrideA_t<LayoutSFA*>,
          cutlass::gemm::TagToStrideB_t<LayoutSFB*>,
          TiledMma,
          SmemLayoutA,
          SmemLayoutB,
          SmemLayoutAccum,
          SmemLayoutOutput,
          SmemLayoutSFA,
          SmemLayoutSFB,
          TMACopyAtomA,
          TMACopyAtomB,
          TMACopyAtomSF,
          TMACopyAtomSF,
          SFVecSize>;

  using CollectiveEpilogue =
      cutlass::xe4_scaled_grouped_gemm::collective::XE4CollectiveEpilogue<
          ProblemShape,
          TileShape,
          ElementOutput,
          cutlass::gemm::TagToStrideC_t<LayoutD*>,
          SmemLayoutOutput,
          TMACopyAtomD>;

  using TileScheduler =
      cutlass::xe4_scaled_grouped_gemm::kernel::PersistentTileSchedulerXe4Group;

  using GemmKernel = cutlass::xe4_scaled_grouped_gemm::kernel::XE4GemmUniversal<
      ProblemShape,
      CollectiveMainloop,
      CollectiveEpilogue,
      TileScheduler>;
};

// MXFP8: e4m3 A/B, ue8m0 scales, SFVecSize=32, BF16 output (per cutlass example).
class moe_mxfp8_policy : public moe_scaled_policy_base<
                            cutlass::float_e4m3_t,
                            cutlass::float_e4m3_t,
                            cutlass::float_ue8m0_t,
                            bf16,
                            /*SFVecSize=*/32,
                            /*TileK=*/256> {};

// NVFP4: e2m1 A/B, ue4m3 scales, SFVecSize=16, FP32 output.
class moe_nvfp4_policy : public moe_scaled_policy_base<
                            cutlass::float_e2m1_t,
                            cutlass::float_e2m1_t,
                            cutlass::float_ue4m3_t,
                            float,
                            /*SFVecSize=*/16,
                            /*TileK=*/128> {};

}  // namespace grouped_gemm
}  // namespace gpu::cutlass_kernel
