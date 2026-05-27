# SPDX-License-Identifier: Apache-2.0
import random

import pytest
import torch

import vllm_xpu_kernels._xpu_C  # noqa: F401
from tests.ops.mx_utils import (_bfloat16_to_float4_e2m1fn_x2,
                                _floatx_unpacked_to_f32, unpack_uint4)
from tests.utils import seed_everything
from vllm_xpu_kernels.fused_moe_interface import cutlass_grouped_gemm

# CRI simulator warmup: the very first CUTLASS grouped GEMM dispatch
# in a fresh process may produce incorrect results.  Run a dummy
# GEMM to stabilise the device state.
if torch.xpu.is_available() and torch.ops._xpu_C.is_cri(0):
    _m, _n, _k = 32, 128, 128
    _a = torch.randn(_m, _k, dtype=torch.bfloat16, device="xpu")
    _b = torch.randn(1, _k, _n, dtype=torch.bfloat16, device="xpu")
    _o = torch.zeros(_m, _n, dtype=torch.bfloat16, device="xpu")
    cutlass_grouped_gemm(_a, None, _b, None, None, _o, [_m], _n, _k, 1)
    torch.xpu.synchronize()
    del _a, _b, _o

pytestmark = pytest.mark.skipif(
    not torch.ops._xpu_C.is_cri(0) and not torch.ops._xpu_C.is_nvl_p(0),
    reason="XE3 tests only run on CRI or NVL_P.")

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

MINI_MNK_SHAPES = [
    (16, 128, 128),
    (16, 128, 256),
    (16, 256, 128),
    (16, 256, 256),
    (32, 128, 128),
    (32, 128, 256),
    (32, 256, 256),
    (64, 128, 128),
    (64, 256, 128),
    (64, 256, 256),
]

# MXFP uses BLK_M=256 tiles; CRI simulator hangs or produces NaN when
# per-expert M is too small. m=256 with seed=8 random partition gives
# [116, 140] for e=2, which avoids the simulator limitation.
# Shapes whose total M (or N) is not a multiple of 4 exercise the
# unaligned-M dispatch added for arbitrary M/N support (PR #444 for mxfp8
# and PR #549 for mxfp4).
MINI_MNK_SHAPES_MXFP = [
    (16, 128, 128),
    (18, 128, 128),
    (32, 128, 256),
    (64, 256, 256),
    (256, 128, 128),
    (256, 128, 256),
    (256, 256, 128),
    (256, 256, 256),
    (250, 256, 256),
    (266, 128, 256),
    # Very small / unaligned-M shapes that exercise the mxfp4 unaligned
    # scalar scale-load path (PR #549).
    (3, 128, 128),
    (5, 128, 256),
    (7, 256, 128),
    (9, 256, 256),
    (15, 128, 128),
    (17, 256, 256),
]

MINI_PYTEST_PARAMS = {
    "test_grouped_gemm": {
        "m,n,k": MINI_MNK_SHAPES,
        "e": [1, 2],
        "topk": [1],
        "dtype": [torch.bfloat16],
        "has_bias": [True]
    },
    "test_grouped_gemm_mxfp": {
        "m,n,k": MINI_MNK_SHAPES_MXFP,
        "e": [1, 2],
        "topk": [1],
        "recipe": ["mxfp8", "mxfp4"],
        "has_bias": [True]
    },
    "test_grouped_gemm_fp8block": {
        "m,n,k": MINI_MNK_SHAPES,
        "e": [1, 2],
        "topk": [1],
        "recipe": ["128x128"],
        "has_bias": [True]
    }
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
    rows_per_expert = random_partition(e, m * topk)
    assert (len(rows_per_expert) == e)
    # input
    input_A = torch.randn((sum(rows_per_expert), k),
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
    total_m = sum(rows_per_expert)
    output = torch.zeros((total_m, n), dtype=dtype, device=DEVICE)
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
    return _floatx_unpacked_to_f32(unpack_uint4(t.cpu()),
                                   FP4_EBITS, FP4_MBITS).to(t.device)


def bfloat16_to_fp4_e2m1fn_x2(t: torch.Tensor) -> torch.Tensor:
    assert t.dtype == torch.bfloat16
    assert t.shape[-1] % 2 == 0
    return _bfloat16_to_float4_e2m1fn_x2(t)


@pytest.mark.parametrize("m,n,k", FUSED_MOE_MNK_FACTORS)
@pytest.mark.parametrize("e", NUM_EXPERTS)
@pytest.mark.parametrize("topk", TOP_KS)
@pytest.mark.parametrize("recipe", ["mxfp8", "mxfp4"])
@pytest.mark.parametrize("has_bias", [True, False])
def test_grouped_gemm_mxfp(m, n, k, e, topk, recipe, has_bias):
    if recipe == "mxfp4" and torch.ops._xpu_C.is_nvl_p(0):
        pytest.skip(reason="MXFP4 is not supported on NVL_P")
    seed_everything(8)
    num_experts = e
    rows_per_expert = random_partition(e, m * topk)
    assert (len(rows_per_expert) == e)


    BLOCK_SIZE = 32
    m = sum(rows_per_expert)
    A_ref = torch.randn((m, k), device=DEVICE, dtype=torch.bfloat16)
    B_ref = torch.randn((num_experts, n, k),
                        device=DEVICE,
                        dtype=torch.bfloat16)
    A_scale = data_to_mx_scale(A_ref, BLOCK_SIZE, recipe)  # (m, scale_k)
    A_scale_k = torch.zeros_like(A_scale)
    cumu_m = 0
    for gm in rows_per_expert:
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
        A = (A_ref.reshape(-1, BLOCK_SIZE) / A_scale.reshape(
            m * ceil_div(k, BLOCK_SIZE), 1).bfloat16()).reshape(m, k)
        A = A.clamp(min=min_val, max=max_val)
        A = bfloat16_to_fp4_e2m1fn_x2(A)
        B = (B_ref.reshape(-1, BLOCK_SIZE) / B_scale.reshape(
            num_experts * n * ceil_div(k, BLOCK_SIZE), 1).bfloat16()).reshape(
                num_experts, n, k)
        B = B.clamp(min=min_val, max=max_val)
        B = bfloat16_to_fp4_e2m1fn_x2(B)

    if has_bias:
        bias = torch.randn((num_experts, n),
                           dtype=torch.float32,
                           device=DEVICE)
    else:
        bias = None
    output = torch.zeros((m, n), dtype=torch.float32, device=DEVICE)
    output_kernel = output.to(KERNEL_DEVICE)
    cutlass_grouped_gemm(_to_kernel(A), _to_kernel(A_scale_k), _to_kernel(B),
                         _to_kernel(B_scale), _to_kernel(bias), output_kernel,
                         rows_per_expert, n, k, num_experts)
    output = output_kernel.cpu()
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
        cur_token_num = rows_per_expert[i]
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


def hp_from_128x128(x_lp, x_scale):
    orig_shape = x_lp.shape
    M, K = orig_shape
    x_lp = x_lp.view(M // 128, 128, K // 128, 128)
    x_scale = x_scale.unsqueeze(1).unsqueeze(-1)
    x_hp = x_lp.to(torch.float32)
    x_hp = x_hp * x_scale
    return x_hp.reshape(orig_shape).to(torch.float32)


def hp_from_1x128(x_lp, x_scale):
    orig_shape = x_lp.shape
    x_lp = x_lp.reshape(x_lp.shape[0], x_lp.shape[-1] // 128, 128)
    x_hp = x_lp.to(torch.float32)
    x_hp = x_hp * x_scale.unsqueeze(-1)
    return x_hp.reshape(orig_shape).to(torch.float32)


def fill_zero(x_fp8):
    mask = (x_fp8.float() == 0)
    x_fp8[mask] = torch.randn_like(x_fp8.float())[mask].to(x_fp8.dtype)


@pytest.mark.parametrize("m,n,k", FUSED_MOE_MNK_FACTORS)
@pytest.mark.parametrize("e", NUM_EXPERTS)
@pytest.mark.parametrize("topk", TOP_KS)
@pytest.mark.parametrize("recipe", ["128x128"])
@pytest.mark.parametrize("has_bias", [True, False])
def test_grouped_gemm_fp8block(m, n, k, e, topk, recipe, has_bias):
    assert (recipe == "128x128")
    seed_everything(8)
    num_experts = e
    rows_per_expert = random_partition(e, m * topk)
    assert (len(rows_per_expert) == e)

    m = sum(rows_per_expert)

    A_fp32 = torch.randn((m, k), device=DEVICE, dtype=torch.float32)
    a_fp8 = A_fp32.to(torch.float8_e4m3fn)
    a_scales = torch.randn(m * k // 128, device=DEVICE,
                           dtype=torch.float32).reshape(m, k // 128)
    fill_zero(a_scales)
    assert (not (a_scales == 0).any())

    B_fp32 = torch.randn((num_experts, n, k),
                         device=DEVICE,
                         dtype=torch.float32)
    b_fp8 = B_fp32.to(torch.float8_e4m3fn).transpose(
        -1, -2).contiguous().transpose(-1, -2)
    b_scales = torch.randn(num_experts * (n // 128) * (k // 128),
                           device=DEVICE,
                           dtype=torch.float32).reshape(
                               num_experts, n // 128, k // 128)
    fill_zero(b_scales)
    assert (not (b_scales == 0).any())

    if has_bias:
        bias = torch.randn((num_experts, n),
                           dtype=torch.float32,
                           device=DEVICE)
    else:
        bias = None

    output = torch.zeros((m, n), dtype=torch.float32, device=DEVICE)
    output_kernel = output.to(KERNEL_DEVICE)
    cutlass_grouped_gemm(_to_kernel(a_fp8), _to_kernel(a_scales),
                         _to_kernel(b_fp8), _to_kernel(b_scales),
                         _to_kernel(bias), output_kernel,
                         rows_per_expert, n, k, num_experts)
    output = output_kernel.cpu()

    # ref gg
    ref = []
    pre_token_sum = 0
    a_ref = hp_from_1x128(a_fp8, a_scales)
    for i in range(num_experts):
        cur_token_num = rows_per_expert[i]
        if cur_token_num == 0:
            continue
        input = a_ref[pre_token_sum:pre_token_sum + cur_token_num, :]
        weight = hp_from_128x128(b_fp8[i, :, :], b_scales[i, :, :])

        expert_output = input @ weight.T
        if has_bias:
            expert_output += bias[i]
        ref.append(expert_output)
        pre_token_sum += cur_token_num
    ref = torch.cat(ref, dim=0)

    print("ref: ", ref, ref.shape)
    print("ker: ", output, output.shape)
    torch.testing.assert_close(output, ref, rtol=1e-2, atol=1e-2)
