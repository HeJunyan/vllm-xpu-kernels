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
    "test_grouped_gemm_mxfp8": {
        "m,n,k": [
            (1, 256, 256),
            (4, 256, 256),
            (8, 256, 256),
            (16, 512, 256),
            (4, 256, 512),
        ],
        "e": [1, 2],
        "topk": [1],
        "has_bias": [False],
    },
    "test_grouped_gemm_nvfp4": {
        "m,n,k": [
            (1, 128, 128),
            (4, 128, 128),
            (8, 256, 128),
            (16, 256, 256),
            (4, 128, 256),
        ],
        "e": [1, 2],
        "topk": [1],
        "has_bias": [False],
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


# =====================================================================
# Block-scaled (low-precision) grouped GEMM tests: MXFP8 + NVFP4
# =====================================================================

NVFP4_SFVECSIZE = 16  # one ue4m3 scale per 16 K-elements
MXFP8_SFVECSIZE = 32  # one ue8m0 scale per 32 K-elements


def _fp4_e2m1fn_x2_to_float(t: torch.Tensor) -> torch.Tensor:
    """Unpack float4_e2m1fn_x2 packed tensor to float32."""
    from torch.testing._internal.common_quantized import (
        _floatx_unpacked_to_f32)

    def unpack_uint4(uint8_data) -> torch.Tensor:
        shape = list(uint8_data.shape)
        shape[-1] *= 2
        out = torch.empty(*shape, device=uint8_data.device,
                          dtype=torch.uint8).view(-1)
        u = uint8_data.view(torch.uint8).view(-1)
        out[1::2] = u[:] >> 4
        out[::2] = u & 15
        return out.view(shape)

    return _floatx_unpacked_to_f32(unpack_uint4(t), ebits=2, mbits=1)


def _quant_nvfp4(x: torch.Tensor, sf_vec_size: int = NVFP4_SFVECSIZE):
    """Quantize BF16/FP32 tensor to NVFP4 (e2m1 + ue4m3 per-16 scale)."""
    from torch.testing._internal.common_quantized import (
        _bfloat16_to_float4_e2m1fn_x2)

    FP4_MAX_VAL = 6.0
    orig_shape = x.shape
    K = orig_shape[-1]
    assert K % sf_vec_size == 0

    num_blocks = K // sf_vec_size
    x_bf16 = x.to(torch.bfloat16)
    x_blocks = x_bf16.reshape(-1, sf_vec_size)

    absmax = x_blocks.abs().amax(dim=-1).float()
    scales = (absmax / FP4_MAX_VAL).clamp(min=1e-12)
    scales_e4m3 = scales.to(torch.float8_e4m3fn)

    x_scaled = (x_blocks /
                scales_e4m3.float().unsqueeze(-1).clamp(min=1e-12))
    x_scaled = x_scaled.reshape(orig_shape)
    x_scaled = x_scaled.clamp(min=-FP4_MAX_VAL,
                              max=FP4_MAX_VAL).to(torch.bfloat16)
    packed = _bfloat16_to_float4_e2m1fn_x2(x_scaled)

    scales_out = scales_e4m3.reshape(*orig_shape[:-1], num_blocks)
    return packed, scales_out


def _quant_mxfp8(x: torch.Tensor, sf_vec_size: int = MXFP8_SFVECSIZE):
    """Quantize BF16/FP32 tensor to MXFP8 (e4m3 + ue8m0 per-32 scale).

    ue8m0 is an 8-bit unsigned exponent-only float (power-of-two scales).
    """
    FP8_MAX_VAL = 448.0  # e4m3 max representable magnitude
    orig_shape = x.shape
    K = orig_shape[-1]
    assert K % sf_vec_size == 0

    num_blocks = K // sf_vec_size
    x_f32 = x.to(torch.float32)
    x_blocks = x_f32.reshape(-1, sf_vec_size)

    absmax = x_blocks.abs().amax(dim=-1).clamp(min=1e-30)
    # Round to next power-of-two scale that keeps values inside e4m3 range.
    raw_scale = absmax / FP8_MAX_VAL
    exp = torch.ceil(torch.log2(raw_scale))
    exp = exp.clamp(min=-127.0, max=127.0)
    scales_f32 = torch.pow(2.0, exp)
    scales_ue8m0 = scales_f32.to(torch.float8_e8m0fnu)

    x_scaled = x_blocks / scales_f32.unsqueeze(-1)
    x_scaled = x_scaled.reshape(orig_shape)
    x_scaled = x_scaled.clamp(min=-FP8_MAX_VAL, max=FP8_MAX_VAL).to(
        torch.float8_e4m3fn)

    scales_out = scales_ue8m0.reshape(*orig_shape[:-1], num_blocks)
    return x_scaled, scales_out


def _scaled_grouped_gemm_check(
    quantize_fn,
    sf_vec_size,
    m,
    n,
    k,
    e,
    topk,
    has_bias,
    out_dtype,
    is_fp4,
    rtol,
    atol,
):
    seed_everything(7)
    num_experts = e
    token_per_group = random_partition(e, m * topk)
    assert len(token_per_group) == e
    total_tokens = sum(token_per_group)

    # Reference data in BF16
    A_ref = torch.randn((total_tokens, k), device=DEVICE,
                        dtype=torch.bfloat16) / 10
    B_ref = torch.randn((num_experts, n, k), device=DEVICE,
                        dtype=torch.bfloat16) / 10

    A_q, A_sf = quantize_fn(A_ref, sf_vec_size)
    B_q_list = []
    B_sf_list = []
    for i in range(num_experts):
        bq, bs = quantize_fn(B_ref[i], sf_vec_size)
        B_q_list.append(bq)
        B_sf_list.append(bs)
    B_q = torch.stack(B_q_list, dim=0)
    B_sf = torch.stack(B_sf_list, dim=0)

    # ADMA SF loads expect per-group column-major (M-/N-contiguous) scale-factor
    # layout, matching cutlass reference 'C' ordering. For multi-group, each
    # expert's SFA slice has its own column-major stride M_i (NOT the total M),
    # so we lay out the SFA kernel buffer as the concatenation of per-group
    # column-major slabs. The original (row-major) A_sf is kept for the
    # host reference computation.
    sf_k = k // sf_vec_size
    A_sf_kernel_flat = torch.empty(A_sf.numel(), dtype=A_sf.dtype,
                                   device=A_sf.device)
    pre = 0
    off = 0
    for i in range(num_experts):
        cur = token_per_group[i]
        if cur == 0:
            continue
        slc = A_sf[pre:pre + cur]
        slab_size = cur * sf_k
        # Column-major flatten: transpose to (sf_k, cur) then flatten.
        A_sf_kernel_flat[off:off + slab_size] = slc.t().contiguous().view(-1)
        pre += cur
        off += slab_size
    B_sf_kernel = B_sf.permute(0, 2, 1).contiguous().permute(0, 2, 1)

    if has_bias:
        bias = torch.randn((num_experts, n), dtype=torch.float32,
                           device=DEVICE)
    else:
        bias = None

    output = torch.empty((total_tokens, n), dtype=out_dtype, device=DEVICE)
    output_kernel = output.to(KERNEL_DEVICE)

    cutlass_grouped_gemm(_to_kernel(A_q), _to_kernel(A_sf_kernel_flat),
                         _to_kernel(B_q), _to_kernel(B_sf_kernel),
                         _to_kernel(bias),
                         output_kernel, token_per_group, n, k,
                         num_experts)
    output = output_kernel.cpu()

    # Reference (host, FP32 accumulate)
    sf_k = k // sf_vec_size
    if is_fp4:
        A_deq = _fp4_e2m1fn_x2_to_float(A_q).to(torch.float32)
    else:
        A_deq = A_q.to(torch.float32)
    A_sf_f32 = A_sf.float()
    A_blocks = A_deq.reshape(-1, sf_k, sf_vec_size)
    A_blocks = A_blocks * A_sf_f32.reshape(-1, sf_k, 1)
    A_full = A_blocks.reshape(total_tokens, k)

    ref = []
    pre = 0
    for i in range(num_experts):
        cur = token_per_group[i]
        if cur == 0:
            continue
        if is_fp4:
            B_deq_i = _fp4_e2m1fn_x2_to_float(B_q[i]).to(torch.float32)
        else:
            B_deq_i = B_q[i].to(torch.float32)
        Bsf_i = B_sf[i].float()
        B_blocks = B_deq_i.reshape(n, sf_k, sf_vec_size)
        B_blocks = B_blocks * Bsf_i.reshape(n, sf_k, 1)
        B_full = B_blocks.reshape(n, k)
        a_slice = A_full[pre:pre + cur, :]
        expert_out = a_slice @ B_full.t()
        if has_bias:
            expert_out += bias[i]
        ref.append(expert_out)
        pre += cur
    ref = torch.cat(ref, dim=0)

    torch.testing.assert_close(output.to(torch.float32), ref.to(torch.float32),
                               rtol=rtol, atol=atol)


@pytest.mark.parametrize("m,n,k", FUSED_MOE_MNK_FACTORS)
@pytest.mark.parametrize("e", NUM_EXPERTS)
@pytest.mark.parametrize("topk", TOP_KS)
@pytest.mark.parametrize("has_bias", [False])
def test_grouped_gemm_mxfp8(m, n, k, e, topk, has_bias):
    if k % MXFP8_SFVECSIZE != 0:
        pytest.skip("K must be divisible by MXFP8 SFVecSize (32)")
    _scaled_grouped_gemm_check(
        quantize_fn=_quant_mxfp8,
        sf_vec_size=MXFP8_SFVECSIZE,
        m=m, n=n, k=k, e=e, topk=topk, has_bias=has_bias,
        out_dtype=torch.bfloat16,
        is_fp4=False,
        rtol=5e-2, atol=5e-2,
    )


@pytest.mark.parametrize("m,n,k", FUSED_MOE_MNK_FACTORS)
@pytest.mark.parametrize("e", NUM_EXPERTS)
@pytest.mark.parametrize("topk", TOP_KS)
@pytest.mark.parametrize("has_bias", [False])
def test_grouped_gemm_nvfp4(m, n, k, e, topk, has_bias):
    if k % NVFP4_SFVECSIZE != 0:
        pytest.skip("K must be divisible by NVFP4 SFVecSize (16)")
    _scaled_grouped_gemm_check(
        quantize_fn=_quant_nvfp4,
        sf_vec_size=NVFP4_SFVECSIZE,
        m=m, n=n, k=k, e=e, topk=topk, has_bias=has_bias,
        out_dtype=torch.float32,
        is_fp4=True,
        rtol=5e-2, atol=5e-2,
    )
