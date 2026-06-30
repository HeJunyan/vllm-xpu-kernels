"""
Mini kernel tests for WAN 2.2 with reduced shapes for quick CI validation.

Covers the same operations as test_wan22_kernels_ops_bf16.py and
test_wan22_mxfp8_ops.py but with num_tokens=128, num_heads=1.

Usage:
    python -m pytest test_wan22_kernels_mini.py -v -s
    BENCHMARK_MODE=0 python -m pytest test_wan22_kernels_mini.py -v -s
"""

import os
import sys

import numpy as np
import pytest
import torch

DEVICE = "xpu" if torch.xpu.is_available() else "cpu"

# Mini shapes
BATCH_SIZE = 1
NUM_TOKENS = 128
NUM_HEADS = 1
HEAD_DIM = 128
HIDDEN_DIM = 128
FFN_DIM = 512
TEXT_SEQ_LEN = 32

WARMUP = 1
RUNS = 1
BENCHMARK_MODE = os.environ.get("BENCHMARK_MODE", "1") != "0"


def benchmark_fn(name, fn, warmup=WARMUP, runs=RUNS):
    """Simple benchmark helper. Returns avg latency in ms."""
    if DEVICE == "cpu":
        pytest.skip("Kernel tests require XPU")

    if BENCHMARK_MODE:
        for _ in range(warmup):
            fn()
            torch.xpu.synchronize()

    latencies = []
    for _ in range(runs):
        torch.xpu.synchronize()
        start = torch.xpu.Event(enable_timing=True)
        end = torch.xpu.Event(enable_timing=True)
        start.record()
        fn()
        end.record()
        torch.xpu.synchronize()
        latencies.append(start.elapsed_time(end))

    avg_ms = np.mean(latencies)
    print(f"\n  {name}: {avg_ms:.3f} ms")
    return avg_ms


# ============================================================================
# BF16 Flash Attention
# ============================================================================


class TestFlashAttentionMini:
    """Flash attention with num_tokens=128, num_heads=1."""

    def test_flash_attn_varlen_self(self):
        """Self-attention: Q/K/V [128, 1, 128]."""
        if DEVICE == "cpu":
            pytest.skip("Kernel tests require XPU")

        try:
            from vllm_xpu_kernels.flash_attn_interface import flash_attn_varlen_func
        except ImportError:
            pytest.skip("vllm_xpu_kernels not installed")

        q = torch.randn(NUM_TOKENS, NUM_HEADS, HEAD_DIM, device="xpu", dtype=torch.bfloat16)
        k = torch.randn(NUM_TOKENS, NUM_HEADS, HEAD_DIM, device="xpu", dtype=torch.bfloat16)
        v = torch.randn(NUM_TOKENS, NUM_HEADS, HEAD_DIM, device="xpu", dtype=torch.bfloat16)
        cu_seqlens = torch.tensor([0, NUM_TOKENS], dtype=torch.int32, device="xpu")
        softmax_scale = 1.0 / (HEAD_DIM ** 0.5)

        def run():
            return flash_attn_varlen_func(
                q, k, v,
                cu_seqlens_q=cu_seqlens,
                cu_seqlens_k=cu_seqlens,
                max_seqlen_q=NUM_TOKENS,
                max_seqlen_k=NUM_TOKENS,
                dropout_p=0.0,
                softmax_scale=softmax_scale,
                causal=False,
            )

        benchmark_fn("Flash Attn Self [128, 1, 128]", run)

    def test_flash_attn_varlen_cross(self):
        """Cross-attention: Q [128, 1, 128], K/V [32, 1, 128]."""
        if DEVICE == "cpu":
            pytest.skip("Kernel tests require XPU")

        try:
            from vllm_xpu_kernels.flash_attn_interface import flash_attn_varlen_func
        except ImportError:
            pytest.skip("vllm_xpu_kernels not installed")

        q = torch.randn(NUM_TOKENS, NUM_HEADS, HEAD_DIM, device="xpu", dtype=torch.bfloat16)
        k = torch.randn(TEXT_SEQ_LEN, NUM_HEADS, HEAD_DIM, device="xpu", dtype=torch.bfloat16)
        v = torch.randn(TEXT_SEQ_LEN, NUM_HEADS, HEAD_DIM, device="xpu", dtype=torch.bfloat16)
        cu_seqlens_q = torch.tensor([0, NUM_TOKENS], dtype=torch.int32, device="xpu")
        cu_seqlens_k = torch.tensor([0, TEXT_SEQ_LEN], dtype=torch.int32, device="xpu")
        softmax_scale = 1.0 / (HEAD_DIM ** 0.5)

        def run():
            return flash_attn_varlen_func(
                q, k, v,
                cu_seqlens_q=cu_seqlens_q,
                cu_seqlens_k=cu_seqlens_k,
                max_seqlen_q=NUM_TOKENS,
                max_seqlen_k=TEXT_SEQ_LEN,
                dropout_p=0.0,
                softmax_scale=softmax_scale,
                causal=False,
            )

        benchmark_fn("Flash Attn Cross [128x32, 1, 128]", run)


# ============================================================================
# BF16 Normalization & Activation
# ============================================================================


class TestNormActivationMini:
    """Normalization and activation ops with seq_len=128."""

    def test_layer_norm(self):
        """LayerNorm: [1, 128, 128]."""
        if DEVICE == "cpu":
            pytest.skip("Kernel tests require XPU")

        x = torch.randn(BATCH_SIZE, NUM_TOKENS, HEAD_DIM, device="xpu", dtype=torch.bfloat16)

        def run():
            return torch.nn.functional.layer_norm(x.float(), [HEAD_DIM], eps=1e-6).to(torch.bfloat16)

        benchmark_fn("LayerNorm [128, 128]", run)


    def test_silu(self):
        """SiLU: [1, 128, 128]."""
        if DEVICE == "cpu":
            pytest.skip("Kernel tests require XPU")

        x = torch.randn(BATCH_SIZE, NUM_TOKENS, HEAD_DIM, device="xpu", dtype=torch.bfloat16)

        def run():
            return torch.nn.functional.silu(x)

        benchmark_fn("SiLU [128, 128]", run)

    def test_gelu(self):
        """GELU: [1, 128, 128]."""
        if DEVICE == "cpu":
            pytest.skip("Kernel tests require XPU")

        x = torch.randn(BATCH_SIZE, NUM_TOKENS, HEAD_DIM, device="xpu", dtype=torch.bfloat16)

        def run():
            return torch.nn.functional.gelu(x, approximate="tanh")

        benchmark_fn("GELU [128, 128]", run)


# ============================================================================
# BF16 Element-wise & Memory Ops
# ============================================================================


class TestElementWiseMini:
    """Element-wise operations with seq_len=128."""

    def test_elementwise_add(self):
        """Residual add: [1, 128, 128]."""
        if DEVICE == "cpu":
            pytest.skip("Kernel tests require XPU")

        x = torch.randn(BATCH_SIZE, NUM_TOKENS, HIDDEN_DIM, device="xpu", dtype=torch.bfloat16)
        residual = torch.randn_like(x)

        def run():
            return x + residual

        benchmark_fn("Element-wise Add [128, 128]", run)

    def test_elementwise_mul(self):
        """Scale mul: [1, 128, 128]."""
        if DEVICE == "cpu":
            pytest.skip("Kernel tests require XPU")

        x = torch.randn(BATCH_SIZE, NUM_TOKENS, HIDDEN_DIM, device="xpu", dtype=torch.bfloat16)
        scale = torch.randn(BATCH_SIZE, 1, HIDDEN_DIM, device="xpu", dtype=torch.bfloat16)

        def run():
            return x * (1 + scale)

        benchmark_fn("Element-wise Mul [128, 128]", run)

    def test_dtype_conversion(self):
        """BF16 -> FP32 -> BF16: [1, 128, 128]."""
        if DEVICE == "cpu":
            pytest.skip("Kernel tests require XPU")

        x = torch.randn(BATCH_SIZE, NUM_TOKENS, HIDDEN_DIM, device="xpu", dtype=torch.bfloat16)

        def run():
            return x.float().to(torch.bfloat16)

        benchmark_fn("BF16->FP32->BF16 [128, 128]", run)

    def test_contiguous_copy(self):
        """Transpose + contiguous: [1, 128, 1, 128] -> [1, 1, 128, 128]."""
        if DEVICE == "cpu":
            pytest.skip("Kernel tests require XPU")

        x = torch.randn(BATCH_SIZE, NUM_TOKENS, NUM_HEADS, HEAD_DIM, device="xpu", dtype=torch.bfloat16)

        def run():
            return x.transpose(1, 2).contiguous()

        benchmark_fn("Contiguous Copy [128, 1, 128]", run)


# ============================================================================
# BF16 RoPE
# ============================================================================


class TestRoPEMini:
    """RoPE with num_tokens=128, num_heads=1."""

    def test_rope_eager(self):
        """RoPE (eager): [1, 128, 1, 128]."""
        if DEVICE == "cpu":
            pytest.skip("Kernel tests require XPU")

        x = torch.randn(BATCH_SIZE, NUM_TOKENS, NUM_HEADS, HEAD_DIM, device="xpu", dtype=torch.bfloat16)
        cos = torch.randn(BATCH_SIZE, NUM_TOKENS, 1, HEAD_DIM // 2, device="xpu", dtype=torch.bfloat16)
        sin = torch.randn(BATCH_SIZE, NUM_TOKENS, 1, HEAD_DIM // 2, device="xpu", dtype=torch.bfloat16)

        def run():
            x1, x2 = x.unflatten(-1, (-1, 2)).unbind(-1)
            rotated = torch.stack((x1 * cos - x2 * sin, x1 * sin + x2 * cos), dim=-1)
            return rotated.flatten(-2, -1).to(x.dtype)

        benchmark_fn("RoPE Eager [128, 1, 128]", run)

    def test_rope_sycl(self):
        """RoPE via vllm_xpu_kernels: [1, 128, 1, 128]."""
        if DEVICE == "cpu":
            pytest.skip("Kernel tests require XPU")

        try:
            from vllm_xpu_kernels.rotary import apply_rotary_emb
        except ImportError:
            pytest.skip("vllm_xpu_kernels not installed")

        x = torch.randn(BATCH_SIZE, NUM_TOKENS, NUM_HEADS, HEAD_DIM, device="xpu", dtype=torch.bfloat16)
        cos = torch.randn(NUM_TOKENS, HEAD_DIM // 2, device="xpu", dtype=torch.bfloat16)
        sin = torch.randn(NUM_TOKENS, HEAD_DIM // 2, device="xpu", dtype=torch.bfloat16)

        def run():
            return apply_rotary_emb(x, cos, sin, is_neox=False)

        benchmark_fn("RoPE SYCL [128, 1, 128]", run)


# ============================================================================
# MXFP8 Quantized GEMM
# ============================================================================


class TestMXFP8Mini:
    """MXFP8 W8A8 quantized GEMM with num_tokens=128."""

    @pytest.fixture(autouse=True)
    def _setup_mxfp8(self):
        """Import MXFP8 utilities or skip."""
        if DEVICE == "cpu":
            pytest.skip("MXFP8 tests require XPU")

        # Fix sys.path for test imports
        tests_dir = os.path.abspath(os.path.join(os.path.dirname(__file__), ".."))
        if tests_dir not in sys.path:
            sys.path.insert(0, tests_dir)

        try:
            from ops.mx_utils import to_mxfp
            from register_ops import fp8_gemm
            self._to_mxfp = to_mxfp
            self._fp8_gemm = fp8_gemm
        except ImportError as e:
            pytest.skip(f"MXFP8 utilities not available: {e}")

    def _run_mxfp8_gemm(self, name, m, n, k):
        """Run MXFP8 GEMM benchmark."""
        inputs_bf16 = torch.randn((m, k), dtype=torch.bfloat16, device="xpu") * 0.01
        weights_bf16 = torch.randn((n, k), dtype=torch.bfloat16, device="xpu") * 0.01

        def run():
            # to_mxfp returns (scale_e8m0, data_fp8)
            inputs_scale, inputs_lp = self._to_mxfp(inputs_bf16, format="mxfp8")
            weights_scale, weights_lp = self._to_mxfp(weights_bf16, format="mxfp8")
            weights_t = weights_lp.transpose(0, 1).contiguous()
            return self._fp8_gemm(
                inputs_lp, weights_t, torch.bfloat16,
                inputs_scale, weights_scale, torch.Tensor(),
            )

        benchmark_fn(name, run)

    def test_mxfp8_qkv_projection(self):
        """MXFP8 QKV: [128, 128] x [384, 128]^T."""
        self._run_mxfp8_gemm(
            "MXFP8 QKV [128, 128]->[128, 384]",
            BATCH_SIZE * NUM_TOKENS, 3 * HIDDEN_DIM, HIDDEN_DIM,
        )


# ============================================================================
# BF16 Conv Operations
# ============================================================================


class TestConvMini:
    """Conv1D/2D/3D with mini shapes."""

    def test_conv1d(self):
        """Conv1D: [1, 128, 128] -> [1, 128, 128]."""
        if DEVICE == "cpu":
            pytest.skip("Kernel tests require XPU")

        x = torch.randn(BATCH_SIZE, 128, 128, device="xpu", dtype=torch.bfloat16)
        conv = torch.nn.Conv1d(128, 128, kernel_size=3, padding=1, device="xpu", dtype=torch.bfloat16)

        def run():
            return conv(x)

        benchmark_fn("Conv1D [1, 128, 128]", run)

    def test_conv2d(self):
        """Conv2D: [1, 128, 16, 16] -> [1, 128, 16, 16]."""
        if DEVICE == "cpu":
            pytest.skip("Kernel tests require XPU")

        x = torch.randn(BATCH_SIZE, 128, 16, 16, device="xpu", dtype=torch.bfloat16)
        conv = torch.nn.Conv2d(128, 128, kernel_size=3, padding=1, device="xpu", dtype=torch.bfloat16)

        def run():
            return conv(x)

        benchmark_fn("Conv2D [1, 128, 16, 16]", run)

    def test_conv3d(self):
        """Conv3D: [1, 128, 4, 8, 8] -> [1, 128, 4, 8, 8]."""
        if DEVICE == "cpu":
            pytest.skip("Kernel tests require XPU")

        x = torch.randn(BATCH_SIZE, 128, 4, 8, 8, device="xpu", dtype=torch.bfloat16)
        conv = torch.nn.Conv3d(128, 128, kernel_size=3, padding=1, device="xpu", dtype=torch.bfloat16)

        def run():
            return conv(x)

        benchmark_fn("Conv3D [1, 128, 4, 8, 8]", run)

    def test_conv3d_vae_small(self):
        """Conv3D VAE-like: [1, 3, 4, 16, 16] -> [1, 128, 4, 16, 16]."""
        if DEVICE == "cpu":
            pytest.skip("Kernel tests require XPU")

        x = torch.randn(BATCH_SIZE, 3, 4, 16, 16, device="xpu", dtype=torch.bfloat16)
        conv = torch.nn.Conv3d(3, 128, kernel_size=3, padding=1, device="xpu", dtype=torch.bfloat16)

        def run():
            return conv(x)

        benchmark_fn("Conv3D VAE [1, 3, 4, 16, 16]->[1, 128, 4, 16, 16]", run)


class TestConv1x1Mini:
    """Conv2D/Conv3D kernel_size=1 tests — known CRI simulator crash shapes.

    These test the specific configurations that crash the CRI simulator:
    - Conv2d(k=1) at spatial <= 8x8
    - Conv3d(k=1) at spatial >= 32x32
    See: sanity_tests.txt "Known CRI Simulator Crash Shapes" section.
    """

    def test_conv2d_1x1_attn_proj_8x8(self):
        """Conv2d(128, 128, k=1) @ 8x8 — VAE attention projection (CRASHES SIM)."""
        if DEVICE == "cpu":
            pytest.skip("Kernel tests require XPU")

        x = torch.randn(1, 128, 8, 8, device="xpu", dtype=torch.bfloat16)
        conv = torch.nn.Conv2d(128, 128, kernel_size=1, device="xpu", dtype=torch.bfloat16)

        def run():
            return conv(x)

        benchmark_fn("Conv2D 1x1 [1, 128, 8, 8]", run)

    def test_conv2d_1x1_attn_qkv_8x8(self):
        """Conv2d(128, 384, k=1) @ 8x8 — VAE attention QKV (CRASHES SIM)."""
        if DEVICE == "cpu":
            pytest.skip("Kernel tests require XPU")

        x = torch.randn(1, 128, 8, 8, device="xpu", dtype=torch.bfloat16)
        conv = torch.nn.Conv2d(128, 384, kernel_size=1, device="xpu", dtype=torch.bfloat16)

        def run():
            return conv(x)

        benchmark_fn("Conv2D 1x1 QKV [1, 128, 8, 8]", run)

    def test_conv2d_1x1_16x16(self):
        """Conv2d(128, 128, k=1) @ 16x16 — should PASS."""
        if DEVICE == "cpu":
            pytest.skip("Kernel tests require XPU")

        x = torch.randn(1, 128, 16, 16, device="xpu", dtype=torch.bfloat16)
        conv = torch.nn.Conv2d(128, 128, kernel_size=1, device="xpu", dtype=torch.bfloat16)

        def run():
            return conv(x)

        benchmark_fn("Conv2D 1x1 [1, 128, 16, 16]", run)

    def test_conv3d_1x1_shortcut_16x16(self):
        """Conv3d(4, 8, k=1) @ (1,16,16) — VAE conv_shortcut (should PASS)."""
        if DEVICE == "cpu":
            pytest.skip("Kernel tests require XPU")

        x = torch.randn(1, 4, 1, 16, 16, device="xpu", dtype=torch.bfloat16)
        conv = torch.nn.Conv3d(4, 8, kernel_size=1, device="xpu", dtype=torch.bfloat16)

        def run():
            return conv(x)

        benchmark_fn("Conv3D 1x1 [1, 4, 1, 16, 16]", run)

    def test_conv3d_1x1_shortcut_32x32(self):
        """Conv3d(4, 8, k=1) @ (1,32,32) — VAE conv_shortcut (CRASHES SIM)."""
        if DEVICE == "cpu":
            pytest.skip("Kernel tests require XPU")

        x = torch.randn(1, 4, 1, 32, 32, device="xpu", dtype=torch.bfloat16)
        conv = torch.nn.Conv3d(4, 8, kernel_size=1, device="xpu", dtype=torch.bfloat16)

        def run():
            return conv(x)

        benchmark_fn("Conv3D 1x1 [1, 4, 1, 32, 32]", run)


if __name__ == "__main__":
    pytest.main([__file__, "-v", "-s"])
