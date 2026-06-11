#!/bin/bash
# WAN 2.2 CRI End-to-End Test Script
# Tests T2V model at 720p with TP=1

set -e  # Exit on error

# WORKSPACE must be set by the environment (e.g. /workspace)
if [ -z "${WORKSPACE}" ]; then
    echo "ERROR: WORKSPACE environment variable is not set."
    echo "Please set it to the base workspace path (e.g. export WORKSPACE=/workspace)"
    exit 1
fi

# Environment setup
ulimit -n 1048576

echo "=========================================="
echo "WAN 2.2 CRI End-to-End Test"
echo "Resolution: 720x1280, Frames: 81, TP: 1"
echo "WORKSPACE: ${WORKSPACE}"
echo "=========================================="

# ============================================================================
# Test: Text-to-Video (T2V)
# ============================================================================
echo ""
echo "=========================================="
echo "Test: Text-to-Video (T2V) TP=1"
echo "=========================================="

cd ${WORKSPACE}/vllm-omni/examples/offline_inference/text_to_video/

python ${WORKSPACE}/vllm-omni/examples/offline_inference/text_to_video/text_to_video.py \
  --model Wan-AI/Wan2.2-T2V-A14B-Diffusers \
  --prompt "Two anthropomorphic cats in comfy boxing gear and bright gloves fight intensely on a spotlighted stage." \
  --height 720 --width 1280 --num-frames 81 \
  --num-inference-steps 40 \
  --boundary-ratio 0.875 --flow-shift 5.0 --fps 16 \
  --tensor-parallel-size 1 --enable-cpu-offload \
  --vae-use-slicing --vae-use-tiling \
  --cache-backend cache_dit \
  --enable-diffusion-pipeline-profiler \
  --output t2v_720p_tp1_cpu_offload.mp4 2>&1 | tee wan-t2v_720p_tp1.log

echo "T2V test completed. Output: t2v_720p_tp1_cpu_offload.mp4"

# ============================================================================
# Summary
# ============================================================================
echo ""
echo "=========================================="
echo "CRI test completed successfully!"
echo "=========================================="
echo "Output: ${WORKSPACE}/vllm-omni/examples/offline_inference/text_to_video/t2v_720p_tp1_cpu_offload.mp4"
echo "Log:    ${WORKSPACE}/vllm-omni/examples/offline_inference/text_to_video/wan-t2v_720p_tp1.log"
echo "=========================================="
