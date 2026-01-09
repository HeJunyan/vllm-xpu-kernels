# SPDX-License-Identifier: Apache-2.0
import random

import pytest
import torch

from tests.utils import seed_everything
from vllm_xpu_kernels.fused_moe_interface import cutlass_grouped_gemm

DEVICE = "xpu"

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
        "m,n,k": [(1, 256, 128)],
        "e": [2],
        "topk": [1],
        "dtype": [torch.bfloat16],
        "has_bias": [True]
    },
    "test_grouped_gemm_mxfp": {
        "m,n,k": [(256, 128, 128)],
        "e": [2],
        "topk": [1],
        "recipe": ["mxfp8", "mxfp4"],
        "has_bias": [True]
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
@pytest.mark.parametrize("dtype", [torch.bfloat16, torch.float16])
@pytest.mark.parametrize("has_bias", [True, False])
def test_grouped_gemm(m, n, k, e, topk, dtype, has_bias):
    seed_everything(7)
    num_experts = e
    token_per_group = random_partition(e, m * topk)
    assert (len(token_per_group) == e)
    # input
    input_A = torch.randn((sum(token_per_group), k),
                          dtype=dtype,
                          device=DEVICE).contiguous()
    ref_A = input_A
    # weight
    input_B = torch.randn((num_experts, n, k), dtype=dtype, device=DEVICE)
    input_B = input_B.transpose(-1, -2).contiguous()
    if has_bias:
        bias = torch.randn((num_experts, n), dtype=dtype, device=DEVICE)
    else:
        bias = None

    # output offset
    output = torch.empty((sum(token_per_group), n), dtype=dtype, device=DEVICE)
    cutlass_grouped_gemm(input_A, None, input_B, None, bias, output,
                         token_per_group, n, k, num_experts)
    # ref gg
    ref = []
    pre_token_sum = 0
    for i in range(num_experts):
        cur_token_num = token_per_group[i]
        if cur_token_num == 0:
            continue
        input = ref_A[pre_token_sum:pre_token_sum + cur_token_num, :]
        weight = input_B[i, :, :]
        expert_output = input @ weight
        if has_bias:
            expert_output += bias[i]
        ref.append(expert_output)
        pre_token_sum += cur_token_num
    ref = torch.cat(ref, dim=0)

    torch.testing.assert_close(output, ref, rtol=2e-2, atol=1e-2)


def ceil_div(a, b):
    return (a + b - 1) // b


# largest power of 2 representable in `torch.float8_e4m3fn`
F8E4M3_LARGEST_POW2 = 8
# largest power of 2 representable in `torch.float4_e2m1fn_x2`
FP4E2M1FN_LARGEST_POW2 = 2.0
# max value of `torch.float8_e4m3fn` (448)
F8E4M3_MAX_VAL = torch.finfo(torch.float8_e4m3fn).max
# exponent bias of `torch.float8_e8m0fnu`
F8E8M0_EXP_BIAS = 127
# exponent and mantissa bits of `torch.float4_e2m1fn_x2`
FP4_EBITS, FP4_MBITS = 2, 1
FP4_MAX_VAL = 6.0


def data_to_mx_scale(x, block_size, recipe):
    # simple implementation of https://www.opencompute.org/documents/ocp-microscaling-formats-mx-v1-0-spec-final-pdf
    # section 6.3, not all edge cases (such as NaN) are handled/tested
    if recipe == "mxfp8":
        largest_pow2 = F8E4M3_LARGEST_POW2
    elif recipe == "mxfp4":
        largest_pow2 = FP4E2M1FN_LARGEST_POW2
    else:
        raise ValueError(
            f"data_to_mx_scale(): Unsupported mx recipe: {recipe}")
    orig_shape = x.shape
    x = x.reshape(-1, block_size)
    max_abs = torch.amax(torch.abs(x), 1)
    largest_p2_lt_max_abs = torch.floor(torch.log2(max_abs))
    scale_e8m0_unbiased = largest_p2_lt_max_abs - largest_pow2
    scale_e8m0_unbiased = torch.clamp(scale_e8m0_unbiased,
                                      -1 * F8E8M0_EXP_BIAS, F8E8M0_EXP_BIAS)
    scale_e8m0_biased = scale_e8m0_unbiased + F8E8M0_EXP_BIAS
    scale_e8m0_biased = scale_e8m0_biased.to(torch.uint8)
    scale_e8m0_biased = scale_e8m0_biased.view(torch.float8_e8m0fnu)
    return scale_e8m0_biased.reshape(*orig_shape[:-1],
                                     orig_shape[-1] // block_size)


def fp4_e2m1fn_x2_to_float(t: torch.Tensor) -> torch.Tensor:
    from torch.testing._internal.common_quantized import (
        _floatx_unpacked_to_f32)

    def unpack_uint4(uint8_data) -> torch.Tensor:
        # Take a packed uint8 tensor (i.e. nvfp4) and unpack into
        # a tensor twice as wide. Useful for dequant operations.
        shape = list(uint8_data.shape)
        # 2x packed elements -> single non-packed => adjust shape
        shape[-1] *= 2
        out = torch.empty(*shape, device=uint8_data.device,
                          dtype=torch.uint8).view(-1)

        uint8_data_as_uint8 = uint8_data.view(torch.uint8).view(-1)

        out[1::2] = uint8_data_as_uint8[:] >> 4
        out[::2] = uint8_data_as_uint8 & 15

        return out.view(shape)

    t_float = _floatx_unpacked_to_f32(unpack_uint4(t), ebits=2, mbits=1)
    return t_float


@pytest.mark.parametrize("m,n,k", FUSED_MOE_MNK_FACTORS)
@pytest.mark.parametrize("e", NUM_EXPERTS)
@pytest.mark.parametrize("topk", TOP_KS)
@pytest.mark.parametrize("recipe", ["mxfp8", "mxfp4"])
@pytest.mark.parametrize("has_bias", [True, False])
def test_grouped_gemm_mxfp(m, n, k, e, topk, recipe, has_bias):
    seed_everything(8)
    num_experts = e
    token_per_group = random_partition(e, m * topk)
    assert (len(token_per_group) == e)

    BLOCK_SIZE = 32
    m = sum(token_per_group)
    A_ref = torch.randn((m, k), device=DEVICE, dtype=torch.bfloat16)
    B_ref = torch.randn((num_experts, n, k),
                        device=DEVICE,
                        dtype=torch.bfloat16)
    A_scale = data_to_mx_scale(A_ref, BLOCK_SIZE, recipe)  # (m, scale_k)
    A_scale_k = torch.empty_like(A_scale)
    cumu_m = 0
    for gm in token_per_group:
        if gm != 0:
            cur_slice = A_scale_k[cumu_m:cumu_m + gm, :].view_as(
                A_scale[cumu_m:cumu_m + gm, :].transpose(-1, -2))
            cur_slice.copy_(A_scale[cumu_m:cumu_m + gm, :].transpose(
                -1, -2).contiguous())
            cumu_m += gm
    if recipe == "mxfp8":
        B_scale = data_to_mx_scale(B_ref, BLOCK_SIZE,
                                   recipe)  # (e, n, scale_k)
        B_scale = B_scale.transpose(-1, -2).contiguous().transpose(-1, -2)
        assert (A_scale_k.is_contiguous())
        max_val = F8E4M3_MAX_VAL
        min_val = -1 * max_val
        A = (A_ref.reshape(-1, BLOCK_SIZE) /
             A_scale.reshape(m * ceil_div(k, BLOCK_SIZE), 1).float()).reshape(
                 m, k)
        A = A.clamp(min=min_val, max=max_val).to(torch.float8_e4m3fn)
        B = (B_ref.reshape(-1, BLOCK_SIZE) / B_scale.reshape(
            num_experts * n * ceil_div(k, BLOCK_SIZE), 1).float()).reshape(
                num_experts, n, k)
        B = B.clamp(min=min_val,
                    max=max_val).to(torch.float8_e4m3fn)  # (e, n, k)
        B = B.transpose(-1, -2).contiguous().transpose(-1, -2)
    elif recipe == "mxfp4":
        B_scale = data_to_mx_scale(B_ref, BLOCK_SIZE, recipe)
        B_scale = B_scale.transpose(-1, -2).contiguous().transpose(-1, -2)
        max_val = FP4_MAX_VAL
        min_val = -1 * max_val
        from torch.testing._internal.common_quantized import (
            _bfloat16_to_float4_e2m1fn_x2)
        A = (A_ref.reshape(-1, BLOCK_SIZE) / A_scale.reshape(
            m * ceil_div(k, BLOCK_SIZE), 1).bfloat16()).reshape(m, k)
        A = A.clamp(min=min_val, max=max_val)
        A = _bfloat16_to_float4_e2m1fn_x2(A)
        B = (B_ref.reshape(-1, BLOCK_SIZE) / B_scale.reshape(
            num_experts * n * ceil_div(k, BLOCK_SIZE), 1).bfloat16()).reshape(
                num_experts, n, k)
        B = B.clamp(min=min_val, max=max_val)
        B = _bfloat16_to_float4_e2m1fn_x2(B)

    if has_bias:
        bias = torch.randn((num_experts, n),
                           dtype=torch.float32,
                           device=DEVICE)
    else:
        bias = None
    output = torch.empty((m, n), dtype=torch.float32, device=DEVICE)
    cutlass_grouped_gemm(A, A_scale_k, B, B_scale, bias, output,
                         token_per_group, n, k, num_experts)
    # ref gg
    if recipe == "mxfp8":
        A_dq = A.float().reshape(-1, BLOCK_SIZE) * (A_scale.reshape(
            m * ceil_div(k, BLOCK_SIZE), 1).float())
        B_dq = B.float().reshape(-1, BLOCK_SIZE) * (B_scale.reshape(
            num_experts * n * ceil_div(k, BLOCK_SIZE), 1).float())
    elif recipe == "mxfp4":
        A_dq = fp4_e2m1fn_x2_to_float(A).reshape(-1, BLOCK_SIZE) * (
            A_scale.reshape(m * ceil_div(k, BLOCK_SIZE), 1).float())
        B_dq = fp4_e2m1fn_x2_to_float(B).reshape(
            -1, BLOCK_SIZE) * (B_scale.reshape(
                num_experts * n * ceil_div(k, BLOCK_SIZE), 1).float())
    A_dq = A_dq.reshape(m, k)
    B_dq = B_dq.reshape(num_experts, n, k)

    ref = []
    pre_token_sum = 0
    for i in range(num_experts):
        cur_token_num = token_per_group[i]
        if cur_token_num == 0:
            continue
        input = A_dq[pre_token_sum:pre_token_sum + cur_token_num, :]
        weight = B_dq[i, :, :]
        expert_output = input @ weight.T
        if has_bias:
            expert_output += bias[i]
        ref.append(expert_output)
        pre_token_sum += cur_token_num
    ref = torch.cat(ref, dim=0)

    print("ref: ", ref, ref.shape)
    print("ker: ", output, output.shape)
    torch.testing.assert_close(output, ref, rtol=1e-2, atol=1e-2)
