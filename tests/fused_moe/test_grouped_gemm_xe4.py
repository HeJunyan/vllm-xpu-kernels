# SPDX-License-Identifier: Apache-2.0
import random

import pytest
import torch

import vllm_xpu_kernels._xpu_C  # noqa: F401
from tests.utils import seed_everything
from vllm_xpu_kernels.fused_moe_interface import cutlass_grouped_gemm

pytestmark = pytest.mark.skipif(
    not torch.ops._xpu_C.is_jgs(0),
    reason="XE4 tests only run on JGS.")

DEVICE = "cpu"
KERNEL_DEVICE = "xpu"


def _to_kernel(x):
    return None if x is None else x.to(KERNEL_DEVICE)

# shape for Llama-4-scout
FUSED_MOE_MNK_FACTORS = [
    (1, 5120, 8192),
    (4, 5120, 8192),
    (16, 5120, 8192),
    (8192, 5120, 8192),
]
NUM_EXPERTS = [16]
TOP_KS = [1]

MINI_PYTEST_PARAMS = {
    "test_grouped_gemm": {
        "m,n,k": [
            (64, 64, 128),
            (64, 128, 256),
            (64, 256, 64),
            (128, 128, 128),
            (128, 256, 64),
            (256, 64, 128),
            (256, 256, 256),
        ],
        "e": [1, 2],
        "topk": [1],
        "dtype": [torch.float16, torch.bfloat16],
        "has_bias": [False]
    },
}


def random_partition(size_a: int, target: int):
    cuts = sorted(random.sample(range(target + size_a - 1), size_a - 1))
    cuts = [-1] + cuts + [target + size_a - 1]
    result = [cuts[i + 1] - cuts[i] - 1 for i in range(size_a)]
    return result


@pytest.mark.parametrize("m,n,k", FUSED_MOE_MNK_FACTORS)
@pytest.mark.parametrize("e", NUM_EXPERTS)
@pytest.mark.parametrize("topk", TOP_KS)
@pytest.mark.parametrize("dtype", [torch.float16, torch.bfloat16])
@pytest.mark.parametrize("has_bias", [False])
def test_grouped_gemm(m, n, k, e, topk, dtype, has_bias):
    seed_everything(7)
    num_experts = e
    rows_per_expert = random_partition(e, m * topk)
    assert (len(rows_per_expert) == e)
    # input
    input_A = torch.randn((sum(rows_per_expert), k),
                          dtype=dtype,
                          device=DEVICE).contiguous() / 10
    ref_A = input_A
    # weight
    input_B = torch.randn((num_experts, n, k), dtype=dtype, device=DEVICE) / 10
    input_B = input_B.transpose(-1, -2)  #.contiguous()
    if has_bias:
        bias = torch.randn((num_experts, n), dtype=dtype, device=DEVICE)
    else:
        bias = None

    output_dtype = torch.float16 if dtype == torch.float16 else torch.float32 # FIXME: bf16 output acc issue
    output = torch.empty((sum(rows_per_expert), n), dtype=output_dtype, device=DEVICE)
    output_kernel = output.to(KERNEL_DEVICE)
    cutlass_grouped_gemm(_to_kernel(input_A), None, _to_kernel(input_B), None,
                         _to_kernel(bias), output_kernel,
                         rows_per_expert, n, k, num_experts)
    output = output_kernel.cpu()
    # ref gg
    ref = []
    pre_token_sum = 0
    for i in range(num_experts):
        cur_token_num = rows_per_expert[i]
        if cur_token_num == 0:
            continue
        input = ref_A[pre_token_sum:pre_token_sum + cur_token_num, :]
        weight = input_B[i, :, :]
        expert_output = input.to(torch.float32) @ weight.to(torch.float32)
        if has_bias:
            expert_output += bias[i]
        ref.append(expert_output)
        pre_token_sum += cur_token_num
    ref = torch.cat(ref, dim=0)

    torch.testing.assert_close(output.to(torch.float32), ref, rtol=1e-2, atol=1e-2)
