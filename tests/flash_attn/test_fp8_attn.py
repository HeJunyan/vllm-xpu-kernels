# SPDX-License-Identifier: Apache-2.0
# SPDX-FileCopyrightText: Copyright contributors to the vLLM project
"""Unit tests for full FP8 attention (fp8 Q/K/V -> fp8 Q*K and P*V GEMMs).

Both the paged-decode kernel (query_len == 1) and the chunk-prefill kernel
(query_len > 1) share the same full-fp8 datapath. The reference is the
standalone FP8 attention model in ``fp8_attention_ref`` (defined below) which
quantizes Q/K/V through fp8 and rounds the softmax probabilities through fp8
before the P @ V matmul (matching the kernel's fp8 P packing).

Full FP8 attention is implemented for XE3 only (SYCL_INTEL_TARGET == 35),
dispatched through ``is_xe3p_arch() == is_cri() || is_nvl_p()``.
"""

import math
from typing import Optional

import pytest
import torch

import vllm_xpu_kernels._xpu_C  # noqa: F401
from tests.utils import format_tc
from vllm_xpu_kernels.flash_attn_interface import flash_attn_varlen_func

# ---------------------------------------------------------------------------
# Standalone FP8 attention reference (adapted from flash_attn.cute.testing).
#
# The FP8 path quantizes Q/K/V through torch.float8_e4m3fn, computes reference
# attention in bf16/fp32, and optionally rounds the softmax probabilities
# through FP8 before the P @ V matmul.
# ---------------------------------------------------------------------------
FP8_DTYPE = torch.float8_e4m3fn
FP8_REF_DTYPE = torch.bfloat16


def quantize_to_fp8_ref(x: torch.Tensor,
                        ref_dtype: torch.dtype = FP8_REF_DTYPE) -> torch.Tensor:
    """Round values through FP8, then return them in a reference compute dtype."""
    return x.to(FP8_DTYPE).to(ref_dtype)


def construct_local_mask(
    seqlen_q: int,
    seqlen_k: int,
    window_size: tuple[Optional[int], Optional[int]] = (None, None),
    sink_token_length: int = 0,
    query_padding_mask: Optional[torch.Tensor] = None,
    key_padding_mask: Optional[torch.Tensor] = None,
    key_leftpad: Optional[torch.Tensor] = None,
    device: Optional[torch.device] = None,
) -> torch.Tensor:
    row_idx = torch.arange(seqlen_q, device=device, dtype=torch.long).unsqueeze(1)
    col_idx = torch.arange(seqlen_k, device=device, dtype=torch.long)
    if key_leftpad is not None:
        key_leftpad = key_leftpad[:, None, None, None]
        col_idx = col_idx[None, None, None, :].expand(key_leftpad.shape[0], -1,
                                                     -1, -1)
        col_idx = torch.where(col_idx >= key_leftpad, col_idx - key_leftpad,
                              2**32)
    sk = (seqlen_k if key_padding_mask is None else
          key_padding_mask.sum(-1)[:, None, None, None])
    sq = (seqlen_q if query_padding_mask is None else
          query_padding_mask.sum(-1)[:, None, None, None])
    if window_size[0] is None:
        return col_idx > row_idx + sk - sq + window_size[1]
    sk = torch.full_like(col_idx, seqlen_k) if key_padding_mask is None else sk
    if window_size[1] is None:
        local_mask_left = col_idx > sk
    else:
        local_mask_left = col_idx > torch.minimum(
            row_idx + sk - sq + window_size[1], sk)
    return torch.logical_or(
        local_mask_left,
        torch.logical_and(col_idx < row_idx + sk - sq - window_size[0],
                          col_idx >= sink_token_length),
    )


def construct_chunk_mask(
    seqlen_q: int,
    seqlen_k: int,
    attention_chunk: int,
    query_padding_mask: Optional[torch.Tensor] = None,
    key_padding_mask: Optional[torch.Tensor] = None,
    key_leftpad: Optional[torch.Tensor] = None,
    device: Optional[torch.device] = None,
) -> torch.Tensor:
    row_idx = torch.arange(seqlen_q, device=device, dtype=torch.long).unsqueeze(1)
    col_idx = torch.arange(seqlen_k, device=device, dtype=torch.long)
    if key_leftpad is not None:
        key_leftpad = key_leftpad[:, None, None, None]
        col_idx = col_idx[None, None, None, :].expand(key_leftpad.shape[0], -1,
                                                     -1, -1)
        col_idx = torch.where(col_idx >= key_leftpad, col_idx - key_leftpad,
                              2**32)
    sk = (seqlen_k if key_padding_mask is None else
          key_padding_mask.sum(-1)[:, None, None, None])
    sq = (seqlen_q if query_padding_mask is None else
          query_padding_mask.sum(-1)[:, None, None, None])
    sk = torch.full_like(col_idx, seqlen_k) if key_padding_mask is None else sk
    col_limit_left_chunk = row_idx + sk - sq - (row_idx + sk -
                                                sq) % attention_chunk
    return torch.logical_or(
        col_idx < col_limit_left_chunk,
        col_idx >= col_limit_left_chunk + attention_chunk)


def fp8_attention_ref(
    q: torch.Tensor,
    k: torch.Tensor,
    v: torch.Tensor,
    query_padding_mask: Optional[torch.Tensor] = None,
    key_padding_mask: Optional[torch.Tensor] = None,
    key_leftpad: Optional[torch.Tensor] = None,
    attn_bias: Optional[torch.Tensor] = None,
    dropout_p: float = 0.0,
    dropout_mask: Optional[torch.Tensor] = None,
    causal: bool = False,
    qv: Optional[torch.Tensor] = None,
    q_descale: Optional[torch.Tensor] = None,
    k_descale: Optional[torch.Tensor] = None,
    v_descale: Optional[torch.Tensor] = None,
    window_size: tuple[Optional[int], Optional[int]] = (None, None),
    attention_chunk: int = 0,
    sink_token_length: int = 0,
    learnable_sink: Optional[torch.Tensor] = None,
    softcap: float = 0.0,
    upcast: bool = True,
    reorder_ops: bool = False,
    intermediate_dtype: Optional[torch.dtype] = FP8_DTYPE,
    return_lse: bool = False,
    gather_kv_indices: Optional[torch.Tensor] = None,
):
    """Reference attention with optional FP8 descale and FP8 softmax rounding.

    Inputs use shape (batch, seqlen, heads, dim). For an FP8 test reference, pass
    tensors that have already been rounded through FP8, e.g.
    ``q_ref = quantize_to_fp8_ref(q_bf16)``.
    """
    if causal:
        window_size = (window_size[0], 0)
    dtype_og = q.dtype
    if upcast:
        q, k, v = q.float(), k.float(), v.float()
        qv = qv.float() if qv is not None else None
    if q_descale is not None:
        q_descale = q_descale.repeat_interleave(q.shape[2] // k.shape[2],
                                                dim=1)[:, None, :, None]
        q = (q.float() * q_descale).to(q.dtype)
        qv = (qv.float() * q_descale).to(qv.dtype) if qv is not None else None
    if k_descale is not None:
        k = (k.float() * k_descale[:, None, :, None]).to(dtype=k.dtype)
    if v_descale is not None:
        v = (v.float() * v_descale[:, None, :, None]).to(dtype=v.dtype)

    seqlen_q, seqlen_k = q.shape[1], k.shape[1]
    k = k.repeat_interleave(q.shape[2] // k.shape[2], dim=2)
    v = v.repeat_interleave(q.shape[2] // v.shape[2], dim=2)
    d, dv = q.shape[-1], v.shape[-1]
    softmax_scale = 1.0 / math.sqrt(d if qv is None else d + dv)

    if not reorder_ops:
        scores = torch.einsum("bthd,bshd->bhts", q * softmax_scale, k)
    else:
        scores = torch.einsum("bthd,bshd->bhts", q, k * softmax_scale)
    if qv is not None:
        scores = scores + torch.einsum("bthd,bshd->bhts", qv * softmax_scale, v)
    if softcap > 0:
        scores = torch.tanh(scores / softcap) * softcap
    if key_padding_mask is not None:
        scores.masked_fill_(~key_padding_mask[:, None, None, :], float("-inf"))

    local_mask = None
    if window_size[0] is not None or window_size[1] is not None:
        local_mask = construct_local_mask(
            seqlen_q,
            seqlen_k,
            window_size,
            sink_token_length,
            query_padding_mask,
            key_padding_mask,
            key_leftpad=key_leftpad,
            device=q.device,
        )
    if attention_chunk > 0:
        chunk_mask = construct_chunk_mask(
            seqlen_q,
            seqlen_k,
            attention_chunk,
            query_padding_mask,
            key_padding_mask,
            key_leftpad=key_leftpad,
            device=q.device,
        )
        local_mask = torch.logical_or(
            local_mask, chunk_mask) if local_mask is not None else chunk_mask
    if gather_kv_indices is not None:
        batch = q.shape[0]
        topk_len = gather_kv_indices.shape[2]
        if topk_len < seqlen_k:
            topk_index_mask = torch.full((batch, seqlen_q, seqlen_k),
                                         False,
                                         device=q.device).scatter_(
                                             -1, gather_kv_indices, True)
            scores.masked_fill_(~topk_index_mask[:, None, :, :], float("-inf"))
    if local_mask is not None:
        scores.masked_fill_(local_mask, float("-inf"))
    if attn_bias is not None:
        scores = scores + attn_bias

    lse = torch.logsumexp(scores, dim=-1)
    if learnable_sink is None:
        attention = torch.softmax(scores, dim=-1).to(v.dtype)
    else:
        scores_fp32 = scores.to(torch.float32)
        logits_max = torch.amax(scores_fp32, dim=-1, keepdim=True)
        learnable_sink = learnable_sink[:, None, None]
        logits_or_sinks_max = torch.maximum(learnable_sink, logits_max)
        unnormalized_scores = torch.exp(scores_fp32 - logits_or_sinks_max)
        normalizer = unnormalized_scores.sum(dim=-1, keepdim=True) + torch.exp(
            learnable_sink - logits_or_sinks_max)
        lse = (torch.log(normalizer.squeeze(-1)) +
               logits_or_sinks_max.squeeze(-1)).to(dtype_og)
        attention = (unnormalized_scores / normalizer).to(v.dtype)

    if query_padding_mask is not None:
        attention = attention.masked_fill(~query_padding_mask[:, None, :, None],
                                          0.0)
    if key_padding_mask is not None:
        attention = attention.masked_fill(~key_padding_mask[:, None, None, :],
                                          0.0)
    if local_mask is not None:
        attention = attention.masked_fill(
            torch.all(local_mask, dim=-1, keepdim=True), 0.0)

    attention_drop = attention.masked_fill(
        ~dropout_mask, 0.0) if dropout_mask is not None else attention
    if intermediate_dtype is not None:
        attention_drop = attention_drop.to(intermediate_dtype).to(
            attention_drop.dtype)

    output = torch.einsum("bhts,bshd->bthd", attention_drop,
                          v * (1.0 / (1.0 - dropout_p)))
    if query_padding_mask is not None:
        output.masked_fill_(~query_padding_mask[:, :, None, None], 0.0)
    if return_lse:
        return output.to(dtype_og), attention.to(dtype_og), lse.to(dtype_og)
    return output.to(dtype=dtype_og), attention.to(dtype=dtype_og)

# Skip the whole module if the _xpu_C ops aren't registered (build not run).
try:
    torch.ops._xpu_C.is_cri(0)
except (AttributeError, RuntimeError):
    pytestmark = pytest.mark.skip(
        reason="torch.ops._xpu_C not registered - run build steps first")


def _is_xe3() -> bool:
    try:
        return bool(torch.ops._xpu_C.is_cri(0) or torch.ops._xpu_C.is_nvl_p(0))
    except (AttributeError, RuntimeError):
        return False


def _run_full_fp8_attention(
    query_len: int,
    fp8_dtype: torch.dtype,
    o_dtype: torch.dtype,
    is_causal: bool,
    head_size: int = 128,
    num_query_heads: int = 1,
    num_kv_heads: int = 1,
    kv_len: int = 64,
    # The fp8 DPAS atom has a P*V contraction depth of 32, so the KV page size
    # (== PV contraction tile) must be a multiple of 32. Use 64.
    block_size: int = 128,
    num_blocks: int = 4,
    # Sliding window: window_size_left (right is -1 / unbounded, with causal
    # masking handling the upper triangle). ``None`` disables the local mask.
    window_left: Optional[int] = None,
    # Attention sink: add a per-query-head learnable-sink logit (s_aux).
    use_sink: bool = False,
    atol: float = 1.5e-1,
    rtol: float = 1.5e-1,
) -> None:
    """Drive one full-fp8 attention request and compare against the reference.

    ``query_len == 1`` routes to the paged-decode kernel; ``query_len > 1``
    routes to chunk_prefill (see ``is_prefill_only`` in flash_api.cpp).
    """
    torch.set_default_device("xpu")
    torch.xpu.set_device("xpu:0")
    if not _is_xe3():
        pytest.skip("Full fp8 attention is XE3-only (CRI simulator / NVL-P).")
    torch.manual_seed(42)

    num_seqs = 1
    query_lens = [query_len]
    kv_lens = [kv_len]
    max_query_len = query_len
    max_kv_len = kv_len
    scale = head_size**-0.5

    base_dtype = torch.float16
    query = torch.randn(sum(query_lens),
                        num_query_heads,
                        head_size,
                        dtype=base_dtype)
    key_cache = torch.randn(num_blocks,
                            block_size,
                            num_kv_heads,
                            head_size,
                            dtype=base_dtype)
    value_cache = torch.randn_like(key_cache)

    cu_query_lens = torch.tensor([0] + query_lens,
                                 dtype=torch.int32).cumsum(dim=0,
                                                           dtype=torch.int32)
    seq_k = torch.tensor(kv_lens, dtype=torch.int32)
    max_num_blocks_per_seq = (max_kv_len + block_size - 1) // block_size
    block_tables = torch.randint(0,
                                 num_blocks,
                                 (num_seqs, max_num_blocks_per_seq),
                                 dtype=torch.int32)

    # Quantize Q/K/V to fp8 with per-tensor descales. The q/k descales are
    # passed straight to the API, which fuses them into softmax_scale for us
    # (no manual pre-folding by the caller). V descale rescales the output.
    q_descale = (torch.abs(query).max() / 200).to(torch.float32)
    k_descale = (torch.abs(key_cache).max() / 200).to(torch.float32)
    v_descale = (torch.abs(value_cache).max() / 200).to(torch.float32)
    q_fp8 = (query / q_descale).to(fp8_dtype)
    k_fp8 = (key_cache / k_descale).to(fp8_dtype)
    v_fp8 = (value_cache / v_descale).to(fp8_dtype)
    scale_shape = (num_seqs, num_kv_heads)

    out = torch.empty(sum(query_lens),
                      num_query_heads,
                      head_size,
                      dtype=o_dtype)

    # Sliding window: [left, right]. right=-1 (unbounded) lets the causal mask
    # handle the upper triangle; is_local is enabled when left != -1.
    window_size = None if window_left is None else [window_left, -1]

    # Attention sink: a per-query-head learnable-sink logit. For full fp8 the
    # kernel reads the sink as the query (fp8) element type, so quantize it to
    # fp8 here and use the fp8-rounded value as the reference learnable sink.
    s_aux = None
    if use_sink:
        s_aux = (torch.randn(num_query_heads) * 0.5).to(fp8_dtype)

    output = flash_attn_varlen_func(
        q_fp8,
        k_fp8,
        v_fp8,
        max_query_len,
        cu_query_lens,
        max_kv_len,
        seqused_k=seq_k,
        softmax_scale=scale,
        causal=is_causal,
        block_table=block_tables,
        q_descale=q_descale,
        k_descale=k_descale.expand(scale_shape),
        v_descale=v_descale.expand(scale_shape),
        window_size=window_size,
        s_aux=s_aux,
        out=out,
    )

    # Build the dense (batch, seqlen, heads, dim) tensors the reference expects
    # by gathering the paged KV cache for the single sequence. Run on CPU: the
    # reference einsum/softmax are heavy and would otherwise execute on the
    # (very slow) XE3 simulator device.
    #
    # fp8_attention_ref expects inputs that are *already rounded through fp8*
    # and dequantized into a compute dtype (see its docstring), so we apply the
    # Q/K/V descales here and pass them in float32. intermediate_dtype rounds
    # the softmax probabilities through fp8 before P @ V, matching the kernel's
    # fp8 P packing.
    block_indices = block_tables[0].cpu().tolist()
    k_gathered = k_fp8[block_indices].reshape(-1, num_kv_heads,
                                              head_size)[:kv_len].cpu()
    v_gathered = v_fp8[block_indices].reshape(-1, num_kv_heads,
                                              head_size)[:kv_len].cpu()

    ref_dtype = torch.float32
    ref_q = (q_fp8.cpu().to(torch.float32) *
             q_descale.cpu()).to(ref_dtype).unsqueeze(0)  # (1, q_len, h_q, d)
    ref_k = (k_gathered.to(torch.float32) *
             k_descale.cpu()).to(ref_dtype).unsqueeze(0)
    ref_v = (v_gathered.to(torch.float32) *
             v_descale.cpu()).to(ref_dtype).unsqueeze(0)

    # The reference uses window_size=(left, right) where ``None`` means
    # unbounded; causal masking internally forces the right side to 0. The
    # learnable sink matches the fp8-rounded s_aux passed to the kernel.
    ref_window = (window_left, None)
    ref_sink = (s_aux.cpu().to(torch.float32) if s_aux is not None else None)
    ref_output, _ = fp8_attention_ref(
        ref_q,
        ref_k,
        ref_v,
        causal=is_causal,
        window_size=ref_window,
        learnable_sink=ref_sink,
        intermediate_dtype=fp8_dtype,
    )
    # Drop the batch dim back to (q_len, h_q, d). fp8_attention_ref uses
    # softmax_scale = 1/sqrt(d) internally, which matches the `scale` passed to
    # the kernel, so no extra rescaling is required.
    ref_output = ref_output[0]

    output_cpu = output.to(torch.float32).cpu()
    ref_cpu = ref_output.to(torch.float32).cpu()
    torch.testing.assert_close(output_cpu, ref_cpu, atol=atol, rtol=rtol), \
        f"{torch.max(torch.abs(output_cpu - ref_cpu))}"
    torch.xpu.empty_cache()


@pytest.mark.parametrize("fp8_dtype",
                         [torch.float8_e4m3fn, torch.float8_e5m2],
                         ids=format_tc)
@pytest.mark.parametrize("o_dtype", [torch.float16, torch.bfloat16],
                         ids=format_tc)
# (window_left, use_sink): None/False == plain, 16 == sliding window (local
# mask), use_sink == learnable attention sink (s_aux).
@pytest.mark.parametrize("window_left,use_sink",
                         [(None, False), (16, False), (None, True)],
                         ids=format_tc)
@torch.inference_mode()
def test_paged_decode_full_fp8(
    fp8_dtype: torch.dtype,
    o_dtype: torch.dtype,
    window_left: Optional[int],
    use_sink: bool,
) -> None:
    """Full fp8 attention through the paged-decode kernel (query_len == 1).

    Covers the plain path plus the sliding-window (local mask) and learnable
    attention-sink features via the window_left/use_sink parameters.
    """
    _run_full_fp8_attention(
        query_len=1,
        fp8_dtype=fp8_dtype,
        o_dtype=o_dtype,
        is_causal=False,
        window_left=window_left,
        use_sink=use_sink,
    )


@pytest.mark.parametrize("fp8_dtype",
                         [torch.float8_e4m3fn, torch.float8_e5m2],
                         ids=format_tc)
@pytest.mark.parametrize("o_dtype", [torch.float16, torch.bfloat16],
                         ids=format_tc)
@pytest.mark.parametrize("is_causal", [False, True])
# (window_left, use_sink): None/False == plain, 16 == sliding window (local
# mask), use_sink == learnable attention sink (s_aux).
@pytest.mark.parametrize("window_left,use_sink",
                         [(None, False), (16, False), (None, True)],
                         ids=format_tc)
@torch.inference_mode()
def test_chunk_prefill_full_fp8(
    fp8_dtype: torch.dtype,
    o_dtype: torch.dtype,
    is_causal: bool,
    window_left: Optional[int],
    use_sink: bool,
) -> None:
    """Full fp8 attention through the chunk-prefill kernel (query_len > 1).

    Covers the plain path plus the sliding-window (local mask) and learnable
    attention-sink features via the window_left/use_sink parameters.
    """
    _run_full_fp8_attention(
        query_len=64,
        fp8_dtype=fp8_dtype,
        o_dtype=o_dtype,
        is_causal=is_causal,
        window_left=window_left,
        use_sink=use_sink,
    )


@pytest.mark.parametrize("fp8_dtype",
                         [torch.float8_e4m3fn, torch.float8_e5m2],
                         ids=format_tc)
@torch.inference_mode()
def test_paged_decode_full_fp8_sliding_window(
    fp8_dtype: torch.dtype,
) -> None:
    """Full fp8 paged-decode with a sliding window (local mask)."""
    _run_full_fp8_attention(
        query_len=1,
        fp8_dtype=fp8_dtype,
        o_dtype=torch.float16,
        is_causal=False,
        window_left=16,
    )


@pytest.mark.parametrize("fp8_dtype",
                         [torch.float8_e4m3fn, torch.float8_e5m2],
                         ids=format_tc)
@torch.inference_mode()
def test_paged_decode_full_fp8_sink(
    fp8_dtype: torch.dtype,
) -> None:
    """Full fp8 paged-decode with a learnable attention sink (s_aux)."""
    _run_full_fp8_attention(
        query_len=1,
        fp8_dtype=fp8_dtype,
        o_dtype=torch.float16,
        is_causal=False,
        use_sink=True,
    )


@pytest.mark.parametrize("fp8_dtype",
                         [torch.float8_e4m3fn, torch.float8_e5m2],
                         ids=format_tc)
@torch.inference_mode()
def test_chunk_prefill_full_fp8_sliding_window(
    fp8_dtype: torch.dtype,
) -> None:
    """Full fp8 chunk-prefill with a causal sliding window (local mask)."""
    _run_full_fp8_attention(
        query_len=64,
        fp8_dtype=fp8_dtype,
        o_dtype=torch.float16,
        is_causal=True,
        window_left=16,
    )


@pytest.mark.parametrize("fp8_dtype",
                         [torch.float8_e4m3fn, torch.float8_e5m2],
                         ids=format_tc)
@torch.inference_mode()
def test_chunk_prefill_full_fp8_sink(
    fp8_dtype: torch.dtype,
) -> None:
    """Full fp8 chunk-prefill with a causal learnable attention sink (s_aux)."""
    _run_full_fp8_attention(
        query_len=64,
        fp8_dtype=fp8_dtype,
        o_dtype=torch.float16,
        is_causal=True,
        use_sink=True,
    )
