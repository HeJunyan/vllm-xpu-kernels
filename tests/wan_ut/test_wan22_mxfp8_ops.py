"""
MXFP8 Quantized GEMM tests for WAN 2.2
Tests MXFP8 W8A8 quantization with same shapes as BF16 linear operations

**Note on from_blocked_format:**
Unlike accuracy tests in test_fp8_gemm_onednn.py, these are pure performance
benchmarks. We don't need from_blocked_format() which is only used to dequantize
MXFP8 back to BF16 for reference computation in accuracy validation.

**Test Workflow:**
1. Create BF16 inputs/weights on CPU
2. Transfer to XPU
3. Reset peak memory stats and clear cache
4. Warmup: Quantize to MXFP8 + fp8_gemm (memory freed after)
5. Benchmark: Quantize to MXFP8 + fp8_gemm (timed, memory freed after)

## Memory Tracking

Each test reports peak memory usage with breakdown:
- **Peak Memory**: Total peak XPU memory allocated during the test
- **Memory Breakdown**:
  - **Activation (A)**: Input activation in FP8 + scales (1 byte + scale per 32 elements)
  - **Weight (W)**: Weight in FP8 + scales (1 byte + scale per 32 elements)
  - **Output (O)**: Output tensor memory (BF16 format, 2 bytes)

**Memory Management:**
- Peak stats are reset before each test
- Intermediate tensors (quantized weights/activations) are freed after each run
- Cache is cleared between runs
- Ensures accurate per-test memory measurements

**Automatic Memory-Based Test Skipping:**
- Tests automatically skip if expected memory exceeds available device memory
- Uses 90% of total device memory as threshold (configurable via MEMORY_THRESHOLD_RATIO)
- Prevents OOM errors on memory-constrained GPUs
- Memory estimation includes BF16 inputs + FP8 quantized + BF16 output

Example output:
```
MXFP8 QKV Projection: 23.456ms, 3.21 TFLOPs, 145.2 GB/s,
Peak: 384.2MB (Act: 72.3MB, Weight: 235.8MB, Out: 76.1MB)
```

Usage:
```bash
# Run all tests with benchmarking (default: 1 warmup + 1 run)
python -m pytest test_wan22_mxfp8_ops.py -v -s

# Run specific test
python -m pytest test_wan22_mxfp8_ops.py::TestMXFP8LinearOps::test_mxfp8_qkv_projection -v -s

# Run in fast mode (no warmup)
BENCHMARK_MODE=0 python -m pytest test_wan22_mxfp8_ops.py -v -s

# Configure memory threshold (default: 90% of device memory)
MEMORY_THRESHOLD_RATIO=0.8 python -m pytest test_wan22_mxfp8_ops.py -v -s

# View generated report
cat wan22_mxfp8_report.md
```

**Note:**
- Report `wan22_mxfp8_report.md` is automatically generated after tests complete
- Each test runs once with 1 warmup for accurate measurements
- Quantized tensors are freed between runs to prevent accumulation
- Tests automatically skip if expected memory exceeds available device memory

**Environment Variables:**
- `BENCHMARK_MODE`: Set to 0 to disable warmup (default: 1)
- `MEMORY_THRESHOLD_RATIO`: Fraction of device memory to use (default: 0.9)
"""

import os
import sys

import numpy as np
import pytest
import torch

# Skip this module in mini scope (use test_wan22_kernels_mini.py instead)
SKIP_IN_MINI_SCOPE = True

# Test device configuration
DEVICE = "xpu" if torch.xpu.is_available() else "cpu"

if DEVICE == "cpu":
    pytest.skip("MXFP8 tests require XPU", allow_module_level=True)

# Memory threshold: use 90% of available memory as the limit
MEMORY_THRESHOLD_RATIO = float(os.environ.get("MEMORY_THRESHOLD_RATIO", "0.9"))


def get_available_device_memory_mb():
    """Get available XPU memory in MB."""
    if DEVICE == "cpu":
        return float('inf')
    try:
        props = torch.xpu.get_device_properties(0)
        total_memory_bytes = props.total_memory
        return (total_memory_bytes / (1024 ** 2)) * MEMORY_THRESHOLD_RATIO
    except:
        return 16384 * MEMORY_THRESHOLD_RATIO


def should_skip_test_due_to_memory(expected_memory_mb, test_name):
    """
    Check if test should be skipped due to insufficient device memory.

    Args:
        expected_memory_mb: Expected peak memory usage in MB
        test_name: Name of the test for logging

    Returns:
        tuple: (should_skip: bool, reason: str)
    """
    available_memory_mb = get_available_device_memory_mb()

    if expected_memory_mb > available_memory_mb:
        reason = (
            f"Test requires {expected_memory_mb:.1f}MB but only "
            f"{available_memory_mb:.1f}MB available "
            f"({MEMORY_THRESHOLD_RATIO*100:.0f}% of device memory)"
        )
        return True, reason

    return False, ""


def estimate_mxfp8_memory_mb(batch, seq_len, in_features, out_features):
    """
    Estimate peak memory usage for MXFP8 GEMM in MB.

    MXFP8 format:
    - Input: FP8 (1 byte) + scale (1 byte per 32 elements)
    - Weight: FP8 (1 byte) + scale (1 byte per 32 elements)
    - Output: BF16 (2 bytes)
    """
    # Input activation (FP8 + scales)
    input_bytes = batch * seq_len * in_features * 1
    input_scale_bytes = batch * seq_len * in_features // 32

    # Weight (FP8 + scales)
    weight_bytes = in_features * out_features * 1
    weight_scale_bytes = in_features * out_features // 32

    # Output (BF16)
    output_bytes = batch * seq_len * out_features * 2

    # Add BF16 inputs before quantization
    bf16_input_bytes = batch * seq_len * in_features * 2
    bf16_weight_bytes = in_features * out_features * 2

    # Peak includes: BF16 inputs + FP8 quantized + output
    total_bytes = bf16_input_bytes + bf16_weight_bytes + input_bytes + input_scale_bytes + weight_bytes + weight_scale_bytes + output_bytes

    return total_bytes / (1024 ** 2)

# Fix sys.path: Remove workspace root to use installed vllm_xpu_kernels with compiled extensions
workspace_root = os.path.abspath(os.path.join(os.path.dirname(__file__), "../.."))
sys.path[:] = [p for p in sys.path if os.path.abspath(p) != workspace_root]

# Add tests directory for test utilities
tests_dir = os.path.abspath(os.path.join(os.path.dirname(__file__), ".."))
if tests_dir not in sys.path:
    sys.path.insert(0, tests_dir)

# Import XPU ops and utilities
try:
    from ops.mx_utils import from_blocked_format, to_mxfp
    from register_ops import fp8_gemm, fp8_gemm_w8a16
except ImportError as e:
    pytest.skip(f"vllm-xpu-kernels test utilities not available: {e}", allow_module_level=True)

# Configuration from WAN 2.2 A14B
BATCH_SIZE = 1
SEQ_LEN = 75600
HIDDEN_DIM = 5120
FFN_DIM = 13824
TEXT_SEQ_LEN = 512

WARMUP = 1
RUNS = 1

# Benchmark mode
BENCHMARK_MODE = os.environ.get("BENCHMARK_MODE", "1") != "0"

# Store test results
TEST_RESULTS = []


def _convert_to_mxfp8(t):
    """Convert a tensor to MXFP8 format."""
    t_scale, t_lp = to_mxfp(t, format="mxfp8")
    return t_lp, t_scale


def calculate_flops(batch, seq_len, in_features, out_features):
    """Calculate FLOPs for GEMM."""
    return 2 * batch * seq_len * in_features * out_features


def calculate_memory_bytes(batch, seq_len, in_features, out_features):
    """Calculate total memory bytes accessed for MXFP8 with breakdown."""
    # MXFP8: weight=FP8 (1 byte) + scale=FP8 (1 byte per 32 elements)
    # Activation: BF16 input (2 bytes, but quantized to FP8) + BF16 output (2 bytes)
    input_bytes = batch * seq_len * in_features * 1  # FP8
    input_scale_bytes = batch * seq_len * in_features // 32  # FP8 scale
    weight_bytes = in_features * out_features * 1  # FP8
    weight_scale_bytes = in_features * out_features // 32  # FP8 scale
    output_bytes = batch * seq_len * out_features * 2  # BF16

    breakdown = {
        "activation": input_bytes + input_scale_bytes,
        "weight": weight_bytes + weight_scale_bytes,
        "output": output_bytes,
        "runtime": 0,
    }

    total = input_bytes + input_scale_bytes + weight_bytes + weight_scale_bytes + output_bytes
    return total, breakdown


def benchmark_mxfp8_gemm(name, batch, seq_len, in_features, out_features, profiling_info=None):
    """Benchmark MXFP8 GEMM with CPU→XPU workflow.

    Workflow:
    1. Prepare BF16 inputs and weights on CPU
    2. Transfer to XPU (not measured)
    3. Benchmark: Quantize to MXFP8 + fp8_gemm kernel (measured together)

    Note: Quantization is included in benchmark timing as it's part of the
    actual computation workload in production inference.
    """
    # Check if test should be skipped due to memory constraints
    expected_memory_mb = estimate_mxfp8_memory_mb(batch, seq_len, in_features, out_features)
    should_skip, skip_reason = should_skip_test_due_to_memory(expected_memory_mb, name)

    if should_skip:
        pytest.skip(skip_reason)

    m = batch * seq_len
    n = out_features
    k = in_features

    # Step 1: Prepare BF16 tensors on CPU
    inputs_bf16 = torch.randn((m, k), dtype=torch.bfloat16, device="cpu") * 0.01
    weights_bf16 = torch.randn((n, k), dtype=torch.bfloat16, device="cpu") * 0.01

    # Step 2: Transfer to XPU (not measured)
    inputs_bf16_xpu = inputs_bf16.to("xpu")
    weights_bf16_xpu = weights_bf16.to("xpu")

    # Reset peak memory stats before measurement
    torch.xpu.empty_cache()
    torch.xpu.reset_peak_memory_stats()

    # Step 3: Warmup (including quantization)
    if BENCHMARK_MODE:
        for _ in range(WARMUP):
            # Quantize
            inputs_lp, inputs_scale = _convert_to_mxfp8(inputs_bf16_xpu)
            weights_lp, weights_scale = _convert_to_mxfp8(weights_bf16_xpu)
            weights_t = weights_lp.transpose(0, 1).contiguous()
            # GEMM
            output = fp8_gemm(
                inputs_lp,
                weights_t,
                torch.bfloat16,
                inputs_scale,
                weights_scale,
                torch.Tensor(),
            )
            torch.xpu.synchronize()
            # Free memory immediately
            del inputs_lp, inputs_scale, weights_lp, weights_scale, weights_t, output
            torch.xpu.empty_cache()

    # Step 4: Benchmark (including quantization in timing)
    latencies = []
    num_runs = RUNS if BENCHMARK_MODE else 1
    for _ in range(num_runs):
        torch.xpu.synchronize()
        start = torch.xpu.Event(enable_timing=True)
        end = torch.xpu.Event(enable_timing=True)

        start.record()
        # Quantize to MXFP8 (measured)
        inputs_lp_xpu, inputs_scale_xpu = _convert_to_mxfp8(inputs_bf16_xpu)
        weights_lp_xpu, weights_scale_xpu = _convert_to_mxfp8(weights_bf16_xpu)
        weights_t_xpu = weights_lp_xpu.transpose(0, 1).contiguous()

        # GEMM (measured)
        output = fp8_gemm(
            inputs_lp_xpu,
            weights_t_xpu,
            torch.bfloat16,
            inputs_scale_xpu,
            weights_scale_xpu,
            torch.Tensor(),
        )
        end.record()

        torch.xpu.synchronize()
        latencies.append(start.elapsed_time(end))

        # Verify output shape before freeing
        expected_shape = (m, n)
        assert output.shape == expected_shape, f"Output shape {output.shape} != expected {expected_shape}"

        # Free memory immediately after timing
        del inputs_lp_xpu, inputs_scale_xpu, weights_lp_xpu, weights_scale_xpu, weights_t_xpu, output
        torch.xpu.empty_cache()

    # Calculate metrics
    avg_ms = np.mean(latencies)
    std_ms = np.std(latencies)

    total_flops = calculate_flops(batch, seq_len, in_features, out_features)
    total_memory_bytes, memory_breakdown = calculate_memory_bytes(batch, seq_len, in_features, out_features)

    tflops = (total_flops / (avg_ms / 1000)) / 1e12 if avg_ms > 0 else 0
    memory_bw_gbs = (total_memory_bytes / (avg_ms / 1000)) / 1e9 if avg_ms > 0 else 0

    # Get peak memory usage from XPU
    peak_memory_mb = 0
    try:
        peak_memory_mb = torch.xpu.max_memory_allocated() / (1024 ** 2)
        torch.xpu.reset_peak_memory_stats()
    except:
        pass

    result = {
        "name": name,
        "avg_ms": avg_ms,
        "std_ms": std_ms,
        "tflops": tflops,
        "memory_bw_gbs": memory_bw_gbs,
        "peak_memory_mb": peak_memory_mb,
        "memory_breakdown": memory_breakdown,
        "profiling_info": profiling_info,
    }

    TEST_RESULTS.append(result)

    # Print with memory info
    mem_str = f"Peak: {peak_memory_mb:.1f}MB"
    if memory_breakdown:
        act_mb = memory_breakdown.get("activation", 0) / (1024 ** 2)
        weight_mb = memory_breakdown.get("weight", 0) / (1024 ** 2)
        out_mb = memory_breakdown.get("output", 0) / (1024 ** 2)
        mem_str += f" (Act: {act_mb:.1f}MB, Weight: {weight_mb:.1f}MB, Out: {out_mb:.1f}MB)"

    print(f"\n{result['name']}: {result['avg_ms']:.3f}ms ±{result['std_ms']:.3f}ms, "
          f"{result['tflops']:.2f} TFLOPs, {result['memory_bw_gbs']:.2f} GB/s, {mem_str}")

    return result


# ============================================================================
# MXFP8 Linear Operations
# ============================================================================


class TestMXFP8LinearOps:
    """Test MXFP8 W8A8 quantized linear operations."""

    def test_mxfp8_qkv_projection(self):
        """Test MXFP8 QKV projection (5120 -> 15360)."""
        benchmark_mxfp8_gemm(
            "MXFP8 QKV Projection",
            BATCH_SIZE,
            SEQ_LEN,
            HIDDEN_DIM,
            3 * HIDDEN_DIM,
            profiling_info="T2V: 16 calls | S2V: 24 calls",
        )

    def test_mxfp8_output_projection(self):
        """Test MXFP8 attention output projection (5120 -> 5120)."""
        benchmark_mxfp8_gemm(
            "MXFP8 Attn Output Projection",
            BATCH_SIZE,
            SEQ_LEN,
            HIDDEN_DIM,
            HIDDEN_DIM,
        )

    def test_mxfp8_cross_attn_q_projection(self):
        """Test MXFP8 cross-attention Q projection (5120 -> 5120)."""
        benchmark_mxfp8_gemm(
            "MXFP8 Cross-Attn Q Projection",
            BATCH_SIZE,
            SEQ_LEN,
            HIDDEN_DIM,
            HIDDEN_DIM,
        )

    def test_mxfp8_cross_attn_kv_projection(self):
        """Test MXFP8 cross-attention K/V projection (5120 -> 10240)."""
        benchmark_mxfp8_gemm(
            "MXFP8 Cross-Attn K/V Projection",
            BATCH_SIZE,
            TEXT_SEQ_LEN,
            HIDDEN_DIM,
            2 * HIDDEN_DIM,
        )

    def test_mxfp8_ffn_upproject(self):
        """Test MXFP8 FFN upproject (5120 -> 13824)."""
        benchmark_mxfp8_gemm(
            "MXFP8 FFN Upproject",
            BATCH_SIZE,
            SEQ_LEN,
            HIDDEN_DIM,
            FFN_DIM,
            profiling_info="T2V: 16 calls | S2V: 24 calls",
        )

    def test_mxfp8_ffn_downproject(self):
        """Test MXFP8 FFN downproject (13824 -> 5120)."""
        benchmark_mxfp8_gemm(
            "MXFP8 FFN Downproject",
            BATCH_SIZE,
            SEQ_LEN,
            FFN_DIM,
            HIDDEN_DIM,
            profiling_info="T2V: 16 calls | S2V: 24 calls",
        )


def generate_markdown_report(output_file="wan22_mxfp8_report.md"):
    """Generate Markdown report from MXFP8 test results."""
    if not TEST_RESULTS:
        return

    total_peak_mem = sum(r.get("peak_memory_mb", 0) for r in TEST_RESULTS)
    md = f"""# WAN 2.2 MXFP8 Operations Test Report

## Summary
| Metric | Value |
|--------|-------|
| Total Tests | {len(TEST_RESULTS)} |
| Total TFLOPs | {sum(r["tflops"] for r in TEST_RESULTS):.2f} |
| Avg Memory BW | {np.mean([r["memory_bw_gbs"] for r in TEST_RESULTS]):.2f} GB/s |
| Total Peak Memory | {total_peak_mem:.1f} MB |

## Detailed Results

| Test Name | Latency (ms) | TFLOPs | Memory BW (GB/s) | Peak Mem (MB) | Memory Breakdown (MB) | Notes |
|-----------|--------------|--------|------------------|---------------|----------------------|-------|
"""

    for result in TEST_RESULTS:
        profiling = result.get("profiling_info", "")
        peak_mem = result.get("peak_memory_mb", 0)
        mem_breakdown = result.get("memory_breakdown", {})

        # Format memory breakdown
        mem_breakdown_str = ""
        if mem_breakdown:
            act_mb = mem_breakdown.get("activation", 0) / (1024 ** 2)
            weight_mb = mem_breakdown.get("weight", 0) / (1024 ** 2)
            out_mb = mem_breakdown.get("output", 0) / (1024 ** 2)
            mem_breakdown_str = f"A:{act_mb:.1f} W:{weight_mb:.1f} O:{out_mb:.1f}"

        md += f"| {result['name']} | {result['avg_ms']:.3f} | {result['tflops']:.2f} | "
        md += f"{result['memory_bw_gbs']:.2f} | {peak_mem:.1f} | {mem_breakdown_str} | {profiling} |\n"

    with open(output_file, "w") as f:
        f.write(md)

    print(f"\n✅ Markdown report generated: {output_file}")


def pytest_sessionfinish(session, exitstatus):
    """Generate report after all tests complete."""
    if TEST_RESULTS:
        generate_markdown_report()


if __name__ == "__main__":
    pytest.main([__file__, "-v", "-s"])
    # Ensure report is generated even when run as script
    if TEST_RESULTS:
        generate_markdown_report()
