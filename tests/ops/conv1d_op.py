# SPDX-License-Identifier: Apache-2.0
from typing import Optional

import torch
import torch.nn.functional as F

from tests.ops.custom_ops import CustomOp
from vllm_xpu_kernels.conv1d import conv1d


class Conv1d(CustomOp):
    """Depthwise 1D convolution operator.

    Performs depthwise 1D convolution where each input channel is convolved
    independently with its own kernel (groups == channels).

    Shapes:
        input: (batch, channels, width)
        weight: (channels, 1, kernel_size)
        bias: (channels,) or None
        return: (batch, channels, out_width)
    """

    def __init__(
        self,
        stride: int = 1,
        padding: int = 0,
    ):
        super().__init__()
        self.stride = stride
        self.padding = padding

    def forward_native(
        self,
        input: torch.Tensor,
        weight: torch.Tensor,
        bias: Optional[torch.Tensor] = None,
    ) -> torch.Tensor:
        """PyTorch-native implementation using F.conv1d with groups."""
        channels = input.shape[1]
        return F.conv1d(
            input,
            weight,
            bias=bias,
            stride=self.stride,
            padding=self.padding,
            groups=channels,
        )

    def forward_xpu(
        self,
        input: torch.Tensor,
        weight: torch.Tensor,
        bias: Optional[torch.Tensor] = None,
    ) -> torch.Tensor:
        """Triton-based XPU implementation."""
        return conv1d(
            input,
            weight,
            bias=bias,
            stride=self.stride,
            padding=self.padding,
        )
