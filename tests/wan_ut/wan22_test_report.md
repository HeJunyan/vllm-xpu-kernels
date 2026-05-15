# WAN 2.2 Operations Test Report

## Summary
| Metric | Value |
|--------|-------|
| Total Tests | 53 |
| Total TFLOPs | 15527.29 |
| Avg Memory BW | 476.99 GB/s |

## Detailed Results

| Test Name | Latency (ms) | TFLOPs | Memory BW (GB/s) | Shape | Notes |
|-----------|--------------|--------|------------------|-------|-------|
| Conv1D Audio 80K | 123.663 | 0.01 | 0.66 | B=1, IC=1, OC=512, K=10 | None |
| Conv1D Audio Projector | 72.373 | 0.17 | 0.34 | B=4, IC=1280, OC=2560, K=3 | S2V: 4 calls, 92.66ms total |
| Conv1D Audio Encoder Mid | 85.573 | 0.15 | 0.21 | B=1, IC=512, OC=512, K=3 | None |
| Conv2D 256×256 | 97.189 | 0.89 | 1.56 | B=4, IC=192, OC=96 | None |
| Conv2D VAE 32×32 | 37.503 | 0.02 | 0.11 | B=1, IC=384, OC=1152 | None |
| Conv2D VAE 64×64 | 58.146 | 0.19 | 0.19 | B=2, IC=384, OC=192 | None |
| Conv2D VAE 128×128 | 55.235 | 1.57 | 1.39 | B=4, IC=384, OC=192 | None |
| Conv3D [1,384,3,34,34] | 67.327 | 0.41 | 0.20 | B=1, IC=384, OC=384 | T2V: 7,560 calls | S2V: 13,320 calls |
| Conv3D [1,96,6,258,258] | 69.174 | 2.87 | 2.22 | B=1, IC=96, OC=96 | T2V: 4,320 calls | S2V: 6,912 calls |
| Conv3D to RGB | 27.947 | 0.22 | 2.83 | B=1, IC=96, OC=3 | None |
| Conv3D [1,192,6,130,130] | 86.948 | 2.32 | 0.92 | B=1, IC=192, OC=192 | T2V: 4,320 calls | S2V: 6,264 calls |
| Conv3D [1,384,4,66,66] | 70.749 | 1.96 | 0.49 | B=1, IC=384, OC=384 | T2V: 3,600 calls | S2V: 5,544 calls |
| Conv3D VAE Encoder 720p | 183.755 | 2.08 | 26.28 | B=1, IC=3, OC=128 | None |
| Conv3D VAE Decoder to Pixel | 2.030 | 3.06 | 38.97 | B=1, IC=96, OC=3 | None |
| Conv3D VAE Encoder | 335.018 | 4.62 | 58.38 | B=1, IC=3, OC=128 | S2V: 40,752 calls | T2V: similar (81 vs 80 frames) |
| Conv3D Latent Space | 71.868 | 28.72 | 12.49 | B=1, IC=128, OC=256 | None |
| Conv3D Latent Space (S2V) | 53.739 | 9.48 | 4.15 | B=1, IC=128, OC=256 | None |
| Flash Attention Varlen Self | 1045.355 | 111.97 | 2.96 | B=1, S=75600 | T2V: 16 calls, ~550ms/call | S2V: 24 calls, ~366ms/call |
| Flash Attention Varlen Cross | 7.946 | 14731.21 | 389.71 | B=1, S=75600 | T2V: 16 calls | S2V: 24 calls |
| QK RMSNorm | 385.445 | 0.00 | 8.03 | Elements=774144000 | T2V: 35,280 calls |
| Attn Output Projection | 99.460 | 39.85 | 16.09 | B=1, S=75600, I=5120, O=5120 | None |
| Cross-Attn Q Projection | 33.875 | 117.01 | 47.25 | B=1, S=75600, I=5120, O=5120 | None |
| Cross-Attn K/V Projection | 49.758 | 1.08 | 2.42 | B=1, S=512, I=5120, O=10240 | None |
| Cross-Attn Output Projection | 34.962 | 113.37 | 45.78 | B=1, S=75600, I=5120, O=5120 | None |
| FFN Upproject | 96.031 | 111.44 | 31.30 | B=1, S=75600, I=5120, O=13824 | T2V: 16 calls | S2V: 24 calls |
| FFN Downproject | 106.031 | 100.93 | 28.35 | B=1, S=75600, I=13824, O=5120 | T2V: 16 calls | S2V: 24 calls |
| QKV Projection (Linear) | 115.798 | 102.69 | 28.10 | B=1, S=75600, I=5120, O=15360 | T2V: 16 calls | S2V: 24 calls |
| RMSNorm | 74.709 | 0.01 | 20.72 | Elements=387072000 | T2V: 35,280 calls, ~232µs/call | S2V: similar |
| LayerNorm | 10.882 | 0.00 | 0.68 | Elements=1843200 | T2V: 32 calls, ~3.3ms/call | S2V: similar |
| SiLU | 18.566 | 0.04 | 83.39 | Elements=387072000 | S2V: 28,850 calls |
| GELU | 42.353 | 0.05 | 98.70 | Elements=1045094400 | None |
| Element-wise Mul | 6.408 | 0.12 | 241.64 | Elements=387072000 | T2V: 41,828 calls | S2V: 68,078 calls |
| Element-wise Div | 24.430 | 0.03 | 63.38 | Elements=387072000 | T2V: 17,789 calls | S2V: 30,176 calls |
| Element-wise Add | 4.439 | 0.17 | 348.75 | Elements=387072000 | None |
| Reshape to Multi-head | 0.207 | 11.23 | 22465.87 | Elements=1161216000 | None |
| Concatenation (CFG) | 10.195 | 0.00 | 3.80 | Elements=9676800 | T2V: 25,802 calls | S2V: 42,793 calls |
| CFG Concatenation | 1.286 | 0.06 | 116.07 | Elements=37324800 | S2V: 42,793 calls (80 frames) | T2V: similar (81 frames) |
| Audio Feature Concat (S2V) | 0.271 | 0.02 | 31.01 | Elements=2097152 | None |
| RoPE 3D Position Generation | 3.889 | 0.00 | 0.23 | Elements=226800 | None |
| FP32→BF16 | 5.244 | 0.15 | 295.23 | Elements=387072000 | T2V/S2V: frequent |
| BF16→FP32 | 5.604 | 0.14 | 276.27 | Elements=387072000 | T2V: 84,028 calls | S2V: 142,308 calls |
| Contiguous Copy | 55.086 | 0.01 | 28.11 | Elements=387072000 | T2V/S2V: frequent |
| WanResidualBlock | 180.742 | 0.15 | 0.07 | B=1, IC=384, OC=384 | T2V: 588 calls/block |
| VAE Forward Block | 1.102 | 25.07 | 12.06 | B=1, IC=384, OC=384 | T2V: 8,232 forward calls |
| VAE Blend Operations | 0.447 | 0.02 | 41.24 | Elements=4608000 | T2V: 24 blend_h calls |
| VAE blend_h Mul | 0.118 | 0.08 | 156.63 | Elements=4608000 | T2V: ~40ms/call | S2V: similar |
| VAE blend_h Add | 0.143 | 0.06 | 128.94 | Elements=4608000 | T2V/S2V: frequent |
| VAE Conv3D Decoder | 53.364 | 0.63 | 1.63 | B=1, IC=16, OC=128 | T2V: ~6.2ms/forward (21f) | S2V: similar (20f) |
| VAE Tiled Encode Conv | 63.039 | 0.43 | 5.45 | B=1, IC=3, OC=128 | Full 720p video split into tiles |
| UMT5 Matmul | 16.961 | 0.09 | 0.37 | B=1, S=512 | 48 UMT5Block.forward calls | T2V/S2V: similar |
| UMT5 Attention Softmax | 26.161 | 0.00 | 0.96 | Elements=6291456 | T2V/S2V: similar |
| UMT5 Attention Softmax (T2V) | 0.235 | 0.05 | 106.95 | Elements=6291456 | None |
| UMT5 FFN Linear | 17.600 | 0.37 | 1.04 | B=1, S=512, I=1536, O=4096 | ~8ms per UMT5Block.forward | T2V/S2V: similar |
