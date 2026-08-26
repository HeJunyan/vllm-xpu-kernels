#!/usr/bin/env bash
set -euo pipefail

scope="${1:-${TEST_SCOPE:-ci}}"
shift || true

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "${SCRIPT_DIR}/.." && pwd)"
TEST_RESULTS_DIR="${TEST_RESULTS_DIR:-/workspace/test-results}"

mkdir -p "${TEST_RESULTS_DIR}"

prepend_ld_library_path() {
    local candidate_dir="$1"

    [[ -d "${candidate_dir}" ]] || return 0

    case ":${LD_LIBRARY_PATH:-}:" in
        *:"${candidate_dir}":*) ;;
        *) export LD_LIBRARY_PATH="${candidate_dir}${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}" ;;
    esac
}

setup_runtime_env() {
    local runtime_lib_dirs=""

    if [[ -f /opt/gfx-deps/env.sh ]]; then
        source /opt/gfx-deps/env.sh
    fi

    if [[ -f /opt/intel/oneapi/setvars.sh ]]; then
        source /opt/intel/oneapi/setvars.sh --force >/dev/null 2>&1 || true
    fi

    if [[ -f /opt/intel/oneapi/ccl/2021.16_py29/build/_install/env/setvars.sh ]]; then
        source /opt/intel/oneapi/ccl/2021.16_py29/build/_install/env/setvars.sh >/dev/null 2>&1 || true
    fi

    if [[ -f /opt/intel/oneapi/ccl/oneCCL_2021_15_9/build/_install/env/setvars.sh ]]; then
        source /opt/intel/oneapi/ccl/oneCCL_2021_15_9/build/_install/env/setvars.sh --force >/dev/null 2>&1 || true
    fi

    if [[ -d /opt/gfx-deps/oneccl/opt/mpi/lib ]]; then
        prepend_ld_library_path "/opt/gfx-deps/oneccl/opt/mpi/lib"
    fi

    runtime_lib_dirs="$(python3 - <<'PY'
import importlib.util
import os
import pathlib
import sys

seen = set()
candidate_dirs = []

def add_dir(path):
    resolved = pathlib.Path(path).resolve()
    if not resolved.is_dir():
        return
    key = str(resolved)
    if key in seen:
        return
    seen.add(key)
    candidate_dirs.append(key)

spec = importlib.util.find_spec("torch")
if spec and spec.origin:
    torch_dir = pathlib.Path(spec.origin).resolve().parent
    add_dir(torch_dir / "lib")
    for so_path in torch_dir.rglob("libc10_xpu.so"):
        add_dir(so_path.parent)

for prefix in filter(None, [os.environ.get("CONDA_PREFIX"), sys.prefix, "/opt/conda/envs/vllm", "/root/anaconda3/envs/pytorch"]):
    add_dir(pathlib.Path(prefix) / "lib")

print("\n".join(candidate_dirs))
PY
)"

    while IFS= read -r candidate_dir; do
        [[ -n "${candidate_dir}" ]] || continue
        prepend_ld_library_path "${candidate_dir}"
    done <<< "${runtime_lib_dirs}"
}

print_runtime_diagnostics() {
    python3 - <<'PY'
import importlib.util
import os
import pathlib
import sys

spec = importlib.util.find_spec("torch")
torch_origin = spec.origin if spec and spec.origin else "<not found>"
torch_dir = pathlib.Path(torch_origin).resolve().parent if spec and spec.origin else None
libc10_candidates = []
if torch_dir and torch_dir.exists():
    libc10_candidates = sorted(str(path) for path in torch_dir.rglob("libc10_xpu.so"))

print("[DEBUG] sys.executable:", sys.executable)
print("[DEBUG] sys.prefix:", sys.prefix)
print("[DEBUG] torch.__init__:", torch_origin)
print("[DEBUG] LD_LIBRARY_PATH:", os.environ.get("LD_LIBRARY_PATH", ""))
print("[DEBUG] libc10_xpu candidates:", libc10_candidates)
PY
}

ensure_pytest_available() {
    if python3 -m pytest --version >/dev/null 2>&1; then
        return 0
    fi

    python3 -m pip install --break-system-packages pytest >/dev/null
}

validate_kernel_imports() {
    if ! python3 - <<'PY'
import importlib

import torch
import triton
import vllm_xpu_kernels

importlib.import_module("triton.backends")
importlib.import_module("vllm_xpu_kernels._C")
importlib.import_module("vllm_xpu_kernels._moe_C")
importlib.import_module("vllm_xpu_kernels._xpu_C")

print("torch version:", getattr(torch, "__version__", "<unknown>"))
print("triton version:", getattr(triton, "__version__", "<unknown>"))
print("torch.xpu.is_available:", torch.xpu.is_available())
print("torch.xpu.device_count:", torch.xpu.device_count())
print("vllm_xpu_kernels import ok")
PY
    then
        print_runtime_diagnostics
        return 1
    fi
}

setup_runtime_env
validate_kernel_imports
ensure_pytest_available

extra_args=()
if [[ -n "${EXTRA_PYTEST_ARGS:-}" ]]; then
    read -r -a extra_args <<< "${EXTRA_PYTEST_ARGS}"
fi
if [[ "$#" -gt 0 ]]; then
    extra_args+=("$@")
fi

cd "${REPO_ROOT}"
if [[ -f tests/test_cache.py ]]; then
    extra_args+=(--ignore=tests/test_cache.py)
fi
XPU_KERNEL_TEST_SCOPE="${scope}" python3 -m pytest -v -s tests \
    --junitxml="${TEST_RESULTS_DIR}/pytest.junit.xml" \
    "${extra_args[@]}"