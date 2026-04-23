# SPDX-License-Identifier: Apache-2.0
import math

import pytest
import torch

import vllm_xpu_kernels._xpu_C  # noqa: F401
from tests.fused_moe.test_grouped_gemm_xe3 import (data_to_mx_scale,
                                                   bfloat16_to_fp4_e2m1fn_x2,
                                                   fp4_e2m1fn_x2_to_float,
                                                   hp_from_1x128,
                                                   hp_from_128x128)
from tests.utils import seed_everything
from vllm_xpu_kernels.fused_moe_interface import (quant_fp8_act,
                                                  quant_mxfp_act,
                                                  xpu_fused_moe)

pytestmark = pytest.mark.skipif(
    not torch.ops._xpu_C.is_cri(0),
    reason="XE3 tests only run on CRI.")

DEVICE = "xpu"

# shape for Llama-4-scout
FUSED_MOE_MNK_FACTORS = [
    (1, 5120, 8192),
    (4, 5120, 8192),
    (16, 5120, 8192),
    (8192, 5120, 8192),
]
NUM_EXPERTS = [16]
TOP_KS = [1, 2]
EP_RANK = [0, 1, 2, 3]
EP_SIZE = [4]

MINI_PYTEST_PARAMS = {
    "default": {
        "m,n,k": [
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
            # m=256 needed for MXFP recipes (BLK_M=256 on CRI)
            (256, 128, 128),
            (256, 256, 256),
        ],
        "e": [2],
        "topk": [2],
        "recipe": ["bf16", "mxfp8", "mxfp4", "fp8block"],
        "has_bias": [True]
    }
}

RECIPE_TO_DTYPE = {
    "bf16": (torch.bfloat16, None),
    "fp16": (torch.float16, None),
    "mxfp8": (torch.float8_e4m3fn, torch.float8_e8m0fnu),
    "fp8block": (torch.float8_e4m3fn, torch.float32),
    "mxfp4": (torch.float4_e2m1fn_x2, torch.float8_e8m0fnu),
}


def quant_mxfp_weight(w, recipe):
    # max value of `torch.float8_e4m3fn` (448)
    F8E4M3_MAX_VAL = torch.finfo(torch.float8_e4m3fn).max
    FP4_MAX_VAL = 6.0

    BLOCK_SIZE = 32
    if recipe == "mxfp8":
        max_val = F8E4M3_MAX_VAL
        min_val = -1 * max_val
    elif recipe == "mxfp4":
        max_val = FP4_MAX_VAL
        min_val = -1 * max_val

    orig_shape = w.shape
    w_scales = data_to_mx_scale(w.to(torch.bfloat16), BLOCK_SIZE, recipe)
    w_scales = w_scales.transpose(-1, -2).contiguous().transpose(-1, -2)
    if recipe == "mxfp8":
        w = (w.to(torch.bfloat16).reshape(-1, BLOCK_SIZE) /
             w_scales.reshape(-1, 1).float()).reshape(orig_shape)
        w = w.clamp(min=min_val,
                    max=max_val).to(torch.float8_e4m3fn)  # (e, n, k)
    elif recipe == "mxfp4":
        w = (w.to(torch.bfloat16).reshape(-1, BLOCK_SIZE) /
             w_scales.reshape(-1, 1).bfloat16()).reshape(orig_shape)
        w = w.clamp(min=min_val, max=max_val)
        w = bfloat16_to_fp4_e2m1fn_x2(w)
    return w, w_scales


def to_kernel_weight_layout(recipe, w13, w2):
    # XE3 grouped GEMM expects non-MXFP4 weights in [E, K, N] layout.
    if recipe == "mxfp4":
        return w13, w2
    return w13.transpose(-1, -2).contiguous(), w2.transpose(-1, -2).contiguous()


def ref_fused_moe(recipe,
                  x,
                  w13,
                  w13_scales,
                  w13_bias,
                  w2,
                  w2_scales,
                  w2_bias,
                  expert_weights,
                  expert_indices,
                  num_per_tok,
                  activation,
                  num_experts,
                  ep_rank=0,
                  ep_size=1):

    flat_expert_indices = expert_indices.view(-1)
    flat_expert_weights = expert_weights.view(-1, 1)

    expert_start_id = num_experts * ep_rank
    expert_end_id = expert_start_id + num_experts
    expert_cache = torch.zeros_like(x).to(torch.float32)
    idxs = flat_expert_indices.argsort()
    counts = flat_expert_indices.bincount().cpu().numpy()
    tokens_per_expert = counts.cumsum()
    token_idxs = idxs // num_per_tok

    if recipe == "fp8block":
        _q, _scale = quant_fp8_act(x)
        x = hp_from_1x128(_q, _scale)
    elif recipe == "mxfp8":
        act_ori_shape = x.shape
        w13_ori_shape = w13.shape
        w2_ori_shape = w2.shape
        _q, _scale = quant_mxfp_act(x, "mxfp8")
        x = _q.float().reshape(-1, 32) * (_scale.reshape(-1, 1).float())
        x = x.reshape(act_ori_shape)
        w13 = w13.float().reshape(-1, 32) * (w13_scales.reshape(-1, 1).float())
        w2 = w2.float().reshape(-1, 32) * (w2_scales.reshape(-1, 1).float())
        w13 = w13.reshape(w13_ori_shape)
        w2 = w2.reshape(w2_ori_shape)
    elif recipe == "mxfp4":
        act_ori_shape = x.shape
        _q, _scale = quant_mxfp_act(x, "mxfp4")
        x = fp4_e2m1fn_x2_to_float(_q).reshape(-1, 32) * (_scale.reshape(
            -1, 1).float())
        x = x.reshape(act_ori_shape)
        w13_ori_shape = w13.shape
        w2_ori_shape = w2.shape
        w13 = fp4_e2m1fn_x2_to_float(w13).reshape(
            -1, 32) * (w13_scales.reshape(-1, 1).float())
        w2 = fp4_e2m1fn_x2_to_float(w2).reshape(-1, 32) * (w2_scales.reshape(
            -1, 1).float())
        w13 = w13.reshape(w13_ori_shape[:-1] + (w13_ori_shape[-1] * 2, ))
        w2 = w2.reshape(w2_ori_shape[:-1] + (w2_ori_shape[-1] * 2, ))

    for expert_id, end_idx in enumerate(tokens_per_expert):
        start_idx = 0 if expert_id == 0 else tokens_per_expert[expert_id - 1]
        if (start_idx == end_idx) or (expert_id
                                      < expert_start_id) or (expert_id
                                                             >= expert_end_id):
            continue
        exp_token_idxs = token_idxs[start_idx:end_idx]
        expert_tokens = x[exp_token_idxs]

        ### dequant weight13
        expert_w13 = w13[expert_id, :, :]
        if recipe == "fp8block":
            expert_w13 = hp_from_128x128(w13[expert_id, :, :],
                                         w13_scales[expert_id, :, :])
        ###

        w1, w3 = torch.split(expert_w13,
                             int(list(expert_w13.shape)[0] / 2),
                             dim=0)
        if w13_bias is not None:
            w1_bias, w3_bias = w13_bias[expert_id, :].chunk(2)
        act_fn = torch.nn.SiLU()
        gemm1 = (expert_tokens.to(torch.float32) @ w1.T.to(torch.float32))
        if w13_bias is not None:
            gemm1 += w1_bias.to(torch.float32)

        gate = act_fn(gemm1)
        up = (expert_tokens.to(torch.float32) @ w3.T.to(torch.float32))
        if w13_bias is not None:
            up += w3_bias.to(torch.float32)

        ### quant act for gemm2 and dequant weight 2
        gemm2_input = gate * up
        expert_w2 = w2[expert_id, :, :]
        if recipe == "fp8block":
            expert_w2 = hp_from_128x128(w2[expert_id, :, :],
                                        w2_scales[expert_id, :, :])
            _q, _scale = quant_fp8_act(gemm2_input)
            gemm2_input = hp_from_1x128(_q, _scale)
        elif recipe == "mxfp8":
            _q, _scale = quant_mxfp_act(gemm2_input, "mxfp8")
            gemm2_input = _q.float().reshape(-1, 32) * (_scale.reshape(
                -1, 1).float())
            gemm2_input = gemm2_input.reshape(_q.shape)
        elif recipe == "mxfp4":
            _q, _scale = quant_mxfp_act(gemm2_input, "mxfp4")
            gemm2_input = fp4_e2m1fn_x2_to_float(_q).reshape(
                -1, 32) * (_scale.reshape(-1, 1).float())
            gemm2_input = gemm2_input.reshape(_q.shape[:-1] +
                                              (_q.shape[-1] * 2, ))
        ###

        expert_out = ((gemm2_input) @ expert_w2.T.to(torch.float32))

        if w2_bias is not None:
            expert_out += w2_bias[expert_id, :].to(torch.float32)

        expert_out.mul_(flat_expert_weights[idxs[start_idx:end_idx]])
        expert_cache.scatter_reduce_(0,
                                     exp_token_idxs.view(-1, 1).repeat(
                                         1, x.shape[-1]),
                                     expert_out,
                                     reduce='sum')
    if recipe in ["bf16", "fp16"]:
        expert_cache = expert_cache.to(x.dtype)
    return expert_cache


@pytest.mark.parametrize("m,n,k", FUSED_MOE_MNK_FACTORS)
@pytest.mark.parametrize("e", NUM_EXPERTS)
@pytest.mark.parametrize("topk", TOP_KS)
@pytest.mark.parametrize("recipe",
                         ["bf16", "fp16", "mxfp8", "mxfp4", "fp8block"])
@pytest.mark.parametrize("has_bias", [True, False])
def test_fused_moe(m, n, k, e, topk, recipe, has_bias):
    if topk > e:
        pytest.skip(f"topk={topk} > num_experts={e}")

    if recipe in ["mxfp8", "mxfp4"] and m < 256:
        pytest.skip("MXFP requires m>=256 on CRI simulator (BLK_M=256)")
    seed_everything(7)
    data_dtype, scale_dtype = RECIPE_TO_DTYPE.get(recipe, (None, None))

    input_len = m
    hidden_size = k
    intermediate_size = n
    num_experts = e
    block_k = 1
    data_factor = 1.0 / math.sqrt(hidden_size)

    hidden_states = torch.randn(
        (input_len, hidden_size), device=DEVICE,
        dtype=torch.float32) * data_factor
    w13 = torch.randn((num_experts, 2 * intermediate_size, hidden_size),
                      device=DEVICE,
                      dtype=torch.float32) * data_factor
    w2 = torch.randn((num_experts, hidden_size, intermediate_size),
                     device=DEVICE,
                     dtype=torch.float32) * data_factor
    w13_scales = None
    w2_scales = None

    if data_dtype in [torch.bfloat16, torch.float16]:
        hidden_states = hidden_states.to(data_dtype)
        w13 = w13.to(data_dtype)
        w2 = w2.to(data_dtype)
    elif recipe == "fp8block":
        w13 = w13.to(data_dtype)
        w2 = w2.to(data_dtype)
        block_k = 128
        w13_scales = torch.rand(
            num_experts * (2 * intermediate_size // block_k) *
            (hidden_size // block_k),
            device=DEVICE,
            dtype=torch.float32).reshape(
                num_experts, 2 * intermediate_size // block_k,
                hidden_size // block_k) * 0.01 + 0.01  # [0.01,0.02]
        w2_scales = torch.rand(
            num_experts * (hidden_size // block_k) *
            (intermediate_size // block_k),
            device=DEVICE,
            dtype=torch.float32).reshape(
                num_experts, hidden_size // block_k,
                intermediate_size // block_k) * 0.005 + 0.005  # [0.005,0.01]
    elif recipe == "mxfp8":
        block_k = 32
        w13, w13_scales = quant_mxfp_weight(w13, "mxfp8")
        w2, w2_scales = quant_mxfp_weight(w2, "mxfp8")
    elif recipe == "mxfp4":
        block_k = 32
        w13, w13_scales = quant_mxfp_weight(w13, "mxfp4")
        w2, w2_scales = quant_mxfp_weight(w2, "mxfp4")

    if has_bias:
        w13_bias = torch.randn((num_experts, 2 * intermediate_size),
                               device=DEVICE,
                               dtype=torch.float32) / 16
        w2_bias = torch.randn(
            (num_experts, hidden_size), device=DEVICE,
            dtype=torch.float32) / 16
        if data_dtype in [torch.float16, torch.bfloat16]:
            w13_bias = w13_bias.to(data_dtype)
            w2_bias = w2_bias.to(data_dtype)
    else:
        w13_bias = None
        w2_bias = None
    # moe gate
    scores = torch.randn((input_len, num_experts),
                         device=DEVICE,
                         dtype=torch.float32)
    expert_scores, expert_indices = torch.topk(scores,
                                               k=topk,
                                               dim=-1,
                                               sorted=False)

    ref_out = ref_fused_moe(recipe, hidden_states, w13, w13_scales, w13_bias,
                            w2, w2_scales, w2_bias, expert_scores,
                            expert_indices, topk, "silu", e)
    kernel_w13, kernel_w2 = to_kernel_weight_layout(recipe, w13, w2)

    output = xpu_fused_moe(hidden_states=hidden_states,
                           w13=kernel_w13,
                           w13_scales=w13_scales,
                           w13_bias=w13_bias,
                           w2=kernel_w2,
                           w2_scales=w2_scales,
                           w2_bias=w2_bias,
                           topk_weights=expert_scores,
                           topk_ids=expert_indices,
                           n_experts_per_token=topk,
                           activation="silu",
                           num_experts=e,
                           act_quant=recipe not in ["bf16", "fp16"])

    if data_dtype == torch.float16:
        rtol = 1e-2
        atol = 1e-2
    else:
        rtol = 2e-2
        atol = 2e-2
    torch.testing.assert_close(output, ref_out, rtol=rtol, atol=atol)
