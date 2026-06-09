#pragma once

#include "cutlass/fast_math.h"
#include "cutlass/gemm_coord.hpp"
#include "cutlass/kernel_hardware_info.hpp"
#include "cutlass/gemm/kernel/tile_scheduler_params.h"
#include "cute/layout.hpp"
#include "cute/tensor.hpp"
#include "moe_tile_scheduler_params.h"

using namespace cutlass::gemm;
using namespace cutlass::gemm::kernel;
using namespace cutlass::gemm::kernel::detail;

namespace cutlass::xe4_scaled_grouped_gemm::kernel {

// Same persistent scheduler as bf16 grouped GEMM, but with a SLM counter
// used by the kernel's async fetch_next path. No per-group problem-shape
// device array — instead reads `rows_per_expert_[group_idx]` directly.
class PersistentTileSchedulerXe4Group {

private:
  uint64_t current_work_linear_idx_ = 0;
  uint64_t total_grid_size_ = 0;
  int64_t N_ = 0;
  int64_t K_ = 0;
  int64_t num_experts_ = 0;
  const int* rows_per_expert_ = nullptr;

  struct GroupInfo {
    int group_idx = 0;
    uint64_t start_linear_idx = 0;
    uint64_t total_tiles = 0;
  } current_group_info_;

public:
  void update_from_shared_counter(uint32_t global_idx, uint32_t local_idx) {
    uint64_t new_val = total_grid_size_ + global_idx - local_idx;
    current_work_linear_idx_ = new_val;
  }

  struct WorkTileInfo {
    int32_t M_idx = 0;
    int32_t N_idx = 0;
    int32_t L_idx = 0;
    bool is_valid_tile = false;

    CUTLASS_HOST_DEVICE
    bool is_valid() const { return is_valid_tile; }

    CUTLASS_HOST_DEVICE
    static WorkTileInfo invalid_work_tile() { return {-1, -1, -1, false}; }
  };

  // SLM-resident counters used by the kernel's async fetch_next path.
  static constexpr size_t SmemAlignment = 512;
  struct CounterStorage : cute::aligned_struct<SmemAlignment, _0> {
    cute::array_aligned<int32_t, sizeof(int32_t), SmemAlignment> smem_counter;
  };

  using GroupParams = PersistentTileSchedulerMoEParams;
  using RasterOrder = typename GroupParams::RasterOrder;
  using RasterOrderOptions = typename GroupParams::RasterOrderOptions;

  struct Arguments {
    int max_swizzle_size = 1;
    RasterOrderOptions raster_order = RasterOrderOptions::AlongM;
    uint64_t* global_task_counter = nullptr;
  };

  struct Params {
    GroupParams group_params;
    uint64_t* global_task_counter_ = nullptr;
  };

  Params scheduler_params;

  template <class TileShape, class ClusterShape>
  static Params to_underlying_arguments(
      TileShape tile_shape,
      ClusterShape cluster_shape,
      KernelHardwareInfo const& hw_info,
      Arguments const& arguments) {
    static_assert(cute::is_static<TileShape>::value);
    static_assert(cute::is_static<ClusterShape>::value);

    dim3 problem_blocks =
        get_tiled_cta_shape_mnl(hw_info, tile_shape, cluster_shape);

    Params params;
    params.group_params.initialize(
        problem_blocks,
        to_gemm_coord(tile_shape),
        to_gemm_coord(cluster_shape),
        hw_info,
        arguments.max_swizzle_size,
        arguments.raster_order);

    params.global_task_counter_ = arguments.global_task_counter;
    return params;
  }

  template <class TileShape, class ClusterShape>
  CUTLASS_HOST_DEVICE static dim3 get_grid_shape(
      Params const& params,
      TileShape tile_shape,
      ClusterShape cluster_shape,
      KernelHardwareInfo hw_info,
      Arguments arguments,
      bool truncate_by_problem_size = true) {
    dim3 problem_blocks =
        get_tiled_cta_shape_mnl(hw_info, tile_shape, cluster_shape);

    return GroupParams::get_grid_shape(
        problem_blocks,
        to_gemm_coord(cluster_shape),
        hw_info,
        arguments.max_swizzle_size,
        arguments.raster_order,
        true);
  }

  template <class BlockShape, class ClusterShape>
  CUTLASS_HOST_DEVICE static dim3 get_tiled_cta_shape_mnl(
      KernelHardwareInfo hw_info,
      BlockShape cta_shape,
      ClusterShape cluster_shape) {
    uint32_t total_ctas = hw_info.sm_count;
    uint32_t cta_in_N_dim = 1;
    return GroupParams::get_tiled_cta_shape_mnl(
        to_gemm_coord(cluster_shape), total_ctas, cta_in_N_dim);
  }

  PersistentTileSchedulerXe4Group() = default;

  CUTLASS_DEVICE explicit PersistentTileSchedulerXe4Group(
      Params const& params_,
      const int* rows_per_expert,
      int64_t N,
      int64_t K,
      int64_t num_experts)
      : scheduler_params(params_) {
    if (scheduler_params.group_params.raster_order_ == RasterOrder::AlongN) {
      current_work_linear_idx_ =
          uint64_t(BlockIdxX()) + uint64_t(BlockIdxY()) * uint64_t(GridDimX());
    } else {
      current_work_linear_idx_ =
          uint64_t(BlockIdxX()) * uint64_t(GridDimY()) + uint64_t(BlockIdxY());
    }

    total_grid_size_ =
        uint64_t(GridDimX()) * uint64_t(GridDimY()) * uint64_t(GridDimZ());

    N_ = N;
    K_ = K;
    num_experts_ = num_experts;
    rows_per_expert_ = rows_per_expert;
  }

  CUTLASS_DEVICE
  WorkTileInfo get_current_work() {
    return get_current_work_for_linear_idx(current_work_linear_idx_);
  }

  CUTLASS_DEVICE
  WorkTileInfo get_current_work_for_linear_idx(uint64_t linear_idx) {
    if (scheduler_params.group_params.pre_processed_problem_shapes &&
        linear_idx >= scheduler_params.group_params.blocks_across_problem_) {
      return WorkTileInfo::invalid_work_tile();
    }

    return get_work_idx_m_and_n(
        linear_idx,
        current_group_info_,
        scheduler_params.group_params.cta_shape_,
        scheduler_params.group_params.cluster_shape_,
        scheduler_params.group_params.divmod_cluster_shape_major_,
        scheduler_params.group_params.divmod_cluster_shape_minor_,
        scheduler_params.group_params.divmod_cta_shape_m_,
        scheduler_params.group_params.divmod_cta_shape_n_,
        scheduler_params.group_params.log_swizzle_size_,
        scheduler_params.group_params.raster_order_);
  }

  CUTLASS_DEVICE
  WorkTileInfo get_work_idx_m_and_n(
      uint64_t linear_idx,
      struct GroupInfo& group_info,
      GemmCoord cta_shape,
      GemmCoord cluster_shape,
      FastDivmodU64Pow2 const& divmod_cluster_shape_major,
      FastDivmodU64Pow2 const& divmod_cluster_shape_minor,
      FastDivmodU64 const& divmod_cta_shape_m,
      FastDivmodU64 const& divmod_cta_shape_n,
      int32_t log_swizzle_size,
      RasterOrder raster_order) {
    bool valid_tile = true;
    uint64_t ctas_along_m, ctas_along_n;
    int total_problem_groups = num_experts_;
    int64_t M_ = rows_per_expert_[group_info.group_idx];

    ctas_along_m =
        divmod_cta_shape_m.divide(M_ + divmod_cta_shape_m.divisor - 1);
    ctas_along_n =
        divmod_cta_shape_n.divide(N_ + divmod_cta_shape_n.divisor - 1);

    auto problem_blocks_m =
        round_up(ctas_along_m, (1 << log_swizzle_size) * cluster_shape.m());
    auto problem_blocks_n =
        round_up(ctas_along_n, (1 << log_swizzle_size) * cluster_shape.n());
    group_info.total_tiles = problem_blocks_m * problem_blocks_n;

    while (group_info.start_linear_idx + group_info.total_tiles <= linear_idx) {
      group_info.group_idx++;

      if (group_info.group_idx >= total_problem_groups)
        return WorkTileInfo::invalid_work_tile();

      group_info.start_linear_idx += group_info.total_tiles;

      M_ = rows_per_expert_[group_info.group_idx];
      ctas_along_m =
          divmod_cta_shape_m.divide(M_ + divmod_cta_shape_m.divisor - 1);
      ctas_along_n =
          divmod_cta_shape_n.divide(N_ + divmod_cta_shape_n.divisor - 1);

      problem_blocks_m =
          round_up(ctas_along_m, (1 << log_swizzle_size) * cluster_shape.m());
      problem_blocks_n =
          round_up(ctas_along_n, (1 << log_swizzle_size) * cluster_shape.n());
      group_info.total_tiles = problem_blocks_m * problem_blocks_n;
    }

    uint64_t cluster_id, cluster_major_offset = 0, cluster_minor_offset = 0;
    uint64_t blk_per_grid_dim = divmod_cluster_shape_minor.divide(
        linear_idx - group_info.start_linear_idx);
    divmod_cluster_shape_major(
        cluster_id, cluster_major_offset, blk_per_grid_dim);

    if (raster_order == RasterOrder::AlongN) {
      cluster_minor_offset = BlockIdxX();
    } else {
      cluster_minor_offset = BlockIdxY();
    }

    uint64_t cluster_idx_minor, cluster_idx_major;
    uint64_t cluster_idx_minor_div_swizzle, extra, offset;

    offset = cluster_id & ((1 << log_swizzle_size) - 1);
    extra = cluster_id >> log_swizzle_size;

    uint64_t curr_group_cluster_blk_major;
    if (raster_order == RasterOrder::AlongN) {
      curr_group_cluster_blk_major =
          divmod_cluster_shape_major.divide(problem_blocks_n);
    } else {
      curr_group_cluster_blk_major =
          divmod_cluster_shape_major.divide(problem_blocks_m);
    }
    cluster_idx_minor_div_swizzle = extra / curr_group_cluster_blk_major;
    cluster_idx_major = extra % curr_group_cluster_blk_major;

    cluster_idx_minor =
        cluster_idx_minor_div_swizzle * (1 << log_swizzle_size) + offset;

    auto minor_work_idx = static_cast<int32_t>(
        cluster_idx_minor * divmod_cluster_shape_minor.divisor +
        cluster_minor_offset);
    auto major_work_idx = static_cast<int32_t>(
        cluster_idx_major * divmod_cluster_shape_major.divisor +
        cluster_major_offset);

    if (raster_order == RasterOrder::AlongN) {
      return {minor_work_idx, major_work_idx, group_info.group_idx, valid_tile};
    } else {
      return {major_work_idx, minor_work_idx, group_info.group_idx, valid_tile};
    }
  }

  CUTLASS_DEVICE
  WorkTileInfo fetch_next_work() {
    auto next_work = get_current_work();
    return next_work;
  }

  template <class ClusterShape>
  CUTLASS_DEVICE WorkTileInfo initial_work_tile_info(ClusterShape) {
    return get_current_work();
  }
};
}  // namespace cutlass::xe4_scaled_grouped_gemm::kernel
