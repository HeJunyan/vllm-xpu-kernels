# SPDX-License-Identifier: Apache-2.0
import torch

try:
    from . import _C  # noqa: F401
    from . import _moe_C  # noqa: F401
    from . import _xpu_C  # noqa: F401
    FUSEDMOE_UNAVAILABLE_REASON = None
    FUSEDMOE_AVAILABLE = True
except ImportError as e:
    FUSEDMOE_UNAVAILABLE_REASON = str(e)
    FUSEDMOE_AVAILABLE = False


def cutlass_grouped_gemm(input_A, input_A_scale, input_B, input_B_scale, bias,
                         output, expert_token_count, n, k, num_experts):

    def exclusive_prefix_sum(arr):
        prefix = [0]
        for i, x in enumerate(arr):
            prefix.append(prefix[-1] + x)
        return prefix

    expert_offset = torch.tensor(exclusive_prefix_sum(expert_token_count),
                                 dtype=torch.int64,
                                 device="xpu")

    torch.ops._xpu_C.cutlass_grouped_gemm_interface(
        ptr_A=input_A,
        ptr_A_scale=input_A_scale,
        ptr_B=input_B,
        ptr_B_scale=input_B_scale,
        ptr_bias=bias,
        ptr_D=output,
        expert_first_token_offset=expert_offset,
        N=n,
        K=k,
        num_experts=num_experts,
        is_B_int4=False,
        is_B_mxfp4=False)


def cutlass_grouped_gemm_xe2(input_A, input_B, scales, bias, output,
                             num_rows_per_expert, n, k, num_experts, is_B_int4,
                             is_B_mxfp4):
    expert_first_token_offset = torch.cat([
        torch.tensor([0],
                     dtype=num_rows_per_expert.dtype,
                     device=num_rows_per_expert.device),
        torch.cumsum(num_rows_per_expert, dim=0)
    ]).to(torch.int64)
    torch.ops._xpu_C.cutlass_grouped_gemm_interface(
        ptr_A=input_A,
        ptr_A_scale=None,
        ptr_B=input_B,
        ptr_B_scale=scales,
        ptr_bias=bias,
        ptr_D=output,
        expert_first_token_offset=expert_first_token_offset,
        N=n,
        K=k,
        num_experts=num_experts,
        is_B_int4=is_B_int4,
        is_B_mxfp4=is_B_mxfp4)


def ceilDiv(a, b):
    return (a + b - 1) // b


def compute_num_tokens_per_block(num_tokens, num_experts_per_node):
    for num_tokens_per_block in [32, 64, 128, 256, 512, 1024]:
        num_blocks_per_seq = ceilDiv(num_tokens, num_tokens_per_block)
        if num_blocks_per_seq * num_experts_per_node <= num_tokens_per_block:
            return num_tokens_per_block
    return 1024


def implement_zp(qweight):
    # change u4 to s4 to avoid zero point in gemm kernel
    # only support default zero point now
    assert qweight.dtype == torch.uint8, "Input tensor must be uint8"

    high_u4 = (qweight >> 4) & 0x0F
    low_u4 = qweight & 0x0F

    high_s8 = high_u4.to(torch.int8)
    low_s8 = low_u4.to(torch.int8)

    high_s8 = high_s8 - 8
    low_s8 = low_s8 - 8

    def pack_compact(a, b):

        def process_number(x):
            sign = (x < 0).to(torch.uint8)
            abs_low3 = (x.view(torch.uint8) & 0x7).to(torch.uint8)
            return (sign << 3) | abs_low3

        packed_a = process_number(a)
        packed_b = process_number(b)

        return (packed_a << 4) | packed_b

    result = pack_compact(high_s8, low_s8)

    return result


def quant_fp8_act(x: torch.Tensor):
    """
    Quantize FP32 tensor to block-wise scaled FP8 (1x128 blocks)
    Args:
        x: FP32 tensor, shape [..., K]
    Returns:
        q: FP8 tensor, same shape as x
        scales: FP32 tensor, shape [..., ceil(K / block_size)]
    """
    block_size = 128
    fp8_dtype = torch.float8_e4m3fn
    assert x.dtype == torch.float32
    assert x.shape[-1] % block_size == 0, \
        "Last dim must be divisible by block_size for simplicity"

    orig_shape = x.shape
    K = orig_shape[-1]
    num_blocks = K // block_size

    # reshape to [..., num_blocks, block_size]
    x_blocks = x.view(*orig_shape[:-1], num_blocks, block_size)

    # absmax per block
    absmax = x_blocks.abs().amax(dim=-1)  # [..., num_blocks]

    # avoid div-by-zero
    eps = torch.finfo(torch.float32).eps
    absmax = torch.clamp(absmax, min=eps)

    # fp8 max
    fp8_max = 448.0

    # scale
    scales = absmax / fp8_max  # FP32

    # scale + cast
    x_scaled = x_blocks / scales.unsqueeze(-1)
    q = x_scaled.to(fp8_dtype)

    # reshape back
    q = q.view(orig_shape)

    return q, scales


def quant_mxfp_act(x, recipe):
    from tests.fused_moe.test_grouped_gemm_xe3 import data_to_mx_scale

    # max value of `torch.float8_e4m3fn` (448)
    F8E4M3_MAX_VAL = torch.finfo(torch.float8_e4m3fn).max
    # exponent and mantissa bits of `torch.float4_e2m1fn_x2`
    FP4_MAX_VAL = 6.0

    if recipe == "mxfp8":
        max_val = F8E4M3_MAX_VAL
        min_val = -1 * max_val
    elif recipe == "mxfp4":
        max_val = FP4_MAX_VAL
        min_val = -1 * max_val

    ori_shape = x.shape
    x_scale = data_to_mx_scale(x.to(torch.bfloat16), 32,
                               recipe)  # (m, scale_k)
    if recipe == "mxfp8":
        x = (x.to(torch.bfloat16).reshape(-1, 32) /
             x_scale.reshape(-1, 1).float()).reshape(ori_shape)
        x = x.clamp(min=min_val, max=max_val).to(torch.float8_e4m3fn)
    elif recipe == "mxfp4":
        x = (x.to(torch.bfloat16).reshape(-1, 32) /
             x_scale.reshape(-1, 1).bfloat16()).reshape(ori_shape)
        x = x.clamp(min=min_val, max=max_val)
        from torch.testing._internal.common_quantized import (
            _bfloat16_to_float4_e2m1fn_x2)
        x = _bfloat16_to_float4_e2m1fn_x2(x)
    return x, x_scale


def reorder_mxfp_scales(A_scales, expert_first_token_offset):
    token_per_group = expert_first_token_offset[
        1:] - expert_first_token_offset[:-1]
    A_scale_k = torch.empty_like(A_scales)
    cumu_m = 0
    for gm in token_per_group.tolist():
        if gm != 0:
            cur_slice = A_scale_k[cumu_m:cumu_m + gm, :].view_as(
                A_scales[cumu_m:cumu_m + gm, :].transpose(-1, -2))
            cur_slice.copy_(A_scales[cumu_m:cumu_m + gm, :].transpose(
                -1, -2).contiguous())
            cumu_m += gm
    return A_scale_k


def xpu_fused_moe(hidden_states,
                  w13,
                  w2,
                  topk_weights,
                  topk_ids,
                  n_experts_per_token,
                  activation,
                  num_experts,
                  w13_scales=None,
                  w2_scales=None,
                  w13_bias=None,
                  w2_bias=None,
                  act_quant=False,
                  ep_rank=0,
                  ep_size=1,
                  expert_map=None,
                  output=None,
                  is_fp8=False,
                  is_int4=False,
                  is_mxfp4=False):
    '''
    hidden_states: [num_rows, hidden_size]
    w13: [num_experts, 2*inter_size, hidden_size]
    w13_scales:
        None for bf16/fp16
        or [num_experts] for fp8
        or [num_experts, 2*inter_size, hidden_size // group_size] for 4bits
    w13_bias: [num_experts, 2*inter_size] or None
    w2: [num_experts, hidden_size, inter_size]
    w2_scales:
        None for bf16/fp16
        or [num_experts] for fp8
        or [num_experts, hidden_size, inter_size // group_size] for 4bits
    w2_bias: [num_experts, hidden_size] or None
    topk_weights: [num_rows, topk]
    topk_ids: [num_rows, topk]
    n_experts_per_token: int
    activation: str
    num_experts: int
    is_int4: bool
    is_mxfp4: bool
    '''

    ori_token_num, ori_hidden_size = list(hidden_states.shape)
    data_dtype = hidden_states.dtype
    input_scales = None
    scale_dtype = None
    block_k = 1
    if output is None:
        output = torch.zeros_like(hidden_states)
    else:
        assert output.shape == hidden_states.shape, \
            "output shape must be the same as hidden_states shape"

    if act_quant:
        assert (w13_scales is not None)
        assert (w2_scales is not None)
        if w13_scales.dtype == torch.float32:
            # fp8 block
            data_dtype = torch.float8_e4m3fn
            scale_dtype = torch.float32
            block_k = 128
            hidden_states, input_scales = quant_fp8_act(hidden_states)
        elif w13_scales.dtype == torch.float8_e8m0fnu:
            if w13.dtype == torch.float8_e4m3fn:
                # mxfp8
                data_dtype = torch.float8_e4m3fn
                scale_dtype = torch.float8_e8m0fnu
                block_k = 32
                hidden_states, input_scales = quant_mxfp_act(
                    hidden_states, "mxfp8")
            elif w13.dtype == torch.float4_e2m1fn_x2:
                # mxfp4
                data_dtype = torch.float4_e2m1fn_x2
                scale_dtype = torch.float8_e8m0fnu
                block_k = 16  # for prologue
                hidden_states, input_scales = quant_mxfp_act(
                    hidden_states, "mxfp4")

    # 4bits support [E, N, K]
    # other types [E, K, N]
    if not is_int4 and not is_mxfp4 and w13.dtype != torch.float4_e2m1fn_x2:
        inter_size = list(w13.shape)[-1] // 2
    else:
        inter_size = list(w13.shape)[-2] // 2

    assert w13.is_contiguous() and w2.is_contiguous()

    # FIXME: move this to vllm
    if is_int4 and not hasattr(w13, 'xpu_fused_moe'):
        w13_tmp = torch.empty_like(w13)
        w2_tmp = torch.empty_like(w2)
        for i in range(num_experts):
            w13_tmp[i] = implement_zp(w13[i])
            w2_tmp[i] = implement_zp(w2[i])
        w13_tmp = w13_tmp.contiguous()
        w2_tmp = w2_tmp.contiguous()
        w13.data = w13_tmp
        w2.data = w2_tmp
        w13.xpu_fused_moe = True

    # TODO: will all integrated in Cpp func. Temporary expose before gemm fusion
    num_rows, hidden_size = list(hidden_states.shape)
    num_moe_inputs = n_experts_per_token * num_rows
    if topk_ids.dtype == torch.int32:
        topk_ids = topk_ids.to(torch.int64)

    gemm1_output = torch.zeros((num_moe_inputs, 2 * inter_size),
                               dtype=torch.float32,
                               device=hidden_states.device)
    if data_dtype in [torch.float16, torch.bfloat16]:
        gemm1_output = gemm1_output.to(data_dtype)

    if expert_map is None and ep_size > 1:
        expert_map = torch.empty((num_experts * ep_size),
                                 dtype=torch.int32,
                                 device=hidden_states.device)
        torch.ops._moe_C.init_expert_map(expert_map, num_experts, ep_rank,
                                         ep_size)

    if expert_map is not None:
        total_experts_num = expert_map.shape[0]
    else:
        total_experts_num = num_experts * ep_size
    local_experts_num = num_experts

    remapped_hidden_states = torch.empty(
        (num_rows * n_experts_per_token, hidden_size),
        dtype=hidden_states.dtype,
        device=hidden_states.device)
    expert_first_token_offset = torch.zeros((num_experts + 1),
                                            dtype=torch.int64,
                                            device=hidden_states.device)
    unpermuted_row_to_permuted_row = torch.empty(
        (num_rows, n_experts_per_token),
        dtype=torch.int32,
        device=hidden_states.device)

    remapped_hidden_states_scales = None
    if input_scales is not None:
        scaled_hidden_size = hidden_size // block_k
        remapped_hidden_states_scales = torch.empty(
            (num_rows * n_experts_per_token, scaled_hidden_size),
            dtype=input_scales.dtype,
            device=hidden_states.device)

    torch.ops._moe_C.remap_hidden_states(
        hidden_states=hidden_states,
        hidden_states_scales=input_scales,
        remapped_hidden_states=remapped_hidden_states,
        remapped_hidden_states_scales=remapped_hidden_states_scales,
        expert_map=expert_map,
        expert_first_token_offset=expert_first_token_offset,
        unpermuted_row_to_permuted_row=unpermuted_row_to_permuted_row,
        topk_ids=topk_ids,
        total_experts_num=total_experts_num,
        local_experts_num=local_experts_num)

    ########### gemm1 ##################
    input_B = w13
    if scale_dtype == torch.float8_e8m0fnu:
        input_scales = reorder_mxfp_scales(remapped_hidden_states_scales,
                                           expert_first_token_offset)
    elif remapped_hidden_states_scales is not None:
        input_scales = remapped_hidden_states_scales

    torch.ops._xpu_C.cutlass_grouped_gemm_interface(
        ptr_A=remapped_hidden_states,
        ptr_A_scale=input_scales,
        ptr_B=input_B,
        ptr_B_scale=w13_scales,
        ptr_bias=w13_bias,
        ptr_D=gemm1_output,
        expert_first_token_offset=expert_first_token_offset,
        N=2 * inter_size,
        K=ori_hidden_size,
        num_experts=num_experts,
        is_B_int4=is_int4,
        is_B_mxfp4=is_mxfp4)

    # act
    act_output = torch.zeros((num_moe_inputs, inter_size),
                             dtype=gemm1_output.dtype,
                             device=gemm1_output.device)
    if activation == "silu":
        torch.ops._C.silu_and_mul(act_output, gemm1_output)
    elif activation == "gelu":
        torch.ops._C.gelu_and_mul(act_output, gemm1_output)
    elif activation == "swigluoai" or ("SWIGLUOAI" in str(activation)):
        torch.ops._C.swigluoai_and_mul(act_output, gemm1_output, 1.702, 7.0)
    elif activation == "swiglustep":
        torch.ops._C.swiglustep_and_mul(act_output, gemm1_output, 7.0)
    else:
        raise ValueError(f"Unsupported FusedMoe activation: {activation}.")

    ########### gemm2 ##################
    input_A = act_output.contiguous()
    input_B = w2
    gemm2_output = torch.zeros((num_moe_inputs, ori_hidden_size),
                               dtype=gemm1_output.dtype,
                               device=gemm1_output.device)

    if data_dtype in [torch.float16, torch.bfloat16]:
        input_A_scales = None
    elif data_dtype == torch.float8_e4m3fn:
        if scale_dtype == torch.float32:
            input_A, input_A_scales = quant_fp8_act(input_A)
        elif scale_dtype == torch.float8_e8m0fnu:
            input_A, input_A_scales = quant_mxfp_act(input_A, "mxfp8")
            input_A_scales = reorder_mxfp_scales(input_A_scales,
                                                 expert_first_token_offset)
    elif data_dtype == torch.float4_e2m1fn_x2:
        input_A, input_A_scales = quant_mxfp_act(input_A, "mxfp4")
        input_A_scales = reorder_mxfp_scales(input_A_scales,
                                             expert_first_token_offset)

    torch.ops._xpu_C.cutlass_grouped_gemm_interface(
        ptr_A=input_A,
        ptr_A_scale=input_A_scales,
        ptr_B=input_B,
        ptr_B_scale=w2_scales,
        ptr_bias=w2_bias,
        ptr_D=gemm2_output,
        expert_first_token_offset=expert_first_token_offset,
        N=ori_hidden_size,
        K=inter_size,
        num_experts=num_experts,
        is_B_int4=is_int4,
        is_B_mxfp4=is_mxfp4)

    torch.ops._moe_C.moe_gather(output, gemm2_output, topk_weights,
                                unpermuted_row_to_permuted_row,
                                expert_first_token_offset, num_experts)

    return output
