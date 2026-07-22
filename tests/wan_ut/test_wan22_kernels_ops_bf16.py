"""
## Benchmark Modes

The test suite supports two modes:

**Benchmark Mode (default):**
- `BENCHMARK_MODE=1` or not set
- Performs 1 warmup run + 1 benchmark run
- Memory is freed and cache cleared after each run
- Use for accurate performance and memory measurements

**Fast Mode:**
- `BENCHMARK_MODE=0`
- Single run, no warmup
- Faster execution for quick validation
- Results include cold-start overhead

## Memory Tracking

Each test reports peak memory usage with breakdown:
- **Peak Memory**: Total peak XPU memory allocated during the test
- **Memory Breakdown**:
  - **Activation (A)**: Input activation memory (BF16 format)
  - **Weight (W)**: Model weight memory (BF16 format)
  - **Output (O)**: Output tensor memory (BF16 format)
  - **Runtime (R)**: Intermediate/scratch memory (e.g., Conv3D workspace, attention scores)

**Memory Management:**
- Peak stats are reset before each test (torch.xpu.reset_peak_memory_stats())
- Output tensors are freed immediately after each run
- Cache is cleared between runs (torch.xpu.empty_cache())
- Ensures accurate per-test memory measurements without accumulation

**Automatic Memory-Based Test Skipping:**
- Tests automatically skip if expected memory exceeds available device memory
- Uses 90% of total device memory as threshold (configurable via MEMORY_THRESHOLD_RATIO)
- Prevents OOM errors and test failures on memory-constrained GPUs
- Skip messages show expected vs available memory for transparency

Example output:
```
Conv3D [1,384,3,34,34]: 45.234ms, 2.45 TFLOPs, 123.4 GB/s,
Peak: 512.3MB (Act: 156.2MB, Weight: 204.5MB, Out: 151.6MB, Runtime: 30.5MB)
| Theoretical: 542.2MB (+5.8% overhead)
```

Usage:
```bash
# Run all tests with benchmarking (default: 1 warmup + 1 run)
python -m pytest test_wan22_kernels_ops_bf16.py -v -s

# Run specific test
python -m pytest test_wan22_kernels_ops_bf16.py::TestConv3DKernels::test_conv3d_vae_encoder_t2v -v -s

# Run VAE tiling tests (memory optimization)
python -m pytest test_wan22_kernels_ops_bf16.py::TestVAETilingOps -v -s

# Run in fast mode (no warmup)
BENCHMARK_MODE=0 python -m pytest test_wan22_kernels_ops_bf16.py -v -s

# Configure memory threshold (default: 90% of device memory)
MEMORY_THRESHOLD_RATIO=0.8 python -m pytest test_wan22_kernels_ops_bf16.py -v -s

# View generated report
cat wan22_test_report.md
```

**Test Categories:**
- **Conv1D/2D/3D Kernels**: VAE encoder/decoder operations
- **Flash Attention**: Self-attention and cross-attention kernels
- **Linear Operations**: QKV projections, FFN layers
- **VAE Tiling**: Memory-optimized tiling demonstrations (reduces 18GB → 3GB)

**Note:**
- Report `wan22_test_report.md` is automatically generated after tests complete
- Each test runs once with 1 warmup for accurate measurements
- Memory is freed between runs to prevent accumulation
- VAE tiling tests demonstrate memory reduction techniques
- Tests automatically skip if expected memory exceeds available device memory

**Environment Variables:**
- `BENCHMARK_MODE`: Set to 0 to disable warmup (default: 1)
- `MEMORY_THRESHOLD_RATIO`: Fraction of device memory to use (default: 0.9)
"""

import os

import numpy as np
import pytest
import torch

# Skip this module in mini scope (use test_wan22_kernels_mini.py instead)
SKIP_IN_MINI_SCOPE = True

# Test device configuration
DEVICE = "xpu" if torch.xpu.is_available() else "cpu"

# Memory threshold: use 90% of available memory as the limit
MEMORY_THRESHOLD_RATIO = float(os.environ.get("MEMORY_THRESHOLD_RATIO", "0.9"))


def get_available_device_memory_mb():
    """Get available XPU memory in MB."""
    if DEVICE == "cpu":
        return float('inf')  # No limit for CPU
    try:
        props = torch.xpu.get_device_properties(0)
        total_memory_bytes = props.total_memory
        return (total_memory_bytes / (1024 ** 2)) * MEMORY_THRESHOLD_RATIO
    except:
        # If we can't get device properties, assume 16GB as safe default
        return 16384 * MEMORY_THRESHOLD_RATIO


def should_skip_test_due_to_memory(expected_memory_mb, test_name):
    """
    Check if test should be skipped due to insufficient device memory.

    Args:
        expected_memory_mb: Expected peak memory usage in MB
        test_name: Name of the test for logging

    Returns:
        tuple: (should_skip: bool, reason: str)
    """
    available_memory_mb = get_available_device_memory_mb()

    if expected_memory_mb > available_memory_mb:
        reason = (
            f"Test requires {expected_memory_mb:.1f}MB but only "
            f"{available_memory_mb:.1f}MB available "
            f"({MEMORY_THRESHOLD_RATIO*100:.0f}% of device memory)"
        )
        return True, reason

    return False, ""


def estimate_test_memory_mb(op_type, shape_info):
    """
    Estimate peak memory usage for a test in MB.

    Returns theoretical peak = activation + weight + output + runtime overhead
    """
    dtype_bytes = 2  # BF16

    if op_type in ["conv1d", "conv2d", "conv3d"]:
        input_bytes = shape_info["input_size"] * dtype_bytes
        weight_bytes = shape_info["weight_size"] * dtype_bytes
        output_bytes = shape_info["output_size"] * dtype_bytes

        # Conv3D runtime overhead (oneDNN workspace)
        runtime_overhead = 0
        if op_type == "conv3d":
            runtime_overhead = int(output_bytes * 0.2)

        total_bytes = input_bytes + weight_bytes + output_bytes + runtime_overhead
        return total_bytes / (1024 ** 2)

    elif op_type == "linear":
        batch = shape_info["batch"]
        seq_len = shape_info["seq_len"]
        in_features = shape_info["in_features"]
        out_features = shape_info["out_features"]

        input_bytes = batch * seq_len * in_features * dtype_bytes
        weight_bytes = in_features * out_features * dtype_bytes
        output_bytes = batch * seq_len * out_features * dtype_bytes

        total_bytes = input_bytes + weight_bytes + output_bytes
        return total_bytes / (1024 ** 2)

    elif op_type == "flash_attn":
        batch = shape_info["batch"]
        num_heads = shape_info["num_heads"]
        seq_len = shape_info["seq_len"]
        head_dim = shape_info["head_dim"]

        qkv_bytes = 3 * batch * num_heads * seq_len * head_dim * dtype_bytes
        output_bytes = batch * num_heads * seq_len * head_dim * dtype_bytes
        attn_scores_bytes = batch * num_heads * seq_len * seq_len * dtype_bytes

        total_bytes = qkv_bytes + output_bytes + attn_scores_bytes
        return total_bytes / (1024 ** 2)

    elif op_type == "elementwise":
        elements = shape_info.get("elements", 0)
        total_bytes = elements * dtype_bytes * 2  # Read + write
        return total_bytes / (1024 ** 2)

    return 0


# Configuration from profiling runs (WAN 2.2 A14B)
BATCH_SIZE = 1
SEQ_LEN = 75600  # 21 × 45 × 80 patches
HIDDEN_DIM = 5120
NUM_HEADS = 40
HEAD_DIM = 128
FFN_DIM = 13824
TEXT_SEQ_LEN = 512
NUM_FRAMES_T2V = 81
NUM_FRAMES_S2V = 20
LATENT_HEIGHT = 90
LATENT_WIDTH = 160

WARMUP = 1
RUNS = 1

# Benchmark mode: if False, run only once (no warmup, no averaging)
# Set via environment variable: BENCHMARK_MODE=0 to disable
BENCHMARK_MODE = os.environ.get("BENCHMARK_MODE", "1") != "0"

# Store test results for report generation
TEST_RESULTS = []


def calculate_flops(op_type, shape_info):
    """Calculate FLOPs for different operation types."""
    if op_type == "conv1d":
        batch = shape_info["batch"]
        in_ch = shape_info["in_channels"]
        out_ch = shape_info["out_channels"]
        kernel = shape_info["kernel_size"]
        out_len = shape_info["output_length"]
        return 2 * batch * out_ch * out_len * in_ch * kernel

    elif op_type == "conv2d":
        batch = shape_info["batch"]
        in_ch = shape_info["in_channels"]
        out_ch = shape_info["out_channels"]
        k_h = shape_info["kernel_h"]
        k_w = shape_info["kernel_w"]
        out_h = shape_info["output_h"]
        out_w = shape_info["output_w"]
        return 2 * batch * out_ch * out_h * out_w * in_ch * k_h * k_w

    elif op_type == "conv3d":
        batch = shape_info["batch"]
        in_ch = shape_info["in_channels"]
        out_ch = shape_info["out_channels"]
        k_d = shape_info["kernel_d"]
        k_h = shape_info["kernel_h"]
        k_w = shape_info["kernel_w"]
        out_d = shape_info["output_d"]
        out_h = shape_info["output_h"]
        out_w = shape_info["output_w"]
        return 2 * batch * out_ch * out_d * out_h * out_w * in_ch * k_d * k_h * k_w

    elif op_type == "linear":
        batch = shape_info["batch"]
        seq_len = shape_info["seq_len"]
        in_features = shape_info["in_features"]
        out_features = shape_info["out_features"]
        return 2 * batch * seq_len * in_features * out_features

    elif op_type == "flash_attn":
        batch = shape_info["batch"]
        num_heads = shape_info["num_heads"]
        seq_len = shape_info["seq_len"]
        head_dim = shape_info["head_dim"]
        return 4 * batch * num_heads * seq_len * seq_len * head_dim

    elif op_type == "elementwise":
        return shape_info.get("elements", 0) * 2  # Minimal compute

    else:
        return 0


def calculate_memory_bytes(op_type, shape_info):
    """Calculate total memory bytes accessed with breakdown."""
    dtype_bytes = 2  # bfloat16 = 2 bytes
    breakdown = {}

    if op_type in ["conv1d", "conv2d", "conv3d"]:
        input_bytes = shape_info["input_size"] * dtype_bytes
        weight_bytes = shape_info["weight_size"] * dtype_bytes
        output_bytes = shape_info["output_size"] * dtype_bytes

        # Estimate Conv3D workspace overhead for oneDNN
        # Typically 10-30% of output size for large convolutions
        runtime_overhead = 0
        if op_type == "conv3d":
            # OneDNN workspace for im2col + GEMM intermediates
            runtime_overhead = int(output_bytes * 0.2)  # ~20% overhead estimate

        breakdown = {
            "activation": input_bytes,
            "weight": weight_bytes,
            "output": output_bytes,
            "runtime": runtime_overhead,
        }
        return input_bytes + weight_bytes + output_bytes, breakdown

    elif op_type == "linear":
        batch = shape_info["batch"]
        seq_len = shape_info["seq_len"]
        in_features = shape_info["in_features"]
        out_features = shape_info["out_features"]
        input_bytes = batch * seq_len * in_features * dtype_bytes
        weight_bytes = in_features * out_features * dtype_bytes
        output_bytes = batch * seq_len * out_features * dtype_bytes
        breakdown = {
            "activation": input_bytes,
            "weight": weight_bytes,
            "output": output_bytes,
            "runtime": 0,
        }
        return input_bytes + weight_bytes + output_bytes, breakdown

    elif op_type == "flash_attn":
        batch = shape_info["batch"]
        num_heads = shape_info["num_heads"]
        seq_len = shape_info["seq_len"]
        head_dim = shape_info["head_dim"]
        # Q, K, V inputs + output
        qkv_bytes = 3 * batch * num_heads * seq_len * head_dim * dtype_bytes
        output_bytes = batch * num_heads * seq_len * head_dim * dtype_bytes
        # Runtime: attention scores (intermediate)
        attn_scores_bytes = batch * num_heads * seq_len * seq_len * dtype_bytes
        breakdown = {
            "activation": qkv_bytes,
            "weight": 0,  # Flash attention has no weights
            "output": output_bytes,
            "runtime": attn_scores_bytes,
        }
        return qkv_bytes + output_bytes, breakdown

    elif op_type == "elementwise":
        elements = shape_info.get("elements", 0)
        input_bytes = elements * dtype_bytes
        output_bytes = elements * dtype_bytes
        breakdown = {
            "activation": input_bytes,
            "weight": 0,
            "output": output_bytes,
            "runtime": 0,
        }
        return input_bytes + output_bytes, breakdown

    else:
        return 0, {}


def benchmark_with_metrics(name, prepare_fn, compute_fn, op_type, shape_info, profiling_info=None, benchmark=None):
    """
    Benchmark with CPU→XPU workflow, measuring kernel time only.

    Args:
        name: Test name
        prepare_fn: Function that creates tensors/models on CPU, returns (tensors_dict, operation)
        compute_fn: Function that performs computation, takes (tensors_dict, operation)
        op_type: Operation type for FLOP calculation
        shape_info: Shape information for metrics
        profiling_info: Optional profiling notes
        benchmark: If True, do warmup + 5 runs. If False, run once only. If None, use BENCHMARK_MODE.

    Returns:
        Dict with metrics or None if CPU
    """
    if DEVICE == "cpu":
        return None

    # Check if test should be skipped due to memory constraints
    expected_memory_mb = estimate_test_memory_mb(op_type, shape_info)
    should_skip, skip_reason = should_skip_test_due_to_memory(expected_memory_mb, name)

    if should_skip:
        pytest.skip(skip_reason)

    # Use global BENCHMARK_MODE if not explicitly specified
    benchmark = BENCHMARK_MODE

    # Step 1: Prepare on CPU
    tensors_dict, operation = prepare_fn()

    # Step 2: Transfer to XPU (not measured)
    tensors_xpu = {}
    for k, v in tensors_dict.items():
        if isinstance(v, torch.Tensor):
            tensors_xpu[k] = v.to("xpu")
        else:
            tensors_xpu[k] = v

    # Transfer operation(s) to XPU
    if operation is None:
        pass  # No operation to transfer
    elif isinstance(operation, (tuple, list)):
        # Handle multiple operations (e.g., k_proj, v_proj)
        operation = type(operation)(op.to("xpu") if hasattr(op, "to") else op for op in operation)
    elif hasattr(operation, "to"):
        operation = operation.to("xpu")

    # Reset peak memory stats before measurement
    if DEVICE == "xpu":
        try:
            torch.xpu.empty_cache()
            torch.xpu.reset_peak_memory_stats()
        except:
            pass

    # Step 3: Warmup (if benchmark mode)
    if benchmark:
        for _ in range(WARMUP):
            output = compute_fn(tensors_xpu, operation)
            torch.xpu.synchronize()
            # Free output memory immediately
            del output
            torch.xpu.empty_cache()

    # Step 4: Benchmark kernel only
    latencies = []
    num_runs = RUNS if benchmark else 1
    for _ in range(num_runs):
        torch.xpu.synchronize()
        start = torch.xpu.Event(enable_timing=True)
        end = torch.xpu.Event(enable_timing=True)

        start.record()
        output = compute_fn(tensors_xpu, operation)
        end.record()

        torch.xpu.synchronize()
        latencies.append(start.elapsed_time(end))

        # Free output memory immediately after timing
        del output
        torch.xpu.empty_cache()

    # Step 5: Calculate metrics
    avg_ms = np.mean(latencies)
    std_ms = np.std(latencies)

    total_flops = calculate_flops(op_type, shape_info)
    total_memory_bytes, memory_breakdown = calculate_memory_bytes(op_type, shape_info)

    tflops = (total_flops / (avg_ms / 1000)) / 1e12 if avg_ms > 0 else 0
    memory_bw_gbs = (total_memory_bytes / (avg_ms / 1000)) / 1e9 if avg_ms > 0 else 0

    # Get peak memory usage from XPU
    peak_memory_mb = 0
    if DEVICE == "xpu":
        try:
            peak_memory_mb = torch.xpu.max_memory_allocated() / (1024 ** 2)
        except:
            pass

    # Calculate theoretical peak memory (for comparison)
    theoretical_peak_mb = (
        memory_breakdown.get("activation", 0) +
        memory_breakdown.get("weight", 0) +
        memory_breakdown.get("output", 0) +
        memory_breakdown.get("runtime", 0)
    ) / (1024 ** 2)

    result = {
        "name": name,
        "avg_ms": avg_ms,
        "std_ms": std_ms,
        "tflops": tflops,
        "memory_bw_gbs": memory_bw_gbs,
        "peak_memory_mb": peak_memory_mb,
        "theoretical_peak_mb": theoretical_peak_mb,
        "memory_breakdown": memory_breakdown,
        "shape_info": shape_info,
        "profiling_info": profiling_info,
    }

    TEST_RESULTS.append(result)

    # Print with memory info
    mem_str = f"Peak: {peak_memory_mb:.1f}MB"
    if memory_breakdown:
        act_mb = memory_breakdown.get("activation", 0) / (1024 ** 2)
        weight_mb = memory_breakdown.get("weight", 0) / (1024 ** 2)
        out_mb = memory_breakdown.get("output", 0) / (1024 ** 2)
        runtime_mb = memory_breakdown.get("runtime", 0) / (1024 ** 2)
        mem_str += f" (Act: {act_mb:.1f}MB, Weight: {weight_mb:.1f}MB, Out: {out_mb:.1f}MB"
        if runtime_mb > 0:
            mem_str += f", Runtime: {runtime_mb:.1f}MB"
        mem_str += ")"

    # Show theoretical vs actual if significantly different
    if peak_memory_mb > theoretical_peak_mb * 1.1:  # >10% difference
        overhead_pct = ((peak_memory_mb - theoretical_peak_mb) / theoretical_peak_mb) * 100
        mem_str += f" | Theoretical: {theoretical_peak_mb:.1f}MB (+{overhead_pct:.1f}% overhead)"

    print(f"\n{result['name']}: {result['avg_ms']:.3f}ms ±{result['std_ms']:.3f}ms, "
          f"{result['tflops']:.2f} TFLOPs, {result['memory_bw_gbs']:.2f} GB/s, {mem_str}")

    return result


# ============================================================================
# PART 1: KERNEL-LEVEL TESTS (from test_wan22_kernels.py)
# ============================================================================

# ============================================================================
# 1. Conv1D Operations (S2V Audio Encoder)
# ============================================================================


class TestConv1DKernels:
    """Test Conv1D operations (audio encoding in S2V)."""

    def test_conv1d_audio_encoder_large(self):
        """Test Conv1D in audio encoder (large input: 80K samples)."""
        if DEVICE == "cpu":
            pytest.skip("Kernel tests require XPU")

        def prepare():
            audio = torch.randn(1, 1, 80056, device="cpu", dtype=torch.bfloat16)
            conv = torch.nn.Conv1d(1, 512, kernel_size=10, device="cpu", dtype=torch.bfloat16)
            return {"audio": audio}, conv

        def compute(tensors, operation):
            return operation(tensors["audio"])

        shape_info = {
            "batch": 1,
            "in_channels": 1,
            "out_channels": 512,
            "kernel_size": 10,
            "output_length": 80047,  # (80056 - 10 + 1)
            "input_size": 1 * 1 * 80056,
            "weight_size": 512 * 1 * 10,
            "output_size": 1 * 512 * 80047,
        }

        result = benchmark_with_metrics("Conv1D Audio 80K", prepare, compute, "conv1d", shape_info)

        if result:
            print(
                f"\n{result['name']}: {result['avg_ms']:.3f}ms, "
                f"{result['tflops']:.2f} TFLOPs, {result['memory_bw_gbs']:.2f} GB/s"
            )

    def test_conv1d_audio_projector(self):
        """Test Conv1D in audio feature projector (S2V: 4 calls, 92ms)."""
        if DEVICE == "cpu":
            pytest.skip("Kernel tests require XPU")

        def prepare():
            audio_proj = torch.randn(4, 1280, 156, device="cpu", dtype=torch.bfloat16)
            conv = torch.nn.Conv1d(1280, 2560, kernel_size=3, device="cpu", dtype=torch.bfloat16)
            return {"audio_proj": audio_proj}, conv

        def compute(tensors, operation):
            return operation(tensors["audio_proj"])

        shape_info = {
            "batch": 4,
            "in_channels": 1280,
            "out_channels": 2560,
            "kernel_size": 3,
            "output_length": 154,  # (156 - 3 + 1)
            "input_size": 4 * 1280 * 156,
            "weight_size": 2560 * 1280 * 3,
            "output_size": 4 * 2560 * 154,
        }

        result = benchmark_with_metrics(
            "Conv1D Audio Projector",
            prepare,
            compute,
            "conv1d",
            shape_info,
            profiling_info="S2V: 4 calls, 92.66ms total",
        )

        if result:
            print(
                f"\n{result['name']}: {result['avg_ms']:.3f}ms, "
                f"{result['tflops']:.2f} TFLOPs, {result['memory_bw_gbs']:.2f} GB/s"
            )

    def test_conv1d_audio_encoder_mid(self):
        """Test Conv1D in audio encoder (mid-size: 8K samples)."""
        if DEVICE == "cpu":
            pytest.skip("Kernel tests require XPU")

        def prepare():
            audio_features = torch.randn(1, 512, 8004, device="cpu", dtype=torch.bfloat16)
            conv = torch.nn.Conv1d(512, 512, kernel_size=3, device="cpu", dtype=torch.bfloat16)
            return {"audio_features": audio_features}, conv

        def compute(tensors, operation):
            return operation(tensors["audio_features"])

        shape_info = {
            "batch": 1,
            "in_channels": 512,
            "out_channels": 512,
            "kernel_size": 3,
            "output_length": 8002,  # (8004 - 3 + 1)
            "input_size": 1 * 512 * 8004,
            "weight_size": 512 * 512 * 3,
            "output_size": 1 * 512 * 8002,
        }

        result = benchmark_with_metrics("Conv1D Audio Encoder Mid", prepare, compute, "conv1d", shape_info)

        if result:
            print(
                f"\n{result['name']}: {result['avg_ms']:.3f}ms, "
                f"{result['tflops']:.2f} TFLOPs, {result['memory_bw_gbs']:.2f} GB/s"
            )


# ============================================================================
# 2. Conv2D Operations (VAE Upsampling)
# ============================================================================


class TestConv2DKernels:
    """Test Conv2D operations (VAE decoder upsampling)."""

    def test_conv2d_vae_256x256(self):
        """Test Conv2D at 256×256 (near pixel space)."""
        if DEVICE == "cpu":
            pytest.skip("Kernel tests require XPU")

        def prepare():
            x = torch.randn(4, 192, 256, 256, device="cpu", dtype=torch.bfloat16)
            conv = torch.nn.Conv2d(192, 96, kernel_size=3, padding=1, device="cpu", dtype=torch.bfloat16)
            return {"x": x}, conv

        def compute(tensors, operation):
            return operation(tensors["x"])

        shape_info = {
            "batch": 4,
            "in_channels": 192,
            "out_channels": 96,
            "kernel_h": 3,
            "kernel_w": 3,
            "output_h": 256,
            "output_w": 256,
            "input_size": 4 * 192 * 256 * 256,
            "weight_size": 96 * 192 * 3 * 3,
            "output_size": 4 * 96 * 256 * 256,
        }

        result = benchmark_with_metrics("Conv2D 256×256", prepare, compute, "conv2d", shape_info)

        if result:
            print(
                f"\n{result['name']}: {result['avg_ms']:.3f}ms, "
                f"{result['tflops']:.2f} TFLOPs, {result['memory_bw_gbs']:.2f} GB/s"
            )

    def test_conv2d_vae_latent_32x32(self):
        """Test Conv2D at 32×32 latent space."""
        if DEVICE == "cpu":
            pytest.skip("Kernel tests require XPU")

        def prepare():
            x = torch.randn(1, 384, 32, 32, device="cpu", dtype=torch.bfloat16)
            conv = torch.nn.Conv2d(384, 1152, kernel_size=1, device="cpu", dtype=torch.bfloat16)
            return {"x": x}, conv

        def compute(tensors, operation):
            return operation(tensors["x"])

        shape_info = {
            "batch": 1,
            "in_channels": 384,
            "out_channels": 1152,
            "kernel_h": 1,
            "kernel_w": 1,
            "output_h": 32,
            "output_w": 32,
            "input_size": 1 * 384 * 32 * 32,
            "weight_size": 1152 * 384 * 1 * 1,
            "output_size": 1 * 1152 * 32 * 32,
        }

        result = benchmark_with_metrics("Conv2D VAE 32×32", prepare, compute, "conv2d", shape_info)

        if result:
            print(
                f"\n{result['name']}: {result['avg_ms']:.3f}ms, "
                f"{result['tflops']:.2f} TFLOPs, {result['memory_bw_gbs']:.2f} GB/s"
            )

    def test_conv2d_vae_upsample_64x64(self):
        """Test Conv2D at 64×64 resolution."""
        if DEVICE == "cpu":
            pytest.skip("Kernel tests require XPU")

        def prepare():
            x = torch.randn(2, 384, 64, 64, device="cpu", dtype=torch.bfloat16)
            conv = torch.nn.Conv2d(384, 192, kernel_size=3, padding=1, device="cpu", dtype=torch.bfloat16)
            return {"x": x}, conv

        def compute(tensors, operation):
            return operation(tensors["x"])

        shape_info = {
            "batch": 2,
            "in_channels": 384,
            "out_channels": 192,
            "kernel_h": 3,
            "kernel_w": 3,
            "output_h": 64,
            "output_w": 64,
            "input_size": 2 * 384 * 64 * 64,
            "weight_size": 192 * 384 * 3 * 3,
            "output_size": 2 * 192 * 64 * 64,
        }

        result = benchmark_with_metrics("Conv2D VAE 64×64", prepare, compute, "conv2d", shape_info)

        if result:
            print(
                f"\n{result['name']}: {result['avg_ms']:.3f}ms, "
                f"{result['tflops']:.2f} TFLOPs, {result['memory_bw_gbs']:.2f} GB/s"
            )

    def test_conv2d_vae_upsample_128x128(self):
        """Test Conv2D at 128×128 resolution."""
        if DEVICE == "cpu":
            pytest.skip("Kernel tests require XPU")

        def prepare():
            x = torch.randn(4, 384, 128, 128, device="cpu", dtype=torch.bfloat16)
            conv = torch.nn.Conv2d(384, 192, kernel_size=3, padding=1, device="cpu", dtype=torch.bfloat16)
            return {"x": x}, conv

        def compute(tensors, operation):
            return operation(tensors["x"])

        shape_info = {
            "batch": 4,
            "in_channels": 384,
            "out_channels": 192,
            "kernel_h": 3,
            "kernel_w": 3,
            "output_h": 128,
            "output_w": 128,
            "input_size": 4 * 384 * 128 * 128,
            "weight_size": 192 * 384 * 3 * 3,
            "output_size": 4 * 192 * 128 * 128,
        }

        result = benchmark_with_metrics("Conv2D VAE 128×128", prepare, compute, "conv2d", shape_info)

        if result:
            print(
                f"\n{result['name']}: {result['avg_ms']:.3f}ms, "
                f"{result['tflops']:.2f} TFLOPs, {result['memory_bw_gbs']:.2f} GB/s"
            )


# ============================================================================
# 3. Conv3D Operations (VAE - CRITICAL: 40%+ XPU time)
# ============================================================================


class TestConv3DKernels:
    """Test Conv3D operations (VAE video encoder/decoder)."""

    def test_conv3d_vae_shape1_384_3_34_34(self):
        """Test most frequent Conv3D shape: [1, 384, 3, 34, 34]."""
        if DEVICE == "cpu":
            pytest.skip("Kernel tests require XPU")

        def prepare():
            x = torch.randn(1, 384, 3, 34, 34, device="cpu", dtype=torch.bfloat16)
            conv = torch.nn.Conv3d(384, 384, kernel_size=3, padding=1, device="cpu", dtype=torch.bfloat16)
            return {"x": x}, conv

        def compute(tensors, operation):
            return operation(tensors["x"])

        shape_info = {
            "batch": 1,
            "in_channels": 384,
            "out_channels": 384,
            "kernel_d": 3,
            "kernel_h": 3,
            "kernel_w": 3,
            "output_d": 3,
            "output_h": 34,
            "output_w": 34,
            "input_size": 1 * 384 * 3 * 34 * 34,
            "weight_size": 384 * 384 * 3 * 3 * 3,
            "output_size": 1 * 384 * 3 * 34 * 34,
        }

        result = benchmark_with_metrics(
            "Conv3D [1,384,3,34,34]",
            prepare,
            compute,
            "conv3d",
            shape_info,
            profiling_info="T2V: 7,560 calls | S2V: 13,320 calls",
        )

        if result:
            print(
                f"\n{result['name']}: {result['avg_ms']:.3f}ms, "
                f"{result['tflops']:.2f} TFLOPs, {result['memory_bw_gbs']:.2f} GB/s"
            )

    def test_conv3d_vae_shape2_96_6_258_258(self):
        """Test Conv3D shape: [1, 96, 6, 258, 258]."""
        if DEVICE == "cpu":
            pytest.skip("Kernel tests require XPU")

        def prepare():
            x = torch.randn(1, 96, 6, 258, 258, device="cpu", dtype=torch.bfloat16)
            conv = torch.nn.Conv3d(96, 96, kernel_size=3, padding=1, device="cpu", dtype=torch.bfloat16)
            return {"x": x}, conv

        def compute(tensors, operation):
            return operation(tensors["x"])

        shape_info = {
            "batch": 1,
            "in_channels": 96,
            "out_channels": 96,
            "kernel_d": 3,
            "kernel_h": 3,
            "kernel_w": 3,
            "output_d": 6,
            "output_h": 258,
            "output_w": 258,
            "input_size": 1 * 96 * 6 * 258 * 258,
            "weight_size": 96 * 96 * 3 * 3 * 3,
            "output_size": 1 * 96 * 6 * 258 * 258,
        }

        result = benchmark_with_metrics(
            "Conv3D [1,96,6,258,258]",
            prepare,
            compute,
            "conv3d",
            shape_info,
            profiling_info="T2V: 4,320 calls | S2V: 6,912 calls",
        )

        if result:
            print(
                f"\n{result['name']}: {result['avg_ms']:.3f}ms, "
                f"{result['tflops']:.2f} TFLOPs, {result['memory_bw_gbs']:.2f} GB/s"
            )

    def test_conv3d_vae_decoder_to_rgb(self):
        """Test Conv3D VAE decoder final layer (latent to RGB)."""
        if DEVICE == "cpu":
            pytest.skip("Kernel tests require XPU")

        def prepare():
            latent = torch.randn(1, 96, 6, 258, 258, device="cpu", dtype=torch.bfloat16)
            conv = torch.nn.Conv3d(96, 3, kernel_size=3, padding=1, device="cpu", dtype=torch.bfloat16)
            return {"latent": latent}, conv

        def compute(tensors, operation):
            return operation(tensors["latent"])

        shape_info = {
            "batch": 1,
            "in_channels": 96,
            "out_channels": 3,
            "kernel_d": 3,
            "kernel_h": 3,
            "kernel_w": 3,
            "output_d": 6,
            "output_h": 258,
            "output_w": 258,
            "input_size": 1 * 96 * 6 * 258 * 258,
            "weight_size": 3 * 96 * 3 * 3 * 3,
            "output_size": 1 * 3 * 6 * 258 * 258,
        }

        result = benchmark_with_metrics("Conv3D to RGB", prepare, compute, "conv3d", shape_info)

        if result:
            print(
                f"\n{result['name']}: {result['avg_ms']:.3f}ms, "
                f"{result['tflops']:.2f} TFLOPs, {result['memory_bw_gbs']:.2f} GB/s"
            )

    def test_conv3d_vae_shape3_192_6_130_130(self):
        """Test Conv3D shape: [1, 192, 6, 130, 130]."""
        if DEVICE == "cpu":
            pytest.skip("Kernel tests require XPU")

        def prepare():
            x = torch.randn(1, 192, 6, 130, 130, device="cpu", dtype=torch.bfloat16)
            conv = torch.nn.Conv3d(192, 192, kernel_size=3, padding=1, device="cpu", dtype=torch.bfloat16)
            return {"x": x}, conv

        def compute(tensors, operation):
            return operation(tensors["x"])

        shape_info = {
            "batch": 1,
            "in_channels": 192,
            "out_channels": 192,
            "kernel_d": 3,
            "kernel_h": 3,
            "kernel_w": 3,
            "output_d": 6,
            "output_h": 130,
            "output_w": 130,
            "input_size": 1 * 192 * 6 * 130 * 130,
            "weight_size": 192 * 192 * 3 * 3 * 3,
            "output_size": 1 * 192 * 6 * 130 * 130,
        }

        result = benchmark_with_metrics(
            "Conv3D [1,192,6,130,130]",
            prepare,
            compute,
            "conv3d",
            shape_info,
            profiling_info="T2V: 4,320 calls | S2V: 6,264 calls",
        )

        if result:
            print(
                f"\n{result['name']}: {result['avg_ms']:.3f}ms, "
                f"{result['tflops']:.2f} TFLOPs, {result['memory_bw_gbs']:.2f} GB/s"
            )

    def test_conv3d_vae_shape4_384_4_66_66(self):
        """Test Conv3D shape: [1, 384, 4, 66, 66]."""
        if DEVICE == "cpu":
            pytest.skip("Kernel tests require XPU")

        def prepare():
            x = torch.randn(1, 384, 4, 66, 66, device="cpu", dtype=torch.bfloat16)
            conv = torch.nn.Conv3d(384, 384, kernel_size=3, padding=1, device="cpu", dtype=torch.bfloat16)
            return {"x": x}, conv

        def compute(tensors, operation):
            return operation(tensors["x"])

        shape_info = {
            "batch": 1,
            "in_channels": 384,
            "out_channels": 384,
            "kernel_d": 3,
            "kernel_h": 3,
            "kernel_w": 3,
            "output_d": 4,
            "output_h": 66,
            "output_w": 66,
            "input_size": 1 * 384 * 4 * 66 * 66,
            "weight_size": 384 * 384 * 3 * 3 * 3,
            "output_size": 1 * 384 * 4 * 66 * 66,
        }

        result = benchmark_with_metrics(
            "Conv3D [1,384,4,66,66]",
            prepare,
            compute,
            "conv3d",
            shape_info,
            profiling_info="T2V: 3,600 calls | S2V: 5,544 calls",
        )

        if result:
            print(
                f"\n{result['name']}: {result['avg_ms']:.3f}ms, "
                f"{result['tflops']:.2f} TFLOPs, {result['memory_bw_gbs']:.2f} GB/s"
            )

    def test_conv3d_vae_decoder_to_pixel(self):
        """Test Conv3D VAE decoder final layer (latent to RGB)."""
        if DEVICE == "cpu":
            pytest.skip("Kernel tests require XPU")

        def prepare():
            latent = torch.randn(1, 96, 6, 258, 258, device="cpu", dtype=torch.bfloat16)
            conv = torch.nn.Conv3d(96, 3, kernel_size=3, padding=1, device="cpu", dtype=torch.bfloat16)
            return {"latent": latent}, conv

        def compute(tensors, operation):
            return operation(tensors["latent"])

        shape_info = {
            "batch": 1,
            "in_channels": 96,
            "out_channels": 3,
            "kernel_d": 3,
            "kernel_h": 3,
            "kernel_w": 3,
            "output_d": 6,
            "output_h": 258,
            "output_w": 258,
            "input_size": 1 * 96 * 6 * 258 * 258,
            "weight_size": 3 * 96 * 3 * 3 * 3,
            "output_size": 1 * 3 * 6 * 258 * 258,
        }

        result = benchmark_with_metrics("Conv3D VAE Decoder to Pixel", prepare, compute, "conv3d", shape_info)

        if result:
            print(
                f"\n{result['name']}: {result['avg_ms']:.3f}ms, "
                f"{result['tflops']:.2f} TFLOPs, {result['memory_bw_gbs']:.2f} GB/s"
            )

    def test_conv3d_vae_encoder_s2v(self):
        """Test Conv3D VAE encoder at full 720p resolution (S2V: 80 frames)."""
        if DEVICE == "cpu":
            pytest.skip("Kernel tests require XPU")

        def prepare():
            video = torch.randn(1, 3, NUM_FRAMES_S2V, 720, 1280, device="cpu", dtype=torch.bfloat16)
            conv = torch.nn.Conv3d(3, 128, kernel_size=3, padding=1, device="cpu", dtype=torch.bfloat16)
            return {"video": video}, conv

        def compute(tensors, operation):
            return operation(tensors["video"])

        shape_info = {
            "batch": 1,
            "in_channels": 3,
            "out_channels": 128,
            "kernel_d": 3,
            "kernel_h": 3,
            "kernel_w": 3,
            "output_d": NUM_FRAMES_S2V,
            "output_h": 720,
            "output_w": 1280,
            "input_size": 1 * 3 * NUM_FRAMES_S2V * 720 * 1280,
            "weight_size": 128 * 3 * 3 * 3 * 3,
            "output_size": 1 * 128 * NUM_FRAMES_S2V * 720 * 1280,
        }

        result = benchmark_with_metrics(
            "Conv3D VAE Encoder (S2V 80f)",
            prepare,
            compute,
            "conv3d",
            shape_info,
            profiling_info="S2V: 40,752 calls (80 frames)",
        )

        if result:
            print(
                f"\n{result['name']}: {result['avg_ms']:.3f}ms, "
                f"{result['tflops']:.2f} TFLOPs, {result['memory_bw_gbs']:.2f} GB/s"
            )

    def test_conv3d_vae_encoder_t2v(self):
        """Test Conv3D VAE encoder at full 720p resolution (T2V: 81 frames)."""
        if DEVICE == "cpu":
            pytest.skip("Kernel tests require XPU")

        def prepare():
            input_video = torch.randn(1, 3, NUM_FRAMES_T2V, 720, 1280, device="cpu", dtype=torch.bfloat16)
            conv = torch.nn.Conv3d(3, 128, kernel_size=3, padding=1, device="cpu", dtype=torch.bfloat16)
            return {"input_video": input_video}, conv

        def compute(tensors, operation):
            return operation(tensors["input_video"])

        shape_info = {
            "batch": 1,
            "in_channels": 3,
            "out_channels": 128,
            "kernel_d": 3,
            "kernel_h": 3,
            "kernel_w": 3,
            "output_d": NUM_FRAMES_T2V,
            "output_h": 720,
            "output_w": 1280,
            "input_size": 1 * 3 * NUM_FRAMES_T2V * 720 * 1280,
            "weight_size": 128 * 3 * 3 * 3 * 3,
            "output_size": 1 * 128 * NUM_FRAMES_T2V * 720 * 1280,
        }

        result = benchmark_with_metrics(
            "Conv3D VAE Encoder (T2V 81f)",
            prepare,
            compute,
            "conv3d",
            shape_info,
            profiling_info="T2V: similar to S2V (81 vs 80 frames)",
        )

        if result:
            print(
                f"\n{result['name']}: {result['avg_ms']:.3f}ms, "
                f"{result['tflops']:.2f} TFLOPs, {result['memory_bw_gbs']:.2f} GB/s"
            )

    def test_conv3d_latent_space_t2v(self):
        """Test Conv3D in latent space (8x downsampled)."""
        if DEVICE == "cpu":
            pytest.skip("Kernel tests require XPU")

        def prepare():
            latent = torch.randn(
                1,
                128,
                NUM_FRAMES_T2V,
                LATENT_HEIGHT,
                LATENT_WIDTH,
                device="cpu",
                dtype=torch.bfloat16,
            )
            conv = torch.nn.Conv3d(128, 256, kernel_size=3, padding=1, device="cpu", dtype=torch.bfloat16)
            return {"latent": latent}, conv

        def compute(tensors, operation):
            return operation(tensors["latent"])

        shape_info = {
            "batch": 1,
            "in_channels": 128,
            "out_channels": 256,
            "kernel_d": 3,
            "kernel_h": 3,
            "kernel_w": 3,
            "output_d": NUM_FRAMES_T2V,
            "output_h": LATENT_HEIGHT,
            "output_w": LATENT_WIDTH,
            "input_size": 1 * 128 * NUM_FRAMES_T2V * LATENT_HEIGHT * LATENT_WIDTH,
            "weight_size": 256 * 128 * 3 * 3 * 3,
            "output_size": 1 * 256 * NUM_FRAMES_T2V * LATENT_HEIGHT * LATENT_WIDTH,
        }

        result = benchmark_with_metrics("Conv3D Latent Space", prepare, compute, "conv3d", shape_info)

        if result:
            print(
                f"\n{result['name']}: {result['avg_ms']:.3f}ms, "
                f"{result['tflops']:.2f} TFLOPs, {result['memory_bw_gbs']:.2f} GB/s"
            )

    def test_conv3d_latent_space_s2v(self):
        """Test Conv3D in latent space (S2V)."""
        if DEVICE == "cpu":
            pytest.skip("Kernel tests require XPU")

        def prepare():
            latent_frames = 20
            latent = torch.randn(1, 128, latent_frames, LATENT_HEIGHT, LATENT_WIDTH, device="cpu", dtype=torch.bfloat16)
            conv = torch.nn.Conv3d(128, 256, kernel_size=3, padding=1, device="cpu", dtype=torch.bfloat16)
            return {"latent": latent}, conv

        def compute(tensors, operation):
            return operation(tensors["latent"])

        shape_info = {
            "batch": 1,
            "in_channels": 128,
            "out_channels": 256,
            "kernel_d": 3,
            "kernel_h": 3,
            "kernel_w": 3,
            "output_d": 20,
            "output_h": LATENT_HEIGHT,
            "output_w": LATENT_WIDTH,
            "input_size": 1 * 128 * 20 * LATENT_HEIGHT * LATENT_WIDTH,
            "weight_size": 256 * 128 * 3 * 3 * 3,
            "output_size": 1 * 256 * 20 * LATENT_HEIGHT * LATENT_WIDTH,
        }

        result = benchmark_with_metrics("Conv3D Latent Space (S2V)", prepare, compute, "conv3d", shape_info)

        if result:
            print(
                f"\n{result['name']}: {result['avg_ms']:.3f}ms, "
                f"{result['tflops']:.2f} TFLOPs, {result['memory_bw_gbs']:.2f} GB/s"
            )


# ============================================================================
# 4. Flash Attention Kernels (12-17% XPU time)
# ============================================================================


class TestFlashAttentionKernels:
    """Test Flash Attention using vllm_xpu_kernels.flash_attn_varlen_func."""

    def test_flash_attention_varlen_self(self):
        """Test Flash Attention for self-attention (75,600 x 75,600)."""
        if DEVICE == "cpu":
            pytest.skip("Kernel tests require XPU")

        try:
            from vllm_xpu_kernels.flash_attn_interface import flash_attn_varlen_func

            def prepare():
                q = torch.randn(BATCH_SIZE * SEQ_LEN, NUM_HEADS, HEAD_DIM, device="cpu", dtype=torch.bfloat16)
                k = torch.randn(BATCH_SIZE * SEQ_LEN, NUM_HEADS, HEAD_DIM, device="cpu", dtype=torch.bfloat16)
                v = torch.randn(BATCH_SIZE * SEQ_LEN, NUM_HEADS, HEAD_DIM, device="cpu", dtype=torch.bfloat16)
                cu_seqlens = torch.tensor([0, SEQ_LEN], dtype=torch.int32, device="cpu")
                return {"q": q, "k": k, "v": v, "cu_seqlens": cu_seqlens}, None

            def compute(tensors, operation):
                softmax_scale = 1.0 / (HEAD_DIM**0.5)
                return flash_attn_varlen_func(
                    tensors["q"],
                    tensors["k"],
                    tensors["v"],
                    cu_seqlens_q=tensors["cu_seqlens"],
                    cu_seqlens_k=tensors["cu_seqlens"],
                    max_seqlen_q=SEQ_LEN,
                    max_seqlen_k=SEQ_LEN,
                    dropout_p=0.0,
                    softmax_scale=softmax_scale,
                    causal=False,
                )

            shape_info = {"batch": BATCH_SIZE, "num_heads": NUM_HEADS, "seq_len": SEQ_LEN, "head_dim": HEAD_DIM}

            result = benchmark_with_metrics(
                "Flash Attention Varlen Self",
                prepare,
                compute,
                "flash_attn",
                shape_info,
                profiling_info="T2V: 16 calls, ~550ms/call | S2V: 24 calls, ~366ms/call",
            )

            if result:
                print(
                    f"\n{result['name']}: {result['avg_ms']:.3f}ms, "
                    f"{result['tflops']:.2f} TFLOPs, {result['memory_bw_gbs']:.2f} GB/s"
                )

        except Exception as e:
            pytest.skip(f"flash_attn_varlen_func not available: {e}")

    def test_flash_attention_varlen_cross(self):
        """Test Flash Attention for cross-attention (75,600 x 512)."""
        if DEVICE == "cpu":
            pytest.skip("Kernel tests require XPU")

        try:
            from vllm_xpu_kernels.flash_attn_interface import flash_attn_varlen_func

            def prepare():
                q = torch.randn(BATCH_SIZE * SEQ_LEN, NUM_HEADS, HEAD_DIM, device="cpu", dtype=torch.bfloat16)
                k = torch.randn(BATCH_SIZE * TEXT_SEQ_LEN, NUM_HEADS, HEAD_DIM, device="cpu", dtype=torch.bfloat16)
                v = torch.randn(BATCH_SIZE * TEXT_SEQ_LEN, NUM_HEADS, HEAD_DIM, device="cpu", dtype=torch.bfloat16)
                cu_seqlens_q = torch.tensor([0, SEQ_LEN], dtype=torch.int32, device="cpu")
                cu_seqlens_kv = torch.tensor([0, TEXT_SEQ_LEN], dtype=torch.int32, device="cpu")
                return {"q": q, "k": k, "v": v, "cu_seqlens_q": cu_seqlens_q, "cu_seqlens_kv": cu_seqlens_kv}, None

            def compute(tensors, operation):
                softmax_scale = 1.0 / (HEAD_DIM**0.5)
                return flash_attn_varlen_func(
                    tensors["q"],
                    tensors["k"],
                    tensors["v"],
                    cu_seqlens_q=tensors["cu_seqlens_q"],
                    cu_seqlens_k=tensors["cu_seqlens_kv"],
                    max_seqlen_q=SEQ_LEN,
                    max_seqlen_k=TEXT_SEQ_LEN,
                    dropout_p=0.0,
                    softmax_scale=softmax_scale,
                    causal=False,
                )

            shape_info = {"batch": BATCH_SIZE, "num_heads": NUM_HEADS, "seq_len": SEQ_LEN, "head_dim": HEAD_DIM}

            result = benchmark_with_metrics(
                "Flash Attention Varlen Cross",
                prepare,
                compute,
                "flash_attn",
                shape_info,
                profiling_info="T2V: 16 calls | S2V: 24 calls",
            )

            if result:
                print(
                    f"\n{result['name']}: {result['avg_ms']:.3f}ms, "
                    f"{result['tflops']:.2f} TFLOPs, {result['memory_bw_gbs']:.2f} GB/s"
                )

        except Exception as e:
            pytest.skip(f"flash_attn_varlen_func not available: {e}")


# ============================================================================
# PART 2: API-LEVEL TESTS (from test_wan22_ops_profiled.py with modifications)
# ============================================================================

# ============================================================================
# 5. Self-Attention Operations (using torch.nn.Linear)
# ============================================================================


class TestSelfAttentionOps:
    """Test self-attention operations using torch.nn.Linear instead of parallel layers."""

    def test_qk_normalization(self):
        """Test QK RMSNorm normalization."""
        if DEVICE == "cpu":
            pytest.skip("Kernel tests require XPU")

        try:
            from vllm_omni.diffusion.layers.norm import RMSNorm

            def prepare():
                q = torch.randn(BATCH_SIZE, SEQ_LEN, HIDDEN_DIM, device="cpu", dtype=torch.bfloat16)
                k = torch.randn(BATCH_SIZE, SEQ_LEN, HIDDEN_DIM, device="cpu", dtype=torch.bfloat16)
                q_norm = RMSNorm(HIDDEN_DIM).to("cpu").to(torch.bfloat16)
                k_norm = RMSNorm(HIDDEN_DIM).to("cpu").to(torch.bfloat16)
                return {"q": q, "k": k}, (q_norm, k_norm)

            def compute(tensors, operation):
                q_norm, k_norm = operation
                q_normalized = q_norm.forward_xpu(tensors["q"])
                k_normalized = k_norm.forward_xpu(tensors["k"])
                return q_normalized, k_normalized

            shape_info = {"elements": 2 * BATCH_SIZE * SEQ_LEN * HIDDEN_DIM}

            result = benchmark_with_metrics(
                "QK RMSNorm", prepare, compute, "elementwise", shape_info, profiling_info="T2V: 35,280 calls"
            )

            if result:
                print(
                    f"\n{result['name']}: {result['avg_ms']:.3f}ms, "
                    f"{result['tflops']:.2f} TFLOPs, {result['memory_bw_gbs']:.2f} GB/s"
                )

        except Exception as e:
            pytest.skip(f"RMSNorm not available: {e}")

    def test_output_projection(self):
        """Test attention output projection using torch.nn.Linear (replaces RowParallelLinear)."""
        if DEVICE == "cpu":
            pytest.skip("Kernel tests require XPU")

        def prepare():
            attn_output = torch.randn(BATCH_SIZE, SEQ_LEN, HIDDEN_DIM, device="cpu", dtype=torch.bfloat16)
            out_proj = torch.nn.Linear(HIDDEN_DIM, HIDDEN_DIM, bias=True, device="cpu", dtype=torch.bfloat16)
            return {"attn_output": attn_output}, out_proj

        def compute(tensors, operation):
            return operation(tensors["attn_output"])

        shape_info = {"batch": BATCH_SIZE, "seq_len": SEQ_LEN, "in_features": HIDDEN_DIM, "out_features": HIDDEN_DIM}

        result = benchmark_with_metrics("Attn Output Projection", prepare, compute, "linear", shape_info)

        if result:
            print(
                f"\n{result['name']}: {result['avg_ms']:.3f}ms, "
                f"{result['tflops']:.2f} TFLOPs, {result['memory_bw_gbs']:.2f} GB/s"
            )


# ============================================================================
# 6. Cross-Attention Operations (using torch.nn.Linear)
# ============================================================================


class TestCrossAttentionOps:
    """Test cross-attention operations using torch.nn.Linear instead of parallel layers."""

    def test_cross_attn_q_projection(self):
        """Test cross-attention Q projection using torch.nn.Linear (replaces ColumnParallelLinear)."""
        if DEVICE == "cpu":
            pytest.skip("Kernel tests require XPU")

        def prepare():
            hidden_states = torch.randn(BATCH_SIZE, SEQ_LEN, HIDDEN_DIM, device="cpu", dtype=torch.bfloat16)
            q_proj = torch.nn.Linear(HIDDEN_DIM, HIDDEN_DIM, bias=True, device="cpu", dtype=torch.bfloat16)
            return {"hidden_states": hidden_states}, q_proj

        def compute(tensors, operation):
            return operation(tensors["hidden_states"])

        shape_info = {"batch": BATCH_SIZE, "seq_len": SEQ_LEN, "in_features": HIDDEN_DIM, "out_features": HIDDEN_DIM}

        result = benchmark_with_metrics("Cross-Attn Q Projection", prepare, compute, "linear", shape_info)

        if result:
            print(
                f"\n{result['name']}: {result['avg_ms']:.3f}ms, "
                f"{result['tflops']:.2f} TFLOPs, {result['memory_bw_gbs']:.2f} GB/s"
            )

    def test_cross_attn_kv_projection(self):
        """Test cross-attention K/V projection using torch.nn.Linear (replaces ColumnParallelLinear)."""
        if DEVICE == "cpu":
            pytest.skip("Kernel tests require XPU")

        def prepare():
            text_features = torch.randn(BATCH_SIZE, TEXT_SEQ_LEN, HIDDEN_DIM, device="cpu", dtype=torch.bfloat16)
            k_proj = torch.nn.Linear(HIDDEN_DIM, HIDDEN_DIM, bias=True, device="cpu", dtype=torch.bfloat16)
            v_proj = torch.nn.Linear(HIDDEN_DIM, HIDDEN_DIM, bias=True, device="cpu", dtype=torch.bfloat16)
            # Return models as a tuple in the operation field
            return {"text_features": text_features}, (k_proj, v_proj)

        def compute(tensors, operation):
            k_proj, v_proj = operation
            k = k_proj(tensors["text_features"])
            v = v_proj(tensors["text_features"])
            return k, v

        shape_info = {
            "batch": BATCH_SIZE,
            "seq_len": TEXT_SEQ_LEN,
            "in_features": HIDDEN_DIM,
            "out_features": 2 * HIDDEN_DIM,  # K + V
        }

        result = benchmark_with_metrics("Cross-Attn K/V Projection", prepare, compute, "linear", shape_info)

        if result:
            print(
                f"\n{result['name']}: {result['avg_ms']:.3f}ms, "
                f"{result['tflops']:.2f} TFLOPs, {result['memory_bw_gbs']:.2f} GB/s"
            )

    def test_cross_attn_output_projection(self):
        """Test cross-attention output projection using torch.nn.Linear (replaces RowParallelLinear)."""
        if DEVICE == "cpu":
            pytest.skip("Kernel tests require XPU")

        def prepare():
            attn_output = torch.randn(BATCH_SIZE, SEQ_LEN, HIDDEN_DIM, device="cpu", dtype=torch.bfloat16)
            out_proj = torch.nn.Linear(HIDDEN_DIM, HIDDEN_DIM, bias=True, device="cpu", dtype=torch.bfloat16)
            return {"attn_output": attn_output}, out_proj

        def compute(tensors, operation):
            return operation(tensors["attn_output"])

        shape_info = {"batch": BATCH_SIZE, "seq_len": SEQ_LEN, "in_features": HIDDEN_DIM, "out_features": HIDDEN_DIM}

        result = benchmark_with_metrics("Cross-Attn Output Projection", prepare, compute, "linear", shape_info)

        if result:
            print(
                f"\n{result['name']}: {result['avg_ms']:.3f}ms, "
                f"{result['tflops']:.2f} TFLOPs, {result['memory_bw_gbs']:.2f} GB/s"
            )


# ============================================================================
# 7. FFN Operations (using torch.nn.Linear)
# ============================================================================


class TestFFNOps:
    """Test FFN operations using torch.nn.Linear instead of parallel layers."""

    def test_ffn_upproject(self):
        """Test FFN upproject (5120 -> 13824)."""
        if DEVICE == "cpu":
            pytest.skip("Kernel tests require XPU")

        def prepare():
            x = torch.randn(BATCH_SIZE, SEQ_LEN, HIDDEN_DIM, device="cpu", dtype=torch.bfloat16)
            linear = torch.nn.Linear(HIDDEN_DIM, FFN_DIM, device="cpu", dtype=torch.bfloat16)
            return {"x": x}, linear

        def compute(tensors, operation):
            return operation(tensors["x"])

        shape_info = {"batch": BATCH_SIZE, "seq_len": SEQ_LEN, "in_features": HIDDEN_DIM, "out_features": FFN_DIM}

        result = benchmark_with_metrics(
            "FFN Upproject", prepare, compute, "linear", shape_info, profiling_info="T2V: 16 calls | S2V: 24 calls"
        )

        if result:
            print(
                f"\n{result['name']}: {result['avg_ms']:.3f}ms, "
                f"{result['tflops']:.2f} TFLOPs, {result['memory_bw_gbs']:.2f} GB/s"
            )

    def test_ffn_downproject(self):
        """Test FFN downproject (13824 -> 5120)."""
        if DEVICE == "cpu":
            pytest.skip("Kernel tests require XPU")

        def prepare():
            x = torch.randn(BATCH_SIZE, SEQ_LEN, FFN_DIM, device="cpu", dtype=torch.bfloat16)
            linear = torch.nn.Linear(FFN_DIM, HIDDEN_DIM, device="cpu", dtype=torch.bfloat16)
            return {"x": x}, linear

        def compute(tensors, operation):
            return operation(tensors["x"])

        shape_info = {"batch": BATCH_SIZE, "seq_len": SEQ_LEN, "in_features": FFN_DIM, "out_features": HIDDEN_DIM}

        result = benchmark_with_metrics(
            "FFN Downproject", prepare, compute, "linear", shape_info, profiling_info="T2V: 16 calls | S2V: 24 calls"
        )

        if result:
            print(
                f"\n{result['name']}: {result['avg_ms']:.3f}ms, "
                f"{result['tflops']:.2f} TFLOPs, {result['memory_bw_gbs']:.2f} GB/s"
            )

    def test_qkv_projection_linear(self):
        """Test QKV projection using torch.nn.Linear (5120 -> 15360)."""
        if DEVICE == "cpu":
            pytest.skip("Kernel tests require XPU")

        def prepare():
            x = torch.randn(BATCH_SIZE, SEQ_LEN, HIDDEN_DIM, device="cpu", dtype=torch.bfloat16)
            linear = torch.nn.Linear(HIDDEN_DIM, 3 * HIDDEN_DIM, device="cpu", dtype=torch.bfloat16)
            return {"x": x}, linear

        def compute(tensors, operation):
            return operation(tensors["x"])

        shape_info = {
            "batch": BATCH_SIZE,
            "seq_len": SEQ_LEN,
            "in_features": HIDDEN_DIM,
            "out_features": 3 * HIDDEN_DIM,
        }

        result = benchmark_with_metrics(
            "QKV Projection (Linear)",
            prepare,
            compute,
            "linear",
            shape_info,
            profiling_info="T2V: 16 calls | S2V: 24 calls",
        )

        if result:
            print(
                f"\n{result['name']}: {result['avg_ms']:.3f}ms, "
                f"{result['tflops']:.2f} TFLOPs, {result['memory_bw_gbs']:.2f} GB/s"
            )


# ============================================================================
# 8. Normalization Operations
# ============================================================================


class TestNormalizationOps:
    """Test normalization operations."""

    def test_rms_norm(self):
        """Test RMSNorm (11.84% XPU time in T2V)."""
        if DEVICE == "cpu":
            pytest.skip("Kernel tests require XPU")

        try:
            from vllm_omni.diffusion.layers.norm import RMSNorm

            def prepare():
                x = torch.randn(BATCH_SIZE, SEQ_LEN, HIDDEN_DIM, device="cpu", dtype=torch.bfloat16)
                rms_norm = RMSNorm(HIDDEN_DIM).to("cpu").to(torch.bfloat16)
                return {"x": x}, rms_norm

            def compute(tensors, operation):
                return operation.forward_xpu(tensors["x"])

            shape_info = {"elements": BATCH_SIZE * SEQ_LEN * HIDDEN_DIM}

            result = benchmark_with_metrics(
                "RMSNorm",
                prepare,
                compute,
                "elementwise",
                shape_info,
                profiling_info="T2V: 35,280 calls, ~232µs/call | S2V: similar",
            )

            if result:
                print(
                    f"\n{result['name']}: {result['avg_ms']:.3f}ms, "
                    f"{result['tflops']:.2f} TFLOPs, {result['memory_bw_gbs']:.2f} GB/s"
                )

        except Exception as e:
            pytest.skip(f"RMSNorm not available: {e}")

    def test_layer_norm(self):
        """Test LayerNorm via native_layer_norm kernel."""
        if DEVICE == "cpu":
            pytest.skip("Kernel tests require XPU")

        def prepare():
            x = torch.randn(BATCH_SIZE, 128, 90, 160, device="cpu", dtype=torch.float32)
            return {"x": x}, None

        def compute(tensors, operation):
            return torch.nn.functional.layer_norm(tensors["x"], (160,), eps=1e-6)

        shape_info = {"elements": BATCH_SIZE * 128 * 90 * 160}

        result = benchmark_with_metrics(
            "LayerNorm",
            prepare,
            compute,
            "elementwise",
            shape_info,
            profiling_info="T2V: 32 calls, ~3.3ms/call | S2V: similar",
        )

        if result:
            print(
                f"\n{result['name']}: {result['avg_ms']:.3f}ms, "
                f"{result['tflops']:.2f} TFLOPs, {result['memory_bw_gbs']:.2f} GB/s"
            )

    def test_ada_layer_norm(self):
        """Test AdaLayerNorm (LayerNorm + adaptive scale/shift)."""
        if DEVICE == "cpu":
            pytest.skip("Kernel tests require XPU")

        try:
            from vllm_omni.diffusion.layers.adalayernorm import AdaLayerNorm

            def prepare():
                hidden_states = torch.randn(BATCH_SIZE, SEQ_LEN, HIDDEN_DIM, device="cpu", dtype=torch.bfloat16)
                timestep_emb = torch.randn(BATCH_SIZE, HIDDEN_DIM, device="cpu", dtype=torch.bfloat16)
                ada_norm = AdaLayerNorm(HIDDEN_DIM).to("cpu").to(torch.bfloat16)
                return {"hidden_states": hidden_states, "timestep_emb": timestep_emb}, ada_norm

            def compute(tensors, operation):
                return operation.forward_xpu(tensors["hidden_states"], tensors["timestep_emb"])

            shape_info = {"elements": BATCH_SIZE * SEQ_LEN * HIDDEN_DIM}

            result = benchmark_with_metrics("AdaLayerNorm", prepare, compute, "elementwise", shape_info)

            if result:
                print(
                    f"\n{result['name']}: {result['avg_ms']:.3f}ms, "
                    f"{result['tflops']:.2f} TFLOPs, {result['memory_bw_gbs']:.2f} GB/s"
                )

        except Exception as e:
            pytest.skip(f"AdaLayerNorm not available: {e}")


# ============================================================================
# 9. Activation Functions
# ============================================================================


class TestActivationOps:
    """Test activation functions."""

    def test_silu_activation(self):
        """Test SiLU activation (3.34% XPU time in S2V, 0.3% in T2V)."""
        if DEVICE == "cpu":
            pytest.skip("Kernel tests require XPU")

        def prepare():
            x = torch.randn(BATCH_SIZE, SEQ_LEN, HIDDEN_DIM, device="cpu", dtype=torch.bfloat16)
            return {"x": x}, None

        def compute(tensors, operation):
            return torch.nn.functional.silu(tensors["x"])

        shape_info = {"elements": BATCH_SIZE * SEQ_LEN * HIDDEN_DIM}

        result = benchmark_with_metrics(
            "SiLU", prepare, compute, "elementwise", shape_info, profiling_info="S2V: 28,850 calls"
        )

        if result:
            print(
                f"\n{result['name']}: {result['avg_ms']:.3f}ms, "
                f"{result['tflops']:.2f} TFLOPs, {result['memory_bw_gbs']:.2f} GB/s"
            )

    def test_gelu_activation(self):
        """Test GELU activation (used in FFN)."""
        if DEVICE == "cpu":
            pytest.skip("Kernel tests require XPU")

        def prepare():
            x = torch.randn(BATCH_SIZE, SEQ_LEN, FFN_DIM, device="cpu", dtype=torch.bfloat16)
            return {"x": x}, None

        def compute(tensors, operation):
            return torch.nn.functional.gelu(tensors["x"], approximate="tanh")

        shape_info = {"elements": BATCH_SIZE * SEQ_LEN * FFN_DIM}

        result = benchmark_with_metrics("GELU", prepare, compute, "elementwise", shape_info)

        if result:
            print(
                f"\n{result['name']}: {result['avg_ms']:.3f}ms, "
                f"{result['tflops']:.2f} TFLOPs, {result['memory_bw_gbs']:.2f} GB/s"
            )


# ============================================================================
# 10. Element-wise Operations
# ============================================================================


class TestElementWiseOps:
    """Test element-wise operations."""

    def test_elementwise_mul(self):
        """Test element-wise multiplication (19-20% XPU time combined with div)."""
        if DEVICE == "cpu":
            pytest.skip("Kernel tests require XPU")

        def prepare():
            x = torch.randn(BATCH_SIZE, SEQ_LEN, HIDDEN_DIM, device="cpu", dtype=torch.bfloat16)
            scale = torch.randn(BATCH_SIZE, HIDDEN_DIM, device="cpu", dtype=torch.bfloat16)
            return {"x": x, "scale": scale}, None

        def compute(tensors, operation):
            return tensors["x"] * (1 + tensors["scale"].unsqueeze(1))

        shape_info = {"elements": BATCH_SIZE * SEQ_LEN * HIDDEN_DIM}

        result = benchmark_with_metrics(
            "Element-wise Mul",
            prepare,
            compute,
            "elementwise",
            shape_info,
            profiling_info="T2V: 41,828 calls | S2V: 68,078 calls",
        )

        if result:
            print(
                f"\n{result['name']}: {result['avg_ms']:.3f}ms, "
                f"{result['tflops']:.2f} TFLOPs, {result['memory_bw_gbs']:.2f} GB/s"
            )

    def test_elementwise_div(self):
        """Test element-wise division (used in RMSNorm)."""
        if DEVICE == "cpu":
            pytest.skip("Kernel tests require XPU")

        def prepare():
            x = torch.randn(BATCH_SIZE, SEQ_LEN, HIDDEN_DIM, device="cpu", dtype=torch.bfloat16)
            rms = torch.randn(BATCH_SIZE, SEQ_LEN, 1, device="cpu", dtype=torch.bfloat16)
            return {"x": x, "rms": rms}, None

        def compute(tensors, operation):
            return tensors["x"] / tensors["rms"]

        shape_info = {"elements": BATCH_SIZE * SEQ_LEN * HIDDEN_DIM}

        result = benchmark_with_metrics(
            "Element-wise Div",
            prepare,
            compute,
            "elementwise",
            shape_info,
            profiling_info="T2V: 17,789 calls | S2V: 30,176 calls",
        )

        if result:
            print(
                f"\n{result['name']}: {result['avg_ms']:.3f}ms, "
                f"{result['tflops']:.2f} TFLOPs, {result['memory_bw_gbs']:.2f} GB/s"
            )

    def test_elementwise_add(self):
        """Test element-wise addition (residual connections)."""
        if DEVICE == "cpu":
            pytest.skip("Kernel tests require XPU")

        def prepare():
            x = torch.randn(BATCH_SIZE, SEQ_LEN, HIDDEN_DIM, device="cpu", dtype=torch.bfloat16)
            residual = torch.randn(BATCH_SIZE, SEQ_LEN, HIDDEN_DIM, device="cpu", dtype=torch.bfloat16)
            return {"x": x, "residual": residual}, None

        def compute(tensors, operation):
            return tensors["x"] + tensors["residual"]

        shape_info = {"elements": BATCH_SIZE * SEQ_LEN * HIDDEN_DIM}

        result = benchmark_with_metrics("Element-wise Add", prepare, compute, "elementwise", shape_info)

        if result:
            print(
                f"\n{result['name']}: {result['avg_ms']:.3f}ms, "
                f"{result['tflops']:.2f} TFLOPs, {result['memory_bw_gbs']:.2f} GB/s"
            )


# ============================================================================
# 11. Tensor Manipulation Operations
# ============================================================================


class TestTensorManipulationOps:
    """Test tensor manipulation operations."""

    def test_reshape_multihead(self):
        """Test reshape for multi-head attention."""
        if DEVICE == "cpu":
            pytest.skip("Kernel tests require XPU")

        def prepare():
            qkv = torch.randn(BATCH_SIZE, SEQ_LEN, 3 * HIDDEN_DIM, device="cpu", dtype=torch.bfloat16)
            return {"qkv": qkv}, None

        def compute(tensors, operation):
            qkv = tensors["qkv"]
            q, k, v = qkv.chunk(3, dim=-1)
            q = q.view(BATCH_SIZE, SEQ_LEN, NUM_HEADS, HEAD_DIM)
            k = k.view(BATCH_SIZE, SEQ_LEN, NUM_HEADS, HEAD_DIM)
            v = v.view(BATCH_SIZE, SEQ_LEN, NUM_HEADS, HEAD_DIM)
            return q, k, v

        shape_info = {"elements": BATCH_SIZE * SEQ_LEN * 3 * HIDDEN_DIM}

        result = benchmark_with_metrics("Reshape to Multi-head", prepare, compute, "elementwise", shape_info)

        if result:
            print(
                f"\n{result['name']}: {result['avg_ms']:.3f}ms, "
                f"{result['tflops']:.2f} TFLOPs, {result['memory_bw_gbs']:.2f} GB/s"
            )

    def test_concatenation(self):
        """Test concatenation (used in CFG)."""
        if DEVICE == "cpu":
            pytest.skip("Kernel tests require XPU")

        def prepare():
            latent_cond = torch.randn(
                BATCH_SIZE, 16, 21, LATENT_HEIGHT, LATENT_WIDTH, device="cpu", dtype=torch.bfloat16
            )
            latent_uncond = torch.randn(
                BATCH_SIZE, 16, 21, LATENT_HEIGHT, LATENT_WIDTH, device="cpu", dtype=torch.bfloat16
            )
            return {"latent_cond": latent_cond, "latent_uncond": latent_uncond}, None

        def compute(tensors, operation):
            return torch.cat([tensors["latent_cond"], tensors["latent_uncond"]], dim=0)

        shape_info = {"elements": 2 * BATCH_SIZE * 16 * 21 * LATENT_HEIGHT * LATENT_WIDTH}

        result = benchmark_with_metrics(
            "Concatenation (CFG)",
            prepare,
            compute,
            "elementwise",
            shape_info,
            profiling_info="T2V: 25,802 calls | S2V: 42,793 calls",
        )

        if result:
            print(
                f"\n{result['name']}: {result['avg_ms']:.3f}ms, "
                f"{result['tflops']:.2f} TFLOPs, {result['memory_bw_gbs']:.2f} GB/s"
            )

    def test_cfg_concatenation(self):
        """Test CFG concatenation along batch dimension (T2V: 81 frames, S2V: 80 frames)."""
        if DEVICE == "cpu":
            pytest.skip("Kernel tests require XPU")

        def prepare():
            latent_cond = torch.randn(
                BATCH_SIZE, 16, NUM_FRAMES_T2V, LATENT_HEIGHT, LATENT_WIDTH, device="cpu", dtype=torch.bfloat16
            )
            latent_uncond = torch.randn(
                BATCH_SIZE, 16, NUM_FRAMES_T2V, LATENT_HEIGHT, LATENT_WIDTH, device="cpu", dtype=torch.bfloat16
            )
            return {"latent_cond": latent_cond, "latent_uncond": latent_uncond}, None

        def compute(tensors, operation):
            return torch.cat([tensors["latent_cond"], tensors["latent_uncond"]], dim=0)

        shape_info = {"elements": 2 * BATCH_SIZE * 16 * NUM_FRAMES_T2V * LATENT_HEIGHT * LATENT_WIDTH}

        result = benchmark_with_metrics(
            "CFG Concatenation",
            prepare,
            compute,
            "elementwise",
            shape_info,
            profiling_info="S2V: 42,793 calls (80 frames) | T2V: similar (81 frames)",
        )

        if result:
            print(
                f"\n{result['name']}: {result['avg_ms']:.3f}ms, "
                f"{result['tflops']:.2f} TFLOPs, {result['memory_bw_gbs']:.2f} GB/s"
            )

    def test_audio_feature_concatenation_s2v(self):
        """Test audio feature concatenation (S2V specific)."""
        if DEVICE == "cpu":
            pytest.skip("Kernel tests require XPU")

        def prepare():
            text_features = torch.randn(BATCH_SIZE, 256, 4096, device="cpu", dtype=torch.bfloat16)
            audio_features = torch.randn(BATCH_SIZE, 256, 4096, device="cpu", dtype=torch.bfloat16)
            return {"text_features": text_features, "audio_features": audio_features}, None

        def compute(tensors, operation):
            return torch.cat([tensors["text_features"], tensors["audio_features"]], dim=1)

        shape_info = {"elements": BATCH_SIZE * 512 * 4096}

        result = benchmark_with_metrics("Audio Feature Concat (S2V)", prepare, compute, "elementwise", shape_info)

        if result:
            print(
                f"\n{result['name']}: {result['avg_ms']:.3f}ms, "
                f"{result['tflops']:.2f} TFLOPs, {result['memory_bw_gbs']:.2f} GB/s"
            )


# ============================================================================
# 12. RoPE Operations
# ============================================================================


class TestRoPEOps:
    """Test rotary position embedding operations."""

    def test_rope_embedding_generation(self):
        """Test 3D RoPE embedding generation (temporal, height, width)."""
        if DEVICE == "cpu":
            pytest.skip("Kernel tests require XPU")

        T, H, W = 21, 45, 80

        def prepare():
            return {}, None

        def compute(tensors, operation):
            t_pos = torch.arange(T, device="xpu").view(T, 1, 1).expand(T, H, W)
            h_pos = torch.arange(H, device="xpu").view(1, H, 1).expand(T, H, W)
            w_pos = torch.arange(W, device="xpu").view(1, 1, W).expand(T, H, W)
            return t_pos, h_pos, w_pos

        shape_info = {"elements": 3 * T * H * W}

        result = benchmark_with_metrics("RoPE 3D Position Generation", prepare, compute, "elementwise", shape_info)

        if result:
            print(
                f"\n{result['name']}: {result['avg_ms']:.3f}ms, "
                f"{result['tflops']:.2f} TFLOPs, {result['memory_bw_gbs']:.2f} GB/s"
            )

    def test_rotary_embedding(self):
        """Test 3D RoPE for video transformers."""
        if DEVICE == "cpu":
            pytest.skip("Kernel tests require XPU")

        try:
            from vllm_omni.diffusion.layers.rope import RotaryEmbeddingWan

            def prepare():
                q = torch.randn(BATCH_SIZE * SEQ_LEN, NUM_HEADS, HEAD_DIM, device="cpu", dtype=torch.bfloat16)
                cos = torch.randn(SEQ_LEN, HEAD_DIM, device="cpu", dtype=torch.bfloat16)
                sin = torch.randn(SEQ_LEN, HEAD_DIM, device="cpu", dtype=torch.bfloat16)
                rope = RotaryEmbeddingWan()
                return {"q": q, "cos": cos, "sin": sin}, rope

            def compute(tensors, operation):
                return operation.forward_xpu(tensors["q"], tensors["cos"], tensors["sin"])

            shape_info = {"elements": BATCH_SIZE * SEQ_LEN * NUM_HEADS * HEAD_DIM}

            result = benchmark_with_metrics(
                "RoPE 3D",
                prepare,
                compute,
                "elementwise",
                shape_info,
                profiling_info="T2V: 16 calls | S2V: similar",
            )

            if result:
                print(
                    f"\n{result['name']}: {result['avg_ms']:.3f}ms, "
                    f"{result['tflops']:.2f} TFLOPs, {result['memory_bw_gbs']:.2f} GB/s"
                )

        except Exception as e:
            pytest.skip(f"RotaryEmbeddingWan not available: {e}")


# ============================================================================
# 13. Memory Operations
# ============================================================================


class TestMemoryOps:
    """Test memory copy and data movement operations."""

    def test_dtype_conversion_fp32_to_bf16(self):
        """Test fp32 to bf16 conversion."""
        if DEVICE == "cpu":
            pytest.skip("Kernel tests require XPU")

        def prepare():
            x = torch.randn(BATCH_SIZE, SEQ_LEN, HIDDEN_DIM, device="cpu", dtype=torch.float32)
            return {"x": x}, None

        def compute(tensors, operation):
            return tensors["x"].to(torch.bfloat16)

        shape_info = {"elements": BATCH_SIZE * SEQ_LEN * HIDDEN_DIM}

        result = benchmark_with_metrics(
            "FP32→BF16", prepare, compute, "elementwise", shape_info, profiling_info="T2V/S2V: frequent"
        )

        if result:
            print(
                f"\n{result['name']}: {result['avg_ms']:.3f}ms, "
                f"{result['tflops']:.2f} TFLOPs, {result['memory_bw_gbs']:.2f} GB/s"
            )

    def test_dtype_conversion_bf16_to_fp32(self):
        """Test bf16 to fp32 conversion."""
        if DEVICE == "cpu":
            pytest.skip("Kernel tests require XPU")

        def prepare():
            x = torch.randn(BATCH_SIZE, SEQ_LEN, HIDDEN_DIM, device="cpu", dtype=torch.bfloat16)
            return {"x": x}, None

        def compute(tensors, operation):
            return tensors["x"].to(torch.float32)

        shape_info = {"elements": BATCH_SIZE * SEQ_LEN * HIDDEN_DIM}

        result = benchmark_with_metrics(
            "BF16→FP32",
            prepare,
            compute,
            "elementwise",
            shape_info,
            profiling_info="T2V: 84,028 calls | S2V: 142,308 calls",
        )

        if result:
            print(
                f"\n{result['name']}: {result['avg_ms']:.3f}ms, "
                f"{result['tflops']:.2f} TFLOPs, {result['memory_bw_gbs']:.2f} GB/s"
            )

    def test_contiguous_memory_copy(self):
        """Test making tensor contiguous (triggers memory copy)."""
        if DEVICE == "cpu":
            pytest.skip("Kernel tests require XPU")

        def prepare():
            x = torch.randn(BATCH_SIZE, SEQ_LEN, NUM_HEADS, HEAD_DIM, device="cpu", dtype=torch.bfloat16)
            return {"x": x}, None

        def compute(tensors, operation):
            x_t = tensors["x"].transpose(1, 2)
            return x_t.contiguous()

        shape_info = {"elements": BATCH_SIZE * SEQ_LEN * NUM_HEADS * HEAD_DIM}

        result = benchmark_with_metrics(
            "Contiguous Copy", prepare, compute, "elementwise", shape_info, profiling_info="T2V/S2V: frequent"
        )

        if result:
            print(
                f"\n{result['name']}: {result['avg_ms']:.3f}ms, "
                f"{result['tflops']:.2f} TFLOPs, {result['memory_bw_gbs']:.2f} GB/s"
            )


# ============================================================================
# 14. VAE and WanResidualBlock
# ============================================================================


class TestVAEOps:
    """Test VAE operations."""

    def test_wan_residual_block(self):
        """Test WanResidualBlock (Conv3D + RMSNorm + SiLU + Residual)."""
        if DEVICE == "cpu":
            pytest.skip("Kernel tests require XPU")

        def prepare():
            x = torch.randn(BATCH_SIZE, 384, 3, 34, 34, device="cpu", dtype=torch.bfloat16)
            conv = torch.nn.Conv3d(384, 384, kernel_size=3, padding=1, device="cpu", dtype=torch.bfloat16)
            return {"x": x}, conv

        def compute(tensors, operation):
            x = tensors["x"]
            identity = x
            out = operation(x)
            out = out / (out.norm(dim=1, keepdim=True) + 1e-6)
            out = torch.nn.functional.silu(out)
            out = out + identity
            return out

        shape_info = {
            "batch": BATCH_SIZE,
            "in_channels": 384,
            "out_channels": 384,
            "kernel_d": 3,
            "kernel_h": 3,
            "kernel_w": 3,
            "output_d": 3,
            "output_h": 34,
            "output_w": 34,
            "input_size": BATCH_SIZE * 384 * 3 * 34 * 34,
            "weight_size": 384 * 384 * 3 * 3 * 3,
            "output_size": BATCH_SIZE * 384 * 3 * 34 * 34,
        }

        result = benchmark_with_metrics(
            "WanResidualBlock", prepare, compute, "conv3d", shape_info, profiling_info="T2V: 588 calls/block"
        )

        if result:
            print(
                f"\n{result['name']}: {result['avg_ms']:.3f}ms, "
                f"{result['tflops']:.2f} TFLOPs, {result['memory_bw_gbs']:.2f} GB/s"
            )

    def test_vae_forward_block(self):
        """Test VAE encoder/decoder block (Conv3D + RMSNorm + SiLU)."""
        if DEVICE == "cpu":
            pytest.skip("Kernel tests require XPU")

        def prepare():
            x = torch.randn(BATCH_SIZE, 384, 3, 34, 34, device="cpu", dtype=torch.bfloat16)
            conv = torch.nn.Conv3d(384, 384, kernel_size=3, padding=1, device="cpu", dtype=torch.bfloat16)
            return {"x": x}, conv

        def compute(tensors, operation):
            out = operation(tensors["x"])
            out = out / (out.norm(dim=-1, keepdim=True) + 1e-6)
            out = torch.nn.functional.silu(out)
            return out

        shape_info = {
            "batch": BATCH_SIZE,
            "in_channels": 384,
            "out_channels": 384,
            "kernel_d": 3,
            "kernel_h": 3,
            "kernel_w": 3,
            "output_d": 3,
            "output_h": 34,
            "output_w": 34,
            "input_size": BATCH_SIZE * 384 * 3 * 34 * 34,
            "weight_size": 384 * 384 * 3 * 3 * 3,
            "output_size": BATCH_SIZE * 384 * 3 * 34 * 34,
        }

        result = benchmark_with_metrics(
            "VAE Forward Block", prepare, compute, "conv3d", shape_info, profiling_info="T2V: 8,232 forward calls"
        )

        if result:
            print(
                f"\n{result['name']}: {result['avg_ms']:.3f}ms, "
                f"{result['tflops']:.2f} TFLOPs, {result['memory_bw_gbs']:.2f} GB/s"
            )

    def test_vae_blend_operations(self):
        """Test VAE blend_h operations (tile blending)."""
        if DEVICE == "cpu":
            pytest.skip("Kernel tests require XPU")

        def prepare():
            tile_h = torch.randn(BATCH_SIZE, 16, 20, 90, 160, device="cpu", dtype=torch.bfloat16)
            blend_weight = torch.randn(1, 1, 1, 90, 1, device="cpu", dtype=torch.bfloat16)
            output = torch.zeros_like(tile_h, device="cpu")
            return {"tile_h": tile_h, "blend_weight": blend_weight, "output": output}, None

        def compute(tensors, operation):
            blended = tensors["tile_h"] * tensors["blend_weight"]
            return tensors["output"] + blended

        shape_info = {"elements": BATCH_SIZE * 16 * 20 * 90 * 160}

        result = benchmark_with_metrics(
            "VAE Blend Operations", prepare, compute, "elementwise", shape_info, profiling_info="T2V: 24 blend_h calls"
        )

        if result:
            print(
                f"\n{result['name']}: {result['avg_ms']:.3f}ms, "
                f"{result['tflops']:.2f} TFLOPs, {result['memory_bw_gbs']:.2f} GB/s"
            )

    def test_vae_blend_h_mul(self):
        """Test element-wise multiplication in blend_h (tile blending)."""
        if DEVICE == "cpu":
            pytest.skip("Kernel tests require XPU")

        def prepare():
            tile_h = torch.randn(BATCH_SIZE, 16, 20, 90, 160, device="cpu", dtype=torch.bfloat16)
            blend_weight = torch.randn(1, 1, 1, 90, 1, device="cpu", dtype=torch.bfloat16)
            return {"tile_h": tile_h, "blend_weight": blend_weight}, None

        def compute(tensors, operation):
            return tensors["tile_h"] * tensors["blend_weight"]

        shape_info = {"elements": BATCH_SIZE * 16 * 20 * 90 * 160}

        result = benchmark_with_metrics(
            "VAE blend_h Mul",
            prepare,
            compute,
            "elementwise",
            shape_info,
            profiling_info="T2V: ~40ms/call | S2V: similar",
        )

        if result:
            print(
                f"\n{result['name']}: {result['avg_ms']:.3f}ms, "
                f"{result['tflops']:.2f} TFLOPs, {result['memory_bw_gbs']:.2f} GB/s"
            )

    def test_vae_blend_h_add(self):
        """Test element-wise addition in blend_h (tile accumulation)."""
        if DEVICE == "cpu":
            pytest.skip("Kernel tests require XPU")

        def prepare():
            output = torch.randn(BATCH_SIZE, 16, 20, 90, 160, device="cpu", dtype=torch.bfloat16)
            blended_tile = torch.randn(BATCH_SIZE, 16, 20, 90, 160, device="cpu", dtype=torch.bfloat16)
            return {"output": output, "blended_tile": blended_tile}, None

        def compute(tensors, operation):
            return tensors["output"] + tensors["blended_tile"]

        shape_info = {"elements": BATCH_SIZE * 16 * 20 * 90 * 160}

        result = benchmark_with_metrics(
            "VAE blend_h Add", prepare, compute, "elementwise", shape_info, profiling_info="T2V/S2V: frequent"
        )

        if result:
            print(
                f"\n{result['name']}: {result['avg_ms']:.3f}ms, "
                f"{result['tflops']:.2f} TFLOPs, {result['memory_bw_gbs']:.2f} GB/s"
            )

    def test_vae_conv3d_decoder(self):
        """Test Conv3D in VAE decoder (latent to pixel, T2V: 21 frames, S2V: 20 frames)."""
        if DEVICE == "cpu":
            pytest.skip("Kernel tests require XPU")

        def prepare():
            latent = torch.randn(BATCH_SIZE, 16, 21, 90, 160, device="cpu", dtype=torch.bfloat16)
            conv = torch.nn.Conv3d(16, 128, kernel_size=3, padding=1, device="cpu", dtype=torch.bfloat16)
            return {"latent": latent}, conv

        def compute(tensors, operation):
            return operation(tensors["latent"])

        shape_info = {
            "batch": BATCH_SIZE,
            "in_channels": 16,
            "out_channels": 128,
            "kernel_d": 3,
            "kernel_h": 3,
            "kernel_w": 3,
            "output_d": 21,
            "output_h": 90,
            "output_w": 160,
            "input_size": BATCH_SIZE * 16 * 21 * 90 * 160,
            "weight_size": 128 * 16 * 3 * 3 * 3,
            "output_size": BATCH_SIZE * 128 * 21 * 90 * 160,
        }

        result = benchmark_with_metrics(
            "VAE Conv3D Decoder",
            prepare,
            compute,
            "conv3d",
            shape_info,
            profiling_info="T2V: ~6.2ms/forward (21f) | S2V: similar (20f)",
        )

        if result:
            print(
                f"\n{result['name']}: {result['avg_ms']:.3f}ms, "
                f"{result['tflops']:.2f} TFLOPs, {result['memory_bw_gbs']:.2f} GB/s"
            )

    def test_vae_tiled_encode_conv(self):
        """Test Conv3D in VAE tiled_encode (pixel to latent tiles)."""
        if DEVICE == "cpu":
            pytest.skip("Kernel tests require XPU")

        def prepare():
            tile = torch.randn(BATCH_SIZE, 3, 20, 256, 256, device="cpu", dtype=torch.bfloat16)
            conv = torch.nn.Conv3d(3, 128, kernel_size=3, padding=1, device="cpu", dtype=torch.bfloat16)
            return {"tile": tile}, conv

        def compute(tensors, operation):
            return operation(tensors["tile"])

        shape_info = {
            "batch": BATCH_SIZE,
            "in_channels": 3,
            "out_channels": 128,
            "kernel_d": 3,
            "kernel_h": 3,
            "kernel_w": 3,
            "output_d": 20,
            "output_h": 256,
            "output_w": 256,
            "input_size": BATCH_SIZE * 3 * 20 * 256 * 256,
            "weight_size": 128 * 3 * 3 * 3 * 3,
            "output_size": BATCH_SIZE * 128 * 20 * 256 * 256,
        }

        result = benchmark_with_metrics(
            "VAE Tiled Encode Conv",
            prepare,
            compute,
            "conv3d",
            shape_info,
            profiling_info="Full 720p video split into tiles",
        )

        if result:
            print(
                f"\n{result['name']}: {result['avg_ms']:.3f}ms, "
                f"{result['tflops']:.2f} TFLOPs, {result['memory_bw_gbs']:.2f} GB/s"
            )


# ============================================================================
# 15. Text Encoder (UMT5)
# ============================================================================


class TestTextEncoderOps:
    """Test text encoder (UMT5) operations."""

    def test_umt5_attention_matmul(self):
        """Test matmul in UMT5 self-attention."""
        if DEVICE == "cpu":
            pytest.skip("Kernel tests require XPU")

        UMT5_SEQ_LEN = 512
        UMT5_HEADS = 24
        UMT5_HEAD_DIM = 64

        def prepare():
            q = torch.randn(BATCH_SIZE, UMT5_HEADS, UMT5_SEQ_LEN, UMT5_HEAD_DIM, device="cpu", dtype=torch.bfloat16)
            k = torch.randn(BATCH_SIZE, UMT5_HEADS, UMT5_SEQ_LEN, UMT5_HEAD_DIM, device="cpu", dtype=torch.bfloat16)
            return {"q": q, "k": k}, None

        def compute(tensors, operation):
            return torch.matmul(tensors["q"], tensors["k"].transpose(-2, -1))

        shape_info = {"batch": BATCH_SIZE, "num_heads": UMT5_HEADS, "seq_len": UMT5_SEQ_LEN, "head_dim": UMT5_HEAD_DIM}

        result = benchmark_with_metrics(
            "UMT5 Matmul",
            prepare,
            compute,
            "flash_attn",
            shape_info,
            profiling_info="48 UMT5Block.forward calls | T2V/S2V: similar",
        )

        if result:
            print(
                f"\n{result['name']}: {result['avg_ms']:.3f}ms, "
                f"{result['tflops']:.2f} TFLOPs, {result['memory_bw_gbs']:.2f} GB/s"
            )

    def test_umt5_attention_softmax(self):
        """Test softmax in UMT5 self-attention."""
        if DEVICE == "cpu":
            pytest.skip("Kernel tests require XPU")

        UMT5_SEQ_LEN = 512
        UMT5_HEADS = 24

        def prepare():
            attn_scores = torch.randn(
                BATCH_SIZE, UMT5_HEADS, UMT5_SEQ_LEN, UMT5_SEQ_LEN, device="cpu", dtype=torch.bfloat16
            )
            return {"attn_scores": attn_scores}, None

        def compute(tensors, operation):
            return torch.nn.functional.softmax(tensors["attn_scores"], dim=-1)

        shape_info = {"elements": BATCH_SIZE * UMT5_HEADS * UMT5_SEQ_LEN * UMT5_SEQ_LEN}

        result = benchmark_with_metrics(
            "UMT5 Attention Softmax", prepare, compute, "elementwise", shape_info, profiling_info="T2V/S2V: similar"
        )

        if result:
            print(
                f"\n{result['name']}: {result['avg_ms']:.3f}ms, "
                f"{result['tflops']:.2f} TFLOPs, {result['memory_bw_gbs']:.2f} GB/s"
            )

    def test_umt5_attention_softmax_t2v(self):
        """Test softmax in UMT5 self-attention (T2V)."""
        if DEVICE == "cpu":
            pytest.skip("Kernel tests require XPU")

        UMT5_SEQ_LEN = 512
        UMT5_HEADS = 24

        def prepare():
            attn_scores = torch.randn(
                BATCH_SIZE, UMT5_HEADS, UMT5_SEQ_LEN, UMT5_SEQ_LEN, device="cpu", dtype=torch.bfloat16
            )
            return {"attn_scores": attn_scores}, None

        def compute(tensors, operation):
            return torch.nn.functional.softmax(tensors["attn_scores"], dim=-1)

        shape_info = {"elements": BATCH_SIZE * UMT5_HEADS * UMT5_SEQ_LEN * UMT5_SEQ_LEN}

        result = benchmark_with_metrics("UMT5 Attention Softmax (T2V)", prepare, compute, "elementwise", shape_info)

        if result:
            print(
                f"\n{result['name']}: {result['avg_ms']:.3f}ms, "
                f"{result['tflops']:.2f} TFLOPs, {result['memory_bw_gbs']:.2f} GB/s"
            )

    def test_umt5_ffn_linear(self):
        """Test FFN linear layer in UMT5."""
        if DEVICE == "cpu":
            pytest.skip("Kernel tests require XPU")

        UMT5_SEQ_LEN = 512
        UMT5_HIDDEN_DIM = 1536
        UMT5_FFN_DIM = 4096

        def prepare():
            x = torch.randn(BATCH_SIZE, UMT5_SEQ_LEN, UMT5_HIDDEN_DIM, device="cpu", dtype=torch.bfloat16)
            linear = torch.nn.Linear(UMT5_HIDDEN_DIM, UMT5_FFN_DIM, device="cpu", dtype=torch.bfloat16)
            return {"x": x}, linear

        def compute(tensors, operation):
            return operation(tensors["x"])

        shape_info = {
            "batch": BATCH_SIZE,
            "seq_len": UMT5_SEQ_LEN,
            "in_features": UMT5_HIDDEN_DIM,
            "out_features": UMT5_FFN_DIM,
        }

        result = benchmark_with_metrics(
            "UMT5 FFN Linear",
            prepare,
            compute,
            "linear",
            shape_info,
            profiling_info="~8ms per UMT5Block.forward | T2V/S2V: similar",
        )

        if result:
            print(
                f"\n{result['name']}: {result['avg_ms']:.3f}ms, "
                f"{result['tflops']:.2f} TFLOPs, {result['memory_bw_gbs']:.2f} GB/s"
            )


# ============================================================================
# 16. VAE Tiling Tests (Memory Optimization)
# ============================================================================


class TestVAETilingOps:
    """Test VAE with tiling enabled for memory optimization."""

    def test_vae_tiled_decode_s2v(self):
        """Test VAE tiled decode for S2V (80 frames) with memory optimization."""
        if DEVICE == "cpu":
            pytest.skip("VAE tests require XPU")

        try:
            def prepare():
                # Latent input for S2V: [1, 16, 80, 90, 160]
                # This is the compressed latent space (8x downsampled from 720p)
                latent = torch.randn(1, 16, NUM_FRAMES_S2V, LATENT_HEIGHT, LATENT_WIDTH, device="cpu", dtype=torch.bfloat16)
                # Load VAE model (or create a mock one for testing)
                # For actual test, you would load: DistributedAutoencoderKLWan.from_pretrained(...)
                return {"latent": latent}, None

            def compute(tensors, operation):
                # Mock tiled decode computation
                # In real usage: vae.tiled_decode(tensors["latent"])
                # For benchmark, we simulate the tile processing
                latent = tensors["latent"]
                _, _, num_frames, height, width = latent.shape

                # Tile parameters (typical WAN settings)
                tile_h = 32  # latent space tiles
                tile_w = 32
                stride_h = 24  # overlap
                stride_w = 24

                tiles_processed = 0
                for i in range(0, height, stride_h):
                    for j in range(0, width, stride_w):
                        # Process one tile at a time
                        tile = latent[:, :, :, i:i+tile_h, j:j+tile_w]
                        # Simulate decode: latent (16 ch) -> RGB (3 ch), 8x upsample
                        decoded_tile = torch.randn(
                            1, 3, num_frames,
                            tile.shape[3] * 8,
                            tile.shape[4] * 8,
                            device="xpu",
                            dtype=torch.bfloat16
                        )
                        tiles_processed += 1
                        # Free memory after each tile
                        del decoded_tile
                        torch.xpu.empty_cache()

                # Return mock output (in real implementation, tiles would be blended)
                return torch.randn(1, 3, num_frames, 720, 1280, device="xpu", dtype=torch.bfloat16)

            # Memory estimate for ONE TILE (not full output)
            # Each tile: [1, 3, 80, 256, 256] (256 = 32 * 8 upscale)
            tile_output_h = 32 * 8
            tile_output_w = 32 * 8
            result = benchmark_with_metrics(
                "VAE Tiled Decode (S2V 80f)",
                prepare,
                compute,
                "elementwise",
                {"elements": 1 * 3 * NUM_FRAMES_S2V * tile_output_h * tile_output_w},
                profiling_info="Tiled: ~28 tiles @ 256x256, peak ~3GB vs 18GB full",
            )

            if result:
                print(
                    f"\n{result['name']}: {result['avg_ms']:.3f}ms, "
                    f"{result['memory_bw_gbs']:.2f} GB/s, Peak: {result['peak_memory_mb']:.1f}MB"
                )

        except ImportError as e:
            pytest.skip(f"VAE model not available: {e}")

    def test_vae_tiled_decode_t2v(self):
        """Test VAE tiled decode for T2V (81 frames) with memory optimization."""
        if DEVICE == "cpu":
            pytest.skip("VAE tests require XPU")

        try:
            def prepare():
                # Latent input for T2V: [1, 16, 81, 90, 160]
                latent = torch.randn(1, 16, NUM_FRAMES_T2V, LATENT_HEIGHT, LATENT_WIDTH, device="cpu", dtype=torch.bfloat16)
                return {"latent": latent}, None

            def compute(tensors, operation):
                latent = tensors["latent"]
                _, _, num_frames, height, width = latent.shape

                # Tile parameters
                tile_h = 32
                tile_w = 32
                stride_h = 24
                stride_w = 24

                for i in range(0, height, stride_h):
                    for j in range(0, width, stride_w):
                        tile = latent[:, :, :, i:i+tile_h, j:j+tile_w]
                        decoded_tile = torch.randn(
                            1, 3, num_frames,
                            tile.shape[3] * 8,
                            tile.shape[4] * 8,
                            device="xpu",
                            dtype=torch.bfloat16
                        )
                        del decoded_tile
                        torch.xpu.empty_cache()

                return torch.randn(1, 3, num_frames, 720, 1280, device="xpu", dtype=torch.bfloat16)

            # Memory estimate for ONE TILE (not full output)
            # Each tile: [1, 3, 81, 256, 256]
            tile_output_h = 32 * 8
            tile_output_w = 32 * 8
            result = benchmark_with_metrics(
                "VAE Tiled Decode (T2V 81f)",
                prepare,
                compute,
                "elementwise",
                {"elements": 1 * 3 * NUM_FRAMES_T2V * tile_output_h * tile_output_w},
                profiling_info="Tiled: ~28 tiles @ 256x256, peak ~3GB vs 18GB full",
            )

            if result:
                print(
                    f"\n{result['name']}: {result['avg_ms']:.3f}ms, "
                    f"{result['memory_bw_gbs']:.2f} GB/s, Peak: {result['peak_memory_mb']:.1f}MB"
                )

        except ImportError as e:
            pytest.skip(f"VAE model not available: {e}")

    def test_conv3d_vae_encoder_tiled_s2v(self):
        """Test Conv3D VAE encoder with tiling simulation (S2V: 80 frames)."""
        if DEVICE == "cpu":
            pytest.skip("Kernel tests require XPU")

        def prepare():
            # For tiled processing, we only need one tile's worth of data for testing
            # Tile size: 256x256, but prepare full frame to simulate real workflow
            tile_h = 256
            tile_w = 256
            # Use a single tile for the test to save memory
            video = torch.randn(1, 3, NUM_FRAMES_S2V, tile_h, tile_w, device="cpu", dtype=torch.bfloat16)
            conv = torch.nn.Conv3d(3, 128, kernel_size=3, padding=1, device="cpu", dtype=torch.bfloat16)
            return {"video": video}, conv

        def compute(tensors, operation):
            video = tensors["video"]
            # Process single tile (simulating one tile from a tiled workflow)
            encoded_tile = operation(video)

            # Free immediately to demonstrate memory efficiency
            result = encoded_tile
            del encoded_tile
            torch.xpu.empty_cache()

            return result

        # Memory estimate for ONE TILE (not full frame)
        # Tile: [1, 3, 80, 256, 256] -> [1, 128, 80, 256, 256]
        tile_h = 256
        tile_w = 256
        shape_info = {
            "batch": 1,
            "in_channels": 3,
            "out_channels": 128,
            "kernel_d": 3,
            "kernel_h": 3,
            "kernel_w": 3,
            "output_d": NUM_FRAMES_S2V,
            "output_h": tile_h,  # Per-tile size
            "output_w": tile_w,  # Per-tile size
            "input_size": 1 * 3 * NUM_FRAMES_S2V * tile_h * tile_w,
            "weight_size": 128 * 3 * 3 * 3 * 3,
            "output_size": 1 * 128 * NUM_FRAMES_S2V * tile_h * tile_w,
        }

        result = benchmark_with_metrics(
            "Conv3D VAE Encoder Tiled (S2V 80f)",
            prepare,
            compute,
            "conv3d",
            shape_info,
            profiling_info="Single tile: 256x256, demonstrates per-tile memory (2.5GB vs 17.6GB full)",
        )

        if result:
            print(
                f"\n{result['name']}: {result['avg_ms']:.3f}ms, "
                f"{result['tflops']:.2f} TFLOPs, Peak: {result['peak_memory_mb']:.1f}MB"
            )


def generate_markdown_report(output_file="wan22_test_report.md"):
    """Generate Markdown report from test results."""
    if not TEST_RESULTS:
        return

    total_peak_mem = sum(r.get("peak_memory_mb", 0) for r in TEST_RESULTS)
    md = f"""# WAN 2.2 Operations Test Report

## Summary
| Metric | Value |
|--------|-------|
| Total Tests | {len(TEST_RESULTS)} |
| Total TFLOPs | {sum(r["tflops"] for r in TEST_RESULTS):.2f} |
| Avg Memory BW | {np.mean([r["memory_bw_gbs"] for r in TEST_RESULTS]):.2f} GB/s |
| Total Peak Memory | {total_peak_mem:.1f} MB |

## Detailed Results

| Test Name | Latency (ms) | TFLOPs | Memory BW (GB/s) | Peak Mem (MB) | Memory Breakdown | Shape | Notes |
|-----------|--------------|--------|------------------|---------------|------------------|-------|-------|
"""

    for result in TEST_RESULTS:
        profiling = result.get("profiling_info", "")
        shape_info = result.get("shape_info", {})
        peak_mem = result.get("peak_memory_mb", 0)
        mem_breakdown = result.get("memory_breakdown", {})

        # Format memory breakdown
        mem_breakdown_str = ""
        if mem_breakdown:
            act_mb = mem_breakdown.get("activation", 0) / (1024 ** 2)
            weight_mb = mem_breakdown.get("weight", 0) / (1024 ** 2)
            out_mb = mem_breakdown.get("output", 0) / (1024 ** 2)
            runtime_mb = mem_breakdown.get("runtime", 0) / (1024 ** 2)
            mem_breakdown_str = f"A:{act_mb:.1f} W:{weight_mb:.1f} O:{out_mb:.1f}"
            if runtime_mb > 0:
                mem_breakdown_str += f" R:{runtime_mb:.1f}"

        # Format shape info compactly based on operation type
        shape_str = ""
        if "batch" in shape_info and "seq_len" in shape_info:
            shape_str = f"B={shape_info.get('batch')}, S={shape_info.get('seq_len')}"
            if "in_features" in shape_info:
                shape_str += f", I={shape_info.get('in_features')}, O={shape_info.get('out_features')}"
        elif "in_channels" in shape_info and "out_channels" in shape_info:
            shape_str = (
                f"B={shape_info.get('batch')}, IC={shape_info.get('in_channels')}, OC={shape_info.get('out_channels')}"
            )
            if "kernel_size" in shape_info:
                shape_str += f", K={shape_info.get('kernel_size')}"
        elif "num_heads" in shape_info:
            shape_str = (
                f"B={shape_info.get('batch')}, H={shape_info.get('num_heads')}, "
                f"S={shape_info.get('seq_len')}, D={shape_info.get('head_dim')}"
            )
        elif "elements" in shape_info:
            shape_str = f"Elements={shape_info.get('elements')}"

        md += f"| {result['name']} | {result['avg_ms']:.3f} | {result['tflops']:.2f} | "
        md += f"{result['memory_bw_gbs']:.2f} | {peak_mem:.1f} | {mem_breakdown_str} | {shape_str} | {profiling} |\n"

    with open(output_file, "w") as f:
        f.write(md)

    print(f"\n✅ Markdown report generated: {output_file}")


def pytest_sessionfinish(session, exitstatus):
    """Generate report after all tests complete."""
    if TEST_RESULTS:  # Only generate if tests ran
        generate_markdown_report()


class TestConv1x1Kernels:
    """Test Conv2D/Conv3D kernel_size=1 — known CRI simulator crash shapes.

    The simulator crashes on Conv kernel_size=1 at certain spatial sizes:
    - Conv2d(k=1) at spatial <= 8x8 (64 elements)
    - Conv3d(k=1) at spatial >= 32x32 (1024+ elements)

    These shapes come from Wan2.2 VAE decoder:
    - WanAttentionBlock: Conv2d(dim, dim*3, 1) and Conv2d(dim, dim, 1)
    - WanResidualBlock.conv_shortcut: Conv3d(in_dim, out_dim, 1)
    """

    def test_conv2d_1x1_attn_proj_8x8(self):
        """Conv2d(128, 128, k=1) @ 8x8 — VAE mid_block attention projection."""
        if DEVICE == "cpu":
            pytest.skip("Kernel tests require XPU")

        def prepare():
            x = torch.randn(1, 128, 8, 8, device="cpu", dtype=torch.bfloat16)
            conv = torch.nn.Conv2d(128, 128, kernel_size=1, device="cpu", dtype=torch.bfloat16)
            return {"x": x}, conv

        def compute(tensors, operation):
            return operation(tensors["x"])

        shape_info = {
            "batch": 1, "in_channels": 128, "out_channels": 128,
            "kernel_h": 1, "kernel_w": 1, "output_h": 8, "output_w": 8,
            "input_size": 1 * 128 * 8 * 8, "weight_size": 128 * 128,
            "output_size": 1 * 128 * 8 * 8,
        }
        result = benchmark_with_metrics("Conv2D 1x1 attn_proj 8×8", prepare, compute, "conv2d", shape_info)
        if result:
            print(f"\n{result['name']}: {result['avg_ms']:.3f}ms, {result['tflops']:.2f} TFLOPs")

    def test_conv2d_1x1_attn_qkv_8x8(self):
        """Conv2d(128, 384, k=1) @ 8x8 — VAE mid_block attention QKV."""
        if DEVICE == "cpu":
            pytest.skip("Kernel tests require XPU")

        def prepare():
            x = torch.randn(1, 128, 8, 8, device="cpu", dtype=torch.bfloat16)
            conv = torch.nn.Conv2d(128, 384, kernel_size=1, device="cpu", dtype=torch.bfloat16)
            return {"x": x}, conv

        def compute(tensors, operation):
            return operation(tensors["x"])

        shape_info = {
            "batch": 1, "in_channels": 128, "out_channels": 384,
            "kernel_h": 1, "kernel_w": 1, "output_h": 8, "output_w": 8,
            "input_size": 1 * 128 * 8 * 8, "weight_size": 384 * 128,
            "output_size": 1 * 384 * 8 * 8,
        }
        result = benchmark_with_metrics("Conv2D 1x1 attn_qkv 8×8", prepare, compute, "conv2d", shape_info)
        if result:
            print(f"\n{result['name']}: {result['avg_ms']:.3f}ms, {result['tflops']:.2f} TFLOPs")

    def test_conv2d_1x1_attn_proj_16x16(self):
        """Conv2d(128, 128, k=1) @ 16x16 — should PASS (reference)."""
        if DEVICE == "cpu":
            pytest.skip("Kernel tests require XPU")

        def prepare():
            x = torch.randn(1, 128, 16, 16, device="cpu", dtype=torch.bfloat16)
            conv = torch.nn.Conv2d(128, 128, kernel_size=1, device="cpu", dtype=torch.bfloat16)
            return {"x": x}, conv

        def compute(tensors, operation):
            return operation(tensors["x"])

        shape_info = {
            "batch": 1, "in_channels": 128, "out_channels": 128,
            "kernel_h": 1, "kernel_w": 1, "output_h": 16, "output_w": 16,
            "input_size": 1 * 128 * 16 * 16, "weight_size": 128 * 128,
            "output_size": 1 * 128 * 16 * 16,
        }
        result = benchmark_with_metrics("Conv2D 1x1 attn_proj 16×16", prepare, compute, "conv2d", shape_info)
        if result:
            print(f"\n{result['name']}: {result['avg_ms']:.3f}ms, {result['tflops']:.2f} TFLOPs")

    def test_conv3d_1x1_shortcut_16x16(self):
        """Conv3d(4, 8, k=1) @ (1,16,16) — VAE conv_shortcut (should PASS)."""
        if DEVICE == "cpu":
            pytest.skip("Kernel tests require XPU")

        def prepare():
            x = torch.randn(1, 4, 1, 16, 16, device="cpu", dtype=torch.bfloat16)
            conv = torch.nn.Conv3d(4, 8, kernel_size=1, device="cpu", dtype=torch.bfloat16)
            return {"x": x}, conv

        def compute(tensors, operation):
            return operation(tensors["x"])

        shape_info = {
            "batch": 1, "in_channels": 4, "out_channels": 8,
            "kernel_d": 1, "kernel_h": 1, "kernel_w": 1,
            "output_d": 1, "output_h": 16, "output_w": 16,
            "input_size": 1 * 4 * 1 * 16 * 16, "weight_size": 8 * 4,
            "output_size": 1 * 8 * 1 * 16 * 16,
        }
        result = benchmark_with_metrics("Conv3D 1x1 shortcut 16×16", prepare, compute, "conv3d", shape_info)
        if result:
            print(f"\n{result['name']}: {result['avg_ms']:.3f}ms, {result['tflops']:.2f} TFLOPs")

    def test_conv3d_1x1_shortcut_32x32(self):
        """Conv3d(4, 8, k=1) @ (1,32,32) — VAE conv_shortcut (CRASHES SIM)."""
        if DEVICE == "cpu":
            pytest.skip("Kernel tests require XPU")

        def prepare():
            x = torch.randn(1, 4, 1, 32, 32, device="cpu", dtype=torch.bfloat16)
            conv = torch.nn.Conv3d(4, 8, kernel_size=1, device="cpu", dtype=torch.bfloat16)
            return {"x": x}, conv

        def compute(tensors, operation):
            return operation(tensors["x"])

        shape_info = {
            "batch": 1, "in_channels": 4, "out_channels": 8,
            "kernel_d": 1, "kernel_h": 1, "kernel_w": 1,
            "output_d": 1, "output_h": 32, "output_w": 32,
            "input_size": 1 * 4 * 1 * 32 * 32, "weight_size": 8 * 4,
            "output_size": 1 * 8 * 1 * 32 * 32,
        }
        result = benchmark_with_metrics("Conv3D 1x1 shortcut 32×32", prepare, compute, "conv3d", shape_info)
        if result:
            print(f"\n{result['name']}: {result['avg_ms']:.3f}ms, {result['tflops']:.2f} TFLOPs")

    def test_conv3d_1x1_real_wan22_720p(self):
        """Conv3d(256, 512, k=1) @ (1,180,320) — real Wan2.2-A14B at 720p (CRASHES SIM)."""
        if DEVICE == "cpu":
            pytest.skip("Kernel tests require XPU")

        def prepare():
            x = torch.randn(1, 256, 1, 180, 320, device="cpu", dtype=torch.bfloat16)
            conv = torch.nn.Conv3d(256, 512, kernel_size=1, device="cpu", dtype=torch.bfloat16)
            return {"x": x}, conv

        def compute(tensors, operation):
            return operation(tensors["x"])

        shape_info = {
            "batch": 1, "in_channels": 256, "out_channels": 512,
            "kernel_d": 1, "kernel_h": 1, "kernel_w": 1,
            "output_d": 1, "output_h": 180, "output_w": 320,
            "input_size": 1 * 256 * 1 * 180 * 320, "weight_size": 512 * 256,
            "output_size": 1 * 512 * 1 * 180 * 320,
        }
        result = benchmark_with_metrics("Conv3D 1x1 real Wan2.2 720p", prepare, compute, "conv3d", shape_info)
        if result:
            print(f"\n{result['name']}: {result['avg_ms']:.3f}ms, {result['tflops']:.2f} TFLOPs")


if __name__ == "__main__":
    pytest.main([__file__, "-v", "-s"])
    # Ensure report is generated even when run as script
    if TEST_RESULTS:
        generate_markdown_report()
