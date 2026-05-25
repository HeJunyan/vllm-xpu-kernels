"""
MXFP8 Quantized GEMM tests for WAN 2.2
Tests MXFP8 W8A8 quantization with same shapes as BF16 linear operations

Usage:
```bash
# Run all tests with accurate benchmarking (default)
python -m pytest test_wan22_mxfp8_ops.py -v -s

# Run all tests in fast mode (quick validation)
BENCHMARK_MODE=0 python -m pytest test_wan22_mxfp8_ops.py -v -s
```
"""

import os
import sys

import numpy as np
import pytest
import torch

# Test device configuration
DEVICE = "xpu" if torch.xpu.is_available() else "cpu"

if DEVICE == "cpu":
    pytest.skip("MXFP8 tests require XPU", allow_module_level=True)

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
RUNS = 5

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
    """Calculate total memory bytes accessed for MXFP8."""
    # MXFP8: weight=FP8 (1 byte) + scale=FP8 (1 byte per 32 elements)
    # Activation: BF16 input (2 bytes, but quantized to FP8) + BF16 output (2 bytes)
    input_bytes = batch * seq_len * in_features * 1  # FP8
    input_scale_bytes = batch * seq_len * in_features // 32  # FP8 scale
    weight_bytes = in_features * out_features * 1  # FP8
    weight_scale_bytes = in_features * out_features // 32  # FP8 scale
    output_bytes = batch * seq_len * out_features * 2  # BF16
    return input_bytes + input_scale_bytes + weight_bytes + weight_scale_bytes + output_bytes


def benchmark_mxfp8_gemm(name, batch, seq_len, in_features, out_features, profiling_info=None):
    """Benchmark MXFP8 GEMM with CPU→XPU workflow."""
    m = batch * seq_len
    n = out_features
    k = in_features

    # Step 1: Prepare on CPU
    # Generate random inputs and weights in BF16
    inputs_bf16 = torch.randn((m, k), dtype=torch.bfloat16, device="cpu") * 0.01
    weights_bf16 = torch.randn((n, k), dtype=torch.bfloat16, device="cpu") * 0.01

    # Convert to MXFP8 on CPU
    inputs_lp, inputs_scale = _convert_to_mxfp8(inputs_bf16)
    weights_lp, weights_scale = _convert_to_mxfp8(weights_bf16)

    # Step 2: Transfer to XPU (not measured)
    inputs_lp_xpu = inputs_lp.to("xpu")
    inputs_scale_xpu = inputs_scale.to("xpu")
    weights_lp_xpu = weights_lp.to("xpu")
    weights_scale_xpu = weights_scale.to("xpu")
    weights_t_xpu = weights_lp_xpu.transpose(0, 1).contiguous()

    # Step 3: Warmup
    if BENCHMARK_MODE:
        for _ in range(WARMUP):
            _ = fp8_gemm(
                inputs_lp_xpu,
                weights_t_xpu,
                torch.bfloat16,
                inputs_scale_xpu,
                weights_scale_xpu,
                torch.Tensor(),
            )
            torch.xpu.synchronize()

    # Step 4: Benchmark
    latencies = []
    num_runs = RUNS if BENCHMARK_MODE else 1
    for _ in range(num_runs):
        torch.xpu.synchronize()
        start = torch.xpu.Event(enable_timing=True)
        end = torch.xpu.Event(enable_timing=True)

        start.record()
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

    # Verify output shape
    expected_shape = (m, n)
    assert output.shape == expected_shape, f"Output shape {output.shape} != expected {expected_shape}"

    # Calculate metrics
    avg_ms = np.mean(latencies)
    std_ms = np.std(latencies)

    total_flops = calculate_flops(batch, seq_len, in_features, out_features)
    total_memory_bytes = calculate_memory_bytes(batch, seq_len, in_features, out_features)

    tflops = (total_flops / (avg_ms / 1000)) / 1e12 if avg_ms > 0 else 0
    memory_bw_gbs = (total_memory_bytes / (avg_ms / 1000)) / 1e9 if avg_ms > 0 else 0

    result = {
        "name": name,
        "avg_ms": avg_ms,
        "std_ms": std_ms,
        "tflops": tflops,
        "memory_bw_gbs": memory_bw_gbs,
        "profiling_info": profiling_info,
    }

    TEST_RESULTS.append(result)
    print(
        f"\n{result['name']}: {result['avg_ms']:.3f}ms ±{result['std_ms']:.3f}ms, "
        f"{result['tflops']:.2f} TFLOPs, {result['memory_bw_gbs']:.2f} GB/s"
    )
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


if __name__ == "__main__":
    pytest.main([__file__, "-v", "-s"])
