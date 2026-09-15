# SPDX-License-Identifier: Apache-2.0

import pytest
import torch

import vllm_xpu_kernels._vllm_fa2_C  # noqa: F401
import vllm_xpu_kernels._xpu_C  # noqa: F401

pytestmark = pytest.mark.skipif(
    not torch.xpu.is_available(), reason="XPU is not available"
)


def _query(batch, length, dtype=torch.bfloat16, heads=32, head_dim=128):
    q = torch.empty(batch, heads, head_dim, dtype=dtype, device="xpu")
    k = torch.empty(1, 64, 4, head_dim, dtype=dtype, device="xpu")
    return torch.ops._vllm_fa2_C.get_paged_decode_num_splits(q, k, k, length)


def _require_measured_device():
    if not hasattr(torch.ops._vllm_fa2_C, "get_paged_decode_num_splits"):
        pytest.skip("Rebuild the FA2 binding for the split metadata query")
    if (not torch.ops._xpu_C.is_cri(0)
            or torch.xpu.get_device_properties(0).gpu_subslice_count != 32):
        pytest.skip("Policy expectations target the measured 32-core CRI")


@pytest.mark.parametrize("batch,expected", [
    (1, 13), (2, 13), (4, 8), (8, 4), (9, 3), (12, 2),
    (16, 2), (17, 1), (24, 1), (32, 1),
])
def test_cri_saturation_policy(batch, expected):
    _require_measured_device()
    assert _query(batch, 3501) == expected


@pytest.mark.parametrize("length,expected", [
    (1984, 1), (1985, 4), (2048, 4), (4032, 4), (4033, 5), (8192, 10),
])
def test_cri_saturation_policy_boundaries(length, expected):
    _require_measured_device()
    assert _query(8, length) == expected


@pytest.mark.parametrize("dtype,heads,head_dim", [
    (torch.float16, 32, 128),
    (torch.bfloat16, 16, 128),
    (torch.bfloat16, 32, 64),
])
def test_unmeasured_shapes_retain_legacy(dtype, heads, head_dim):
    _require_measured_device()
    assert _query(8, 3501, dtype, heads, head_dim) == 1


@pytest.mark.parametrize("length", [0, -1, 2**31])
def test_split_query_rejects_invalid_length(length):
    _require_measured_device()
    with pytest.raises(RuntimeError, match="positive int32"):
        _query(8, length)


def test_split_query_int32_length_does_not_overflow():
    _require_measured_device()
    assert _query(8, 2**31 - 1) == 16
