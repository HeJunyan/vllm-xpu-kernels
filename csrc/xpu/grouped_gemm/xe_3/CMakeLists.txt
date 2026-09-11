cmake_minimum_required(VERSION 3.18)

add_xe3_kernel_library(grouped_gemm_xe_3 INCLUDE_CMAKE_SOURCE_DIR)

# Match the CUTLASS MoE benchmark's vector-alias spill workaround.
target_link_options(grouped_gemm_xe_3 PRIVATE -Xs
                    "-options \"-igc_opts 'VectorAliasBBThreshold=10000'\"")
