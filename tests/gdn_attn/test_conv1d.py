# SPDX-License-Identifier: Apache-2.0
# SPDX-FileCopyrightText: Copyright contributors to the vLLM project

import random

import pytest
import torch
import torch.nn.functional as F

# Conv1d parameters used in vllm (e.g. Mamba/QWEN)
NUM_TOKENS = [1, 32, 1024, 8192]
BATCH_SIZE = [32]
DIM = [512, 6144]
WIDTH = [4]
HAS_BIAS = [True, False]
ACTIVATION = ["silu", None]
MODE = ["prefill", "decode", "mix_mode"]
DTYPES = [torch.float16]

# Override pytest parameters when enabling mini pytest
MINI_PYTEST_PARAMS = {
    "default": {
        "num_actual_tokens": [32],
    },
}


def naive_causal_conv1d(
    x,
    conv_state,
    conv_weights,
    conv_bias,
    activation,
    query_start_loc,
    state_indices,
    has_initial_state,
):
    """Naive element-by-element reference for causal conv1d.

    For each batch, for each token position, computes a depthwise causal
    convolution by taking the dot product of the last `width` inputs
    (including conv_state history) with the corresponding conv_weights,
    then optionally adds bias and applies activation.

    Args:
        x: [num_actual_tokens, dim] - input features
        conv_state: [cache_batch_size, width - 1, dim] - history buffer
        conv_weights: [dim, width] - depthwise conv weights
        conv_bias: [dim] or None
        activation: "silu" or None
        query_start_loc: [batch_size + 1] - cumulative token offsets
        state_indices: [batch_size] - indices into conv_state cache
        has_initial_state: [batch_size] - whether conv_state is valid
    """
    dtype = x.dtype
    device = x.device
    num_actual_tokens = x.shape[0]
    dim = x.shape[1]
    width = conv_weights.shape[1]
    batch_size = query_start_loc.shape[0] - 1

    output = torch.zeros((num_actual_tokens, dim), dtype=dtype, device=device)
    window = torch.zeros(width, dim, dtype=torch.float32, device=device)
    weights_f32 = conv_weights.to(torch.float32)
    bias_f32 = conv_bias.to(torch.float32) if conv_bias is not None else None

    for batch in range(batch_size):
        batch_start = int(query_start_loc[batch].item())
        batch_end = int(query_start_loc[batch + 1].item())
        batch_num_tokens = batch_end - batch_start

        if has_initial_state[batch]:
            state = conv_state[state_indices[batch]].clone()
        else:
            state = torch.zeros(width - 1, dim, dtype=dtype, device=device)

        for t in range(batch_num_tokens):
            token_idx = batch_start + t

            # For each output position, gather the causal window.
            # window[0] = oldest, window[width-1] = current token
            window.zero_()
            for w in range(width):
                lookback = width - 1 - w
                src_idx = t - lookback
                if src_idx >= 0:
                    window[w] = x[batch_start + src_idx].to(torch.float32)
                else:
                    state_pos = (width - 1) + src_idx
                    if state_pos >= 0:
                        window[w] = state[state_pos].to(torch.float32)

            # Depthwise conv: dot product per channel
            result = (window * weights_f32.T).sum(dim=0)

            if bias_f32 is not None:
                result += bias_f32

            if activation == "silu":
                result = F.silu(result)

            output[token_idx] = result.to(dtype)

        # Update conv_state: store the last (width-1) tokens
        all_tokens = torch.cat([state, x[batch_start:batch_end]], dim=0)
        conv_state[state_indices[batch]] = all_tokens[batch_num_tokens:]

    return output


def ref_conv1d(
    x,
    conv_state,
    conv_weights,
    conv_bias,
    activation,
    query_start_loc,
    state_indices,
    has_initial_state,
):
    """Reference implementation of causal conv1d using F.conv1d.

    For each batch, concatenates the conv_state history with the current
    input tokens, applies a grouped depthwise 1D convolution using
    F.conv1d, and updates the conv_state.

    Args:
        x: [num_actual_tokens, dim] - input features
        conv_state: [cache_batch_size, width - 1, dim] - history buffer
        conv_weights: [dim, width] - depthwise conv weights
        conv_bias: [dim] or None
        activation: "silu" or None
        query_start_loc: [batch_size + 1] - cumulative token offsets
        state_indices: [batch_size] - indices into conv_state cache
        has_initial_state: [batch_size] - whether conv_state is valid
    """
    dtype = x.dtype
    num_actual_tokens = x.shape[0]
    dim = x.shape[1]
    batch_size = query_start_loc.shape[0] - 1

    output = torch.zeros((num_actual_tokens, dim), dtype=dtype,
                         device=x.device)

    bias_f32 = conv_bias.to(torch.float32) if conv_bias is not None else None

    for batch in range(batch_size):
        batch_start = int(query_start_loc[batch].item())
        batch_end = int(query_start_loc[batch + 1].item())
        batch_num_tokens = batch_end - batch_start

        if has_initial_state[batch]:
            state = conv_state[state_indices[batch]]
        else:
            state = torch.zeros_like(conv_state[0])

        # Concatenate history with current tokens
        conv_input = torch.cat([state, x[batch_start:batch_end]], dim=0)

        # Update conv_state with the last (width-1) tokens
        conv_state[state_indices[batch]] = conv_input[batch_num_tokens:]

        # Reshape for F.conv1d: [1, dim, seq_len]
        conv_input = conv_input.transpose(0, 1).unsqueeze(0)

        # Grouped depthwise conv1d (one group per channel)
        conv_out = F.conv1d(
            conv_input.to(torch.float32),
            conv_weights.unsqueeze(1).to(torch.float32),
            bias_f32,
            padding=0,
            groups=dim,
        )

        if activation == "silu":
            conv_out = F.silu(conv_out)

        conv_out = conv_out.to(dtype=dtype)

        # Reshape back: [batch_num_tokens, dim]
        conv_out = conv_out.transpose(-2, -1).reshape(batch_num_tokens, dim)
        output[batch_start:batch_end] = conv_out

    return output


def simple_random_distribute(N, batch_size):
    distribution = torch.ones([batch_size])
    for i in range(N - batch_size):
        selected_idx = random.randint(0, batch_size - 1)
        distribution[selected_idx] += 1

    return distribution


@pytest.mark.parametrize("num_actual_tokens", NUM_TOKENS)
@pytest.mark.parametrize("batch_size", BATCH_SIZE)
@pytest.mark.parametrize("dim", DIM)
@pytest.mark.parametrize("width", WIDTH)
@pytest.mark.parametrize("has_bias", HAS_BIAS)
@pytest.mark.parametrize("activation", ACTIVATION)
@pytest.mark.parametrize("mode", MODE)
@pytest.mark.parametrize("dtype", DTYPES)
@torch.inference_mode()
def test_causal_conv1d(num_actual_tokens, batch_size, dim, width, has_bias,
                       activation, mode, dtype):
    """Test causal conv1d with state management as used in vllm.

    Compares a naive element-by-element reference implementation against
    an F.conv1d-based reference for the grouped depthwise causal conv1d
    pattern used in Mamba/SSM models within vllm.
    """
    device = "xpu"
    random.seed(42)
    torch.manual_seed(42)

    if batch_size > num_actual_tokens:
        batch_size = num_actual_tokens

    if mode == "prefill":
        num_prefills = batch_size
    elif mode == "decode":
        num_prefills = 0
        if batch_size < num_actual_tokens:
            pytest.skip("decode mode requires batch_size >= num_actual_tokens")
    else:
        num_prefills = random.randint(1, batch_size -
                                      1) if batch_size > 1 else 1

    num_decodes = batch_size - num_prefills
    cache_batch_size = 200

    # Input data
    x = torch.randn((num_actual_tokens, dim), dtype=dtype, device=device)

    # Conv state (history buffer)
    conv_state = torch.randn((cache_batch_size, width - 1, dim),
                             dtype=dtype,
                             device=device)
    ref_conv_state = conv_state.clone()

    # Conv weights and optional bias
    conv_weights = torch.randn((dim, width), dtype=dtype, device=device)
    conv_bias = None
    if has_bias:
        conv_bias = torch.randn((dim,), dtype=dtype, device=device)

    # Batch structure: variable-length sequences
    prefill_batches = simple_random_distribute(num_actual_tokens - num_decodes,
                                               batch_size - num_decodes)
    token_batches = torch.cat([torch.ones([num_decodes]),
                               prefill_batches]).to(device)
    perm = torch.randperm(token_batches.size(0)).to(device)
    shuffled_tensor = token_batches[perm]
    query_start_loc = torch.cat([
        torch.zeros([1], device=device),
        torch.cumsum(shuffled_tensor, dim=0)
    ]).to(torch.int32)
    has_initial_state = perm >= num_decodes
    state_indices = torch.tensor(random.sample(range(cache_batch_size),
                                               batch_size),
                                 device=device,
                                 dtype=torch.int32)

    # Run F.conv1d-based reference
    ref_output = ref_conv1d(
        x,
        ref_conv_state,
        conv_weights,
        conv_bias,
        activation,
        query_start_loc,
        state_indices,
        has_initial_state,
    )

    # Run naive element-by-element reference
    naive_output = naive_causal_conv1d(
        x,
        conv_state,
        conv_weights,
        conv_bias,
        activation,
        query_start_loc,
        state_indices,
        has_initial_state,
    )

    atol = 5e-2
    rtol = 5e-2

    # Verify conv1d output
    torch.testing.assert_close(naive_output, ref_output, atol=atol, rtol=rtol)

    # Verify conv_state updates
    for i in range(batch_size):
        sid = state_indices[i]
        torch.testing.assert_close(conv_state[sid],
                                   ref_conv_state[sid],
                                   atol=atol,
                                   rtol=rtol)
