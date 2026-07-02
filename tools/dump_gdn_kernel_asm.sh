#!/usr/bin/env bash
# Dump GEN ISA (GPU asm), vISA and LLVM/SPIR IR for the GDN attn SYCL kernels
# (e.g. gdn::causal_conv1d_kernel in csrc/xpu/gdn_attn/causal_conv1d.hpp).
#
# The _xpu_C extension is AOT-compiled (icpx -fsycl -fsycl-targets=spir64_gen)
# so device code never JIT-compiles at runtime. This script reproduces the
# device compile of the gdn_attn translation unit, emits SPIR-V, then runs IGC
# (via ocloc) with shader-dump enabled to produce the final Battlemage ISA plus
# every intermediate IR stage.
#
# The device compile is always done as a DEBUG build (-g, with -Werror removed)
# so IGC embeds the originating C++ source file/line plus the source code text
# as "// File:" / "// Line N:" comments interleaved in the .asm GEN ISA.
#
# Usage:
#   tools/dump_gdn_kernel_asm.sh [OUTDIR] [DEVICE] [KERNEL_FILTER]
# Defaults:
#   OUTDIR=build/kdump  DEVICE=bmg  KERNEL_FILTER=causal_conv1d_kernel
#
# Re-run after editing the kernel and rebuilding (ninja -C build/temp).
set -euo pipefail

REPO="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
OUTDIR="${1:-$REPO/build/kdump}"
DEVICE="${2:-bmg}"
FILTER="${3:-causal_conv1d_kernel}"
BUILD_TEMP="$REPO/build/temp"
SRC="$REPO/csrc/xpu/gdn_attn/gdn_attn_interface.cpp"
CC_JSON="$BUILD_TEMP/compile_commands.json"

# oneAPI environment (icpx, ocloc, llvm-spirv).
ONEAPI_ENV="/opt/intel/oneapi/compiler/2025.3/env/vars.sh"
if [ -f "$ONEAPI_ENV" ]; then
  set +eu; source "$ONEAPI_ENV" >/dev/null 2>&1 || true; set -eu
fi
LLVM_SPIRV="$(dirname "$(command -v icpx)")/compiler/llvm-spirv"

[ -f "$CC_JSON" ] || { echo "error: $CC_JSON not found. Configure/build first." >&2; exit 1; }

mkdir -p "$OUTDIR"
echo ">> [1/4] Extracting device compile flags for gdn_attn_interface.cpp"
# Pull the exact build flags, strip the AOT gen target (incompatible with the
# device-only SPIR-V emission), strip -Werror (so the debug -g build doesn't
# fail on the ignored-option warning), and drop the -o/-c/source tokens.
FLAGS="$(python3 - "$CC_JSON" "$SRC" <<'PY'
import json, shlex, sys
cc, src = sys.argv[1], sys.argv[2]
e = next(x for x in json.load(open(cc)) if 'gdn_attn_interface' in x['file'])
toks = shlex.split(e['command']); out=[]; i=0
while i < len(toks):
    t = toks[i]
    if t == '-o': i += 2; continue
    if t == '-c': i += 1; continue
    if t == e['file']: i += 1; continue
    if t == '-fsycl-targets=spir64_gen': i += 1; continue
    if t == '-Werror': i += 1; continue   # debug build: keep ignored-option warnings non-fatal
    out.append(t); i += 1
print(' '.join(out))
PY
)"

echo ">> [2/4] Emitting device SPIR (LLVM bitcode, debug -g) -> $OUTDIR/gdn_attn_device.bc"
# -g adds line tables so IGC annotates the GEN ISA with C++ source file/line+code.
( cd "$BUILD_TEMP" && eval "$FLAGS -g -fsycl-device-only \"$SRC\" -o \"$OUTDIR/gdn_attn_device.bc\"" )

echo ">> [3/4] Translating to SPIR-V (.spv) + SPIR-V text (.spvasm)"
"$LLVM_SPIRV" "$OUTDIR/gdn_attn_device.bc" \
  --spirv-ext=+all,-SPV_KHR_untyped_pointers -o "$OUTDIR/gdn_attn.spv"
"$LLVM_SPIRV" -to-text "$OUTDIR/gdn_attn.spv" -o "$OUTDIR/gdn_attn.spvasm"

echo ">> [4/4] IGC shader dump (final $DEVICE ISA + vISA + IR) via ocloc"
IGCDIR="$OUTDIR/igc_dump"
rm -rf "$IGCDIR"; mkdir -p "$IGCDIR"
( cd "$OUTDIR" && IGC_ShaderDumpEnable=1 IGC_DumpToCustomDir="$IGCDIR" \
    ocloc compile -file gdn_attn.spv -spirv_input -device "$DEVICE" \
    -internal_options "-cl-intel-256-GRF-per-thread" \
    -output_no_suffix -output gen_"$DEVICE" >"$IGCDIR/ocloc.log" 2>&1 )

# Friendly per-kernel symlinks for the requested filter (.asm = GEN ISA).
BYK="$OUTDIR/by_kernel"; rm -rf "$BYK"; mkdir -p "$BYK"
echo
echo "== ${FILTER} variants (GEN ISA .asm) =="
shopt -s nullglob
for f in "$IGCDIR"/*_simd32_entry_*.asm; do
  k="$(grep -m1 '^//.kernel' "$f" | awk '{print $2}')"
  case "$k" in
    *"$FILTER"*)
      base="$IGCDIR/$(basename "${f%.asm}")"
      short="$(echo "$k" | sed -E 's/^_ZTSN3gdn[0-9]+//; s/IN4sycl3_V1//; s/E+$//')"
      ln -sf "$f"              "$BYK/${short}.asm"
      [ -f "$base.visaasm" ] && ln -sf "$base.visaasm" "$BYK/${short}.visaasm"
      printf '  %-58s spill=%sB GRF=%s instr=%s -> %s\n' \
        "$short" \
        "$(grep -m1 -oE '^//.spill size [0-9]+' "$f" | grep -oE '[0-9]+' || echo 0)" \
        "$(grep -m1 -oE 'numGRF=[0-9]+' "$f" | cut -d= -f2 || echo ?)" \
        "$(grep -m1 -oE '^//.instCount [0-9]+' "$f" | grep -oE '[0-9]+' || echo ?)" \
        "by_kernel/${short}.asm"
      ;;
  esac
done

echo
echo "Done. Artifacts in $OUTDIR:"
echo "  gdn_attn.spvasm        - SPIR-V (LLVM's SPIR) text assembly"
echo "  gdn_attn_device.bc     - device LLVM SPIR bitcode"
echo "  igc_dump/*.asm         - final $DEVICE GEN ISA, annotated with C++ source"
echo "                           file/line + code (// File: / // Line N:) thanks to -g"
echo "  igc_dump/*.visaasm     - vISA assembly"
echo "  igc_dump/*.ll          - IGC LLVM IR pass dumps"
echo "  by_kernel/             - readable symlinks for '$FILTER' variants"
