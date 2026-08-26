def stringParamOrEnvListOrDefault = { String paramName, List<String> envNames, String defaultValue ->
    def rawParamValue = params.containsKey(paramName) ? params.get(paramName) : null
    def paramValue = rawParamValue != null ? rawParamValue.toString().trim() : ''
    if (paramValue) {
        return paramValue
    }

    for (String envName : envNames) {
        def envRawValue = env.getProperty(envName)
        def envValue = envRawValue?.toString()?.trim()
        if (envValue) {
            return envValue
        }
    }

    return defaultValue
}

def stringParamOrEnvOrDefault = { String paramName, String envName, String defaultValue ->
    stringParamOrEnvListOrDefault(paramName, [envName], defaultValue)
}

def booleanParamOrDefault = { String name, boolean defaultValue ->
    def rawValue = params.containsKey(name) ? params.get(name) : null
    rawValue != null ? rawValue : defaultValue
}

def BUILD_NODE_LABEL_VALUE = params.BUILD_NODE_LABEL ?: 'xpu'
def TEST_NODE_LABEL_VALUE = params.TEST_NODE_LABEL ?: BUILD_NODE_LABEL_VALUE
def NODE_PROXY_VALUE = params.NODE_PROXY ?: 'http://proxy-dmz.intel.com:911'
def BUILD_TIMEOUT_HOURS_VALUE = (params.BUILD_TIMEOUT_HOURS ?: '6').toString()
def DOCKER_IMAGE_NAME_VALUE = params.DOCKER_IMAGE_NAME ?: 'vllm-xpu-kernel-ci:local'
def DOCKERFILE_PATH_VALUE = params.DOCKERFILE_PATH ?: 'Dockerfile.xpu'
def BASE_IMAGE_VALUE = params.BASE_IMAGE ?: 'gar-registry.caas.intel.com/pytorch/pytorch-ipex-spr:PO_216'
def TEST_SCOPE_VALUE = stringParamOrEnvListOrDefault('TEST_SCOPE', ['XPU_KERNEL_TEST_SCOPE'], 'ci')
def EXTRA_PYTEST_ARGS_VALUE = params.EXTRA_PYTEST_ARGS ?: ''
def MAX_JOBS_VALUE = params.MAX_JOBS ?: ''
def CCACHE_HOST_DIR_VALUE = params.CCACHE_HOST_DIR ?: ''
def PREBUILT_KERNEL_WHL_VALUE = params.PREBUILT_KERNEL_WHL ?: ''
def EXTRA_ENV_VALUE = params.EXTRA_ENV ?: ''
def VLLM_XPU_KERNEL_PLATFORM_VALUE = params.VLLM_XPU_KERNEL_PLATFORM ?: 'cri'
def BUILD_ON_SIMULATOR_CRI_VALUE = params.BUILD_ON_SIMULATOR_CRI ?: ''
def VLLM_CHUNK_PREFILL_CONFIG_VALUE = stringParamOrEnvOrDefault('VLLM_CHUNK_PREFILL_CONFIG', 'VLLM_CHUNK_PREFILL_CONFIG', 'chunk_prefill_default.conf')
def VLLM_PAGED_DECODE_CONFIG_VALUE = stringParamOrEnvOrDefault('VLLM_PAGED_DECODE_CONFIG', 'VLLM_PAGED_DECODE_CONFIG', 'paged_decode_default.conf')
def VLLM_XPU_KERNEL_MAX_JOBS_CAP_VALUE = params.VLLM_XPU_KERNEL_MAX_JOBS_CAP ?: '64'
def VLLM_XPU_KERNEL_RETRY_ON_COMPILER_CRASH_VALUE = params.VLLM_XPU_KERNEL_RETRY_ON_COMPILER_CRASH ?: '1'
def RUN_TESTS_VALUE = booleanParamOrDefault('RUN_TESTS', true)
def KEEP_WORKSPACE_VALUE = booleanParamOrDefault('KEEP_WORKSPACE', false)
def NO_CACHE_VALUE = booleanParamOrDefault('NO_CACHE', false)
def WORKSPACE_RECLAIM_IMAGE_VALUE = params.WORKSPACE_RECLAIM_IMAGE ?: 'intel/deep-learning-essentials:2026.0.0-devel-ubuntu24.04'
def GIT_CREDENTIAL_ID_VALUE = params.GIT_CREDENTIAL_ID ?: 'dujun_github_token'
def PR_SOURCE_BRANCH_VALUE = stringParamOrEnvListOrDefault('KERNEL_BRANCH', ['ghprbSourceBranch', 'CHANGE_BRANCH', 'BRANCH_NAME'], 'main')
def PR_TARGET_BRANCH_VALUE = stringParamOrEnvListOrDefault('KERNEL_TARGET_BRANCH', ['ghprbTargetBranch', 'CHANGE_TARGET'], 'main')

def noProxy = '127.0.0.1,localhost,172.*,192.*,10.*,*.local,*.intel.com'
def envList = [
    "NODE_PROXY=${NODE_PROXY_VALUE}",
    "no_proxy=${noProxy}",
    "NO_PROXY=${noProxy}",
    'LC_ALL=C.UTF-8',
    'LANG=C.UTF-8',
    "DOCKER_IMAGE_NAME=${DOCKER_IMAGE_NAME_VALUE}",
    "DOCKERFILE_PATH=${DOCKERFILE_PATH_VALUE}",
    "BASE_IMAGE=${BASE_IMAGE_VALUE}",
    "TEST_SCOPE=${TEST_SCOPE_VALUE}",
    "EXTRA_PYTEST_ARGS=${EXTRA_PYTEST_ARGS_VALUE}",
    "MAX_JOBS=${MAX_JOBS_VALUE}",
    "CCACHE_HOST_DIR=${CCACHE_HOST_DIR_VALUE}",
    "PREBUILT_KERNEL_WHL=${PREBUILT_KERNEL_WHL_VALUE}",
    "EXTRA_ENV=${EXTRA_ENV_VALUE}",
    "VLLM_XPU_KERNEL_PLATFORM=${VLLM_XPU_KERNEL_PLATFORM_VALUE}",
    "BUILD_ON_SIMULATOR_CRI=${BUILD_ON_SIMULATOR_CRI_VALUE}",
    "VLLM_CHUNK_PREFILL_CONFIG=${VLLM_CHUNK_PREFILL_CONFIG_VALUE}",
    "VLLM_PAGED_DECODE_CONFIG=${VLLM_PAGED_DECODE_CONFIG_VALUE}",
    "VLLM_XPU_KERNEL_MAX_JOBS_CAP=${VLLM_XPU_KERNEL_MAX_JOBS_CAP_VALUE}",
    "VLLM_XPU_KERNEL_RETRY_ON_COMPILER_CRASH=${VLLM_XPU_KERNEL_RETRY_ON_COMPILER_CRASH_VALUE}",
    "NO_CACHE=${NO_CACHE_VALUE}",
    "KERNEL_BRANCH=${PR_SOURCE_BRANCH_VALUE}",
    "KERNEL_TARGET_BRANCH=${PR_TARGET_BRANCH_VALUE}"
]

if (NODE_PROXY_VALUE?.trim()) {
    envList.addAll([
        "http_proxy=${NODE_PROXY_VALUE}",
        "https_proxy=${NODE_PROXY_VALUE}",
        "HTTP_PROXY=${NODE_PROXY_VALUE}",
        "HTTPS_PROXY=${NODE_PROXY_VALUE}"
    ])
}

def reclaimWorkspaceOwnership = {
    sh """#!/bin/bash
set +e

if [[ ! -d \"${WORKSPACE}\" ]]; then
    exit 0
fi

host_uid=\"\$(stat -c '%u' \"${WORKSPACE}\" 2>/dev/null || id -u)\"
host_gid=\"\$(stat -c '%g' \"${WORKSPACE}\" 2>/dev/null || id -g)\"

docker image inspect \"${WORKSPACE_RECLAIM_IMAGE_VALUE}\" >/dev/null 2>&1 || docker pull \"${WORKSPACE_RECLAIM_IMAGE_VALUE}\" >/dev/null 2>&1 || exit 0

docker run --rm \
    -v \"${WORKSPACE}:/workspace\" \
    \"${WORKSPACE_RECLAIM_IMAGE_VALUE}\" \
    /bin/bash -lc \"chown -R \${host_uid}:\${host_gid} /workspace || true; chmod -R u+rwX /workspace || true\" \
    >/dev/null 2>&1 || true
"""
}

def resetWorkspace = {
    reclaimWorkspaceOwnership()
    deleteDir()
}

echo "[Jenkinsfile] Using GIT_CREDENTIAL_ID='${GIT_CREDENTIAL_ID_VALUE}' for private FetchContent clones"

currentBuild.displayName = "#${BUILD_NUMBER}-kernel-ci-${PR_SOURCE_BRANCH_VALUE}"
currentBuild.description = "${BUILD_NODE_LABEL_VALUE}->${TEST_NODE_LABEL_VALUE} ${PR_SOURCE_BRANCH_VALUE} -> ${PR_TARGET_BRANCH_VALUE}"

timeout(time: BUILD_TIMEOUT_HOURS_VALUE.toInteger(), unit: 'HOURS') {
    node(BUILD_NODE_LABEL_VALUE) {
        try {
            resetWorkspace()
            checkout scm
            withEnv(envList + ['PIPELINE_STAGE=build']) {
                echo "[Jenkinsfile] BUILD stage: about to enter withCredentials(gitUsernamePassword id='${GIT_CREDENTIAL_ID_VALUE}')"
                withCredentials([gitUsernamePassword(credentialsId: GIT_CREDENTIAL_ID_VALUE, gitToolName: 'git')]) {
                    echo "[Jenkinsfile] BUILD stage: inside withCredentials, invoking sh"
                    sh '''#!/bin/bash
set -uo pipefail
if [[ -z "${GIT_USERNAME:-}" && -n "${GIT_ASKPASS:-}" && -x "${GIT_ASKPASS}" ]]; then
    export GIT_USERNAME="$("${GIT_ASKPASS}" "Username for 'https://github.com':" 2>/dev/null || true)"
fi
if [[ -z "${GIT_PASSWORD:-}" && -n "${GIT_ASKPASS:-}" && -x "${GIT_ASKPASS}" ]]; then
    export GIT_PASSWORD="$("${GIT_ASKPASS}" "Password for 'https://github.com':" 2>/dev/null || true)"
fi
echo "[SHELL-DIAG] BEFORE set -e: git env dump (masked):"
env | grep -iE '^(GIT_|GITHUB_)' | sort || true
set -e
mkdir -p "${WORKSPACE}/logs"
bash "${WORKSPACE}/ci/run_kernel_ci.sh" build
'''
                }
            }
            stash name: 'kernel-ci-build', includes: 'dist/*.whl,logs/kernel-ci/**', allowEmpty: false
        } finally {
            archiveArtifacts artifacts: 'logs/**,dist/*.whl', allowEmptyArchive: true
            if (!KEEP_WORKSPACE_VALUE.toBoolean()) {
                resetWorkspace()
            }
        }
    }

    if (RUN_TESTS_VALUE.toBoolean()) {
        node(TEST_NODE_LABEL_VALUE) {
            try {
                resetWorkspace()
                checkout scm
                unstash 'kernel-ci-build'
                withEnv(envList + ['PIPELINE_STAGE=test']) {
                    echo "[Jenkinsfile] TEST stage: about to enter withCredentials(gitUsernamePassword id='${GIT_CREDENTIAL_ID_VALUE}')"
                    withCredentials([gitUsernamePassword(credentialsId: GIT_CREDENTIAL_ID_VALUE, gitToolName: 'git')]) {
                        echo "[Jenkinsfile] TEST stage: inside withCredentials, invoking sh"
                        sh '''#!/bin/bash
set -uo pipefail
if [[ -z "${GIT_USERNAME:-}" && -n "${GIT_ASKPASS:-}" && -x "${GIT_ASKPASS}" ]]; then
    export GIT_USERNAME="$("${GIT_ASKPASS}" "Username for 'https://github.com':" 2>/dev/null || true)"
fi
if [[ -z "${GIT_PASSWORD:-}" && -n "${GIT_ASKPASS:-}" && -x "${GIT_ASKPASS}" ]]; then
    export GIT_PASSWORD="$("${GIT_ASKPASS}" "Password for 'https://github.com':" 2>/dev/null || true)"
fi
echo "[SHELL-DIAG] BEFORE set -e: git env dump (masked):"
env | grep -iE '^(GIT_|GITHUB_)' | sort || true
set -e
mkdir -p "${WORKSPACE}/logs"
bash "${WORKSPACE}/ci/run_kernel_ci.sh" test
'''
                    }
                }
            } finally {
                junit testResults: 'test-results/**/*.xml', allowEmptyResults: true
                archiveArtifacts artifacts: 'logs/**,dist/*.whl,test-results/**', allowEmptyArchive: true
                if (!KEEP_WORKSPACE_VALUE.toBoolean()) {
                    resetWorkspace()
                }
            }
        }
    } else {
        echo '[Jenkinsfile] RUN_TESTS=false, skipping test stage'
    }
}