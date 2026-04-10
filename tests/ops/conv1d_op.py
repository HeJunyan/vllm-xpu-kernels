# SPDX-License-Identifier: Apache-2.0
from typing import Optional

import torch
import torch.nn.functional as F

from tests.ops.custom_ops import CustomOp
from vllm_xpu_kernels.conv1d import causal_conv1d_fn


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
        stride: int = 1,
        padding: int = 0,
    ):
        super().__init__()

    def forward_native(
        self,
        input: torch.Tensor,
        weight: torch.Tensor,
        bias: Optional[torch.Tensor] = None,
    ) -> torch.Tensor:
        """PyTorch-native implementation using F.conv1d with groups."""
        x = input.transpose(1, 2)
        seqlen = x.shape[-1]
        w = weight.transpose(0, 1)
        dim, width = w.shape
        out = F.conv1d(x, w.unsqueeze(1), bias, padding=width - 1, groups=dim)
        out = out[..., :seqlen]
        out = out.transpose(1, 2)
        return out

    def forward_native_optimized(
        self,
        x: torch.Tensor,
        weight: torch.Tensor,
        bias: Optional[torch.Tensor] = None,
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
        if weight.dim() != 2:
            raise ValueError(
                f"weight must be a 2-D tensor [kernel_size, dim], "
                f"got {weight.dim()}-D")

        bs, seq_len, dim = x.shape
        kernel_size = weight.shape[0]

        if weight.shape[1] != dim:
            raise ValueError(f"weight.shape[1] ({weight.shape[1]}) must match x.shape[2] ({dim})")
        if bias is not None and bias.shape != (dim, ):
            raise ValueError(f"bias shape {tuple(bias.shape)} must be ({dim},)")

        # Left-pad the sequence dimension with (kernel_size - 1) zeros so the
        # output keeps the same sequence length (causal padding).
        x_padded = F.pad(x, (0, 0, kernel_size - 1, 0))

        # Accumulate contributions from each kernel position.
        output: torch.Tensor | None = None
        for k in range(kernel_size):
            x_slice = x_padded[:, k:k + seq_len, :]   # [bs, seq_len, dim]
            contribution = x_slice * weight[k]          # broadcasts over bs/seq
            if output is None:
                output = contribution
            else:
                output.add_(contribution)

        assert output is not None  # kernel_size >= 1 guaranteed by weight shape

        if bias is not None:
            output = output + bias

        return output

    def forward_xpu_triton(
        self,
        input: torch.Tensor,
        weight: torch.Tensor,
        bias: Optional[torch.Tensor] = None,
    ) -> torch.Tensor:
        """Triton-based XPU implementation using causal_conv1d_fn.

        Directly calls ``causal_conv1d_fn`` — the same kernel used by vLLM's
        Mamba layer — after reshaping tensors to the channel-first 2-D layout
        that the kernel expects:

        - ``x``:      ``(dim, batch * seq_len)`` channel-last (stride 0 == 1)
        - ``weight``: ``(dim, kernel_size)`` contiguous (stride 1 == 1)

        Auxiliary tensors (``conv_states``, ``query_start_loc``,
        ``cache_indices``, ``has_initial_state``) are created to satisfy the
        continuous-batching API, treating every sample in the batch as a fresh
        sequence with no prior state.
        """
        bs, seq_len, dim = input.shape
        # weight is (kernel_size, dim); extract kernel_size from axis 0
        kernel_size = weight.shape[0]

        # causal_conv1d_fn expects x: (dim, cu_seqlen), stride(0)==1
        x_2d = input.reshape(bs * seq_len, dim).t()  # (dim, bs*seq_len)
        # weight must be (dim, kernel_size) with stride(1)==1
        w_2d = weight.t().contiguous()  # (dim, kernel_size)

        # Conv state cache — all-zeros since there is no prior state.
        # causal_conv1d_fn requires the state dimension to be at least 1, so
        # clamp to 1 when kernel_size == 1 (state_len = kernel_size - 1 = 0).
        state_size = max(kernel_size - 1, 1)
        conv_states = torch.zeros(bs, dim, state_size,
                                  dtype=x_2d.dtype, device=input.device)

        # Cumulative sequence lengths: [0, seq_len, 2*seq_len, ..., bs*seq_len]
        query_start_loc = torch.arange(0, (bs + 1) * seq_len, seq_len,
                                       dtype=torch.int32, device=input.device)

        # No prior state for any sequence in this batch.
        has_initial_state = torch.zeros(bs, dtype=torch.bool, device=input.device)

        # Identity mapping: sequence i uses cache line i.
        cache_indices = torch.arange(bs, dtype=torch.int32, device=input.device)

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

        # (dim, bs*seq_len) → (bs*seq_len, dim) → (bs, seq_len, dim)
        return out_2d.t().reshape(bs, seq_len, dim)
