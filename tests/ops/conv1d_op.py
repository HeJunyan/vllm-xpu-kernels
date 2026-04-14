# SPDX-License-Identifier: Apache-2.0
from typing import Optional

import torch
import torch.nn.functional as F
import triton
import triton.language as tl

from tests.ops.custom_ops import CustomOp
from vllm.model_executor.layers.mamba.ops.causal_conv1d import (
    causal_conv1d_fn,
)


@triton.jit
def _causal_conv1d_kernel(
    X_ptr,
    W_ptr,
    B_ptr,
    O_ptr,
    bs,
    seq_len,
    dim,
    stride_xb: tl.constexpr,
    stride_xs: tl.constexpr,
    stride_xd: tl.constexpr,
    stride_wk: tl.constexpr,
    stride_wd: tl.constexpr,
    stride_ob: tl.constexpr,
    stride_os: tl.constexpr,
    stride_od: tl.constexpr,
    HAS_BIAS: tl.constexpr,
    BLOCK_D: tl.constexpr,
    KERNEL_SIZE: tl.constexpr,
):
    """Triton kernel for depthwise causal conv1d using make_tensor_descriptor.

    Each program handles a BLOCK_D-wide slice of the channel dimension for
    one (batch, sequence) position.

    Grid: (ceil_div(dim, BLOCK_D), batch_size * seq_len)
    axis=0 carries the channel-tile index (changes fastest on XPU) so that
    concurrently executing work-groups access contiguous memory and benefit
    from cache reuse.  axis=1 carries the combined batch*sequence index.

    Algorithm (mirrors forward_native_optimized):
        output[b, s, d] = sum_{k=0}^{K-1} x_padded[b, s+k, d] * weight[k, d]
    where x_padded is x left-padded with K-1 zeros along the sequence axis,
    so x_padded[b, i, d] = x[b, i-(K-1), d] for i >= K-1, else 0.

    Tensor descriptors replace manual pointer arithmetic and use hardware 2D
    block IO.  The descriptor automatically zero-fills any out-of-bounds
    access, including the negative row indices that arise from causal (left)
    padding, so no explicit validity mask is needed for x.  The caller
    guarantees contiguous tensors, so the last (column) stride is always 1.
    """
    # axis=0: channel-tile index — fastest-changing on XPU, preserves cache
    # locality because adjacent work-groups access contiguous channel slices.
    # axis=1: combined batch * sequence index.
    pid_d = tl.program_id(0)
    pid_bs = tl.program_id(1)

    b = pid_bs // seq_len
    s = pid_bs % seq_len

    d_start = pid_d * BLOCK_D

    # Create 2D tensor descriptors to leverage hardware 2D block IO on XPU.
    # The last stride is 1 because the caller ensures contiguous tensors.
    # Out-of-bounds accesses (including negative row indices for causal
    # padding) are automatically filled with zero by the hardware.
    x_desc = tl.make_tensor_descriptor(
        base=X_ptr + b * stride_xb,
        shape=[seq_len, dim],
        strides=[stride_xs, stride_xd],
        block_shape=[1, BLOCK_D],
    )
    w_desc = tl.make_tensor_descriptor(
        base=W_ptr,
        shape=[KERNEL_SIZE, dim],
        strides=[stride_wk, stride_wd],
        block_shape=[1, BLOCK_D],
    )
    o_desc = tl.make_tensor_descriptor(
        base=O_ptr + b * stride_ob,
        shape=[seq_len, dim],
        strides=[stride_os, stride_od],
        block_shape=[1, BLOCK_D],
    )

    acc = tl.zeros([BLOCK_D], dtype=tl.float32)

    for k in tl.static_range(KERNEL_SIZE):
        # Causal padding: x_padded[b, s+k, d] == x[b, s+k-(K-1), d].
        # x_s may be negative; the descriptor zero-fills those accesses.
        x_s = s + k - (KERNEL_SIZE - 1)
        x_vals = x_desc.load([x_s, d_start])  # (1, BLOCK_D)
        w_vals = w_desc.load([k, d_start])     # (1, BLOCK_D)
        acc += x_vals * w_vals

    if HAS_BIAS:
        b_desc = tl.make_tensor_descriptor(
            base=B_ptr,
            shape=[1, dim],
            strides=[dim, 1],
            block_shape=[1, BLOCK_D],
        )
        b_vals = b_desc.load([0, d_start])  # (1, BLOCK_D)
        acc += b_vals

    o_desc.store([s, d_start], acc.to(O_ptr.dtype.element_ty))


def casual_conv1d(
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

    # axis=0: channel-tile dimension; axis=1: combined batch * sequence index.
    # On XPU axis=0 changes fastest; placing the channel tile there ensures
    # concurrent work-groups access contiguous memory and share cached data.
    # The autotuner provides BLOCK_D via the META dict at runtime.
    def grid(META):
#        print ("MMMMMMMMMMMMMeta is :", META)
        ret = (triton.cdiv(dim, META['BLOCK_D']), bs * seq_len)
#        print ("RRRRRRRRRRRRRet is :", ret)
        return ret

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
        KERNEL_SIZE=kernel_size,
        BLOCK_D=1024,
#        num_warps=2,
#        num_stages=1,
    )

    return output


class Conv1d(CustomOp):
    """Depthwise 1D casual convolution operator.

    Performs depthwise 1D convolution where each input channel is convolved
    independently with its own kernel (groups == channels).

    Shapes:
        input: (batch, sequence, dim)
        weight: (width, dim)
        bias: (dim,) or None
        return: (batch, sequence, dim)
    """

    def __init__(
        self,
        batch_size: int,
        dim: int,
        width: int,
        has_bias: bool,
        dtype: torch.dtype,
    ):
        self.w = torch.randn(width, dim, dtype=dtype)
        self.w_t = self.w.t().contiguous()  # (dim, kernel_size)

        self.b = None
        self.has_bias = has_bias
        if has_bias:
            self.b = torch.randn(dim, dtype=dtype)

        self.state_size = max(width - 1, 1)
        self.conv_states = torch.zeros(batch_size, self.state_size, dim, dtype=dtype).transpose(1, 2)
        # No prior state for any sequence in this batch.
        self.has_initial_state = torch.zeros(batch_size, dtype=torch.bool)
        self.cache_indices = torch.arange(batch_size, dtype=torch.int32)

        super().__init__()

    def forward_native(
        self,
        input: torch.Tensor,
    ) -> torch.Tensor:
        """PyTorch-native implementation using F.conv1d with groups."""
        x = input.transpose(1, 2)
        seqlen = x.shape[-1]
        dim, width = self.w_t.shape
        out = F.conv1d(x, self.w_t.unsqueeze(1), self.b, padding=width - 1, groups=dim)
        out = out[..., :seqlen]
        out = out.transpose(1, 2)
        return out

    def forward_native_optimized(
        self,
        x: torch.Tensor,
    ) -> torch.Tensor:
        """
        Optimised depth-wise causal conv1d for the prefill (prompt) phase.
        This function implements the same mathematical operation as a standard
        ``torch.nn.Conv1d`` with ``groups=dim``, ``padding=kernel_size-1``,
        and ``bias``, followed by a non-linearity.
        Algorithm
        ---------
        1. Left-pad ``x`` with ``kernel_size - 1`` zeros along the sequence
           dimension so that the output has the same sequence length as the
           input (causal padding).
        2. For each kernel index ``k`` in ``[0, kernel_size)``:
           - Extract the slice ``x_padded[:, k : k + seq_len, :]``.
           - Multiply element-wise by ``weight[k]`` (shape ``[dim]``), which
             broadcasts over the batch and sequence dimensions.
           - Accumulate the result in-place into the output buffer.
        3. Optionally add a bias term.
        """

        if x.dim() != 3:
            raise ValueError(f"x must be a 3-D tensor [batch, seq_len, dim], got {x.dim()}-D")
        if self.w.dim() != 2:
            raise ValueError(
                f"weight must be a 2-D tensor [kernel_size, dim], "
                f"got {weight.dim()}-D")

        bs, seq_len, dim = x.shape
        kernel_size = self.w.shape[0]

        if self.w.shape[1] != dim:
            raise ValueError(f"self.w.shape[1] ({self.w.shape[1]}) must match x.shape[2] ({dim})")
        if self.b is not None and self.b.shape != (dim, ):
            raise ValueError(f"bias shape {tuple(self.b.shape)} must be ({dim},)")

        # Left-pad the sequence dimension with (kernel_size - 1) zeros so the
        # output keeps the same sequence length (causal padding).
        x_padded = F.pad(x, (0, 0, kernel_size - 1, 0))

        # Accumulate contributions from each kernel position.
        output: torch.Tensor | None = None
        for k in range(kernel_size):
            x_slice = x_padded[:, k:k + seq_len, :]   # [bs, seq_len, dim]
            contribution = x_slice * self.w[k]          # broadcasts over bs/seq
            if output is None:
                output = contribution
            else:
                output.add_(contribution)

        assert output is not None  # kernel_size >= 1 guaranteed by weight shape

        if self.b is not None:
            output = output + self.b

        return output

    def forward_xpu_triton(
        self,
        input: torch.Tensor,
    ) -> torch.Tensor:
        return casual_conv1d (input, self.w, self.b)

#        x = input.transpose(1, 2)
#        bs, seq_len, dim = input.shape
#        # weight is (kernel_size, dim); extract kernel_size from axis 0
#        kernel_size = self.w.shape[0]


#        # Cumulative sequence lengths: [0, seq_len, 2*seq_len, ..., bs*seq_len]
#        query_start_loc = torch.arange(0, (bs + 1) * seq_len, seq_len,
#                                       dtype=torch.int32, device=input.device)

#        out = causal_conv1d_fn(
#            x=x.squeeze(0),
#            weight=self.w_t,
#            bias=self.b,
#            conv_states=self.conv_states,
#            query_start_loc=query_start_loc,
#            cache_indices=self.cache_indices,
#            has_initial_state=self.has_initial_state,
#            activation=None,
#        )

#        # (dim, bs*seq_len) → (bs*seq_len, dim) → (bs, seq_len, dim)
#        return out.t().reshape(bs, seq_len, dim)
