cmake_minimum_required(VERSION 3.18)

add_xe2_kernel_library(gdn_attn_kernels_xe_2 INCLUDE_CMAKE_SOURCE_DIR)

# The cutlass xe35 GDN reference (and our fused kernel that shares its grf gate)
# resolves grf_size from SYCL_INTEL_TARGET. cutlass.h #undefs any plain
# -DSYCL_INTEL_TARGET value and re-derives 40/35/20 purely from the
# __SYCL_TARGET_INTEL_GPU_{PISA,CRI}__ device-target macros. vllm compiles the
# gdn lib with -fsycl-targets=spir64_gen (generic, device chosen only at link),
# so __SYCL_TARGET_INTEL_GPU_CRI__ is never defined and cutlass.h falls back to
# SYCL_INTEL_TARGET=20 -> grf_size<256> instead of the 512 the kernel is tuned
# for (W/U resident), spilling and running ~30% slower. Define the CRI
# device-target macro (as cutlass's own FindDPCPP.cmake does for
# -DDPCPP_SYCL_TARGET=cri) and lift the AOT link cap 256 -> 512. gdn's own C++
# only branches on VLLM_XPU_ENABLE_XE2 (kept), not SYCL_INTEL_TARGET.
get_target_property(_gdn_defs gdn_attn_kernels_xe_2 COMPILE_DEFINITIONS)
list(REMOVE_ITEM _gdn_defs "VLLM_GRF_SIZE=256")
list(APPEND _gdn_defs "__SYCL_TARGET_INTEL_GPU_CRI__" "VLLM_GRF_SIZE=512")
# Dual GDN path: default to the cutlass xe35 2-kernel reference. Set
# -DGDN_USE_CUTLASS=OFF at configure time to fall back to our in-tree kernels.
option(GDN_USE_CUTLASS "Dispatch the GDN op to the cutlass xe35 reference kernel"
       ON)
if(GDN_USE_CUTLASS)
  list(APPEND _gdn_defs "VLLM_GDN_USE_CUTLASS")
endif()
set_target_properties(gdn_attn_kernels_xe_2
                      PROPERTIES COMPILE_DEFINITIONS "${_gdn_defs}")

get_target_property(_gdn_link gdn_attn_kernels_xe_2 LINK_OPTIONS)
string(REPLACE "cl-intel-256-GRF-per-thread" "cl-intel-512-GRF-per-thread"
       _gdn_link "${_gdn_link}")
set_target_properties(gdn_attn_kernels_xe_2
                      PROPERTIES LINK_OPTIONS "${_gdn_link}")
