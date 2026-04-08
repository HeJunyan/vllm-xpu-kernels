# SPDX-License-Identifier: Apache-2.0
# Copyright (c) 2024, Tri Dao.
# Adapted from
# https://github.com/vllm-project/vllm/blob/main/vllm/model_executor/layers/mamba/ops/causal_conv1d.py
"""Triton kernel for depthwise causal conv1d (prefill / prompt phase)."""
from typing import Optional

import numpy as np
import torch
import triton
import triton.language as tl

# Sentinel values matching vllm's PAD_SLOT_ID / NULL_BLOCK_ID
PAD_SLOT_ID = -1
NULL_BLOCK_ID = 0


@triton.jit()
def _causal_conv1d_fwd_kernel(  # continuous batching
    # Pointers to matrices
    x_ptr,  # (dim, cu_seqlen)
    w_ptr,  # (dim, width)
    bias_ptr,
    initial_states_ptr,  # conv_states (num_cache_lines, dim, width-1)
    cache_indices_ptr,  # (batch,) or (batch, n_blocks+padding)
    has_initial_states_ptr,
    query_start_loc_ptr,
    batch_ptr,
    token_chunk_offset_ptr,
    block_idx_first_scheduled_token,  # (batch,) – only used when IS_APC_ENABLED
    block_idx_last_scheduled_token,  # (batch,) – only used when IS_APC_ENABLED
    initial_state_idx,  # (batch,) – only used when IS_APC_ENABLED
    num_computed_tokens,  # (batch,) – only used when IS_APC_ENABLED
    o_ptr,  # (dim, seqlen)
    # Matrix dimensions
    dim: tl.constexpr,
    seqlen: tl.int32,
    num_cache_lines: tl.constexpr,
    # Strides
    stride_x_dim: tl.constexpr,
    stride_x_token: tl.constexpr,
    stride_w_dim: tl.constexpr,
    stride_w_width: tl.constexpr,
    stride_istate_seq: tl.constexpr,
    stride_istate_dim: tl.constexpr,
    stride_istate_token: tl.constexpr,
    stride_cache_indices: tl.constexpr,
    stride_o_dim: tl.constexpr,
    stride_o_token: tl.constexpr,
    stride_block_m: tl.constexpr,
    # others
    pad_slot_id: tl.constexpr,
    null_block_id: tl.constexpr,
    # Meta-parameters
    HAS_BIAS: tl.constexpr,
    KERNEL_WIDTH: tl.constexpr,
    SILU_ACTIVATION: tl.constexpr,
    IS_APC_ENABLED: tl.constexpr,
    HAS_NULL_BLOCK: tl.constexpr,
    NP2_STATELEN: tl.constexpr,
    BLOCK_M: tl.constexpr,
    BLOCK_N: tl.constexpr,
):
    conv_states_ptr = initial_states_ptr
    conv_state_indices_ptr = cache_indices_ptr
    stride_conv_state_seq = stride_istate_seq
    stride_conv_state_dim = stride_istate_dim
    stride_conv_state_tok = stride_istate_token
    state_len = KERNEL_WIDTH - 1

    idx_seq = tl.load(batch_ptr + tl.program_id(0)).to(tl.int64)
    chunk_offset = tl.load(token_chunk_offset_ptr + tl.program_id(0))

    idx_feats = tl.program_id(1) * BLOCK_N + tl.arange(0, BLOCK_N)

    if idx_seq == pad_slot_id:
        return

    sequence_start_index = tl.load(query_start_loc_ptr + idx_seq)
    sequence_end_index = tl.load(query_start_loc_ptr + idx_seq + 1)
    seqlen = sequence_end_index - sequence_start_index

    B_size: tl.constexpr = stride_block_m * BLOCK_M

    if IS_APC_ENABLED:
        current_first_index = tl.load(block_idx_first_scheduled_token +
                                      idx_seq)
        current_last_index = tl.load(block_idx_last_scheduled_token + idx_seq)
        sequence_completed_index = tl.load(num_computed_tokens + idx_seq)

        sequence_completed_offset_token = sequence_completed_index % B_size
        seq_completed_offset = B_size - sequence_completed_offset_token
        seq_end_offset = (seqlen - seq_completed_offset) % B_size
        last_full_block_token_index = sequence_end_index - seq_end_offset
        if seq_end_offset == 0:
            last_full_block_token_index = last_full_block_token_index - B_size

        n_block_to_fill = current_last_index - current_first_index

        conv_state_init_index = tl.load(initial_state_idx + idx_seq)
    else:
        n_block_to_fill = 0
        current_last_index = 0
        conv_state_init_index = 0
        current_first_index = 0
        last_full_block_token_index = 0

    token_offset = BLOCK_M * chunk_offset
    segment_len = min(BLOCK_M, seqlen - token_offset)

    x_base = (x_ptr + sequence_start_index * stride_x_token +
              idx_feats * stride_x_dim)

    conv_states_input_coord = tl.load(conv_state_indices_ptr +
                                      idx_seq * stride_cache_indices +
                                      conv_state_init_index).to(tl.int64)

    if HAS_NULL_BLOCK:  # noqa
        if conv_states_input_coord == null_block_id:
            return

    conv_states_base = (conv_states_ptr +
                        (conv_states_input_coord * stride_conv_state_seq) +
                        (idx_feats * stride_conv_state_dim))

    w_base = w_ptr + (idx_feats * stride_w_dim)

    if chunk_offset == 0:
        load_init_state = tl.load(has_initial_states_ptr + idx_seq).to(tl.int1)
        if load_init_state:
            prior_tokens = conv_states_base + (state_len -
                                               1) * stride_conv_state_tok
            mask_w = idx_feats < dim
            if KERNEL_WIDTH == 2:
                conv_states_ptrs = prior_tokens
                col0 = tl.load(conv_states_ptrs, mask_w, 0.0)
            if KERNEL_WIDTH == 3:
                conv_states_ptrs = prior_tokens
                col1 = tl.load(conv_states_ptrs, mask_w, 0.0)
                conv_states_ptrs = prior_tokens - 1 * stride_conv_state_tok
                col0 = tl.load(conv_states_ptrs, mask_w, 0.0)
            if KERNEL_WIDTH == 4:
                conv_states_ptrs = prior_tokens
                col2 = tl.load(conv_states_ptrs, mask_w, 0.0)
                conv_states_ptrs = prior_tokens - 1 * stride_conv_state_tok
                col1 = tl.load(conv_states_ptrs, mask_w, 0.0)
                conv_states_ptrs = prior_tokens - 2 * stride_conv_state_tok
                col0 = tl.load(conv_states_ptrs, mask_w, 0.0)
            if KERNEL_WIDTH == 5:
                conv_states_ptrs = prior_tokens
                col3 = tl.load(conv_states_ptrs, mask_w, 0.0)
                conv_states_ptrs = prior_tokens - 1 * stride_conv_state_tok
                col2 = tl.load(conv_states_ptrs, mask_w, 0.0)
                conv_states_ptrs = prior_tokens - 2 * stride_conv_state_tok
                col1 = tl.load(conv_states_ptrs, mask_w, 0.0)
                conv_states_ptrs = prior_tokens - 3 * stride_conv_state_tok
                col0 = tl.load(conv_states_ptrs, mask_w, 0.0)
        else:
            if KERNEL_WIDTH >= 2:
                col0 = tl.zeros((BLOCK_N, ), dtype=x_ptr.dtype.element_ty)
            if KERNEL_WIDTH >= 3:
                col1 = tl.zeros((BLOCK_N, ), dtype=x_ptr.dtype.element_ty)
            if KERNEL_WIDTH >= 4:
                col2 = tl.zeros((BLOCK_N, ), dtype=x_ptr.dtype.element_ty)
            if KERNEL_WIDTH >= 5:
                col3 = tl.zeros((BLOCK_N, ), dtype=x_ptr.dtype.element_ty)

        if (state_len <= seqlen):
            idx_tokens_last = (seqlen - state_len) + tl.arange(0, NP2_STATELEN)
            x_ptrs = (x_ptr + ((sequence_start_index + idx_tokens_last) *
                               stride_x_token)[:, None] +
                      (idx_feats * stride_x_dim)[None, :])
            mask_x = ((idx_tokens_last >= 0)[:, None]
                      & (idx_tokens_last < seqlen)[:, None]
                      & (idx_feats < dim)[None, :])
            loaded_x = tl.load(x_ptrs, mask_x, 0.0)
            idx_tokens_conv = tl.arange(0, NP2_STATELEN)

            conv_states_output_coord = tl.load(conv_state_indices_ptr +
                                               idx_seq * stride_cache_indices +
                                               current_last_index).to(tl.int64)

            conv_states_ptrs_target = (
                conv_states_ptr +
                (conv_states_output_coord * stride_conv_state_seq) +
                (idx_feats * stride_conv_state_dim))[None, :] + (
                    idx_tokens_conv * stride_conv_state_tok)[:, None]

            mask = (idx_tokens_conv < state_len)[:, None] & (idx_feats
                                                             < dim)[None, :]
            tl.debug_barrier()
            tl.store(conv_states_ptrs_target, loaded_x, mask)

        else:
            if load_init_state:
                idx_tokens_conv = tl.arange(0, NP2_STATELEN)

                conv_states_ptrs_source = (
                    conv_states_ptr +
                    (conv_states_input_coord * stride_conv_state_seq) +
                    (idx_feats * stride_conv_state_dim)[None, :] +
                    ((idx_tokens_conv + seqlen) * stride_conv_state_tok)[:,
                                                                         None])
                mask = ((conv_states_input_coord < num_cache_lines)
                        & ((idx_tokens_conv + seqlen) < state_len)[:, None]
                        & (idx_feats < dim)[None, :])
                conv_state = tl.load(conv_states_ptrs_source, mask, other=0.0)

                VAL = state_len - seqlen

                x_ptrs = (x_base[None, :] +
                          ((idx_tokens_conv - VAL) * stride_x_token)[:, None])

                mask_x = ((idx_tokens_conv - VAL >= 0)[:, None]
                          & (idx_tokens_conv - VAL < seqlen)[:, None]
                          & (idx_feats < dim)[None, :])
                loaded_x = tl.load(x_ptrs, mask_x, 0.0)

                tl.debug_barrier()
                new_conv_state = tl.where(mask, conv_state, loaded_x)
                conv_states_ptrs_target = (
                    conv_states_base +
                    (idx_tokens_conv * stride_conv_state_tok)[:, None])
                mask = (idx_tokens_conv
                        < state_len)[:, None] & (idx_feats < dim)[None, :]
                tl.store(conv_states_ptrs_target, new_conv_state, mask)
            else:
                idx_tokens_conv = tl.arange(0, NP2_STATELEN)

                VAL = state_len - seqlen

                x_ptrs = (x_base[None, :] +
                          ((idx_tokens_conv - VAL) * stride_x_token)[:, None])

                mask_x = ((idx_tokens_conv - VAL >= 0)[:, None]
                          & (idx_tokens_conv - VAL < seqlen)[:, None]
                          & (idx_feats < dim)[None, :])
                new_conv_state = tl.load(x_ptrs, mask_x, 0.0)

                conv_states_ptrs_target = (
                    conv_states_base +
                    (idx_tokens_conv * stride_conv_state_tok)[:, None])
                mask = (idx_tokens_conv
                        < state_len)[:, None] & (idx_feats < dim)[None, :]
                tl.store(conv_states_ptrs_target, new_conv_state, mask)

    else:  # chunk_offset > 0
        load_init_state = True
        prior_tokens = x_base + (token_offset - 1) * stride_x_token
        mask_w = idx_feats < dim
        if KERNEL_WIDTH == 2:
            conv_states_ptrs = prior_tokens
            col0 = tl.load(conv_states_ptrs, mask_w, 0.0)
        if KERNEL_WIDTH == 3:
            conv_states_ptrs = prior_tokens
            col1 = tl.load(conv_states_ptrs, mask_w, 0.0)
            conv_states_ptrs = prior_tokens - 1 * stride_x_token
            col0 = tl.load(conv_states_ptrs, mask_w, 0.0)
        if KERNEL_WIDTH == 4:
            conv_states_ptrs = prior_tokens
            col2 = tl.load(conv_states_ptrs, mask_w, 0.0)
            conv_states_ptrs = prior_tokens - 1 * stride_x_token
            col1 = tl.load(conv_states_ptrs, mask_w, 0.0)
            conv_states_ptrs = prior_tokens - 2 * stride_x_token
            col0 = tl.load(conv_states_ptrs, mask_w, 0.0)
        if KERNEL_WIDTH == 5:
            conv_states_ptrs = prior_tokens
            col3 = tl.load(conv_states_ptrs, mask_w, 0.0)
            conv_states_ptrs = prior_tokens - 1 * stride_x_token
            col2 = tl.load(conv_states_ptrs, mask_w, 0.0)
            conv_states_ptrs = prior_tokens - 2 * stride_x_token
            col1 = tl.load(conv_states_ptrs, mask_w, 0.0)
            conv_states_ptrs = prior_tokens - 3 * stride_x_token
            col0 = tl.load(conv_states_ptrs, mask_w, 0.0)

        if IS_APC_ENABLED:
            if (chunk_offset - 1) < n_block_to_fill:
                idx_tokens_last = (last_full_block_token_index -
                                   (n_block_to_fill - chunk_offset) * B_size -
                                   state_len) + tl.arange(0, NP2_STATELEN)
                x_ptrs = (x_ptr + (idx_tokens_last * stride_x_token)[:, None] +
                          (idx_feats * stride_x_dim)[None, :])

                mask_x = (idx_tokens_last >= 0)[:, None] & (idx_feats
                                                            < dim)[None, :]
                loaded_x = tl.load(x_ptrs, mask_x, 0.0)
                idx_tokens_conv = tl.arange(0, NP2_STATELEN)

                conv_states_output_coord = tl.load(
                    conv_state_indices_ptr + idx_seq * stride_cache_indices +
                    current_first_index + (chunk_offset - 1)).to(tl.int64)

                conv_states_ptrs_target = (
                    conv_states_ptr +
                    (conv_states_output_coord * stride_conv_state_seq) +
                    (idx_feats * stride_conv_state_dim))[None, :] + (
                        idx_tokens_conv * stride_conv_state_tok)[:, None]

                mask = (idx_tokens_conv
                        < state_len)[:, None] & (idx_feats < dim)[None, :]
                tl.debug_barrier()
                tl.store(conv_states_ptrs_target, loaded_x, mask)

    if HAS_BIAS:
        bias = bias_ptr + idx_feats
        mask_bias = idx_feats < dim
        acc_preload = tl.load(bias, mask=mask_bias, other=0.0).to(tl.float32)
    else:
        acc_preload = tl.zeros((BLOCK_N, ), dtype=tl.float32)

    x_base_1d = x_base + token_offset * stride_x_token

    # PRE-LOAD WEIGHTS
    mask_w = idx_feats < dim
    if KERNEL_WIDTH >= 2:
        w_ptrs = w_base + (0 * stride_w_width)
        w_col0 = tl.load(w_ptrs, mask_w, other=0.0)
        w_ptrs = w_base + (1 * stride_w_width)
        w_col1 = tl.load(w_ptrs, mask_w, other=0.0)
    if KERNEL_WIDTH >= 3:
        w_ptrs = w_base + (2 * stride_w_width)
        w_col2 = tl.load(w_ptrs, mask_w, other=0.0)
    if KERNEL_WIDTH >= 4:
        w_ptrs = w_base + (3 * stride_w_width)
        w_col3 = tl.load(w_ptrs, mask_w, other=0.0)
    if KERNEL_WIDTH >= 5:
        w_ptrs = w_base + (4 * stride_w_width)
        w_col4 = tl.load(w_ptrs, mask_w, other=0.0)

    mask_x_1d = idx_feats < dim
    for idx_token in range(segment_len):
        acc = acc_preload

        matrix_w = w_col0
        matrix_x = col0
        for j in tl.static_range(KERNEL_WIDTH):
            if KERNEL_WIDTH == 2:
                if j == 1:
                    matrix_w = w_col1
                    x_ptrs_1d = x_base_1d + idx_token * stride_x_token
                    matrix_x = tl.load(x_ptrs_1d, mask=mask_x_1d)
            elif KERNEL_WIDTH == 3:
                if j == 1:
                    matrix_w = w_col1
                    matrix_x = col1
                elif j == 2:
                    matrix_w = w_col2
                    x_ptrs_1d = x_base_1d + idx_token * stride_x_token
                    matrix_x = tl.load(x_ptrs_1d, mask=mask_x_1d)
            elif KERNEL_WIDTH == 4:
                if j == 1:
                    matrix_w = w_col1
                    matrix_x = col1
                elif j == 2:
                    matrix_w = w_col2
                    matrix_x = col2
                elif j == 3:
                    matrix_w = w_col3
                    x_ptrs_1d = x_base_1d + idx_token * stride_x_token
                    matrix_x = tl.load(x_ptrs_1d, mask=mask_x_1d)
            elif KERNEL_WIDTH == 5:
                if j == 1:
                    matrix_w = w_col1
                    matrix_x = col1
                elif j == 2:
                    matrix_w = w_col2
                    matrix_x = col2
                elif j == 3:
                    matrix_w = w_col3
                    matrix_x = col3
                elif j == 4:
                    matrix_w = w_col4
                    x_ptrs_1d = x_base_1d + idx_token * stride_x_token
                    matrix_x = tl.load(x_ptrs_1d, mask=mask_x_1d)

            acc += matrix_x * matrix_w

        if KERNEL_WIDTH == 2:
            col0 = matrix_x
        elif KERNEL_WIDTH == 3:
            col0 = col1
            col1 = matrix_x
        elif KERNEL_WIDTH == 4:
            col0 = col1
            col1 = col2
            col2 = matrix_x
        elif KERNEL_WIDTH == 5:
            col0 = col1
            col1 = col2
            col2 = col3
            col3 = matrix_x

        if SILU_ACTIVATION:
            acc = acc / (1 + tl.exp(-acc))
        mask_1d = (idx_token < segment_len) & (idx_feats < dim)
        o_ptrs = (o_ptr + (sequence_start_index + token_offset + idx_token) *
                  stride_o_token + (idx_feats * stride_o_dim))

        tl.store(o_ptrs, acc, mask=mask_1d)


def causal_conv1d_fn(
    x: torch.Tensor,
    weight: torch.Tensor,
    bias: Optional[torch.Tensor],
    conv_states: torch.Tensor,
    query_start_loc: torch.Tensor,
    cache_indices: Optional[torch.Tensor] = None,
    has_initial_state: Optional[torch.Tensor] = None,
    activation: Optional[str] = None,
    pad_slot_id: int = PAD_SLOT_ID,
    null_block_id: int = NULL_BLOCK_ID,
    block_idx_first_scheduled_token: Optional[torch.Tensor] = None,
    block_idx_last_scheduled_token: Optional[torch.Tensor] = None,
    initial_state_idx: Optional[torch.Tensor] = None,
    num_computed_tokens: Optional[torch.Tensor] = None,
    block_size_to_align: int = 0,
) -> torch.Tensor:
    """Causal conv1d forward for continuous batching (variable-length sequences).

    Args:
        x: ``(dim, cu_seqlen)`` input tensor in channel-last layout,
            i.e. ``x.stride(0) == 1`` and ``x.stride(1) >= dim``.
        weight: ``(dim, width)`` weight tensor, must have ``stride(1) == 1``.
        bias: ``(dim,)`` bias tensor or ``None``.
        conv_states: ``(num_cache_lines, dim, width-1)`` conv state cache,
            updated in-place with the last ``width-1`` tokens of each sequence.
        query_start_loc: ``(batch+1,)`` int32 cumulative sequence lengths
            (prepended by 0).
        cache_indices: ``(batch,)`` int32 mapping each sequence to a cache
            line in *conv_states*.  Defaults to ``[0, 1, ..., batch-1]``.
        has_initial_state: ``(batch,)`` bool; ``True`` means the corresponding
            entry in *conv_states* holds valid prior-token state.
            Defaults to all-False.
        activation: ``None``, ``"silu"``, or ``"swish"``.
        pad_slot_id: sentinel for padding entries in *cache_indices*.
        null_block_id: sentinel for null/invalid cache lines.
        block_idx_first_scheduled_token: APC support (optional).
        block_idx_last_scheduled_token: APC support (optional).
        initial_state_idx: APC support (optional).
        num_computed_tokens: APC support (optional).
        block_size_to_align: APC block alignment (0 = disabled).

    Returns:
        Output tensor of same shape and dtype as *x*.
    """
    if isinstance(activation, bool) and activation:
        activation = "silu"

    original_x_dtype = x.dtype
    x = x.to(conv_states.dtype)
    out = torch.empty_like(x)

    dim, cu_seqlen = x.shape
    _, width = weight.shape
    state_len = width - 1
    np2_statelen = triton.next_power_of_2(state_len)

    padded_batch = query_start_loc.size(0) - 1

    stride_x_dim = x.stride(0)
    stride_x_token = x.stride(1)
    stride_w_dim = weight.stride(0)
    stride_w_width = weight.stride(1)

    num_cache_lines = 0
    stride_istate_seq = 0
    stride_istate_dim = 0
    stride_istate_token = 0
    if conv_states is not None:
        num_cache_lines = conv_states.size(0)
        stride_istate_seq = conv_states.stride(0)
        stride_istate_dim = conv_states.stride(1)
        stride_istate_token = conv_states.stride(2)

    stride_o_dim = out.stride(0)
    stride_o_token = out.stride(1)
    stride_cache_indices = (cache_indices.stride(0)
                            if cache_indices is not None else 0)

    BLOCK_M = 8

    # Pre-compute the sequence-id and chunk-offset for every Triton program.
    seqlens_cpu = ((query_start_loc[1:] -
                    query_start_loc[:-1]).cpu().numpy().astype(np.int64))
    nums = (seqlens_cpu + BLOCK_M - 1) // BLOCK_M  # ceil-div per sequence
    total_chunks = int(nums.sum())

    seq_ids = np.repeat(np.arange(padded_batch, dtype=np.int32), nums)
    chunk_offsets_arr = np.concatenate(
        [np.arange(n, dtype=np.int32)
         for n in nums]) if total_chunks > 0 else np.array([], dtype=np.int32)

    batch_ptr = torch.from_numpy(seq_ids).to(x.device)
    token_chunk_offset_ptr = torch.from_numpy(chunk_offsets_arr).to(x.device)

    def grid(META):
        return (total_chunks, triton.cdiv(dim, META["BLOCK_N"]))

    _causal_conv1d_fwd_kernel[grid](
        x,
        weight,
        bias,
        conv_states,
        cache_indices,
        has_initial_state,
        query_start_loc,
        batch_ptr,
        token_chunk_offset_ptr,
        block_idx_first_scheduled_token,
        block_idx_last_scheduled_token,
        initial_state_idx,
        num_computed_tokens,
        out,
        # Matrix dimensions
        dim,
        cu_seqlen,
        num_cache_lines,
        # strides
        stride_x_dim,
        stride_x_token,
        stride_w_dim,
        stride_w_width,
        stride_istate_seq,
        stride_istate_dim,
        stride_istate_token,
        stride_cache_indices,
        stride_o_dim,
        stride_o_token,
        block_size_to_align // BLOCK_M,
        # others
        pad_slot_id,
        null_block_id,
        # META
        HAS_BIAS=bias is not None,
        KERNEL_WIDTH=width,
        SILU_ACTIVATION=activation in ["silu", "swish"],
        IS_APC_ENABLED=block_idx_last_scheduled_token is not None,
        HAS_NULL_BLOCK=null_block_id is not None,
        NP2_STATELEN=np2_statelen,
        BLOCK_M=BLOCK_M,
        BLOCK_N=256,
        num_stages=2,
    )
    return out.to(original_x_dtype)


def conv1d(
    x: torch.Tensor,
    weight: torch.Tensor,
    bias: Optional[torch.Tensor] = None,
) -> torch.Tensor:
    """Triton-based depthwise causal conv1d for the prefill (prompt) phase.

    Implements the same mathematical operation as a standard depthwise causal
    conv1d: left-pad the sequence dimension with ``kernel_size - 1`` zeros
    and accumulate element-wise products across kernel positions.

    Args:
        x: Input tensor of shape ``[batch, seq_len, dim]``.
        weight: Weight tensor of shape ``[kernel_size, dim]``.
        bias: Optional bias tensor of shape ``[dim]``.

    Returns:
        Output tensor of shape ``[batch, seq_len, dim]``.
    """
    if x.dim() != 3:
        raise ValueError(
            f"x must be a 3-D tensor [batch, seq_len, dim], got {x.dim()}-D")
    if weight.dim() != 2:
        raise ValueError(f"weight must be a 2-D tensor [kernel_size, dim], "
                         f"got {weight.dim()}-D")

    bs, seq_len, dim = x.shape
    kernel_size, w_dim = weight.shape

    if w_dim != dim:
        raise ValueError(
            f"weight.shape[1] ({w_dim}) must match x.shape[2] ({dim})")
    if bias is not None and bias.shape != (dim, ):
        raise ValueError(f"bias shape {tuple(bias.shape)} must be ({dim},)")

    # causal_conv1d_fn expects:
    #   x      : (dim, cu_seqlen) in channel-last layout, stride(0)==1
    #   weight : (dim, kernel_size) contiguous, stride(1)==1
    x_2d = x.reshape(bs * seq_len,
                     dim).t()  # (dim, bs*seq_len), strides (1, dim)
    w_2d = weight.t().contiguous(
    )  # (dim, kernel_size), strides (kernel_size, 1)

    # Auxiliary tensors for the continuous-batching API.
    state_size = max(kernel_size - 1, 1)
    conv_states = torch.zeros(bs,
                              dim,
                              state_size,
                              dtype=x_2d.dtype,
                              device=x.device)
    # query_start_loc: [0, seq_len, 2*seq_len, ..., bs*seq_len]
    query_start_loc = torch.arange(0, (bs + 1) * seq_len,
                                   seq_len,
                                   dtype=torch.int32,
                                   device=x.device)
    # has_initial_state: all False → zero-padding at sequence boundaries
    has_initial_state = torch.zeros(bs, dtype=torch.bool, device=x.device)
    # cache_indices: identity mapping [0, 1, ..., bs-1]
    cache_indices = torch.arange(bs, dtype=torch.int32, device=x.device)

    out_2d = causal_conv1d_fn(
        x=x_2d,
        weight=w_2d,
        bias=bias,
        conv_states=conv_states,
        query_start_loc=query_start_loc,
        cache_indices=cache_indices,
        has_initial_state=has_initial_state,
        activation=None,
    )

    # Convert output back: (dim, bs*seq_len) → (bs*seq_len, dim) → [bs, seq_len, dim]
    return out_2d.t().reshape(bs, seq_len, dim)
