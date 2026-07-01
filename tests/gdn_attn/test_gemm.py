# SPDX-License-Identifier: Apache-2.0
# SPDX-FileCopyrightText: Copyright contributors to the vLLM project
"""Unit tests for the device GEMM primitives in
``csrc/xpu/gdn_attn/xe_2/gemm.hpp``.

These primitives (``gemm_TTS``/``gemm_STS``/``gemm_TSS``/``gemm_TTS_k_multi``/
``gemm_TTS_fused_2A``) are device-only helpers used inside
``chunk_gated_delta_rule``. They are exercised here through the test-only
``gdn_gemm_test`` / ``gdn_gemm_test_fused_2a`` ops which run a single work-group
that computes one work-group tile of ``C = A @ B^T`` and copy it back to global
memory, so the result can be checked against a plain PyTorch reference.
"""

import pytest
import torch

import vllm_xpu_kernels._xpu_C  # noqa: F401

DEVICE = "xpu"

DTYPES = [torch.float16, torch.bfloat16]
SEEDS = [0, 7]

# Work-group tile is 64x64x32 for the streaming variants, so M=N=64 and K must
# be a multiple of 32. The register-fragment variants (STS/TSS) use the
# 16x16x16 tile (a single k-tile), so they only support M=N=K=16.
BIG_M = 64
BIG_N = 64
BIG_K = [32, 64, 128]

SMALL = 16

# Reduced parameters for the "mini" test scope.
MINI_PYTEST_PARAMS = {
    "default": {
        "dtype": [torch.float16],
        "seed": [0],
        "k": [32],
    },
}

pytestmark = pytest.mark.skipif(
    not (hasattr(torch, "xpu") and torch.xpu.is_available()),
    reason="requires an Intel XPU (XE2) device",
)


def _tol(dtype):
    if dtype == torch.bfloat16:
        return dict(atol=2e-2, rtol=2e-2)
    return dict(atol=1e-2, rtol=1e-2)


def _ref_matmul(a, b):
    # a: (M, K), b: (N, K) -> (M, N) accumulated in fp32, matching the
    # float accumulation of the DPAS op (inputs are truncated to `dtype`).
    return a.float() @ b.float().transpose(-1, -2)


@pytest.mark.parametrize("dtype", DTYPES)
@pytest.mark.parametrize("seed", SEEDS)
@pytest.mark.parametrize("k", BIG_K)
def test_gemm_tts(dtype, seed, k):
    torch.manual_seed(seed)
    a = torch.randn(BIG_M, k, dtype=dtype, device=DEVICE)
    b = torch.randn(BIG_N, k, dtype=dtype, device=DEVICE)
    c = torch.empty(BIG_M, BIG_N, dtype=torch.float32, device=DEVICE)

    torch.ops._xpu_C.gdn_gemm_test(c, a, b, None, "TTS")

    ref = _ref_matmul(a, b)
    torch.testing.assert_close(c, ref, **_tol(dtype))


@pytest.mark.parametrize("dtype", DTYPES)
@pytest.mark.parametrize("seed", SEEDS)
@pytest.mark.parametrize("k", BIG_K)
def test_gemm_tts_k_multi(dtype, seed, k):
    torch.manual_seed(seed)
    a = torch.randn(BIG_M, k, dtype=dtype, device=DEVICE)
    b = torch.randn(BIG_N, k, dtype=dtype, device=DEVICE)
    k_multi = torch.randn(k, dtype=torch.float32, device=DEVICE)
    c = torch.empty(BIG_M, BIG_N, dtype=torch.float32, device=DEVICE)

    torch.ops._xpu_C.gdn_gemm_test(c, a, b, k_multi, "k_multi")

    # A is scaled per contraction-column by k_multi before the matmul. The
    # kernel scales the (already dtype-rounded) A fragment and casts the result
    # back to `dtype` before the DPAS, so round the reference the same way.
    a_scaled = (a.float() * k_multi.unsqueeze(0)).to(dtype).float()
    ref = a_scaled @ b.float().transpose(-1, -2)
    torch.testing.assert_close(c, ref, **_tol(dtype))


@pytest.mark.parametrize("dtype", DTYPES)
@pytest.mark.parametrize("seed", SEEDS)
@pytest.mark.parametrize("k", BIG_K)
def test_gemm_tts_fused_2a(dtype, seed, k):
    torch.manual_seed(seed)
    a1 = torch.randn(BIG_M, k, dtype=dtype, device=DEVICE)
    a2 = torch.randn(BIG_M, k, dtype=dtype, device=DEVICE)
    b = torch.randn(BIG_N, k, dtype=dtype, device=DEVICE)
    c1 = torch.empty(BIG_M, BIG_N, dtype=torch.float32, device=DEVICE)
    c2 = torch.empty(BIG_M, BIG_N, dtype=torch.float32, device=DEVICE)

    torch.ops._xpu_C.gdn_gemm_test_fused_2a(c1, c2, a1, a2, b)

    torch.testing.assert_close(c1, _ref_matmul(a1, b), **_tol(dtype))
    torch.testing.assert_close(c2, _ref_matmul(a2, b), **_tol(dtype))


@pytest.mark.parametrize("dtype", DTYPES)
@pytest.mark.parametrize("seed", SEEDS)
@pytest.mark.parametrize("variant", ["STS", "TSS"])
def test_gemm_reg_fragment(dtype, seed, variant):
    torch.manual_seed(seed)
    a = torch.randn(SMALL, SMALL, dtype=dtype, device=DEVICE)
    b = torch.randn(SMALL, SMALL, dtype=dtype, device=DEVICE)
    c = torch.empty(SMALL, SMALL, dtype=torch.float32, device=DEVICE)

    torch.ops._xpu_C.gdn_gemm_test(c, a, b, None, variant)

    torch.testing.assert_close(c, _ref_matmul(a, b), **_tol(dtype))
