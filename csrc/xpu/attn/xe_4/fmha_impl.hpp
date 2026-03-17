#pragma once

#include <vector>
#include <cute/arch/mma_xe4.hpp>
#include "cutlass/gemm/device/gemm_universal_adapter.h"
#include "cutlass/util/command_line.h"
#include "cutlass/util/reference/host/gemm_complex.h"
#include "cutlass/util/reference/device/gemm_complex.h"
#include "cutlass/util/reference/host/tensor_fill.h"
#include "cute/util/compat.hpp"
#include "csrc/xpu/attn/xe_4/kernel/xe4_tile_scheduler.hpp"
#include "csrc/xpu/attn/xe_4/kernel/xe4_fmha_fwd_kernel.hpp"
#include "csrc/xpu/attn/xe_4/collective/xe4_fmha_fwd_epilogue.hpp"
#include "csrc/xpu/attn/xe_4/collective/xe4_fmha_fwd_softmax_epilogue.hpp"

using namespace cute;

struct fmha_xe4_args_t {
  void* query;
  void* key;
  void* value;
  void* out;
  void* block_table;
  void* cu_seqlens_q;
  void* cu_seqlens_k;
  int max_queries;
  int max_keys;
  int total_seqlen_q;
  int total_seqlen_k;
  float sm_scale;
  void* sm_sink;
  int batch_size;
  int num_heads_q;
  int num_heads_k;
  int head_size;
  int max_blocks_per_seq;
  int block_size;
  int window_size_left = -1;
  int window_size_right = -1;
  bool is_varlen = false;
  bool is_paged = false;
  bool is_causal = false;
  bool is_local = false;
  bool is_sink = false;
};

class FlashAttentionKernel;

using LayoutQ = cutlass::layout::RowMajor;
using LayoutK = cutlass::layout::ColumnMajor;
using LayoutV = cutlass::layout::RowMajor;
using LayoutO = cutlass::layout::RowMajor;

template <class GemmKernel, bool isVarLen>
struct KernelLauncher {
  using ElementQ = typename GemmKernel::ElementQ;
  using ElementK = typename GemmKernel::ElementK;
  using ElementV = typename GemmKernel::ElementV;
  using ElementAccum = typename GemmKernel::ElementAccum;
  using ElementO = typename GemmKernel::ElementOutput;

  using StrideQ = typename GemmKernel::StrideQ;
  using StrideK = typename GemmKernel::StrideK;
  using StrideV = typename GemmKernel::StrideV;
  using StrideO = typename GemmKernel::StrideO;

  using ProblemShapeType = cutlass::flash_attention::kernel::FMHAProblemShape<isVarLen>;
  using ProblemShapeTypeInit = cutlass::flash_attention::kernel::FMHAProblemShape<false>;
  // using ProblemShapeType = typename GemmKernel::ProblemShape;

  /// Initialization
  StrideQ stride_Q;
  StrideK stride_K;
  StrideV stride_V;
  StrideO stride_O;

  ProblemShapeType initialize(const fmha_xe4_args_t& args) {
    ProblemShapeType shape;
    ProblemShapeTypeInit shape_init;
    auto batch = shape.batch = shape_init.batch = args.batch_size;
    auto num_heads_q = shape.num_heads = shape_init.num_heads =
        args.num_heads_q;
    auto num_heads_kv = shape.num_heads = shape_init.num_heads =
        args.num_heads_k;
    auto head_size_qk = shape.head_size_qk = shape_init.head_size_qk =
        args.head_size;
    auto head_size_vo = shape.head_size_vo = shape_init.head_size_vo =
        args.head_size;
    // auto problem_shape = cute::make_tuple(args.batch_size, args.num_heads_q, args.max_queries, args.max_keys, args.head_size, args.head_size);
    // auto [batch, num_heads, seq_len_qo, seq_len_kv, head_size_qk, head_size_vo] = problem_shape;

    if constexpr (isVarLen) {
      batch = shape_init.batch = 1;
      shape_init.seq_len_qo = args.total_seqlen_q;
      shape_init.seq_len_kv = args.total_seqlen_k;

      shape.seq_len_qo =
          cutlass::flash_attention::collective::VariableLength{args.max_queries};
      shape.seq_len_qo.cumulative_length =
          reinterpret_cast<int*>(args.cu_seqlens_q);
      shape.seq_len_kv =
          cutlass::flash_attention::collective::VariableLength{args.max_keys};
      shape.seq_len_kv.cumulative_length =
          reinterpret_cast<int*>(args.cu_seqlens_k);
    } else {
      shape.seq_len_qo = shape_init.seq_len_qo = args.max_queries;
      shape.seq_len_kv = shape_init.seq_len_kv = args.max_keys;
    }

    auto seq_len_qo = shape_init.seq_len_qo;
    auto seq_len_kv = shape_init.seq_len_kv;

    return shape;
  }

  void run(sycl::queue& queue, typename GemmKernel::Params params,
                  const fmha_xe4_args_t& args) {
    dim3 const block = GemmKernel::get_block_shape();
    dim3 const grid = GemmKernel::get_grid_shape(params);

    const auto sycl_block = compat::dim3(block.x, block.y, block.z);
    const auto sycl_grid = compat::dim3(grid.x, grid.y, grid.z);

    GemmKernel kernel;

    auto* q_ptr = static_cast<const ElementQ*>(args.query);
    auto* k_ptr = static_cast<const ElementK*>(args.key);
    auto* v_ptr = static_cast<const ElementV*>(args.value);
    auto* o_ptr = static_cast<const ElementO*>(args.out);

    queue.parallel_for<GemmKernel>(sycl::nd_range<3>{sycl_grid * sycl_block, sycl_block},
      [=](sycl::nd_item<3> item) {

        auto params_workaround = params;

        kernel(params_workaround);
      }).wait();
  }

  cutlass::Status run(sycl::queue& queue,
      const fmha_xe4_args_t& args) {
    ProblemShapeType shape = initialize(args);

    auto* q_ptr = static_cast<const ElementQ*>(args.query);
    auto* k_ptr = static_cast<const ElementK*>(args.key);
    auto* v_ptr = static_cast<const ElementV*>(args.value);
    auto* o_ptr = static_cast<const ElementO*>(args.out);

    typename GemmKernel::Arguments arguments{
      shape,
      {q_ptr, k_ptr, v_ptr,
       static_cast<int*>(args.block_table),
       args.block_size,
       args.max_blocks_per_seq,
       args.total_seqlen_k},
      {args.sm_scale},
      {o_ptr}
    };

    auto params = GemmKernel::to_underlying_arguments(arguments);

    run(queue, params, args);

    queue.wait();

    return cutlass::Status::kSuccess;
  }
};

template <typename TileShape, 
          int NumSoftmaxWarps = 16, int NumThreadPerRow = 16, 
          int SoftmaxUnroll = 2, int SoftmaxNumStage = 2, 
          bool IsPersistent = false> 
struct FMHAConfig {

  template <typename ProblemConfig>
  static int run(sycl::queue& queue, const fmha_xe4_args_t &args) {
    constexpr bool VarLen = true;
    constexpr bool Paged = true;
    using ProblemShape = cutlass::flash_attention::kernel::FMHAProblemShape<VarLen>;
    // using ProblemShape = cute::tuple<int, int, int, int, int, int>;
    using ClusterShape = Shape<_1, _1, _1>;

    using TileShapeQK_MNK = decltype(select<0, 2, 3>(TileShape{}));
    using TileShapePV_MNK = decltype(select<0, 1, 2>(TileShape{}));

    using ElementInputQ = typename ProblemConfig::ElementInputQ;       // dtype of Q
    using ElementInputKV = typename ProblemConfig::ElementInputKV;      // dtype of K and V
    using ElementS = typename ProblemConfig::ElementS;                // dtype of S
    using ElementP = typename ProblemConfig::ElementP;                // dtype of P
    using ElementAccumulator = typename ProblemConfig::ElementAccumulator; // dtype of QK accum and PV accum
    using ElementOutput = typename ProblemConfig::ElementOutput;      // dtype of output

    constexpr auto majorQ = cute::AMMA::Major::K;
    constexpr auto majorK = cute::AMMA::Major::K;
    constexpr auto majorP = cute::AMMA::Major::K;
    constexpr auto majorV = cute::AMMA::Major::MN;

    constexpr int PipelineStages = 2;
    constexpr int PipelineStagesQ = 2;

    using SmemLayoutAtomQ = decltype(make_layout(
      cute::select<0, 2>(TileShapeQK_MNK{}), GenRowMajor{}));

    using SmemLayoutQ = decltype(tile_to_shape(
      SmemLayoutAtomQ{},
      make_shape(shape<0>(TileShapeQK_MNK{}),
                 shape<2>(TileShapeQK_MNK{}),
                 Int<PipelineStagesQ>{})));

    using SmemLayoutAtomK = decltype(make_layout(
      cute::select<1, 2>(TileShapeQK_MNK{}), GenRowMajor{}));

    using SmemLayoutK = decltype(tile_to_shape(
      SmemLayoutAtomK{},
      make_shape(shape<1>(TileShapeQK_MNK{}),
                 shape<2>(TileShapeQK_MNK{}),
                 Int<PipelineStages>{})));

    using SmemLayoutAtomV = decltype(make_layout(
      cute::select<1, 2>(TileShapePV_MNK{}), GenColMajor{}));
 
    using SmemLayoutV = decltype(tile_to_shape(
      SmemLayoutAtomV{},
      make_shape(shape<1>(TileShapePV_MNK{}), 
                 shape<2>(TileShapePV_MNK{}), 
                 Int<PipelineStages>{})));

    using SmemLayoutOutputAccum = decltype(make_layout(
      cute::select<0, 1>(TileShapePV_MNK{}), GenRowMajor{}));

    using SmemLayoutOutput = decltype(make_layout(
      cute::select<0, 1>(TileShapePV_MNK{}), GenRowMajor{}));

    using TMACopyAtomQ = cute::xe4::ASYNC_TENSOR_LOAD<slm_matrix_type::type1, size<2>(TileShapeQK_MNK{})>;
    using TMACopyAtomK = cute::xe4::ASYNC_TENSOR_LOAD<slm_matrix_type::type1, size<2>(TileShapeQK_MNK{})>;
    using TMACopyAtomV = cute::xe4::ASYNC_TENSOR_LOAD<slm_matrix_type::type1, size<1>(TileShapePV_MNK{})>;
    using TMACopyAtomO = cute::xe4::ASYNC_TENSOR_STORE<slm_matrix_type::type1, size<1>(TileShapePV_MNK{})>;

    using TiledMmaQK = decltype(cute::make_tiled_mma(
      cute::AMMA::ss_op_selector<
      ElementS /*D dtype*/,
      ElementInputQ /*A dtype*/,
      ElementInputKV /*B dtype*/,
      ElementS /*C dtype*/,
      TileShapeQK_MNK,
      ClusterShape,
      majorQ,
      majorK>()));

    // As we will accumulate O for num kv tile times, to ensure the accuracy, we
    // use ElementAccumulator dtype for PV mma C/D tensors.
    using TiledMmaPV = decltype(cute::make_tiled_mma(
      cute::AMMA::ss_op_selector<
      ElementAccumulator /*D dtype*/,
      ElementInputKV /*A dtype*/,
      ElementInputKV /*B dtype*/,
      ElementAccumulator /*C dtype*/,
      TileShapePV_MNK,
      ClusterShape,
      majorP,
      majorV>()));

    using CollectiveMainloop = cutlass::flash_attention::collective::CollectiveMmaAttention<
      ProblemShape, TileShape,
      ElementInputQ, ElementInputKV, ElementInputKV,
      ElementS, ElementP,
      ElementAccumulator, ElementOutput,
      cutlass::gemm::TagToStrideA_t<LayoutQ>,
      cutlass::gemm::TagToStrideB_t<LayoutK>,
      cutlass::gemm::TagToStrideB_t<LayoutV>,
      TiledMmaQK, TiledMmaPV,
      SmemLayoutQ, SmemLayoutK, SmemLayoutV,
      SmemLayoutOutputAccum, SmemLayoutOutput,
      TMACopyAtomQ, TMACopyAtomK, TMACopyAtomV,
      PipelineStages, PipelineStagesQ, Paged>;

    using CollectiveSoftmaxEpilogue = cutlass::flash_attention::collective::CollectiveSoftmaxEpilogue<
      TileShape,
      ElementAccumulator,
      ElementOutput,
      ElementS,
      ElementP,
      NumSoftmaxWarps,
      NumThreadPerRow,
      SoftmaxUnroll,
      SoftmaxNumStage>;

    using CollectiveEpilogue = cutlass::flash_attention::collective::CollectiveEpilogueAttention<
      ProblemShape, TileShape,
      ElementOutput,
      cutlass::gemm::TagToStrideC_t<LayoutO>,
      SmemLayoutOutput,
      TMACopyAtomO>;


    using TileScheduler = typename std::conditional<
      IsPersistent, 
      cutlass::flash_attention::kernel::XeFlashPersistentTileScheduler,
      cutlass::flash_attention::kernel::XeFlashIndividualTileScheduler>::type;

    using GemmKernel = cutlass::flash_attention::kernel::GemmUniversalAttention<
      ProblemShape, 
      CollectiveMainloop,
      CollectiveSoftmaxEpilogue,
      CollectiveEpilogue, 
      TileScheduler>;
    
    /* launch kernel */
    KernelLauncher<GemmKernel, VarLen> launcher;
    launcher.run(queue, args);
    
    return 0;    
  }

};

struct ProblemConfig_bf16 {
    using ElementInputQ = bf16;       // dtype of Q
    using ElementInputKV = bf16;      // dtype of K and V
    using ElementS = bf16;           // dtype of S
    using ElementP = ElementInputKV;           // dtype of P
    using ElementAccumulator = float; // dtype of accum
    using ElementOutput = bf16;      // dtype of output
};

struct ProblemConfig_fp16 {
    using ElementInputQ = fp16;       // dtype of Q
    using ElementInputKV = fp16;      // dtype of K and V
    using ElementS = fp16;           // dtype of S
    using ElementP = ElementInputKV;           // dtype of P
    using ElementAccumulator = float; // dtype of accum
    using ElementOutput = fp16;      // dtype of output
};

void fmha_xe4_impl(
    sycl::queue& queue,
    const at::Tensor& query,      // [seq_q, heads, head_size]
    const at::Tensor& key_cache,  // [num_block, block_size, heads, head_size]
    const at::Tensor& value_cache,
    at::Tensor& out,
    const at::Tensor& block_table,
    const at::Tensor& cu_seqlens_q,
    const at::Tensor& cu_seqlens_k,
    int max_seqlen_q,
    int max_seqlen_k,
    double sm_scale,
    std::optional<const at::Tensor>& sm_sink_,
    int window_size_left,
    int window_size_right,
    bool is_varlen,
    bool is_paged,
    bool is_causal,
    bool is_local,
    bool is_sink) {
  // general params
  int batch_size, num_heads_q, num_heads_kv, head_size;
  // additional params
  int total_seqlen_q, total_seqlen_k;
  int num_blocks, block_size, max_blocks_per_seq;
  if (is_varlen) {
    // query: [total_seq, num_heads, head_size]
    batch_size = cu_seqlens_q.numel() - 1;
    num_heads_q = query.size(1);
    num_heads_kv = key_cache.size(1);
    head_size = query.size(2);
    total_seqlen_q = query.size(0);
    total_seqlen_k = key_cache.size(0);
  } else {
    // query: [batch, num_heads, seq, head_size]
    batch_size = query.size(0);
    num_heads_q = query.size(1);
    num_heads_kv = key_cache.size(1);
    head_size = query.size(3);
    max_seqlen_q = query.size(2);
    max_seqlen_k = key_cache.size(2);
  }
  if (is_paged) {
    num_blocks = key_cache.size(0);
    block_size = key_cache.size(1);
    num_heads_kv = key_cache.size(2);
    max_blocks_per_seq = block_table.size(1);
    total_seqlen_k = num_blocks * block_size;
  }

  if (is_local) {
    window_size_left = window_size_left == -1 ? max_seqlen_k : window_size_left;
    window_size_right =
        window_size_right == -1 ? max_seqlen_k : window_size_right;
    if (is_causal) {
      window_size_right = 0;
      is_causal = false;
    }
  }

  fmha_xe4_args_t args = {
      query.data_ptr(),
      key_cache.data_ptr(),
      value_cache.data_ptr(),
      out.data_ptr(),
      is_paged ? block_table.data_ptr() : nullptr,
      cu_seqlens_q.data_ptr(),
      cu_seqlens_k.data_ptr(),
      max_seqlen_q,
      max_seqlen_k,
      total_seqlen_q,
      total_seqlen_k,
      static_cast<float>(sm_scale),
      is_sink ? sm_sink_.value().data_ptr() : nullptr,
      batch_size,
      num_heads_q,
      num_heads_kv,
      head_size,
      max_blocks_per_seq,
      block_size,
      window_size_left,
      window_size_right,
      is_varlen,  // varlen
      is_paged,   // paged
      is_causal,
      is_local,
      is_sink};

  if (query.scalar_type() == at::kBFloat16) {
    FMHAConfig<Shape<_128, _128, _512, _128>, 16, 16, 2, 2, false>::run<ProblemConfig_bf16>(queue, args);
  } else if (query.scalar_type() == at::kHalf) {
    FMHAConfig<Shape<_128, _128, _512, _128>, 16, 16, 2, 2, false>::run<ProblemConfig_fp16>(queue, args);
  } else {
    throw std::runtime_error("Unsupported data type");
  }
}