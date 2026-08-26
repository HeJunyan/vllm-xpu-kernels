#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "${SCRIPT_DIR}/.." && pwd)"
WORKSPACE_ROOT="${WORKSPACE:-${REPO_ROOT}}"
LOG_DIR="${WORKSPACE_ROOT}/logs/kernel-ci"
DIST_DIR="${REPO_ROOT}/dist"
TEST_RESULTS_DIR="${WORKSPACE_ROOT}/test-results/kernel-ci"
PIPELINE_STAGE="${1:-${PIPELINE_STAGE:-all}}"
DOCKER_IMAGE_NAME="${DOCKER_IMAGE_NAME:-vllm-xpu-kernel-ci:local}"
DOCKERFILE_PATH="${DOCKERFILE_PATH:-Dockerfile.xpu}"
BASE_IMAGE="${BASE_IMAGE:-gar-registry.caas.intel.com/pytorch/pytorch-ipex-spr:PO_216}"
TEST_SCOPE="${TEST_SCOPE:-ci}"
GIT_REMOTE_NAME="${GIT_REMOTE_NAME:-origin}"
GIT_AUTH_USERNAME="${GIT_USERNAME:-${GITHUB_AUTH_USER:-}}"
GIT_AUTH_PASSWORD="${GIT_PASSWORD:-${GITHUB_AUTH_TOKEN:-}}"
KERNEL_BRANCH="${KERNEL_BRANCH:-}"
KERNEL_TARGET_BRANCH="${KERNEL_TARGET_BRANCH:-main}"
MAX_JOBS="${MAX_JOBS:-}"
CCACHE_HOST_DIR="${CCACHE_HOST_DIR:-}"
PREBUILT_KERNEL_WHL="${PREBUILT_KERNEL_WHL:-}"
NO_CACHE="${NO_CACHE:-false}"
HOST_DEP_ROOT="${REPO_ROOT}/.ci-deps-src"
HOST_CUTLASS_SRC_DIR="${HOST_DEP_ROOT}/cutlass-sycl"
HOST_ONEDNN_SRC_DIR="${HOST_DEP_ROOT}/oneDNN"

mkdir -p "${LOG_DIR}" "${DIST_DIR}" "${TEST_RESULTS_DIR}"

log() {
    echo "[INFO] $*"
}

error() {
    echo "[ERROR] $*" >&2
    exit 1
}

to_bool() {
    local value="${1:-}"
    case "${value,,}" in
        1|true|yes|y|on) return 0 ;;
        *) return 1 ;;
    esac
}

resolve_ccache_mount() {
    if [[ -z "${CCACHE_HOST_DIR}" ]]; then
        return 0
    fi

    mkdir -p "${CCACHE_HOST_DIR}"
    printf '%s' "${CCACHE_HOST_DIR}"
}

append_proxy_env_args() {
    local -n docker_args_ref=$1
    local proxy_vars=(http_proxy https_proxy HTTP_PROXY HTTPS_PROXY no_proxy NO_PROXY)
    local var_name
    local var_value

    for var_name in "${proxy_vars[@]}"; do
        var_value="${!var_name:-}"
        if [[ -n "${var_value}" ]]; then
            docker_args_ref+=( -e "${var_name}=${var_value}" )
        fi
    done
}

resolve_target_ref() {
    local remote_ref="refs/remotes/${GIT_REMOTE_NAME}/${KERNEL_TARGET_BRANCH}"

    if ! git show-ref --verify --quiet "${remote_ref}"; then
        log "Fetching ${GIT_REMOTE_NAME}/${KERNEL_TARGET_BRANCH} for merge precheck"
        git fetch "${GIT_REMOTE_NAME}" \
            "+refs/heads/${KERNEL_TARGET_BRANCH}:${remote_ref}" >/dev/null 2>&1 || \
            error "Failed to fetch target branch ${GIT_REMOTE_NAME}/${KERNEL_TARGET_BRANCH}"
    fi

    printf '%s' "${GIT_REMOTE_NAME}/${KERNEL_TARGET_BRANCH}"
}

read_dep_field() {
    local dep_name="$1"
    local field_name="$2"

    python3 - "$REPO_ROOT/deps.json" "$dep_name" "$field_name" "${VLLM_XPU_KERNEL_PLATFORM:-cri}" <<'PY'
import json
import pathlib
import sys

deps_path = pathlib.Path(sys.argv[1])
dep_name = sys.argv[2]
field_name = sys.argv[3]
platform = (sys.argv[4] or "cri").lower()

data = json.loads(deps_path.read_text())
dep = data[dep_name]

if field_name == "repo":
    print(dep["repo"])
elif field_name == "revision":
    revisions = dep["revisions"]
    print(revisions.get(platform, revisions.get("default", "")))
else:
    raise SystemExit(f"unsupported field: {field_name}")
PY
}

prepare_local_git_dependency() {
    local dep_name="$1"
    local dest_dir="$2"
    local repo_url="$3"
    local revision="$4"
    local dep_log="${LOG_DIR}/prepare-${dep_name}.log"

    mkdir -p "${HOST_DEP_ROOT}"

    (
        set -euo pipefail

        if [[ -d "${dest_dir}/.git" ]]; then
            git -C "${dest_dir}" remote set-url origin "${repo_url}"
            git -C "${dest_dir}" fetch --tags --force --prune origin >/dev/null
        else
            rm -rf "${dest_dir}"
            git clone "${repo_url}" "${dest_dir}" >/dev/null
        fi

        git -C "${dest_dir}" checkout --force "${revision}" >/dev/null
        git -C "${dest_dir}" submodule update --init --recursive >/dev/null 2>&1 || true

        echo "repo=${repo_url}"
        echo "revision=${revision}"
        echo "head=$(git -C "${dest_dir}" rev-parse HEAD)"
    ) >"${dep_log}" 2>&1 || {
        tail -n 200 "${dep_log}" >&2 || true
        error "Failed to prepare ${dep_name} sources on host"
    }
}

prepare_host_dependency_sources() {
    local cutlass_repo
    local cutlass_revision
    local onednn_repo
    local onednn_revision

    cutlass_repo="$(read_dep_field cutlass repo)"
    cutlass_revision="$(read_dep_field cutlass revision)"
    onednn_repo="$(read_dep_field onednn repo)"
    onednn_revision="$(read_dep_field onednn revision)"

    log "Preparing host dependency sources under ${HOST_DEP_ROOT}"
    prepare_local_git_dependency cutlass "${HOST_CUTLASS_SRC_DIR}" "${cutlass_repo}" "${cutlass_revision}"
    prepare_local_git_dependency onednn "${HOST_ONEDNN_SRC_DIR}" "${onednn_repo}" "${onednn_revision}"
}

run_merge_precheck() {
    local precheck_log="${LOG_DIR}/merge_precheck.log"

    log "Running merge precheck against ${KERNEL_TARGET_BRANCH}"
    (
        set -euo pipefail

        cd "${REPO_ROOT}"
        git config --global --add safe.directory "${REPO_ROOT}"

        local head_commit
        local source_branch
        local target_ref
        local target_commit
        local worktree_dir

        head_commit="$(git rev-parse HEAD)"
        source_branch="${KERNEL_BRANCH:-$(git rev-parse --abbrev-ref HEAD)}"
        target_ref="$(resolve_target_ref)"
        target_commit="$(git rev-parse "${target_ref}")"
        worktree_dir="$(mktemp -d "${WORKSPACE_ROOT}/merge-precheck.XXXXXX")"

        cleanup_worktree() {
            git worktree remove --force "${worktree_dir}" >/dev/null 2>&1 || rm -rf "${worktree_dir}" || true
        }

        trap cleanup_worktree EXIT

        echo "source_branch=${source_branch}"
        echo "target_branch=${KERNEL_TARGET_BRANCH}"
        echo "head_commit=${head_commit}"
        echo "target_ref=${target_ref}"
        echo "target_commit=${target_commit}"
        echo "head_subject=$(git log -1 --pretty=%s)"

        git worktree add --force --detach "${worktree_dir}" "${target_ref}" >/dev/null
        git config --global --add safe.directory "${worktree_dir}"

        cd "${worktree_dir}"
        git -c merge.autoEdit=no merge --no-commit --no-ff "${head_commit}" >/dev/null

        echo "merge_precheck=passed"
        git status --short
    ) >"${precheck_log}" 2>&1 || {
        tail -n 200 "${precheck_log}" >&2 || true
        error "Merge precheck failed"
    }
}

ensure_image() {
    local force_build="${1:-0}"
    local build_log="${LOG_DIR}/docker-build.log"
    local no_cache_args=()

    if [[ -n "${BASE_IMAGE}" ]]; then
        if docker image inspect "${BASE_IMAGE}" >/dev/null 2>&1; then
            log "Reusing prebuilt base image ${BASE_IMAGE}"
            DOCKER_IMAGE_NAME="${BASE_IMAGE}"
            return 0
        fi

        log "Pulling prebuilt base image ${BASE_IMAGE}"
        docker pull "${BASE_IMAGE}" >"${build_log}" 2>&1 || {
            tail -n 200 "${build_log}" >&2 || true
            error "Failed to pull prebuilt base image ${BASE_IMAGE}"
        }
        DOCKER_IMAGE_NAME="${BASE_IMAGE}"
        return 0
    fi

    if [[ "${force_build}" != "1" ]] && docker image inspect "${DOCKER_IMAGE_NAME}" >/dev/null 2>&1; then
        log "Reusing docker image ${DOCKER_IMAGE_NAME}"
        return 0
    fi

    if to_bool "${NO_CACHE}"; then
        no_cache_args+=(--no-cache)
    fi

    log "Building docker image ${DOCKER_IMAGE_NAME} from ${DOCKERFILE_PATH}"
    docker build \
        "${no_cache_args[@]}" \
        -f "${REPO_ROOT}/${DOCKERFILE_PATH}" \
        -t "${DOCKER_IMAGE_NAME}" \
        "${REPO_ROOT}" >"${build_log}" 2>&1 || {
        tail -n 200 "${build_log}" >&2 || true
        error "Docker image build failed"
    }
}

prepare_prebuilt_kernel_wheel() {
    local source_path="${PREBUILT_KERNEL_WHL:-}"
    local resolved_name=""
    local destination_path=""

    [[ -n "${source_path}" ]] || error "PREBUILT_KERNEL_WHL is empty"

    mkdir -p "${DIST_DIR}"
    find "${DIST_DIR}" -mindepth 1 -maxdepth 1 -exec rm -rf {} +

    if [[ "${source_path}" =~ ^https?:// ]]; then
        resolved_name="$(basename "${source_path%%\?*}")"
        [[ -n "${resolved_name}" ]] || resolved_name="prebuilt-kernel.whl"
        [[ "${resolved_name}" == *.whl ]] || resolved_name="${resolved_name}.whl"
        destination_path="${DIST_DIR}/${resolved_name}"
        log "Downloading prebuilt kernel wheel from ${source_path}"
        curl -fL --retry 3 --retry-delay 2 "${source_path}" -o "${destination_path}" || \
            error "Failed to download prebuilt kernel wheel from ${source_path}"
    else
        [[ -f "${source_path}" ]] || error "PREBUILT_KERNEL_WHL path does not exist: ${source_path}"
        resolved_name="$(basename "${source_path}")"
        destination_path="${DIST_DIR}/${resolved_name}"
        log "Copying prebuilt kernel wheel from ${source_path}"
        cp -f "${source_path}" "${destination_path}" || \
            error "Failed to copy prebuilt kernel wheel from ${source_path}"
    fi

    [[ -s "${destination_path}" ]] || error "Prepared prebuilt kernel wheel is missing or empty: ${destination_path}"
    log "Prepared prebuilt kernel wheel at ${destination_path}"
}

build_wheel() {
    local build_log="${LOG_DIR}/build-wheel.log"
    local container_name="kernel-ci-build-${BUILD_TAG:-local}-$$"
    local ccache_mount=""
    local docker_args=(
        --name "${container_name}"
        --network host
        --ipc=host
        -v "${REPO_ROOT}:/workspace/src"
        -v "${DIST_DIR}:/workspace/dist"
    )

    ccache_mount="$(resolve_ccache_mount || true)"
    if [[ -n "${ccache_mount}" ]]; then
        docker_args+=( -v "${ccache_mount}:/workspace/ccache" )
    fi
    append_proxy_env_args docker_args
    docker_args+=(
        -e "INSTALL_KERNEL_EXTRA_PYTHON_DEPS=${INSTALL_KERNEL_EXTRA_PYTHON_DEPS:-0}"
        -e "VLLM_XPU_KERNEL_PLATFORM=${VLLM_XPU_KERNEL_PLATFORM:-cri}"
        -e "BUILD_ON_SIMULATOR_CRI=${BUILD_ON_SIMULATOR_CRI:-}"
        -e "VLLM_CHUNK_PREFILL_CONFIG=${VLLM_CHUNK_PREFILL_CONFIG:-}"
        -e "VLLM_PAGED_DECODE_CONFIG=${VLLM_PAGED_DECODE_CONFIG:-}"
        -e "VLLM_XPU_KERNEL_MAX_JOBS_CAP=${VLLM_XPU_KERNEL_MAX_JOBS_CAP:-64}"
        -e "VLLM_XPU_KERNEL_RETRY_ON_COMPILER_CRASH=${VLLM_XPU_KERNEL_RETRY_ON_COMPILER_CRASH:-1}"
        -e "VLLM_CUTLASS_SRC_DIR=/workspace/src/.ci-deps-src/cutlass-sycl"
        -e "VLLM_ONEDNN_SRC_DIR=/workspace/src/.ci-deps-src/oneDNN"
        -e "EXTRA_ENV=${EXTRA_ENV:-}"
        -e "GIT_USERNAME=${GIT_AUTH_USERNAME}"
        -e "GIT_PASSWORD=${GIT_AUTH_PASSWORD}"
    )

    trap 'docker rm -f "${container_name}" >/dev/null 2>&1 || true' RETURN

    log "Building kernel wheel"
    local _gu="${GIT_AUTH_USERNAME}"
    local _gp="${GIT_AUTH_PASSWORD}"
    log "GitHub credential status on host: GIT_USERNAME length=${#_gu} GIT_PASSWORD length=${#_gp}"
    if [[ ! -d "${HOST_CUTLASS_SRC_DIR}" || ! -d "${HOST_ONEDNN_SRC_DIR}" ]]; then
        error "Host dependency sources are missing. Expected ${HOST_CUTLASS_SRC_DIR} and ${HOST_ONEDNN_SRC_DIR} to be prepared before container build."
    fi
    if [[ -z "${_gu}" || -z "${_gp}" ]]; then
        log "Proceeding without container GitHub credentials because dependency sources were prepared on the host"
    fi
    set +e
    docker run "${docker_args[@]}" "${DOCKER_IMAGE_NAME}" /bin/bash -c '
set -euo pipefail
cd /workspace/src
git config --global --add safe.directory /workspace/src

GIT_USERNAME_SAFE="${GIT_USERNAME:-}"
GIT_PASSWORD_SAFE="${GIT_PASSWORD:-}"
echo "[INFO] container GIT_USERNAME length=${#GIT_USERNAME_SAFE} GIT_PASSWORD length=${#GIT_PASSWORD_SAFE}" 
git config --global --unset-all url."https://${GIT_USERNAME:-}:${GIT_PASSWORD:-}@github.com/".insteadOf >/dev/null 2>&1 || true
git config --global --unset-all url."https://github.com/".insteadOf >/dev/null 2>&1 || true
if [[ -n "${GIT_USERNAME:-}" ]] && [[ -n "${GIT_PASSWORD:-}" ]]; then
    git config --global --add url."https://${GIT_USERNAME}:${GIT_PASSWORD}@github.com/".insteadOf https://github.com/
    echo "[INFO] Enabled github.com insteadOf rewrite with basic-auth token"
else
    echo "[WARN] GIT_USERNAME/GIT_PASSWORD not set inside container; private repo clone will fail"
fi
git config --global --add url."https://github.com/".insteadOf git@github.com:
git config --global --add url."https://github.com/".insteadOf ssh://git@github.com/

ensure_apt_packages() {
    local missing=0
    local package_name

    for package_name in "$@"; do
        case "${package_name}" in
            ninja-build)
                command -v ninja >/dev/null 2>&1 || missing=1
                ;;
            *)
                dpkg -s "${package_name}" >/dev/null 2>&1 || missing=1
                ;;
        esac
    done

    if [[ "${missing}" == "1" ]]; then
        export DEBIAN_FRONTEND=noninteractive
        apt-get update >/dev/null
        apt-get install -y --no-install-recommends "$@" >/dev/null
    fi
}

ensure_python_modules_via_apt() {
    local -a apt_packages_to_install=()
    local module_name=""
    local apt_package_name=""

    while [[ "$#" -gt 1 ]]; do
        module_name="$1"
        apt_package_name="$2"
        shift 2

        if ! python3 -c "import ${module_name}" >/dev/null 2>&1; then
            apt_packages_to_install+=("${apt_package_name}")
        fi
    done

    if [[ ${#apt_packages_to_install[@]} -gt 0 ]]; then
        export DEBIAN_FRONTEND=noninteractive
        apt-get update >/dev/null
        apt-get install -y --no-install-recommends "${apt_packages_to_install[@]}" >/dev/null
    fi
}

ensure_core_xpu_python_packages() {
    local -a torch_wheels=()
    local -a triton_wheels=()

    if python3 - <<"PY" >/dev/null 2>&1
import torch
import triton
PY
    then
        return 0
    fi

    ensure_python_modules_via_apt \
        typing_extensions python3-typing-extensions \
        filelock python3-filelock \
        jinja2 python3-jinja2 \
        networkx python3-networkx \
        sympy python3-sympy \
        fsspec python3-fsspec \
        elftools python3-pyelftools \
        numpy python3-numpy

    if [[ -d /opt/gfx-deps/whl ]]; then
        mapfile -t torch_wheels < <(find /opt/gfx-deps/whl -maxdepth 1 -type f -name "torch-*.whl" | sort)
        mapfile -t triton_wheels < <(find /opt/gfx-deps/whl -maxdepth 1 -type f \( -name "pytorch_triton_xpu*.whl" -o -name "triton-*.whl" \) | sort)

        if [[ ${#torch_wheels[@]} -gt 0 ]]; then
            python3 -m pip install --no-deps --ignore-installed "${torch_wheels[@]}" >/dev/null
        fi
        if [[ ${#triton_wheels[@]} -gt 0 ]]; then
            python3 -m pip install --no-deps --ignore-installed "${triton_wheels[@]}" >/dev/null
        fi
    fi

    python3 - <<"PY" >/dev/null
import torch
import triton
PY
}

if [[ -f /opt/intel/oneapi/setvars.sh ]]; then
    source /opt/intel/oneapi/setvars.sh --force >/dev/null 2>&1 || true
fi

if [[ -f /opt/gfx-deps/env.sh ]]; then
    source /opt/gfx-deps/env.sh
fi

export PIP_BREAK_SYSTEM_PACKAGES=1

ensure_apt_packages make ccache cmake ninja-build python3-pip python3-setuptools python3-wheel
ensure_python_modules_via_apt \
    packaging python3-packaging \
    setuptools_scm python3-setuptools-scm \
    psutil python3-psutil \
    regex python3-regex \
    jinja2 python3-jinja2
ensure_core_xpu_python_packages

cp requirements.txt requirements.txt.bak
trap "if [[ -f requirements.txt.bak ]]; then mv -f requirements.txt.bak requirements.txt; fi; if [[ -f pyproject.toml.bak ]]; then mv -f pyproject.toml.bak pyproject.toml; fi" EXIT
sed -i "/extra-index-url/d;/torch/d;/torchaudio/d;/torchvision/d;/triton-xpu/d;/pytorch_triton_xpu/d;/vllm_xpu_kernels/d" requirements.txt

apply_pyproject_compat_fixes() {
    [[ -f pyproject.toml ]] || return 0
    if grep -Eq "^license = \"[^\"]+\"$" pyproject.toml || grep -Eq "^license-files = " pyproject.toml; then
        cp pyproject.toml pyproject.toml.bak
    fi
    if grep -Eq "^license = \"[^\"]+\"$" pyproject.toml; then
        sed -Ei "s/^license = \"([^\"]+)\"$/license = { text = \"\\1\" }/" pyproject.toml
    fi
    if grep -Eq "^license-files = " pyproject.toml; then
        sed -Ei "/^license-files = /d" pyproject.toml
    fi
}
apply_pyproject_compat_fixes

if [[ "${INSTALL_KERNEL_EXTRA_PYTHON_DEPS:-0}" == "1" ]]; then
    python3 -m pip install -r requirements.txt >/dev/null
    python3 -m pip install grpcio-tools protobuf nanobind >/dev/null
fi

export CMAKE_PREFIX_PATH="$(python3 -c "import site; print(site.getsitepackages()[0])"):${CMAKE_PREFIX_PATH:-}"

if [[ -n "${EXTRA_ENV:-}" ]]; then
    for addition_env in ${EXTRA_ENV}; do
        echo "[INFO] Exporting EXTRA_ENV entry: ${addition_env}"
        export "${addition_env}"
    done
fi

unset BUILD_ON_NVL
platform_hint="${VLLM_XPU_KERNEL_PLATFORM:-cri}"
case "${platform_hint,,}" in
    nvl) export BUILD_ON_NVL=1; echo "[INFO] Enabled BUILD_ON_NVL=1" ;;
    cri)
        if [[ -z "${BUILD_ON_SIMULATOR_CRI:-}" ]]; then
            export BUILD_ON_SIMULATOR_CRI=1
        fi
        echo "[INFO] Enabled BUILD_ON_SIMULATOR_CRI=${BUILD_ON_SIMULATOR_CRI}" ;;
    *) echo "[INFO] No platform-specific kernel build flag enabled for ${platform_hint}" ;;
esac

export VLLM_TARGET_DEVICE="${VLLM_TARGET_DEVICE:-xpu}"

if command -v ccache >/dev/null 2>&1; then
    export VLLM_USE_CCACHE=1
    if [[ -d /workspace/ccache ]]; then
        export CCACHE_DIR=/workspace/ccache
    else
        export CCACHE_DIR="${CCACHE_DIR:-/tmp/.ccache/vllm_xpu_kernel}"
    fi
    export CCACHE_BASEDIR=/workspace/src
    mkdir -p "${CCACHE_DIR}"
    ccache --max-size 20G >/dev/null 2>&1 || true
    ccache --zero-stats >/dev/null 2>&1 || true
    echo "[INFO] Using CCACHE_DIR=${CCACHE_DIR}"
fi

if [[ -z "${MAX_JOBS:-}" ]]; then
    detected_cpus="$(nproc)"
    default_jobs=$(( detected_cpus * 75 / 100 ))
    [[ "${default_jobs}" -lt 1 ]] && default_jobs=1
    job_cap="${VLLM_XPU_KERNEL_MAX_JOBS_CAP:-64}"
    [[ "${job_cap}" -lt 1 ]] && job_cap=1
    if [[ "${default_jobs}" -gt "${job_cap}" ]]; then
        echo "[INFO] Capping default MAX_JOBS from ${default_jobs} to ${job_cap}"
        default_jobs="${job_cap}"
    fi
    export MAX_JOBS="${default_jobs}"
fi
echo "[INFO] Using MAX_JOBS=${MAX_JOBS}"

python3 setup.py clean >/dev/null 2>&1 || true
rm -f CMakeCache.txt build.ninja cmake_install.cmake
rm -rf CMakeFiles build vllm_xpu_kernels.egg-info .deps
mkdir -p /workspace/dist
find /workspace/dist -mindepth 1 -maxdepth 1 -exec rm -rf {} +

show_first_build_failure() {
    local log_path="$1"
    local build_status="${2:-}"
    local pattern=" error:|fatal error:|FAILED:|Assertion \`|PLEASE submit a bug report|subcommand failed|undefined reference|Segmentation fault|internal compiler error|ninja: build stopped|Killed|killed|out of memory|oom"
    [[ -f "${log_path}" ]] || { echo "[ERROR] Build failed and no detailed log at ${log_path}" >&2; return; }
    local first_match
    first_match="$(grep -n -i -m 1 -E "${pattern}" "${log_path}" || true)"
    echo "[ERROR] Kernel wheel build failed. Full log: ${log_path}" >&2
    [[ -n "${build_status}" ]] && echo "[ERROR] Exit status: ${build_status}" >&2
    if [[ -z "${first_match}" ]]; then
        tail -n 200 "${log_path}" >&2 || true
        return
    fi
    local line_no="${first_match%%:*}"
    local start_line=$(( line_no > 40 ? line_no - 40 : 1 ))
    local end_line=$(( line_no + 80 ))
    echo "[ERROR] First failure marker: ${first_match}" >&2
    sed -n "${start_line},${end_line}p" "${log_path}" >&2 || true
}

compiler_crash_detected() {
    grep -q -i -E "clang frontend command failed|core dumped|Fatal error in .*clang\\+\\+" "$1"
}

run_build_command() {
    local jobs="$1" log_path="$2" verbose_flag="$3" ccache_disable_flag="$4"
    local -a build_env=(VERBOSE="${verbose_flag}" MAX_JOBS="${jobs}")
    [[ -n "${ccache_disable_flag}" ]] && build_env+=(CCACHE_DISABLE="${ccache_disable_flag}")
    rm -f "${log_path}"
    set +e
    env "${build_env[@]}" python3 setup.py bdist_wheel --dist-dir=/workspace/dist --py-limited-api=cp38 2>&1 | tee "${log_path}"
    local status=${PIPESTATUS[0]}
    set -e
    return "${status}"
}

build_log_path=/workspace/logs/kernel-wheel-build.log
retry_log_path=/workspace/logs/kernel-wheel-build.retry.log
mkdir -p /workspace/logs
build_status=0
run_build_command "${MAX_JOBS}" "${build_log_path}" 0 "" || build_status=$?
if [[ "${build_status}" -ne 0 ]]; then
    show_first_build_failure "${build_log_path}" "${build_status}"
    if [[ "${VLLM_XPU_KERNEL_RETRY_ON_COMPILER_CRASH:-1}" != "0" ]] && compiler_crash_detected "${build_log_path}"; then
        echo "[INFO] Compiler crash detected; retrying with MAX_JOBS=1 VERBOSE=1 CCACHE_DISABLE=true" >&2
        build_status=0
        run_build_command 1 "${retry_log_path}" 1 true || build_status=$?
        if [[ "${build_status}" -ne 0 ]]; then
            show_first_build_failure "${retry_log_path}" "${build_status}"
        fi
    fi
    exit "${build_status}"
fi

if command -v ccache >/dev/null 2>&1 && [[ -n "${CCACHE_DIR:-}" ]]; then
    ccache --show-stats || true
fi
' 2>&1 | tee "${build_log}"
    local build_container_status=${PIPESTATUS[0]}
    set -e
    if [[ "${build_container_status}" -ne 0 ]]; then
        tail -n 200 "${build_log}" >&2 || true
        error "Kernel wheel build failed"
    fi

    docker rm -f "${container_name}" >/dev/null 2>&1 || true
    trap - RETURN
}

run_tests() {
    local test_log="${LOG_DIR}/run-tests.log"
    local container_name="kernel-ci-test-${BUILD_TAG:-local}-$$"
    local docker_args=(
        --name "${container_name}"
        --privileged
        --network host
        --ipc=host
        -v "${REPO_ROOT}:/workspace/src"
        -v "${DIST_DIR}:/workspace/dist"
        -v "${TEST_RESULTS_DIR}:/workspace/test-results"
    )
    append_proxy_env_args docker_args
    docker_args+=(
        -e "TEST_SCOPE=${TEST_SCOPE:-ci}"
        -e "GIT_USERNAME=${GIT_AUTH_USERNAME}"
        -e "GIT_PASSWORD=${GIT_AUTH_PASSWORD}"
    )

    trap 'docker rm -f "${container_name}" >/dev/null 2>&1 || true' RETURN

    log "Running kernel tests with scope ${TEST_SCOPE}"
    set +e
    docker run "${docker_args[@]}" "${DOCKER_IMAGE_NAME}" /bin/bash -c '
set -euo pipefail
cd /workspace/src
git config --global --add safe.directory /workspace/src

ensure_pytest() {
    if ! python3 - <<"PY" >/dev/null 2>&1
import pytest
PY
    then
        python3 -m pip install pytest pytest-asyncio pytest-json-report >/dev/null
    fi
}

ensure_python_modules_via_apt() {
    local -a apt_packages_to_install=()
    local module_name=""
    local apt_package_name=""

    while [[ "$#" -gt 1 ]]; do
        module_name="$1"
        apt_package_name="$2"
        shift 2

        if ! python3 -c "import ${module_name}" >/dev/null 2>&1; then
            apt_packages_to_install+=("${apt_package_name}")
        fi
    done

    if [[ ${#apt_packages_to_install[@]} -gt 0 ]]; then
        export DEBIAN_FRONTEND=noninteractive
        apt-get update >/dev/null
        apt-get install -y --no-install-recommends "${apt_packages_to_install[@]}" >/dev/null
    fi
}

ensure_core_xpu_python_packages() {
    ensure_python_modules_via_apt \
        typing_extensions python3-typing-extensions \
        filelock python3-filelock \
        jinja2 python3-jinja2 \
        networkx python3-networkx \
        sympy python3-sympy \
        fsspec python3-fsspec \
        elftools python3-pyelftools \
        numpy python3-numpy

    if ! python3 - <<"PY" >/dev/null 2>&1
import setuptools
from packaging.version import Version
raise SystemExit(0 if Version(setuptools.__version__) >= Version("77.0.3") else 1)
PY
    then
        python3 -m pip install --ignore-installed 'setuptools>=77.0.3,<80.0.0' >/dev/null
    fi
}

if [[ -f /opt/intel/oneapi/setvars.sh ]]; then
    source /opt/intel/oneapi/setvars.sh --force >/dev/null 2>&1 || true
fi

if [[ -f /opt/gfx-deps/env.sh ]]; then
    source /opt/gfx-deps/env.sh
fi

export PIP_BREAK_SYSTEM_PACKAGES=1

ensure_core_xpu_python_packages

if [[ -d /opt/gfx-deps/whl ]]; then
    mapfile -t torch_wheels < <(find /opt/gfx-deps/whl -maxdepth 1 -type f -name "torch-*.whl" | sort)
    mapfile -t triton_wheels < <(find /opt/gfx-deps/whl -maxdepth 1 -type f \( -name "pytorch_triton_xpu*.whl" -o -name "triton-*.whl" \) | sort)

    if [[ ${#torch_wheels[@]} -gt 0 ]]; then
        python3 -m pip install --no-deps --ignore-installed "${torch_wheels[@]}" >/dev/null
    fi
    if [[ ${#triton_wheels[@]} -gt 0 ]]; then
        python3 -m pip install --no-deps --ignore-installed "${triton_wheels[@]}" >/dev/null
    fi
fi

if compgen -G "/workspace/dist/*.whl" >/dev/null; then
    python3 -m pip install --no-deps --force-reinstall /workspace/dist/*.whl >/dev/null
else
    python3 -m pip install --no-build-isolation --no-deps --force-reinstall -e . >/dev/null
fi

ensure_pytest

bash /workspace/src/ci/run_kernel_ut.sh "${TEST_SCOPE:-ci}"
' 2>&1 | tee "${test_log}"
    local test_container_status=${PIPESTATUS[0]}
    set -e
    if [[ "${test_container_status}" -ne 0 ]]; then
        tail -n 200 "${test_log}" >&2 || true
        error "Kernel tests failed"
    fi

    docker rm -f "${container_name}" >/dev/null 2>&1 || true
    trap - RETURN
}

case "${PIPELINE_STAGE}" in
    precheck)
        run_merge_precheck
        ;;
    build)
        run_merge_precheck
        if [[ -n "${PREBUILT_KERNEL_WHL:-}" ]]; then
            prepare_prebuilt_kernel_wheel
        else
            ensure_image 1
            prepare_host_dependency_sources
            build_wheel
        fi
        ;;
    test)
        ensure_image 0
        run_tests
        ;;
    all)
        run_merge_precheck
        if [[ -n "${PREBUILT_KERNEL_WHL:-}" ]]; then
            prepare_prebuilt_kernel_wheel
        else
            ensure_image 1
            prepare_host_dependency_sources
            build_wheel
        fi
        run_tests
        ;;
    *)
        error "Unknown pipeline stage: ${PIPELINE_STAGE}"
        ;;
esac