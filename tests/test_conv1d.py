# SPDX-License-Identifier: Apache-2.0
import pytest
import torch

from tests.allclose_default import get_default_atol, get_default_rtol
from tests.ops.conv1d_op import Conv1d
from tests.utils import seed_everything

DTYPES = [torch.half, torch.bfloat16, torch.float]
BATCH_SIZES = [1, 4, 16]
CHANNELS = [64, 128, 512]
WIDTHS = [32, 128, 1024]
KERNEL_SIZES = [3, 4, 7]
SEEDS = [0]
XPU_DEVICES = [
    f"xpu:{i}" for i in range(1 if torch.xpu.device_count() == 1 else 2)
]

# Override pytest parameters when enable mini pytest
MINI_PYTEST_PARAMS = {
    "default": {
        "batch_size": [1],
        "channels": [64],
        "width": [32],
        "kernel_size": [3],
    },
}


@pytest.mark.parametrize("kernel_size", KERNEL_SIZES)
@pytest.mark.parametrize("width", WIDTHS)
@pytest.mark.parametrize("channels", CHANNELS)
@pytest.mark.parametrize("batch_size", BATCH_SIZES)
@pytest.mark.parametrize("dtype", DTYPES)
@pytest.mark.parametrize("seed", SEEDS)
@pytest.mark.parametrize("device", XPU_DEVICES)
@torch.inference_mode()
def test_conv1d(
    kernel_size: int,
    width: int,
    channels: int,
    batch_size: int,
    dtype: torch.dtype,
    seed: int,
    device: str,
) -> None:
    """Test depthwise conv1d with padding = kernel_size - 1 (causal style)."""
    seed_everything(seed)
    torch.set_default_device(device)

    padding = kernel_size - 1
    layer = Conv1d(stride=1, padding=padding)

    x = torch.randn(batch_size, channels, width, dtype=dtype)
    w = torch.randn(channels, 1, kernel_size, dtype=dtype)

    out = layer(x, w)
    ref_out = layer.forward_native(x, w)

    torch.testing.assert_close(
        out,
        ref_out,
        atol=get_default_atol(out),
        rtol=get_default_rtol(out),
    )


@pytest.mark.parametrize("kernel_size", KERNEL_SIZES)
@pytest.mark.parametrize("width", WIDTHS)
@pytest.mark.parametrize("channels", CHANNELS)
@pytest.mark.parametrize("batch_size", BATCH_SIZES)
@pytest.mark.parametrize("dtype", DTYPES)
@pytest.mark.parametrize("seed", SEEDS)
@pytest.mark.parametrize("device", XPU_DEVICES)
@torch.inference_mode()
def test_conv1d_with_bias(
    kernel_size: int,
    width: int,
    channels: int,
    batch_size: int,
    dtype: torch.dtype,
    seed: int,
    device: str,
) -> None:
    """Test depthwise conv1d with bias."""
    seed_everything(seed)
    torch.set_default_device(device)

    padding = kernel_size - 1
    layer = Conv1d(stride=1, padding=padding)

    x = torch.randn(batch_size, channels, width, dtype=dtype)
    w = torch.randn(channels, 1, kernel_size, dtype=dtype)
    b = torch.randn(channels, dtype=dtype)

    out = layer(x, w, bias=b)
    ref_out = layer.forward_native(x, w, bias=b)

    torch.testing.assert_close(
        out,
        ref_out,
        atol=get_default_atol(out),
        rtol=get_default_rtol(out),
    )


@pytest.mark.parametrize("stride", [1, 2])
@pytest.mark.parametrize("dtype", DTYPES)
@pytest.mark.parametrize("seed", SEEDS)
@pytest.mark.parametrize("device", XPU_DEVICES)
@torch.inference_mode()
def test_conv1d_stride(
    stride: int,
    dtype: torch.dtype,
    seed: int,
    device: str,
) -> None:
    """Test conv1d with different stride values."""
    seed_everything(seed)
    torch.set_default_device(device)

    batch_size, channels, width, kernel_size = 4, 128, 128, 3
    padding = kernel_size - 1
    layer = Conv1d(stride=stride, padding=padding)

    x = torch.randn(batch_size, channels, width, dtype=dtype)
    w = torch.randn(channels, 1, kernel_size, dtype=dtype)

    out = layer(x, w)
    ref_out = layer.forward_native(x, w)

    torch.testing.assert_close(
        out,
        ref_out,
        atol=get_default_atol(out),
        rtol=get_default_rtol(out),
    )


@pytest.mark.parametrize("dtype", DTYPES)
@pytest.mark.parametrize("seed", SEEDS)
@pytest.mark.parametrize("device", XPU_DEVICES)
@torch.inference_mode()
def test_conv1d_no_padding(
    dtype: torch.dtype,
    seed: int,
    device: str,
) -> None:
    """Test conv1d without padding."""
    seed_everything(seed)
    torch.set_default_device(device)

    batch_size, channels, width, kernel_size = 4, 128, 128, 3
    layer = Conv1d(stride=1, padding=0)

    x = torch.randn(batch_size, channels, width, dtype=dtype)
    w = torch.randn(channels, 1, kernel_size, dtype=dtype)

    out = layer(x, w)
    ref_out = layer.forward_native(x, w)

    torch.testing.assert_close(
        out,
        ref_out,
        atol=get_default_atol(out),
        rtol=get_default_rtol(out),
    )
