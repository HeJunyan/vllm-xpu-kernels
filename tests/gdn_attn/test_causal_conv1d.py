# SPDX-License-Identifier: Apache-2.0
import time

import pytest
import torch

from tests.allclose_default import get_default_atol, get_default_rtol
from tests.ops.conv1d_op import Conv1d
from tests.utils import seed_everything

#DTYPES = [torch.half, torch.bfloat16, torch.float]
DTYPES = [torch.float]
BATCH_SIZES = [1, 4]
SEQUENCE_LENGTHS = [64, 128, 512, 1024, 2048]
WIDTHS = [4]
DIMS = [2048, 4096, 8192]
WITH_BIAS = [False]
#SILU_ACTIVATION = [False, True]
SILU_ACTIVATION = [False]

SEED = 0
XPU_DEVICE = "xpu"

NUM_WARMUP_ITERS = 5
NUM_ITERS = 1000

# Override pytest parameters when enable mini pytest
MINI_PYTEST_PARAMS = {
    "default": {
        "batch_size": [1],
        "channels": [64],
        "width": [32],
        "kernel_size": [3],
    },
}


def _measure_latency_us(
    fn,
    num_warmup_iters: int = NUM_WARMUP_ITERS,
    num_iters: int = NUM_ITERS,
) -> float:
    """Measure average per-iteration latency in microseconds."""
    for _ in range(num_warmup_iters):
        fn()
    torch.xpu.synchronize()

    start = time.perf_counter()
    for _ in range(num_iters):
        fn()
    torch.xpu.synchronize()
    end = time.perf_counter()

    return (end - start) / num_iters * 1e6


@pytest.mark.parametrize("dtype", DTYPES)
@pytest.mark.parametrize("silu_activation", SILU_ACTIVATION)
@pytest.mark.parametrize("has_bias", WITH_BIAS)
@pytest.mark.parametrize("seqlen", SEQUENCE_LENGTHS)
@pytest.mark.parametrize("width", WIDTHS)
@pytest.mark.parametrize("dim", DIMS)
@pytest.mark.parametrize("batch_size", BATCH_SIZES)
@torch.inference_mode()
def test_causal_conv1d(
    batch_size: int,
    dim: int,
    width: int,
    seqlen: int,
    has_bias: bool,
    silu_activation: bool,
    dtype: torch.dtype,
) -> None:
    """Test depthwise conv1d with padding = kernel_size - 1 (causal style)."""
    seed_everything(SEED)
    torch.set_default_device(XPU_DEVICE)

    layer = Conv1d(batch_size, dim, width, has_bias, dtype)

    x = torch.randn(batch_size, seqlen, dim, dtype=dtype)

    out_ref = layer.forward_native(x)
    out_opt = layer.forward_native_optimized(x)
    out_triton = layer.forward_xpu_triton(x)

    torch.testing.assert_close(
        out_opt,
        out_ref,
        atol=get_default_atol(out_opt),
        rtol=get_default_rtol(out_opt),
    )
    torch.testing.assert_close(
        out_triton,
        out_ref,
        atol=get_default_atol(out_triton),
        rtol=get_default_rtol(out_triton),
    )

    # Performance measurement for each forward implementation.
    lat_native = _measure_latency_us(lambda: layer.forward_native(x))
    lat_optimized = _measure_latency_us(
        lambda: layer.forward_native_optimized(x))
    lat_triton = _measure_latency_us(
        lambda: layer.forward_xpu_triton(x))

    config_str = (f"batch={batch_size}, dim={dim}, width={width}, "
                  f"seqlen={seqlen}, bias={has_bias}, dtype={dtype}")
    print(f"\n[perf] {config_str}")
    print(f"  forward_native           : {lat_native:.2f} us")
    print(f"  forward_native_optimized : {lat_optimized:.2f} us")
    print(f"  forward_xpu_triton       : {lat_triton:.2f} us")
