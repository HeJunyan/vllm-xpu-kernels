// SPDX-License-Identifier: Apache-2.0
#pragma once

#include <cstdint>

namespace gpu::cutlass_kernel::grouped_gemm::greedy {

enum class Kind { Empty, Tiny, Mid, Normal };
enum class Bucket {
  Tiny8,
  Tiny32,
  Tiny64,
  Tiny128,
  Normal32,
  Normal192,
  Normal256,
  Mid192,
  Mid256,
  Mid320
};

struct MidWindow {
  int min = 0;
  int max = 0;
  int hole_min = 0;
  int hole_max = 0;
};

constexpr Kind classify(int rows, MidWindow window) {
  if (rows <= 0) return Kind::Empty;
  if (rows <= 128) return Kind::Tiny;
  return rows >= window.min && rows < window.max &&
                 !(rows >= window.hole_min && rows < window.hole_max)
             ? Kind::Mid
             : Kind::Normal;
}

struct RowTile {
  Bucket bucket;
  int offset;
  int height;
};

struct Tail {
  int first;
  int second;
};

template <int Large, int Medium, int Small, int Floor>
constexpr int leftover(int rows) {
  if (rows <= Floor) return Floor;
  if (rows <= Small) return Small;
  if (rows <= Medium) return Medium;
  return Large;
}

// SYCL-TLA LOOK-2: keep the earlier large tiles and minimize padding in
// the final pair. On a coverage tie prefer the more balanced pair.
template <int Large, int Medium, int Small, int Floor>
constexpr Tail tail_plan(int remainder) {
  const int cover = Large + remainder;
  const Tail pairs[] = {
      {Small, Small},
      {Medium, Small},
      {Medium, Medium},
      {Large, Small},
      {Large, Medium},
      {Large, Large}};
  Tail best{Large, Large};
  for (auto pair : pairs) {
    const int sum = pair.first + pair.second;
    const int best_sum = best.first + best.second;
    if (sum >= cover && sum < best_sum) {
      best = pair;
    }
  }
  const int rest = leftover<Large, Medium, Small, Floor>(remainder);
  return Large + rest < best.first + best.second ? Tail{Large, rest} : best;
}

constexpr int row_tiles(Kind kind, int rows) {
  if (kind == Kind::Empty) return 0;
  if (kind == Kind::Tiny) return 1;
  const int peel = kind == Kind::Mid ? 320 : 256;
  return rows / peel + (rows % peel != 0);
}

constexpr RowTile row_tile(Kind kind, int rows, int index) {
  if (kind == Kind::Tiny) {
    if (rows <= 8) return {Bucket::Tiny8, 0, 8};
    if (rows <= 32) return {Bucket::Tiny32, 0, 32};
    if (rows <= 64) return {Bucket::Tiny64, 0, 64};
    return {Bucket::Tiny128, 0, 128};
  }
  const bool mid = kind == Kind::Mid;
  const int large = mid ? 320 : 256;
  const int full = rows / large;
  const int rem = rows % large;
  int height = large;
  int offset = index * large;
  if (full == 0) {
    height = mid ? leftover<320, 256, 192, 192>(rem)
                 : leftover<256, 192, 192, 32>(rem);
  } else if (rem != 0 && index >= full - 1) {
    const Tail tail = mid ? tail_plan<320, 256, 192, 192>(rem)
                          : tail_plan<256, 192, 192, 32>(rem);
    offset = (full - 1) * large;
    height = tail.first;
    if (index == full) {
      offset += tail.first;
      height = tail.second;
    }
  }
  if (mid) {
    return {
        height == 320   ? Bucket::Mid320
        : height == 256 ? Bucket::Mid256
                        : Bucket::Mid192,
        offset,
        height};
  }
  return {
      height == 256   ? Bucket::Normal256
      : height == 192 ? Bucket::Normal192
                      : Bucket::Normal32,
      offset,
      height};
}

constexpr int64_t padded_rows(int rows) {
  return (int64_t(rows) + 3) & ~int64_t(3);
}

struct Work {
  int expert;
  int rows;
  int n_tile;
  int64_t row_offset;
  int64_t scale_offset;
  RowTile tile;
  constexpr bool valid() const { return expert >= 0; }
};

// Counts remain on the device. Each persistent workgroup walks forward
// through experts once, carrying both packed-row and padded-scale prefixes.
template <int MidN, int NormalN = 512>
class Scheduler {
 public:
  constexpr Scheduler(
      const int* counts,
      int groups,
      int n,
      MidWindow window,
      int worker,
      int workers,
      bool uniform)
      : counts_(counts),
        groups_(groups),
        window_(window),
        worker_(worker),
        workers_(workers),
        uniform_(uniform),
        linear_(worker) {
    normal_n_tiles_ = (int64_t(n) + NormalN - 1) / NormalN;
    tiny_n_tiles_ = (int64_t(n) + 511) / 512;
    mid_n_tiles_ = (int64_t(n) + MidN - 1) / MidN;
    rows_ = counts_[0];
    if (uniform_) {
      expert_tiles_ = tiles(rows_);
      total_tiles_ = expert_tiles_ * groups_;
      if (expert_tiles_ > 0 && (expert_tiles_ & (expert_tiles_ - 1)) == 0) {
        divisor_shift_ = 0;
        for (int64_t q = expert_tiles_; q > 1; q >>= 1)
          ++divisor_shift_;
      }
    }
  }

  constexpr Work next() {
    int64_t local = linear_;
    if (uniform_) {
      const int64_t full_waves = total_tiles_ / workers_;
      const bool mirror = wave_ >= full_waves / 2 && wave_ < full_waves;
      const int source = mirror ? workers_ - 1 - worker_ : worker_;
      local = wave_++ * workers_ + source;
      if (local >= total_tiles_) return {-1, 0, 0, 0, 0, {}};
      expert_ =
          int(divisor_shift_ >= 0 ? local >> divisor_shift_
                                  : local / expert_tiles_);
      local -= int64_t(expert_) * expert_tiles_;
      row_offset_ = int64_t(expert_) * rows_;
      scale_offset_ = int64_t(expert_) * padded_rows(rows_);
    } else {
      while (expert_ < groups_) {
        const int64_t count = tiles(rows_);
        if (local < count) break;
        local -= count;
        row_offset_ += rows_;
        scale_offset_ += padded_rows(rows_);
        if (++expert_ < groups_) rows_ = counts_[expert_];
      }
      if (expert_ == groups_) return {-1, 0, 0, 0, 0, {}};
      linear_ = local + workers_;
    }
    const Kind kind = classify(rows_, window_);
    const int64_t n_tiles = columns(kind);
    return {
        expert_,
        rows_,
        int(local % n_tiles),
        row_offset_,
        scale_offset_,
        row_tile(kind, rows_, int(local / n_tiles))};
  }

 private:
  constexpr int64_t tiles(int rows) const {
    const Kind kind = classify(rows, window_);
    return int64_t(row_tiles(kind, rows)) * columns(kind);
  }

  constexpr int64_t columns(Kind kind) const {
    if (kind == Kind::Tiny) return tiny_n_tiles_;
    return kind == Kind::Mid ? mid_n_tiles_ : normal_n_tiles_;
  }

  const int* counts_;
  int groups_;
  MidWindow window_;
  int worker_, workers_;
  bool uniform_;
  int rows_ = 0, expert_ = 0, divisor_shift_ = -1;
  int64_t linear_, wave_ = 0;
  int64_t normal_n_tiles_, mid_n_tiles_, tiny_n_tiles_;
  int64_t expert_tiles_ = 0, total_tiles_ = 0;
  int64_t row_offset_ = 0, scale_offset_ = 0;
};

}  // namespace gpu::cutlass_kernel::grouped_gemm::greedy
