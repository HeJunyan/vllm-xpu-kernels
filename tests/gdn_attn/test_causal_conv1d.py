# SPDX-License-Identifier: Apache-2.0
import pytest
import torch

from tests.allclose_default import get_default_atol, get_default_rtol
from tests.ops.conv1d_op import Conv1d
from tests.utils import seed_everything

#DTYPES = [torch.half, torch.bfloat16, torch.float]
DTYPES = [torch.bfloat16]
BATCH_SIZES = [1, 4, 16]
SEQUENCE_LENGTHS = [64, 128, 512]
WIDTHS = [4]
DIMS = [2048, 4096]
WITH_BIAS = [False]
SILU_ACTIVATION = [False, True]

SEED = 0
XPU_DEVICE = "xpu"

# Override pytest parameters when enable mini pytest
MINI_PYTEST_PARAMS = {
    "default": {
        "batch_size": [1],
        "channels": [64],
        "width": [32],
        "kernel_size": [3],
    },
}

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

    layer = Conv1d()

    x = torch.randn(batch_size, seqlen, dim, dtype=dtype)
    w = torch.randn(width, dim, dtype=dtype)
    b = None
    if has_bias:
        b = torch.randn(dim, dtype=dtype)

    out_ref = layer.forward_native(x, w, bias=b)
#    print("########## out.shape is :", out_ref)
    out_opt = layer.forward_native_optimized(x, w, bias=b)
#    print("########## 222 out_opt.shape is :", out_opt)

    torch.testing.assert_close(
        out_opt,
        out_ref,
        atol=get_default_atol(out_opt),
        rtol=get_default_rtol(out_opt),
    )
