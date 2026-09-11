// SPDX-License-Identifier: Apache-2.0
#pragma once

#include "../greedy_dispatch.hpp"
#include <c10/util/Exception.h>
#include "moe_dtype_policy.hpp"
#include "moe_greedy_plan.hpp"
#include "moe_greedy_scale_copy.hpp"

namespace gpu::cutlass_kernel::grouped_gemm {

enum class GreedyStore { Native, CheckAlignment, Aligned };

template <GreedyDtype>
struct GreedyTraits;

template <class Policy, int TileK_, int MinK_, int MidMax_>
struct GreedyFamily {
  using Base = Policy;
  static constexpr int TileK = TileK_, MinK = MinK_, MidMax = MidMax_;
  static constexpr int NormalN = 512, MidN = 256;
  static constexpr bool AllowMid384 = true, SplitTinyM = false;
};

template <GreedyDtype Dtype, int M, int N, int K, bool Tiny>
struct GreedyTilePolicy {
  using Base = typename GreedyTraits<Dtype>::Base;
  static constexpr bool MX = Dtype == GreedyDtype::MXFP8 ||
                             Dtype == GreedyDtype::MXFP4 ||
                             Dtype == GreedyDtype::W4A8;
  static constexpr int SGM =
      Tiny ? ((N < 512 || (GreedyTraits<Dtype>::SplitTinyM && M >= 32)) ? 2 : 1)
           : 4;
  static constexpr int SGN = 32 / SGM;
  // W4A8 uses BF16 BDPAS: the pinned inner-K scale indexing only covers
  // one 32-element scale block per tile when MMA_K is 16.
  static_assert(Dtype != GreedyDtype::W4A8 || K == 32);
  static_assert(Dtype != GreedyDtype::FP8Block || 128 % K == 0);
  static_assert(
      Dtype != GreedyDtype::FP8Block || 128 % (N / SGN) == 0,
      "A block-FP8 subgroup must not cross a B-scale block");
  using TileShape = Shape<Int<M>, Int<N>, Int<K>>;
  using SGLayout =
      Layout<Shape<Int<SGM>, Int<SGN>, _1>, Stride<Int<SGN>, _1, _0>>;
  using TiledMma = typename TiledMMAHelper<
      typename Base::TiledMma::Atom,
      Layout<TileShape>,
      SGLayout>::TiledMMA;
  using ScaleCopyA =
      MoEGreedyScaleLoad<(K + 31) / 32, (M / SGM <= 32 ? 32 : 64)>;
  // Keep W4A8 weight scales in a full GRF for both N16 MMA steps.
  using ScaleCopyB = MoEGreedyScaleLoad<
      (K + 31) / 32,
      (Dtype == GreedyDtype::W4A8 || N / SGN > 32 ? 64 : 32)>;
  using Gemm = typename GenerateGemm<
      typename Base::ElementA,
      typename Base::ElementScaleA,
      typename Base::ElementB,
      typename Base::ElementScaleB,
      typename Base::ElementAccumulator,
      typename Base::ElementOutput,
      typename Base::LayoutA,
      typename Base::LayoutB,
      typename Base::LayoutC,
      typename Base::LayoutD,
      typename Base::StrideScale,
      TiledMma,
      TileShape,
      typename Base::GEMMDispatchPolicy,
      typename Base::EpilogueDispatchPolicy,
      typename Base::EpilogueOp,
      typename Base::GmemTiledCopyA,
      std::conditional_t<MX, ScaleCopyA, typename Base::GmemTiledCopyScaleA>,
      typename Base::GmemTiledCopyB,
      std::conditional_t<MX, ScaleCopyB, typename Base::GmemTiledCopyScaleB>,
      Base::NeedScale>::Gemm;
  using Mainloop = typename Gemm::CollectiveMainloop;
  using Epilogue = typename Gemm::CollectiveEpilogue;
  static_assert(
      size(TiledMma{}) == 512,
      "All greedy buckets must use the same physical workgroup");
};

template <class Policy, GreedyStore Direct>
CUTLASS_DEVICE void greedy_tile(
    GreedyArguments const& args,
    greedy::Work const& work,
    int thread,
    char* shared) {
  using Base = typename Policy::Base;
  using Mainloop = typename Policy::Mainloop;
  using Epilogue = typename Policy::Epilogue;
  using TileShape = typename Policy::TileShape;
  using TiledMma = typename Policy::TiledMma;
  const int m = work.rows - work.tile.offset;
  const int64_t row = work.row_offset + work.tile.offset;
  const auto problem = make_shape(m, args.n, args.k, 1);
  typename Mainloop::Arguments input{};
  input.ptr_A = static_cast<typename Base::ElementA const*>(args.a);
  input.ptr_B = static_cast<typename Base::ElementB const*>(args.b);
  if constexpr (Base::NeedScale) {
    input.ptr_SA = static_cast<typename Base::ElementScaleA const*>(args.sa);
    input.ptr_SB = static_cast<typename Base::ElementScaleB const*>(args.sb);
    input.group_size = Base::BlockSize;
  }
  auto base_args = Mainloop::to_base_arguments(
      input, work.expert, problem, row, work.scale_offset);
  if constexpr (Policy::MX) {
    // A segment moves the scale origin, not the original expert's pitch.
    base_args.ptr_SA += work.tile.offset;
    get<1>(base_args.dSA) = greedy::padded_rows(work.rows);
    get<2>(base_args.dSA) =
        greedy::padded_rows(work.rows) * ((int64_t(args.k) + 31) / 32);
  }
  auto mainloop =
      Mainloop::Base::to_underlying_arguments(problem, base_args, nullptr);

  if constexpr (Direct != GreedyStore::Native) {
    // Retain the tuned MXFP8 application mainloop for aligned, bias-free
    // tiles. Padded4 expert bases that are not 64-byte aligned use the
    // native collective's safe scale copies below.
    if (Direct == GreedyStore::Aligned ||
        ((reinterpret_cast<uintptr_t>(base_args.ptr_SA) & 63) == 0 &&
         (reinterpret_cast<uintptr_t>(base_args.ptr_SB) & 63) == 0)) {
      auto input_view = [](auto const& tensor) {
        using Element = cute::remove_const_t<
            typename cute::remove_cvref_t<decltype(tensor)>::element_type>;
        return make_tensor(
            make_gmem_ptr(
                const_cast<Element*>(raw_pointer_cast(tensor.data()))),
            tensor.layout());
      };
      auto d = make_tensor(
          make_gmem_ptr(
              static_cast<typename Base::ElementOutput*>(args.d) +
              row * args.n),
          make_shape(m, args.n),
          make_stride(args.n, _1{}));
      MoE::moe_gemm_scaled_greedy<1, 32, void, void, void>(
          input_view(mainloop.mA_mkl(_, _, 0)),
          input_view(mainloop.mB_nkl(_, _, 0)),
          input_view(mainloop.mAscale),
          input_view(mainloop.mBscale),
          d,
          make_coord(0, work.n_tile, _, 0),
          TiledMma{},
          1,
          32);
      return;
    }
  }

  if constexpr (Direct != GreedyStore::Aligned) {
    auto a = cute::get_xe_tensor(make_shape(m, args.k, 1));
    auto b = cute::get_xe_tensor(make_shape(args.n, args.k, 1));
    auto ga = local_tile(a, select<0, 2>(TileShape{}), make_coord(0, _, 0));
    auto gb =
        local_tile(b, select<1, 2>(TileShape{}), make_coord(work.n_tile, _, 0));
    auto accum = partition_fragment_C(TiledMma{}, take<0, 2>(TileShape{}));
    auto k_iter = cute::make_coord_iterator(
        idx2crd(0, make_shape(args.k)), make_shape(args.k));
    const auto coord = make_coord(0, work.n_tile, _, 0);
    Mainloop{}(
        accum,
        ga,
        gb,
        accum,
        k_iter,
        cute::ceil_div(args.k, size<2>(TileShape{})),
        coord,
        args.k,
        thread,
        mainloop);

    typename Epilogue::Arguments output{};
    output.ptr_C = Direct == GreedyStore::Native ? args.bias : nullptr;
    output.ptr_D = static_cast<typename Base::ElementOutput*>(args.d);
    output.thread.alpha = 1;
    output.thread.beta = Direct == GreedyStore::Native && args.bias ? 1 : 0;
    output.thread.dAlpha = {_0{}, _0{}, 0};
    output.thread.dBeta = {_0{}, _0{}, 0};
    auto params = Epilogue::template to_underlying_arguments<ProblemShape>(
        output, nullptr);
    Epilogue epilogue{
        params, *reinterpret_cast<typename Epilogue::SharedStorage*>(shared)};
    auto tensors =
        epilogue.update_tensor_shape_stride(work.expert, problem, row);
    epilogue(
        problem,
        typename Mainloop::SubgroupTileShape{},
        coord,
        accum,
        TiledMma{},
        thread,
        tensors);
  }
}

template <GreedyDtype Dtype, int MidN, int TinyK, GreedyStore Direct>
class GreedyKernel;

template <
    GreedyDtype Dtype,
    int MidN,
    int TinyK,
    GreedyStore Direct = GreedyStore::Native>
void launch_greedy_config(sycl::queue& stream, GreedyArguments args) {
  constexpr int K = GreedyTraits<Dtype>::TileK;
  // Wider tiles spill with the mixed-input and FP32 block-scale collectives.
  constexpr int NormalN = GreedyTraits<Dtype>::NormalN;
  using T8 = GreedyTilePolicy<Dtype, 8, 512, TinyK, true>;
  using T32 = GreedyTilePolicy<Dtype, 32, 512, TinyK, true>;
  using T64 = GreedyTilePolicy<Dtype, 64, 512, TinyK, true>;
  using T128 = GreedyTilePolicy<Dtype, 128, 512, TinyK, true>;
  using N32 = GreedyTilePolicy<Dtype, 32, NormalN, K, true>;
  using N192 = GreedyTilePolicy<Dtype, 192, NormalN, K, false>;
  using N256 = GreedyTilePolicy<Dtype, 256, NormalN, K, false>;
  using M192 = GreedyTilePolicy<Dtype, 192, MidN, K, false>;
  using M256 = GreedyTilePolicy<Dtype, 256, MidN, K, false>;
  using M320 = GreedyTilePolicy<Dtype, 320, MidN, K, false>;
  constexpr size_t shared_size = sizeof(typename N256::Epilogue::SharedStorage);
  static_assert(
      shared_size == sizeof(typename T8::Epilogue::SharedStorage) &&
      shared_size == sizeof(typename T32::Epilogue::SharedStorage) &&
      shared_size == sizeof(typename T64::Epilogue::SharedStorage) &&
      shared_size == sizeof(typename T128::Epilogue::SharedStorage) &&
      shared_size == sizeof(typename N32::Epilogue::SharedStorage) &&
      shared_size == sizeof(typename N192::Epilogue::SharedStorage) &&
      shared_size == sizeof(typename M192::Epilogue::SharedStorage) &&
      shared_size == sizeof(typename M256::Epilogue::SharedStorage) &&
      shared_size == sizeof(typename M320::Epilogue::SharedStorage));
  greedy::MidWindow window =
      args.k >= GreedyTraits<Dtype>::MinK
          ? greedy::MidWindow{128, GreedyTraits<Dtype>::MidMax}
          : greedy::MidWindow{};
  if constexpr (
      Dtype == GreedyDtype::BF16 || Dtype == GreedyDtype::MXFP8 ||
      Dtype == GreedyDtype::MXFP4 || Dtype == GreedyDtype::FP8Tensor) {
    // Retain the SYCL-TLA window for the previously tuned 1536x1536 cell.
    if (args.n == 1536 && args.k == 1536) window = {128, 576};
  }
  const auto device = stream.get_device();
  const int workers =
      device.get_info<sycl::ext::intel::info::device::gpu_slices>() *
      device
          .get_info<sycl::ext::intel::info::device::gpu_subslices_per_slice>();
  TORCH_CHECK(workers > 0, "Cannot determine the Xe3 greedy persistent grid");
  namespace oneapi = sycl::ext::oneapi::experimental;
  namespace intel = sycl::ext::intel::experimental;
  const oneapi::properties properties{
      oneapi::sub_group_size<16>, intel::grf_size<VLLM_GRF_SIZE>};
  stream.submit([&](sycl::handler& handler) {
    sycl::local_accessor<char, 1> storage(sycl::range<1>(shared_size), handler);
    handler.parallel_for<GreedyKernel<Dtype, MidN, TinyK, Direct>>(
        sycl::nd_range<3>({1, 1, size_t(workers) * 512}, {1, 1, 512}),
        properties,
        [=](sycl::nd_item<3> item) {
          const auto subgroup = item.get_sub_group();
          const int first = args.counts[0];
          bool same = true;
          for (int64_t expert = subgroup.get_local_linear_id();
               expert < args.groups;
               expert += 16) {
            same &= args.counts[expert] == first;
          }
          const bool uniform = sycl::all_of_group(subgroup, same);
          greedy::Scheduler<MidN, NormalN> scheduler(
              args.counts,
              args.groups,
              args.n,
              window,
              int(item.get_group_linear_id()),
              workers,
              uniform);
          char* shared =
              storage.template get_multi_ptr<sycl::access::decorated::no>()
                  .get();
          for (auto work = scheduler.next(); work.valid();
               work = scheduler.next()) {
            const int thread = int(item.get_local_linear_id());
            switch (work.tile.bucket) {
              case greedy::Bucket::Tiny8:
                greedy_tile<T8, Direct>(args, work, thread, shared);
                break;
              case greedy::Bucket::Tiny32:
                greedy_tile<T32, Direct>(args, work, thread, shared);
                break;
              case greedy::Bucket::Tiny64:
                greedy_tile<T64, Direct>(args, work, thread, shared);
                break;
              case greedy::Bucket::Tiny128:
                greedy_tile<T128, Direct>(args, work, thread, shared);
                break;
              case greedy::Bucket::Normal32:
                greedy_tile<N32, Direct>(args, work, thread, shared);
                break;
              case greedy::Bucket::Normal192:
                greedy_tile<N192, Direct>(args, work, thread, shared);
                break;
              case greedy::Bucket::Normal256:
                greedy_tile<N256, Direct>(args, work, thread, shared);
                break;
              case greedy::Bucket::Mid192:
                greedy_tile<M192, Direct>(args, work, thread, shared);
                break;
              case greedy::Bucket::Mid256:
                greedy_tile<M256, Direct>(args, work, thread, shared);
                break;
              case greedy::Bucket::Mid320:
                greedy_tile<M320, Direct>(args, work, thread, shared);
                break;
            }
          }
        });
  });
}

template <GreedyDtype Dtype>
void launch_greedy(sycl::queue& stream, GreedyArguments args) {
  constexpr int K = GreedyTraits<Dtype>::TileK;
  constexpr int MidN = GreedyTraits<Dtype>::MidN;
  constexpr bool AllowMid384 = GreedyTraits<Dtype>::AllowMid384;
  const bool mid384 = (args.n == 1536 || args.n == 3072) && AllowMid384;
  if constexpr (Dtype == GreedyDtype::MXFP8) {
    if (!args.bias) {
      // Padded4 prefixes and all greedy M origins preserve alignment when
      // scale_K is divisible by 16. Compile out the fallback in that case.
      const bool aligned = (((int64_t(args.k) + 31) / 32) % 16 == 0) &&
                           args.n % 64 == 0 &&
                           (reinterpret_cast<uintptr_t>(args.sa) & 63) == 0 &&
                           (reinterpret_cast<uintptr_t>(args.sb) & 63) == 0;
      if (aligned) {
        if (mid384)
          launch_greedy_config<Dtype, 384, K, GreedyStore::Aligned>(
              stream, args);
        else
          launch_greedy_config<Dtype, 256, K, GreedyStore::Aligned>(
              stream, args);
        return;
      }
      if (!mid384) {
        launch_greedy_config<Dtype, 256, K, GreedyStore::CheckAlignment>(
            stream, args);
        return;
      }
    }
  }
  if constexpr (AllowMid384) {
    if (mid384) {
      launch_greedy_config<Dtype, 384, K>(stream, args);
      return;
    }
  }
  launch_greedy_config<Dtype, MidN, K>(stream, args);
}

}  // namespace gpu::cutlass_kernel::grouped_gemm
