# SPDX-License-Identifier: Apache-2.0
"""Triton kernel for depthwise causal conv1d (prefill / prompt phase)."""
from typing import Optional

import torch
import triton
import triton.language as tl


@triton.jit
def _causal_conv1d_kernel(
    X_ptr,
    W_ptr,
    B_ptr,
    O_ptr,
    bs,
    seq_len,
    dim,
    stride_xb,
    stride_xs,
    stride_xd,
    stride_wk,
    stride_wd,
    stride_ob,
    stride_os,
    stride_od,
    HAS_BIAS: tl.constexpr,
    BLOCK_D: tl.constexpr,
    KERNEL_SIZE: tl.constexpr,
):
    """Triton kernel for depthwise causal conv1d.

    Each program handles one (batch, sequence) position and a BLOCK_D-wide
    slice of the channel dimension.

    Grid: (batch_size * seq_len, ceil_div(dim, BLOCK_D))

    Algorithm (mirrors forward_native_optimized):
        output[b, s, d] = sum_{k=0}^{K-1} x_padded[b, s+k, d] * weight[k, d]
    where x_padded is x left-padded with K-1 zeros along the sequence axis,
    so x_padded[b, i, d] = x[b, i-(K-1), d] for i >= K-1, else 0.
    """
    pid_bs = tl.program_id(0)
    pid_d = tl.program_id(1)

    b = pid_bs // seq_len
    s = pid_bs % seq_len

    d_start = pid_d * BLOCK_D
    d_offsets = d_start + tl.arange(0, BLOCK_D)
    d_mask = d_offsets < dim

    acc = tl.zeros([BLOCK_D], dtype=tl.float32)

    for k in tl.static_range(KERNEL_SIZE):
        # Index into the original (un-padded) x tensor.
        # x_padded[b, s+k, d] == x[b, s+k-(K-1), d]  when s+k-(K-1) >= 0
        x_s = s + k - (KERNEL_SIZE - 1)

        # Use tl.maximum to avoid negative pointer offsets while relying on
        # the validity mask to suppress the load when x_s < 0.
        valid = x_s >= 0
        safe_x_s = tl.maximum(x_s, 0)

        x_vals = tl.load(
            X_ptr + b * stride_xb + safe_x_s * stride_xs +
            d_offsets * stride_xd,
            mask=valid & d_mask,
            other=0.0,
        )
        w_vals = tl.load(
            W_ptr + k * stride_wk + d_offsets * stride_wd,
            mask=d_mask,
        )
        acc += x_vals * w_vals

    if HAS_BIAS:
        b_vals = tl.load(B_ptr + d_offsets, mask=d_mask)
        acc += b_vals

    tl.store(
        O_ptr + b * stride_ob + s * stride_os + d_offsets * stride_od,
        acc.to(O_ptr.dtype.element_ty),
        mask=d_mask,
    )


def conv1d(
    x: torch.Tensor,
    weight: torch.Tensor,
    bias: Optional[torch.Tensor] = None,
) -> torch.Tensor:
    """Triton-based depthwise causal conv1d for the prefill (prompt) phase.

    Implements the same mathematical operation as ``forward_native_optimized``:
    left-pad the sequence dimension with ``kernel_size - 1`` zeros and
    accumulate element-wise products across kernel positions.

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
        raise ValueError(
            f"weight must be a 2-D tensor [kernel_size, dim], "
            f"got {weight.dim()}-D")

    bs, seq_len, dim = x.shape
    kernel_size, w_dim = weight.shape

    if w_dim != dim:
        raise ValueError(
            f"weight.shape[1] ({w_dim}) must match x.shape[2] ({dim})")
    if bias is not None and bias.shape != (dim, ):
        raise ValueError(
            f"bias shape {tuple(bias.shape)} must be ({dim},)")

    x = x.contiguous()
    weight = weight.contiguous()

    output = torch.empty_like(x)

    # Choose a BLOCK_D that is a power of two and covers the full channel dim
    # in as few blocks as possible while staying within reasonable SRAM limits.
    BLOCK_D = min(triton.next_power_of_2(dim), 1024)
    grid = (bs * seq_len, triton.cdiv(dim, BLOCK_D))

    # When there is no bias we pass `weight` as a harmless dummy pointer so
    # the kernel signature stays uniform; the HAS_BIAS constexpr ensures the
    # bias load is never executed in that case.
    bias_ptr = bias if bias is not None else weight

    _causal_conv1d_kernel[grid](
        x,
        weight,
        bias_ptr,
        output,
        bs,
        seq_len,
        dim,
        x.stride(0),
        x.stride(1),
        x.stride(2),
        weight.stride(0),
        weight.stride(1),
        output.stride(0),
        output.stride(1),
        output.stride(2),
        HAS_BIAS=bias is not None,
        BLOCK_D=BLOCK_D,
        KERNEL_SIZE=kernel_size,
    )

    return output
