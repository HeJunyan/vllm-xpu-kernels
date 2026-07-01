#!/usr/bin/env python3
"""Generate sanity_tests.txt and PO_ut_tests.txt from pytest --collect-only.

This script replaces the manual curation of test lists by dynamically
collecting tests using pytest's parametrize resolution with the appropriate
XPU_KERNEL_TEST_SCOPE settings.

Usage:
    # Generate both files:
    python tests/generate_test_lists.py

    # Generate only sanity_tests.txt:
    python tests/generate_test_lists.py --sanity

    # Generate only PO_ut_tests.txt:
    python tests/generate_test_lists.py --po

    # Dry-run (print to stdout, don't write files):
    python tests/generate_test_lists.py --dry-run

    # Custom dedup for PO (keep specific seq_lens indices):
    python tests/generate_test_lists.py --po --seq-lens 0,1,3
"""

import argparse
import os
import subprocess
import sys
from collections import defaultdict
from pathlib import Path

REPO_ROOT = Path(__file__).resolve().parent.parent
TESTS_DIR = REPO_ROOT / "tests"

# Scopes used for PO test generation
PO_SCOPES = ["ondemand:llama3", "ondemand:qwen3_30b_a3b", "ondemand:qwen3_235b_a22b", "ondemand:wan"]

# Test categories for grouping in output
CATEGORIES = [
    ("Flash Attention", "tests/flash_attn/test_flash_attn_varlen_func.py"),
    ("MLA Decode", "tests/flash_attn/test_mla_decode.py"),
    ("Merge Attention States", "tests/test_merge_attn_states.py"),
    ("MOE / Grouped GEMM", "tests/fused_moe/test_fused_moe_xe3.py"),
    ("MOE / Grouped GEMM", "tests/fused_moe/test_grouped_gemm_xe3.py"),
    ("MOE Utils", "tests/test_moe_align_block_size.py"),
    ("MOE Utils", "tests/test_moe_gather.py"),
    ("MOE Utils", "tests/test_moe_sum.py"),
    ("MOE Utils", "tests/fused_moe/test_remap_hidden_states.py"),
    ("GEMM", "tests/test_fp8_gemm_onednn.py"),
    ("GEMM", "tests/test_fp4_gemm_onednn.py"),
    ("GEMM", "tests/test_int4_gemm_onednn.py"),
    ("Quantization", "tests/test_fp8_quant.py"),
    ("Quantization", "tests/test_mxfp4_quant.py"),
    ("Fused Norm + Quant", "tests/test_fused_norm_quant.py"),
    ("Fused Quant Activation", "tests/test_fused_quant_activation.py"),
    ("Fused Quant Activation", "tests/test_fused_silu_mul_block_quant.py"),
    ("LayerNorm", "tests/test_layernorm.py"),
    ("Activation", "tests/test_activation.py"),
    ("Activation", "tests/test_swigluoai_and_mul.py"),
    ("Activation", "tests/test_swiglustep_and_mul.py"),
    ("RoPE", "tests/test_rotary_embedding.py"),
    ("RoPE", "tests/test_deepseek_scaling_rope.py"),
    ("RoPE", "tests/test_fused_qk_norm_rope.py"),
    ("RoPE", "tests/test_multimodal_rotary_embedding.py"),
    ("TopK / Sampling", "tests/test_topk.py"),
    ("TopK / Sampling", "tests/test_grouped_topk.py"),
    ("TopK / Sampling", "tests/test_topk_per_row.py"),
    ("TopK / Sampling", "tests/test_topk_topp_sampler.py"),
    ("KV Cache", "tests/test_cache.py"),
    ("KV Cache", "tests/test_indexer_k_quant_and_cache.py"),
    ("LoRA", "tests/test_lora_ops.py"),
    ("GDN Attention", "tests/gdn_attn/"),
    ("MQA Logits", "tests/mqa_logits/test_mqa_logits.py"),
    ("WAN Kernels", "tests/wan_ut/"),
    ("MOE / Grouped GEMM", "tests/fused_moe/test_fused_moe_xe2.py"),
    ("MOE / Grouped GEMM", "tests/fused_moe/test_grouped_gemm_xe2.py"),
    ("MOE Utils", "tests/test_moe_lora_align_sum.py"),
    ("Misc", "tests/test_xpu_memcpy_sync.py"),
    ("Misc", "tests/test_mem_alloc.py"),
    ("Misc", "tests/test_uva.py"),
    ("Misc", "tests/test_exponential_2d.py"),
    ("Misc", "tests/test_cp_gather_indexer_k_quant_cache.py"),
]


def collect_tests(scope: str, extra_env: dict = None) -> list[str]:
    """Run pytest --collect-only and return list of test node IDs."""
    env = os.environ.copy()
    env["XPU_KERNEL_TEST_SCOPE"] = scope
    if extra_env:
        env.update(extra_env)

    cmd = [
        sys.executable, "-m", "pytest",
        "--collect-only", "-q",
        "--no-header",
        str(TESTS_DIR),
    ]

    result = subprocess.run(
        cmd, capture_output=True, text=True, cwd=str(REPO_ROOT), env=env
    )

    if result.returncode not in (0, 5):
        # rc=5 means no tests collected (ok for some scopes)
        print(f"WARNING: pytest collect failed for scope={scope}", file=sys.stderr)
        print(f"  stderr: {result.stderr[:500]}", file=sys.stderr)

    tests = []
    for line in result.stdout.splitlines():
        line = line.strip()
        if line and "::" in line and not line.startswith(("=", "-", "no tests")):
            tests.append(line)
    return tests


def categorize_test(nodeid: str) -> str:
    """Return category name for a test node ID."""
    for cat_name, path_prefix in CATEGORIES:
        if path_prefix in nodeid:
            return cat_name
    return "Other"


def dedup_po_tests(tests: list[str], keep_seq_lens: list[int]) -> list[str]:
    """Deduplicate PO tests by keeping only specific seq_lens indices.

    For tests with seq_lens parametrize, keep only the specified indices.
    Also keep only num_heads0 (first num_heads variant).
    Excludes test_wan22_kernels_mini.py (covered by sanity scope).
    """
    import re

    filtered = []
    for t in tests:
        # Skip wan mini tests (these are sanity-level, not PO-level)
        if "test_wan22_kernels_mini.py" in t:
            continue

        # Skip non-first num_heads variants
        if "num_heads" in t:
            m = re.search(r"num_heads(\d+)", t)
            if m and int(m.group(1)) != 0:
                continue

        # Filter seq_lens variants
        if "seq_lens" in t:
            m = re.search(r"seq_lens(\d+)", t)
            if m and int(m.group(1)) not in keep_seq_lens:
                continue

        filtered.append(t)
    return filtered


def dedup_sanity_tests(tests: list[str]) -> list[str]:
    """Heavily deduplicate mini-scope tests to ~100-150 representative tests.

    Strategy:
    - Keep only seq_lens0 (first/smallest batch)
    - Keep only num_heads0
    - Keep only first dtype variant per test function
    - Keep 1-2 parametrize combos per test function (cover distinct kernel paths)
    - For MOE/GEMM: keep dtype diversity but reduce size/batch combos
    """
    import re

    # First pass: filter to seq_lens0, num_heads0 only
    filtered = []
    for t in tests:
        if "seq_lens" in t:
            m = re.search(r"seq_lens(\d+)", t)
            if m and int(m.group(1)) != 0:
                continue
        if "num_heads" in t:
            m = re.search(r"num_heads(\d+)", t)
            if m and int(m.group(1)) != 0:
                continue
        filtered.append(t)

    # Filter out xe2 tests (sanity targets CRI/XE3 simulator only)
    filtered = [t for t in filtered if "xe2" not in t]

    # Second pass: group by test function and pick representatives
    func_groups = defaultdict(list)
    for t in filtered:
        # Extract test function name (path::function_name without params)
        func_name = t.split("[")[0] if "[" in t else t
        func_groups[func_name].append(t)

    # Dedup rules per category
    result = []
    for func_name, func_tests in func_groups.items():
        if not func_tests:
            continue

        # Tests without parametrize: keep as-is (single test)
        if len(func_tests) == 1:
            result.extend(func_tests)
            continue

        # Non-parametrized test functions (class-based, etc): keep all
        # These are typically unique test methods, not parametrize variants
        if "[" not in func_tests[0]:
            result.extend(func_tests)
            continue

        # For grouped_gemm/fused_moe: keep one per dtype variant with smallest size
        if "grouped_gemm" in func_name or "fused_moe" in func_name:
            dtype_seen = {}
            for t in func_tests:
                # Extract dtype-like key from params
                params = t.split("[")[1].rstrip("]") if "[" in t else ""
                # For grouped_gemm: dtype0, mxfp4, mxfp8, fp8block
                # For fused_moe: bf16, mxfp4, mxfp8, fp8block
                dtype_key = None
                for dk in ["mxfp4", "mxfp8", "fp8block", "bf16", "dtype0",
                           "dtype1", "float16", "bfloat16", "float32"]:
                    if dk in params:
                        dtype_key = dk
                        break
                if dtype_key is None:
                    dtype_key = "unknown"
                # Keep first (smallest) per dtype, only 1 per dtype
                key = dtype_key
                if key not in dtype_seen:
                    dtype_seen[key] = 0
                if dtype_seen[key] < 1:
                    result.append(t)
                    dtype_seen[key] += 1
            continue

        # For flash attention decode/varlen: keep 1 per distinct kernel config
        if "flash_attn" in func_name:
            # Keep up to 3 variants (cover different head/block combos)
            seen_configs = set()
            for t in func_tests:
                params = t.split("[")[1].rstrip("]") if "[" in t else ""
                # Extract kernel-distinguishing params (h/b/window/sink)
                config_parts = []
                for part in params.split("-"):
                    if part.startswith("h") or part.startswith("b") or \
                       "global" in part or "sink" in part or \
                       "window" in part or "local" in part:
                        config_parts.append(part)
                config_key = "-".join(config_parts) if config_parts else params[:30]
                if config_key not in seen_configs:
                    seen_configs.add(config_key)
                    result.append(t)
            continue

        # For all other tests: keep 1 variant per function by default
        max_per_func = 1
        if "topk" in func_name or "quant" in func_name:
            max_per_func = 1
        if "layernorm" in func_name or "activation" in func_name:
            max_per_func = 1
        if "cache" in func_name:
            max_per_func = 1
        if "lora" in func_name:
            max_per_func = 1
        if "memcpy" in func_name:
            max_per_func = 1
        if "gdn_attn" in func_name:
            max_per_func = 3
        if "mla_decode" in func_name:
            max_per_func = 2
        if "merge_attn" in func_name:
            max_per_func = 2
        if "rope" in func_name or "rotary" in func_name:
            max_per_func = 1
        if "gemm" in func_name and "grouped" not in func_name:
            max_per_func = 1
        if "moe_align" in func_name or "moe_gather" in func_name or \
           "moe_sum" in func_name or "remap" in func_name:
            max_per_func = 1
        if "wan" in func_name or "exponential" in func_name:
            max_per_func = 1
        if "cp_gather" in func_name or "moe_lora" in func_name:
            max_per_func = 1
        if "mem_alloc" in func_name or "uva" in func_name:
            max_per_func = 1

        # Pick up to max_per_func, preferring diversity in first param
        result.extend(func_tests[:max_per_func])

    return result


def generate_sanity(dry_run: bool = False) -> str:
    """Generate sanity_tests.txt from mini scope with heavy dedup."""
    print("Collecting tests with XPU_KERNEL_TEST_SCOPE=mini ...", file=sys.stderr)
    tests = collect_tests("mini")
    print(f"  Collected {len(tests)} tests", file=sys.stderr)

    tests = dedup_sanity_tests(tests)
    print(f"  After dedup: {len(tests)} tests", file=sys.stderr)

    # Group by category
    grouped = defaultdict(list)
    for t in tests:
        cat = categorize_test(t)
        grouped[cat].append(t)

    # Build output
    total = len(tests)
    lines = []
    lines.append(f"# Sanity Test Scope — {total} tests (auto-generated, deduplicated from mini scope)")
    lines.append("# XE3 + WAN validation with representative op coverage")
    lines.append("#")
    lines.append("# Generated by: python tests/generate_test_lists.py --sanity")
    lines.append("# Usage: ./tests/run_sanity.sh [-v] [-s] [--co] [--with-timeout]")
    lines.append("#")
    lines.append("")

    # Output in category order (follow CATEGORIES ordering)
    seen_categories = set()
    for cat_name, _ in CATEGORIES:
        if cat_name in seen_categories or cat_name not in grouped:
            continue
        seen_categories.add(cat_name)
        cat_tests = sorted(grouped[cat_name])
        lines.append(f"# === {cat_name} ({len(cat_tests)}) ===")
        for t in cat_tests:
            lines.append(t)
        lines.append("")

    # Any uncategorized
    if "Other" in grouped:
        cat_tests = sorted(grouped["Other"])
        lines.append(f"# === Other ({len(cat_tests)}) ===")
        for t in cat_tests:
            lines.append(t)
        lines.append("")

    content = "\n".join(lines)

    if dry_run:
        print(content)
    else:
        outpath = TESTS_DIR / "sanity_tests.txt"
        outpath.write_text(content)
        print(f"  Written to {outpath} ({total} tests)", file=sys.stderr)

    return content


def generate_po(dry_run: bool = False, keep_seq_lens: list[int] = None) -> str:
    """Generate PO_ut_tests.txt from ondemand scopes (llama3, qwen3, etc.)."""
    if keep_seq_lens is None:
        keep_seq_lens = [0, 1, 3]

    all_tests = []  # list of (scope, nodeid)
    seen_nodeids = set()

    for scope in PO_SCOPES:
        print(f"Collecting tests with XPU_KERNEL_TEST_SCOPE={scope} ...",
              file=sys.stderr)
        tests = collect_tests(scope)
        print(f"  Collected {len(tests)} tests", file=sys.stderr)

        # Dedup: keep only specific seq_lens and num_heads0
        tests = dedup_po_tests(tests, keep_seq_lens)
        print(f"  After dedup: {len(tests)} tests", file=sys.stderr)

        for t in tests:
            if t not in seen_nodeids:
                seen_nodeids.add(t)
                all_tests.append((scope, t))

    print(f"  Total unique: {len(all_tests)} tests", file=sys.stderr)

    # Group by category
    grouped = defaultdict(list)
    for scope, t in all_tests:
        cat = categorize_test(t)
        grouped[cat].append((scope, t))

    # Build output
    lines = []
    lines.append(
        f"# PO Unit Tests — {len(all_tests)} tests "
        f"(deduplicated, seq_lens {'/'.join(str(s) for s in keep_seq_lens)}, num_heads0)"
    )
    lines.append("# Format: SCOPE|test_node_id")
    lines.append("#   SCOPE = XPU_KERNEL_TEST_SCOPE value for pytest parametrize resolution")
    lines.append("#")
    lines.append("# Generated by: python tests/generate_test_lists.py --po")
    lines.append("# Usage: ./tests/run_po_tests.sh [--with-timeout] [-x]")
    lines.append("#")
    lines.append(
        f"# seq_lens kept: "
        + ", ".join(f"{s}" for s in keep_seq_lens)
    )
    lines.append("#")
    lines.append("")

    # Output in category order
    seen_categories = set()
    for cat_name, _ in CATEGORIES:
        if cat_name in seen_categories or cat_name not in grouped:
            continue
        seen_categories.add(cat_name)
        cat_tests = grouped[cat_name]
        lines.append(f"# === {cat_name} ({len(cat_tests)}) ===")
        for scope, t in cat_tests:
            lines.append(f"{scope}|{t}")
        lines.append("")

    # Any uncategorized
    if "Other" in grouped:
        cat_tests = grouped["Other"]
        lines.append(f"# === Other ({len(cat_tests)}) ===")
        for scope, t in cat_tests:
            lines.append(f"{scope}|{t}")
        lines.append("")

    total = len(all_tests)
    lines.append(f"# Total: {total} tests")
    lines.append("")

    content = "\n".join(lines)

    if dry_run:
        print(content)
    else:
        outpath = TESTS_DIR / "PO_ut_tests.txt"
        outpath.write_text(content)
        print(f"  Written to {outpath} ({total} tests)", file=sys.stderr)

    return content


def main():
    parser = argparse.ArgumentParser(
        description="Generate test list files from pytest --collect-only"
    )
    parser.add_argument("--sanity", action="store_true",
                        help="Generate sanity_tests.txt (mini scope)")
    parser.add_argument("--po", action="store_true",
                        help="Generate PO_ut_tests.txt (ondemand scopes)")
    parser.add_argument("--dry-run", action="store_true",
                        help="Print to stdout instead of writing files")
    parser.add_argument("--seq-lens", type=str, default="0,1,3",
                        help="Comma-separated seq_lens indices to keep for PO "
                             "(default: 0,1,3)")
    parser.add_argument("--scopes", type=str, default=None,
                        help="Comma-separated ondemand scopes for PO "
                             "(default: llama3,qwen3_30b_a3b,qwen3_235b_a22b)")

    args = parser.parse_args()

    # Default: generate both
    if not args.sanity and not args.po:
        args.sanity = True
        args.po = True

    keep_seq_lens = [int(x) for x in args.seq_lens.split(",")]

    if args.scopes:
        global PO_SCOPES
        PO_SCOPES = [f"ondemand:{s}" if not s.startswith("ondemand:") else s
                     for s in args.scopes.split(",")]

    if args.sanity:
        generate_sanity(dry_run=args.dry_run)

    if args.po:
        generate_po(dry_run=args.dry_run, keep_seq_lens=keep_seq_lens)


if __name__ == "__main__":
    main()
