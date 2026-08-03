# SPDX-License-Identifier: Apache-2.0
# SPDX-FileCopyrightText: Copyright contributors to the vLLM project
"""CUTLASS flash_attn_varlen_func perf benchmark on XPU (Xe3).

Adapted from perf_flash_attn.py. Provides 4 default cases:

  case1 : single long sequence prefill
          seqlen_q/k = [8192], batch_size = 1
  case2 : prefill batch
          batch_size = 32, every seq has seqlen_q/k = 1024
  case3 : mixed batch
          batch_size = 32, half prefill (seqlen_q/k = 1024),
          half decode (seqlen_q = 1, seqlen_k = 1024)
  case4 : decode-heavy batch
          batch_size = 32, 2 prefill (seqlen_q/k = 1024),
          30 decode (seqlen_q = 1, seqlen_k = 1024)

All cases share: num_heads_q = num_heads_k = 32, head_size = 128,
paged KV cache enabled, causal = False, dtype = bf16.

Usage examples:
  # Run all 4 default cases:
  python benchmark_cutlass_flash_attn_varlen_xe3.py

  # Run a single case:
  python benchmark_cutlass_flash_attn_varlen_xe3.py --case case2

  # Define a custom case (multi-batch varlen):
  python benchmark_cutlass_flash_attn_varlen_xe3.py --case custom \
      --seq_lens_q 1 1 1024 --seq_lens_k 1024 2048 4096 \
      --head_q 32 --head_k 8 --head_dim 128 --causal --no-paged

  # Tune iterations:
  python benchmark_cutlass_flash_attn_varlen_xe3.py --warmup 10 --perf_iter 100
"""

# isort: off
import argparse

import torch

from utils import bootstrap_benchmark_env

bootstrap_benchmark_env(__file__)

from vllm_xpu_kernels.flash_attn_interface import (
    FA2_AVAILABLE,
    FA2_UNAVAILABLE_REASON,
    flash_attn_varlen_func,
)
# isort: on

DEVICE = "xpu"

DTYPE_MAP = {
    "fp16": torch.float16,
    "bf16": torch.bfloat16,
    "fp32": torch.float32,
}


def make_default_cases():
    """Build the 4 default benchmark cases.

    Every case shares num_heads_q = num_heads_k = 32, head_size = 128,
    paged KV cache, causal = False.
    """
    common = dict(
        head_q=32,
        head_k=32,
        head_dim=128,
        causal=False,
        is_paged=True,
        block_size=64,
    )

    # case1: single long-sequence prefill.
    case1 = dict(
        name="case1",
        desc="single long prefill (seqlen_q/k=8192)",
        seq_lens_q=[8192],
        seq_lens_k=[8192],
        **common,
    )

    # case2: prefill batch of 32, each seqlen_q/k = 1024.
    case2 = dict(
        name="case2",
        desc="prefill batch (batch_size=32, seqlen_q/k=1024)",
        seq_lens_q=[1024] * 32,
        seq_lens_k=[1024] * 32,
        **common,
    )

    # case3: mixed batch of 32, half prefill (q/k=1024), half decode (q=1).
    case3 = dict(
        name="case3",
        desc="mixed batch (16 prefill q/k=1024, 16 decode q=1 k=1024)",
        seq_lens_q=[1024] * 16 + [1] * 16,
        seq_lens_k=[1024] * 32,
        **common,
    )

    # case4: decode-heavy batch of 32, 2 prefill (q/k=1024), 30 decode (q=1).
    case4 = dict(
        name="case4",
        desc="decode-heavy batch (2 prefill q/k=1024, 30 decode q=1 k=1024)",
        seq_lens_q=[1024] * 2 + [1] * 30,
        seq_lens_k=[1024] * 32,
        **common,
    )

    return [case1, case2, case3, case4]


def make_custom_case(args):
    """Build a user-defined case from CLI arguments."""
    seq_lens_q = args.seq_lens_q
    seq_lens_k = args.seq_lens_k
    assert len(seq_lens_q) == len(seq_lens_k), \
        (f"--seq_lens_q ({len(seq_lens_q)}) and --seq_lens_k "
         f"({len(seq_lens_k)}) must have the same length")
    return dict(
        name="custom",
        desc=(f"user-defined (batch_size={len(seq_lens_q)}, "
              f"causal={args.causal}, "
              f"paged={not args.no_paged})"),
        seq_lens_q=list(seq_lens_q),
        seq_lens_k=list(seq_lens_k),
        head_q=args.head_q,
        head_k=args.head_k,
        head_dim=args.head_dim,
        causal=args.causal,
        is_paged=not args.no_paged,
        block_size=args.block_size,
    )


def build_tensors(case, dtype):
    """Allocate Q, K, V and related metadata tensors for a case."""
    seq_lens_q = case["seq_lens_q"]
    seq_lens_k = case["seq_lens_k"]
    assert len(seq_lens_q) == len(seq_lens_k), \
        (f"seq_lens_q ({len(seq_lens_q)}) and seq_lens_k "
         f"({len(seq_lens_k)}) must have the same length")

    block_size = case["block_size"]

    cu_seqlens_q = torch.cumsum(
        torch.tensor([0] + seq_lens_q, dtype=torch.int32), 0
    ).to(torch.int32)
    max_seqlen_q = max(seq_lens_q)

    cu_seqlens_k = torch.cumsum(
        torch.tensor([0] + seq_lens_k, dtype=torch.int32), 0
    ).to(torch.int32)
    max_seqlen_k = max(seq_lens_k)
    seq_lens_k_t = torch.tensor(seq_lens_k, dtype=torch.int32)

    batch_size = cu_seqlens_q.numel() - 1
    max_num_blocks_per_seq = (max_seqlen_k + block_size - 1) // block_size

    q = torch.randn(
        int(cu_seqlens_q[-1]), case["head_q"], case["head_dim"], dtype=dtype)

    is_paged = case["is_paged"]
    if is_paged:
        # Enough blocks to give every sequence a distinct set of blocks.
        num_blocks = max(1, batch_size * max_num_blocks_per_seq)
        k = torch.randn(
            num_blocks, block_size, case["head_k"], case["head_dim"],
            dtype=dtype)
        v = torch.randn_like(k)
        block_tables = torch.randint(
            0, num_blocks,
            (batch_size, max_num_blocks_per_seq), dtype=torch.int32)
    else:
        k = torch.randn(
            int(cu_seqlens_k[-1]), case["head_k"], case["head_dim"],
            dtype=dtype)
        v = torch.randn_like(k)
        block_tables = None

    return dict(
        q=q,
        k=k,
        v=v,
        block_tables=block_tables,
        cu_seqlens_q=cu_seqlens_q,
        cu_seqlens_k=cu_seqlens_k,
        seq_lens_k=seq_lens_k_t,
        max_seqlen_q=max_seqlen_q,
        max_seqlen_k=max_seqlen_k,
        batch_size=batch_size,
        max_num_blocks_per_seq=max_num_blocks_per_seq,
    )


def compute_flops(case):
    """Compute total FLOPs for one flash-attention call.

    For each sequence pair (seq_q, seq_k):
      GEMM1 (Q*K^T): 2 * head_q * seq_q * seq_k * head_dim
      GEMM2 (P*V):   2 * head_q * seq_q * seq_k * head_dim
      Total:          4 * head_q * seq_q * seq_k * head_dim
    With causal masking, effective seq_k ~ seq_k/2 on average.
    """
    total = 0
    for sq, sk in zip(case["seq_lens_q"], case["seq_lens_k"]):
        effective_sk = sk * 0.5 if case["causal"] else sk
        total += 4 * case["head_q"] * sq * effective_sk * case["head_dim"]
    return total


def print_tflops(label, flops, avg_time_us):
    """Print TFLOPS given FLOPs and average kernel time in microseconds."""
    avg_time_s = avg_time_us / 1e6
    tflops = flops / avg_time_s / 1e12
    print(f"\n  [{label}]")
    print(f"  Avg kernel time : {avg_time_us:.2f} us")
    print(f"  FLOPs/call      : {flops:.3e}")
    print(f"  Throughput      : {tflops:.2f} TFLOPS")


def bench_cutlass(case, tensors, args):
    """Benchmark the CUTLASS-SYCL flash-attention kernel for one case."""
    if not FA2_AVAILABLE:
        print("\n[SKIP] CUTLASS flash_attn_varlen_func is unavailable.")
        print(f"  Reason: {FA2_UNAVAILABLE_REASON}")
        return False

    q = tensors["q"]
    k, v = tensors["k"], tensors["v"]
    cu_seqlens_q = tensors["cu_seqlens_q"]
    seq_lens_k = tensors["seq_lens_k"]
    max_seqlen_q = tensors["max_seqlen_q"]
    max_seqlen_k = tensors["max_seqlen_k"]
    is_paged = case["is_paged"]
    causal = case["causal"]

    print(f"\n{'=' * 60}")
    print(f"  CUTLASS flash_attn_varlen_func "
          f"({'paged' if is_paged else 'non-paged'})")
    print(f"{'=' * 60}")

    def run_once():
        if is_paged:
            flash_attn_varlen_func(
                q, k, v, max_seqlen_q, cu_seqlens_q, max_seqlen_k,
                seqused_k=seq_lens_k,
                block_table=tensors["block_tables"],
                causal=causal)
        else:
            flash_attn_varlen_func(
                q, k, v, max_seqlen_q, cu_seqlens_q, max_seqlen_k,
                cu_seqlens_k=tensors["cu_seqlens_k"],
                causal=causal)

    # Warmup
    for _ in range(args.warmup):
        run_once()
    torch.xpu.synchronize()
    print(f"  Warmup ({args.warmup} iters) done.")

    start = torch.xpu.Event(enable_timing=True)
    end = torch.xpu.Event(enable_timing=True)

    total_kernel_time = 0.0
    for _ in range(args.perf_iter):
        start.record()
        run_once()
        end.record()
        end.synchronize()
        total_kernel_time += start.elapsed_time(end)

    avg_time_us = (total_kernel_time / args.perf_iter) * 1e3
    flops = compute_flops(case)
    print_tflops("CUTLASS", flops, avg_time_us)
    return True


def run_case(case, args):
    dtype = DTYPE_MAP[args.dtype]

    print(f"\n{'#' * 60}")
    print(f"  {case['name']}: {case['desc']}")
    print(f"{'#' * 60}")
    print(f"  batch_size = {len(case['seq_lens_q'])}")
    print(f"  seq_lens_q = {case['seq_lens_q']}")
    print(f"  seq_lens_k = {case['seq_lens_k']}")
    print(f"  head_q     = {case['head_q']}")
    print(f"  head_k     = {case['head_k']}")
    print(f"  head_dim   = {case['head_dim']}")
    print(f"  dtype      = {args.dtype}")
    print(f"  causal     = {case['causal']}")
    print(f"  is_paged   = {case['is_paged']}")
    print(f"  block_size = {case['block_size']}")
    print(f"  warmup     = {args.warmup}")
    print(f"  perf_iter  = {args.perf_iter}")

    tensors = build_tensors(case, dtype)

    print(f"\n  Q shape         : {tuple(tensors['q'].shape)}")
    print(f"  K shape         : {tuple(tensors['k'].shape)}")
    if tensors["block_tables"] is not None:
        print(f"  block_tables    : {tuple(tensors['block_tables'].shape)}")
    print(f"  cu_seqlens_q    : {tensors['cu_seqlens_q']}")

    return bench_cutlass(case, tensors, args)


def parse_args():
    p = argparse.ArgumentParser(
        description="CUTLASS flash-attention varlen perf benchmark on Xe3")
    p.add_argument("--case", type=str, default="all",
                   choices=["all", "case1", "case2", "case3", "case4",
                            "custom"],
                   help="Which case to run (default: all). Use 'custom' "
                        "to define your own case via the args below.")
    p.add_argument("--dtype", type=str, default="bf16",
                   choices=list(DTYPE_MAP.keys()),
                   help="Data type (default: bf16)")
    p.add_argument("--warmup", type=int, default=20,
                   help="Warmup iterations (default: 20)")
    p.add_argument("--perf_iter", type=int, default=200,
                   help="Profiling iterations (default: 200)")

    # Custom-case configuration (only used when --case custom).
    g = p.add_argument_group(
        "custom case (only used with --case custom)")
    g.add_argument("--seq_lens_q", type=int, nargs="+", default=[1024],
                   help="Query sequence lengths per batch (default: [1024])")
    g.add_argument("--seq_lens_k", type=int, nargs="+", default=[1024],
                   help="KV sequence lengths per batch (default: [1024])")
    g.add_argument("--head_q", type=int, default=32,
                   help="Number of query heads (default: 32)")
    g.add_argument("--head_k", type=int, default=32,
                   help="Number of KV heads (default: 32)")
    g.add_argument("--head_dim", type=int, default=128,
                   help="Head dimension (default: 128)")
    g.add_argument("--causal", action="store_true", default=False,
                   help="Enable causal masking (default: False)")
    g.add_argument("--block_size", type=int, default=64,
                   help="Paged-KV block size (default: 64)")
    g.add_argument("--no-paged", action="store_true", default=False,
                   help="Disable paged KV cache (use contiguous K/V)")
    return p.parse_args()


def main():
    args = parse_args()

    torch.manual_seed(0)
    torch.set_default_device(DEVICE)
    torch.xpu.set_device("xpu:0")

    print("CUTLASS Flash-Attention Varlen Performance Benchmark (Xe3)")

    cases = make_default_cases()
    if args.case == "custom":
        cases = [make_custom_case(args)]
    elif args.case != "all":
        cases = [c for c in cases if c["name"] == args.case]

    ran_any = False
    for case in cases:
        ran_any = run_case(case, args) or ran_any

    if not ran_any:
        print("\n[SKIP] No benchmark backend was available.")


if __name__ == "__main__":
    main()
