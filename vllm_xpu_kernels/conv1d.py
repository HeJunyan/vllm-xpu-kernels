# SPDX-License-Identifier: Apache-2.0
"""Triton-based 1D convolution kernel for vLLM.

This module implements a depthwise 1D convolution using Triton, optimized for
the inference use case in Mamba/SSM models within vLLM. The convolution
operates along the last dimension (width) for each channel independently.

Typical usage in vLLM Mamba models:
    - Input shape: (batch, channels, width)
    - Weight shape: (channels, 1, kernel_size)  (depthwise)
    - Optional bias shape: (channels,)
"""

from typing import Optional

import torch
import triton
import triton.language as tl


@triton.jit
def _conv1d_kernel(
    input_ptr,
    weight_ptr,
    bias_ptr,
    output_ptr,
    batch_size,
    in_channels,
    in_width,
    kernel_size,
    out_width,
    stride,
    padding,
    HAS_BIAS: tl.constexpr,
    BLOCK_SIZE_W: tl.constexpr,
):
    """Triton kernel for depthwise 1D convolution.

    Each program instance handles one (batch, channel) pair, iterating
    over the output width in blocks of BLOCK_SIZE_W.

    Args:
        input_ptr: Pointer to input tensor [batch, channels, in_width].
        weight_ptr: Pointer to weight tensor [channels, 1, kernel_size].
        bias_ptr: Pointer to bias tensor [channels] or None.
        output_ptr: Pointer to output tensor [batch, channels, out_width].
        batch_size: Number of batch elements.
        in_channels: Number of input/output channels.
        in_width: Input width (length of last dimension).
        kernel_size: Convolution kernel size.
        out_width: Output width.
        stride: Convolution stride.
        padding: Convolution padding (left and right).
        HAS_BIAS: Whether bias is present (compile-time constant).
        BLOCK_SIZE_W: Block size for output width dimension.
    """
    # Each program handles one (batch, channel) pair
    pid = tl.program_id(0)
    batch_idx = pid // in_channels
    channel_idx = pid % in_channels

    # Base pointers for this (batch, channel)
    input_base = (input_ptr + batch_idx * in_channels * in_width +
                  channel_idx * in_width)
    weight_base = weight_ptr + channel_idx * kernel_size
    output_base = (output_ptr + batch_idx * in_channels * out_width +
                   channel_idx * out_width)

    # Process output positions in blocks
    for w_start in range(0, out_width, BLOCK_SIZE_W):
        w_offsets = w_start + tl.arange(0, BLOCK_SIZE_W)
        w_mask = w_offsets < out_width

        # Accumulate convolution result
        acc = tl.zeros([BLOCK_SIZE_W], dtype=tl.float32)

        for k in range(kernel_size):
            # Input position for this kernel element
            in_pos = w_offsets * stride + k - padding

            # Boundary check: valid input positions
            in_mask = w_mask & (in_pos >= 0) & (in_pos < in_width)

            # Load input values (0 for out-of-bounds = zero padding)
            x = tl.load(input_base + in_pos, mask=in_mask, other=0.0)

            # Load weight for this kernel position
            w = tl.load(weight_base + k)

            # Accumulate
            acc += x.to(tl.float32) * w.to(tl.float32)

        # Add bias if present
        if HAS_BIAS:
            bias_val = tl.load(bias_ptr + channel_idx)
            acc += bias_val.to(tl.float32)

        # Store output
        tl.store(output_base + w_offsets, acc, mask=w_mask)


def conv1d(
    input: torch.Tensor,
    weight: torch.Tensor,
    bias: Optional[torch.Tensor] = None,
    stride: int = 1,
    padding: int = 0,
) -> torch.Tensor:
    """Depthwise 1D convolution using Triton.

    Performs depthwise 1D convolution where each input channel is convolved
    with its own set of filters (groups == in_channels).

    Args:
        input: Input tensor of shape (batch, channels, width).
        weight: Weight tensor of shape (channels, 1, kernel_size).
        bias: Optional bias tensor of shape (channels,).
        stride: Convolution stride. Default: 1.
        padding: Zero-padding added to both sides. Default: 0.

    Returns:
        Output tensor of shape (batch, channels, out_width) where
        out_width = (width + 2 * padding - kernel_size) // stride + 1.
    """
    assert input.ndim == 3, (
        f"Expected 3D input (batch, channels, width), got {input.ndim}D")
    assert weight.ndim == 3, (
        f"Expected 3D weight (channels, 1, kernel_size), got {weight.ndim}D")
    assert weight.shape[1] == 1, (
        f"Expected depthwise weight with shape[1]==1, got {weight.shape[1]}")
    assert input.shape[1] == weight.shape[0], (
        f"Channel mismatch: input has {input.shape[1]} channels, "
        f"weight has {weight.shape[0]}")
    if bias is not None:
        assert bias.ndim == 1 and bias.shape[0] == input.shape[1], (
            f"Bias shape mismatch: expected ({input.shape[1]},), "
            f"got {bias.shape}")

    batch_size, in_channels, in_width = input.shape
    kernel_size = weight.shape[2]
    out_width = (in_width + 2 * padding - kernel_size) // stride + 1

    assert out_width > 0, (
        f"Invalid output width: {out_width}. Check input_width={in_width}, "
        f"kernel_size={kernel_size}, padding={padding}, stride={stride}")

    # Allocate output
    output = torch.empty(
        (batch_size, in_channels, out_width),
        dtype=input.dtype,
        device=input.device,
    )

    # Determine block size for output width (power of 2 for Triton)
    BLOCK_SIZE_W = triton.next_power_of_2(min(out_width, 1024))

    # Grid: one program per (batch, channel)
    grid = (batch_size * in_channels, )

    # Triton requires valid pointers for all arguments even when unused.
    # When bias is None, pass input as a dummy pointer (never dereferenced
    # because HAS_BIAS=False is a compile-time constant that guards access).
    bias_ptr = bias if bias is not None else input

    _conv1d_kernel[grid](
        input,
        weight,
        bias_ptr,
        output,
        batch_size,
        in_channels,
        in_width,
        kernel_size,
        out_width,
        stride,
        padding,
        HAS_BIAS=bias is not None,
        BLOCK_SIZE_W=BLOCK_SIZE_W,
    )

    return output
