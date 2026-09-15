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

def parseBooleanValue = { Object rawValue ->
    if (rawValue == null) {
        return null
    }
    if (rawValue instanceof Boolean) {
        return rawValue
    }

    def normalized = rawValue.toString().trim().toLowerCase()
    if (!normalized) {
        return null
    }

    if (['1', 'true', 'yes', 'y', 'on'].contains(normalized)) {
        return true
    }
    if (['0', 'false', 'no', 'n', 'off'].contains(normalized)) {
        return false
    }

    return null
}

def booleanParamOrEnvListOrDefault = { String paramName, List<String> envNames, boolean defaultValue ->
    def rawParamValue = params.containsKey(paramName) ? params.get(paramName) : null
    def parsedParamValue = parseBooleanValue(rawParamValue)
    if (parsedParamValue != null) {
        return parsedParamValue
    }

    for (String envName : envNames) {
        def parsedEnvValue = parseBooleanValue(env.getProperty(envName))
        if (parsedEnvValue != null) {
            return parsedEnvValue
        }
    }

    return defaultValue
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
def UPLOAD_WHL_TO_ARTIFACTORY_VALUE = booleanParamOrEnvListOrDefault('UPLOAD_WHL_TO_ARTIFACTORY', ['UPLOAD_WHL_TO_ARTIFACTORY'], true)
// Explicit override wins; otherwise the upload path is derived per trigger kind below once it is known.
def ARTIFACTORY_UPLOAD_PATH_OVERRIDE_VALUE = stringParamOrEnvListOrDefault('ARTIFACTORY_UPLOAD_PATH', ['ARTIFACTORY_UPLOAD_PATH'], '')
def UPLOAD_ARTIFACTORY_CREDENTIAL_ID_VALUE = stringParamOrEnvListOrDefault('UPLOAD_ARTIFACTORY_CREDENTIAL_ID', ['UPLOAD_ARTIFACTORY_CREDENTIAL_ID'], '')
def UPLOAD_ARTIFACTORY_CREDENTIALS_VALUE = stringParamOrEnvListOrDefault('UPLOAD_ARTIFACTORY_CREDENTIALS', ['UPLOAD_ARTIFACTORY_CREDENTIALS'], '')
def UPLOAD_ARTIFACTORY_CREDENTIAL_ID_IS_RAW_VALUE = UPLOAD_ARTIFACTORY_CREDENTIAL_ID_VALUE.contains(':')
def UPLOAD_ARTIFACTORY_CREDENTIALS_RAW_VALUE = UPLOAD_ARTIFACTORY_CREDENTIAL_ID_IS_RAW_VALUE ? UPLOAD_ARTIFACTORY_CREDENTIAL_ID_VALUE : UPLOAD_ARTIFACTORY_CREDENTIALS_VALUE
def PR_SOURCE_BRANCH_VALUE = stringParamOrEnvListOrDefault('KERNEL_BRANCH', ['WEBHOOK_VLLM_XPU_KERNEL_BRANCH', 'WEBHOOK_XPU_KERNEL_BRANCH', 'WEBHOOK_KERNEL_BRANCH', 'PR_HEAD_REF', 'ghprbSourceBranch', 'CHANGE_BRANCH', 'BRANCH_NAME'], 'main')
def PR_TARGET_BRANCH_VALUE = stringParamOrEnvListOrDefault('KERNEL_TARGET_BRANCH', ['WEBHOOK_VLLM_XPU_KERNEL_TARGET_BRANCH', 'WEBHOOK_XPU_KERNEL_TARGET_BRANCH', 'WEBHOOK_KERNEL_TARGET_BRANCH', 'PR_BASE_REF', 'ghprbTargetBranch', 'CHANGE_TARGET'], 'main')
def ENABLE_PR_AUTOMATIC_TRIGGER_VALUE = booleanParamOrEnvListOrDefault('ENABLE_PR_AUTOMATIC_TRIGGER', ['ENABLE_PR_AUTOMATIC_TRIGGER'], true)
def ENABLE_PR_MERGE_TRIGGER_VALUE = booleanParamOrEnvListOrDefault('ENABLE_PR_MERGE_TRIGGER', ['ENABLE_PR_MERGE_TRIGGER'], true)
def ENABLE_PR_COMMENT_TRIGGER_VALUE = booleanParamOrEnvListOrDefault('ENABLE_PR_COMMENT_TRIGGER', ['ENABLE_PR_COMMENT_TRIGGER'], true)
def FORCE_TRIGGER_KIND_VALUE = stringParamOrEnvListOrDefault('FORCE_TRIGGER_KIND', ['FORCE_TRIGGER_KIND'], '')
def WEBHOOK_EVENT_VALUE = stringParamOrEnvListOrDefault('WEBHOOK_EVENT', ['WEBHOOK_EVENT', 'WEBHOOK_EVENT_TYPE', 'GITHUB_EVENT_NAME', 'X_GITHUB_EVENT', 'x_github_event', 'EVENT_TYPE', 'GITHUB_EVENT'], '')
def WEBHOOK_ACTION_VALUE = stringParamOrEnvListOrDefault('WEBHOOK_ACTION', ['WEBHOOK_ACTION', 'WEBHOOK_PR_ACTION', 'PR_ACTION', 'action'], '')
def WEBHOOK_PR_MERGED_VALUE = stringParamOrEnvListOrDefault('WEBHOOK_PR_MERGED', ['WEBHOOK_PR_MERGED', 'WEBHOOK_PULL_REQUEST_MERGED', 'PR_MERGED', 'pull_request_merged', 'merged'], '')
def WEBHOOK_COMMENT_VALUE = stringParamOrEnvListOrDefault('WEBHOOK_COMMENT', ['WEBHOOK_COMMENT', 'WEBHOOK_COMMENT_BODY', 'COMMENT_BODY', 'comment', 'comment_body'], '')
def PR_NUMBER_VALUE = stringParamOrEnvListOrDefault('PR_NUMBER', ['PR_NUMBER', 'CHANGE_ID'], '')
def PR_HEAD_SHA_VALUE = stringParamOrEnvListOrDefault('PR_HEAD_SHA', ['PR_HEAD_SHA', 'GIT_COMMIT'], '')
def PR_MERGE_COMMIT_SHA_VALUE = stringParamOrEnvListOrDefault('PR_MERGE_COMMIT_SHA', ['PR_MERGE_COMMIT_SHA', 'WEBHOOK_PR_MERGE_COMMIT_SHA', 'MERGE_COMMIT_SHA'], '')
def ISSUE_NUMBER_VALUE = stringParamOrEnvListOrDefault('ISSUE_NUMBER', ['ISSUE_NUMBER', 'issue_number'], '')
def ISSUE_PULL_REQUEST_API_URL_VALUE = stringParamOrEnvListOrDefault('ISSUE_PULL_REQUEST_API_URL', ['ISSUE_PULL_REQUEST_API_URL', 'PR_API_URL', 'issue_pull_request_api_url'], '')
def REPO_FULL_NAME_VALUE = stringParamOrEnvListOrDefault('REPO_FULL_NAME', ['REPO_FULL_NAME'], '')

def EFFECTIVE_PR_SOURCE_BRANCH_VALUE = PR_SOURCE_BRANCH_VALUE
def EFFECTIVE_PR_TARGET_BRANCH_VALUE = PR_TARGET_BRANCH_VALUE
def EFFECTIVE_PR_NUMBER_VALUE = PR_NUMBER_VALUE
def EFFECTIVE_PR_HEAD_SHA_VALUE = PR_HEAD_SHA_VALUE
def EFFECTIVE_PR_MERGE_COMMIT_SHA_VALUE = PR_MERGE_COMMIT_SHA_VALUE

def prAutomaticActions = ['opened', 'reopened', 'ready_for_review', 'synchronize']
def normalizedWebhookEvent = WEBHOOK_EVENT_VALUE.toString().trim().toLowerCase()
def normalizedWebhookAction = WEBHOOK_ACTION_VALUE.toString().trim().toLowerCase()
def normalizedForcedTriggerKind = FORCE_TRIGGER_KIND_VALUE.toString().trim().toLowerCase()
def webhookMergedFlag = parseBooleanValue(WEBHOOK_PR_MERGED_VALUE)

def TRIGGER_KIND_VALUE = 'manual'
def TRIGGER_REASON_VALUE = 'manual-or-legacy'

if (['pr_auto', 'pr_merge', 'comment', 'manual'].contains(normalizedForcedTriggerKind)) {
    TRIGGER_KIND_VALUE = normalizedForcedTriggerKind
    TRIGGER_REASON_VALUE = "forced:${normalizedForcedTriggerKind}"
} else if (normalizedWebhookEvent == 'push') {
    TRIGGER_KIND_VALUE = 'push'
    TRIGGER_REASON_VALUE = 'webhook:push'
} else if (normalizedWebhookEvent == 'issue_comment') {
    TRIGGER_KIND_VALUE = 'comment'
    TRIGGER_REASON_VALUE = "webhook:${normalizedWebhookEvent}"
} else if (normalizedWebhookEvent == 'pull_request' && webhookMergedFlag == true) {
    TRIGGER_KIND_VALUE = 'pr_merge'
    TRIGGER_REASON_VALUE = "webhook:${normalizedWebhookEvent}/${normalizedWebhookAction},merged=true"
} else if (normalizedWebhookEvent == 'pull_request' && prAutomaticActions.contains(normalizedWebhookAction)) {
    TRIGGER_KIND_VALUE = 'pr_auto'
    TRIGGER_REASON_VALUE = "webhook:${normalizedWebhookEvent}/${normalizedWebhookAction}"
} else if (normalizedWebhookEvent == 'pull_request' && normalizedWebhookAction == 'closed') {
    TRIGGER_KIND_VALUE = 'pr_closed'
    TRIGGER_REASON_VALUE = 'webhook:pull_request/closed without merged=true'
} else if (env.CHANGE_ID?.toString()?.trim()) {
    TRIGGER_KIND_VALUE = 'pr_auto'
    TRIGGER_REASON_VALUE = 'legacy-pr-context'
}

def defaultArtifactoryUploadPathForTrigger = { String triggerKind ->
    switch (triggerKind) {
        case 'pr_merge':
            return 'local-ci/merge'
        case 'comment':
            return 'local-ci/pr-comment'
        case 'pr_auto':
            return 'local-ci/pr'
        default:
            return 'local-ci/manual'
    }
}
def ARTIFACTORY_UPLOAD_PATH_VALUE = ARTIFACTORY_UPLOAD_PATH_OVERRIDE_VALUE?.trim() ?: defaultArtifactoryUploadPathForTrigger(TRIGGER_KIND_VALUE)

def shouldRunBuild = true
def skipReason = ''
if (TRIGGER_KIND_VALUE == 'pr_auto' && !ENABLE_PR_AUTOMATIC_TRIGGER_VALUE) {
    shouldRunBuild = false
    skipReason = 'ENABLE_PR_AUTOMATIC_TRIGGER=false'
} else if (TRIGGER_KIND_VALUE == 'pr_merge' && !ENABLE_PR_MERGE_TRIGGER_VALUE) {
    shouldRunBuild = false
    skipReason = 'ENABLE_PR_MERGE_TRIGGER=false'
} else if (TRIGGER_KIND_VALUE == 'comment' && !ENABLE_PR_COMMENT_TRIGGER_VALUE) {
    shouldRunBuild = false
    skipReason = 'ENABLE_PR_COMMENT_TRIGGER=false'
} else if (TRIGGER_KIND_VALUE == 'push') {
    shouldRunBuild = false
    skipReason = 'push event is not a supported kernel CI trigger; use PR events, merge, or /run|recheck comments'
} else if (TRIGGER_KIND_VALUE == 'pr_closed') {
    shouldRunBuild = false
    skipReason = 'pull_request closed event requires WEBHOOK_PR_MERGED=true to run as merge-triggered CI'
} else if (normalizedWebhookEvent && TRIGGER_KIND_VALUE == 'manual') {
    shouldRunBuild = false
    skipReason = "unsupported webhook event '${normalizedWebhookEvent}'"
}

def noProxy = '127.0.0.1,localhost,172.*,192.*,10.*,*.local,*.intel.com'
def buildEnvList = {
    [
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
        "KERNEL_BRANCH=${EFFECTIVE_PR_SOURCE_BRANCH_VALUE}",
        "KERNEL_TARGET_BRANCH=${EFFECTIVE_PR_TARGET_BRANCH_VALUE}",
        "CI_TRIGGER_KIND=${TRIGGER_KIND_VALUE}",
        "CI_TRIGGER_REASON=${TRIGGER_REASON_VALUE}",
        "WEBHOOK_EVENT=${WEBHOOK_EVENT_VALUE}",
        "WEBHOOK_ACTION=${WEBHOOK_ACTION_VALUE}",
        "WEBHOOK_PR_MERGED=${WEBHOOK_PR_MERGED_VALUE}",
        "WEBHOOK_COMMENT=${WEBHOOK_COMMENT_VALUE}"
    ]
}

if (NODE_PROXY_VALUE?.trim()) {
    def currentBuildEnvList = buildEnvList
    buildEnvList = {
        currentBuildEnvList() + [
            "http_proxy=${NODE_PROXY_VALUE}",
            "https_proxy=${NODE_PROXY_VALUE}",
            "HTTP_PROXY=${NODE_PROXY_VALUE}",
            "HTTPS_PROXY=${NODE_PROXY_VALUE}"
        ]
    }
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

def inferRepoFullName = { String repoUrl ->
    if (REPO_FULL_NAME_VALUE?.trim()) {
        return REPO_FULL_NAME_VALUE.trim()
    }

    def normalizedRepoUrl = repoUrl?.trim()
    if (!normalizedRepoUrl) {
        return ''
    }

    def normalizedPath = normalizedRepoUrl
    for (String prefix : ['https://github.com/', 'http://github.com/', 'git@github.com:']) {
        if (normalizedPath.startsWith(prefix)) {
            normalizedPath = normalizedPath.substring(prefix.length())
            break
        }
    }

    if (normalizedPath.endsWith('.git')) {
        normalizedPath = normalizedPath.substring(0, normalizedPath.length() - 4)
    }

    if (normalizedPath.count('/') == 1) {
        return normalizedPath
    }

    return ''
}

def inferIssuePullRequestApiUrl = {
    if (ISSUE_PULL_REQUEST_API_URL_VALUE?.trim()) {
        return ISSUE_PULL_REQUEST_API_URL_VALUE.trim()
    }

    def effectivePrNumber = PR_NUMBER_VALUE?.trim() ?: ISSUE_NUMBER_VALUE?.trim()
    if (REPO_FULL_NAME_VALUE?.trim() && effectivePrNumber) {
        return "https://api.github.com/repos/${REPO_FULL_NAME_VALUE}/pulls/${effectivePrNumber}"
    }

    return ''
}

def resolveCommentTriggerContext = {
    EFFECTIVE_PR_NUMBER_VALUE = PR_NUMBER_VALUE?.trim() ?: ISSUE_NUMBER_VALUE?.trim()

    if (TRIGGER_KIND_VALUE != 'comment') {
        return
    }

    if (EFFECTIVE_PR_NUMBER_VALUE && EFFECTIVE_PR_TARGET_BRANCH_VALUE?.trim() && EFFECTIVE_PR_SOURCE_BRANCH_VALUE?.trim() && EFFECTIVE_PR_SOURCE_BRANCH_VALUE != 'main') {
        return
    }

    def issuePullRequestApiUrl = inferIssuePullRequestApiUrl()
    if (!issuePullRequestApiUrl) {
        echo '[Jenkinsfile] Comment trigger did not provide ISSUE_PULL_REQUEST_API_URL; falling back to current branch defaults'
        return
    }

    withCredentials([gitUsernamePassword(credentialsId: GIT_CREDENTIAL_ID_VALUE, gitToolName: 'git')]) {
        def prMetadataJson = sh(
            script: """#!/bin/bash
set -euo pipefail
python3 - <<'PY'
import json
import os
import sys
import urllib.request

url = ${groovy.json.JsonOutput.toJson(issuePullRequestApiUrl)}
username = os.environ.get('GIT_USERNAME', '')
password = os.environ.get('GIT_PASSWORD', '')

request = urllib.request.Request(url)
request.add_header('Accept', 'application/vnd.github+json')
if username or password:
    import base64
    token = base64.b64encode(f"{username}:{password}".encode()).decode()
    request.add_header('Authorization', f'Basic {token}')

with urllib.request.urlopen(request) as response:
    payload = json.load(response)

print(json.dumps({
    'number': payload.get('number', ''),
    'head_ref': ((payload.get('head') or {}).get('ref') or ''),
    'head_sha': ((payload.get('head') or {}).get('sha') or ''),
    'base_ref': ((payload.get('base') or {}).get('ref') or ''),
    'merge_commit_sha': (payload.get('merge_commit_sha') or ''),
}))
PY
""",
            returnStdout: true
        ).trim()

        def prMetadata = new groovy.json.JsonSlurperClassic().parseText(prMetadataJson)
        EFFECTIVE_PR_NUMBER_VALUE = prMetadata.number?.toString()?.trim() ?: EFFECTIVE_PR_NUMBER_VALUE
        EFFECTIVE_PR_SOURCE_BRANCH_VALUE = prMetadata.head_ref?.toString()?.trim() ?: EFFECTIVE_PR_SOURCE_BRANCH_VALUE
        EFFECTIVE_PR_HEAD_SHA_VALUE = prMetadata.head_sha?.toString()?.trim() ?: EFFECTIVE_PR_HEAD_SHA_VALUE
        EFFECTIVE_PR_TARGET_BRANCH_VALUE = prMetadata.base_ref?.toString()?.trim() ?: EFFECTIVE_PR_TARGET_BRANCH_VALUE
        EFFECTIVE_PR_MERGE_COMMIT_SHA_VALUE = prMetadata.merge_commit_sha?.toString()?.trim() ?: EFFECTIVE_PR_MERGE_COMMIT_SHA_VALUE
    }
}

def resolveEffectiveTriggerContext = {
    EFFECTIVE_PR_SOURCE_BRANCH_VALUE = PR_SOURCE_BRANCH_VALUE
    EFFECTIVE_PR_TARGET_BRANCH_VALUE = PR_TARGET_BRANCH_VALUE
    EFFECTIVE_PR_NUMBER_VALUE = PR_NUMBER_VALUE?.trim() ?: ISSUE_NUMBER_VALUE?.trim()
    EFFECTIVE_PR_HEAD_SHA_VALUE = PR_HEAD_SHA_VALUE
    EFFECTIVE_PR_MERGE_COMMIT_SHA_VALUE = PR_MERGE_COMMIT_SHA_VALUE

    resolveCommentTriggerContext()
}

def publishGitHubCommitStatus = { String state, String description ->
    if (!['pending', 'success', 'failure', 'error'].contains(state)) {
        echo "[Jenkinsfile] Skip GitHub status update: unsupported state='${state}'"
        return
    }

    resolveEffectiveTriggerContext()

    def configuredScm = scm
    def remoteConfig = configuredScm?.userRemoteConfigs ? configuredScm.userRemoteConfigs[0] : null
    def repoUrl = remoteConfig?.url ?: (REPO_FULL_NAME_VALUE ? "https://github.com/${REPO_FULL_NAME_VALUE}.git" : '')
    def repoFullName = inferRepoFullName(repoUrl)
    def statusSha = ''
    if (TRIGGER_KIND_VALUE == 'pr_merge') {
        statusSha = EFFECTIVE_PR_MERGE_COMMIT_SHA_VALUE?.trim() ?: PR_MERGE_COMMIT_SHA_VALUE?.trim() ?: EFFECTIVE_PR_HEAD_SHA_VALUE?.trim() ?: PR_HEAD_SHA_VALUE?.trim()
    } else {
        statusSha = EFFECTIVE_PR_HEAD_SHA_VALUE?.trim() ?: PR_HEAD_SHA_VALUE?.trim() ?: EFFECTIVE_PR_MERGE_COMMIT_SHA_VALUE?.trim() ?: PR_MERGE_COMMIT_SHA_VALUE?.trim()
    }

    if (!repoFullName || !statusSha) {
        echo "[Jenkinsfile] Skip GitHub status update: repo='${repoFullName}', sha='${statusSha}'"
        return
    }

    try {
        withCredentials([usernamePassword(credentialsId: GIT_CREDENTIAL_ID_VALUE, usernameVariable: 'STATUS_GITHUB_USERNAME', passwordVariable: 'STATUS_GITHUB_PASSWORD')]) {
            sh(
                script: """#!/bin/bash
set -euo pipefail
python3 - <<'PY'
import json
import os
import urllib.request

repo = ${groovy.json.JsonOutput.toJson(repoFullName)}
sha = ${groovy.json.JsonOutput.toJson(statusSha)}
state = ${groovy.json.JsonOutput.toJson(state)}
description = ${groovy.json.JsonOutput.toJson(description.take(140))}
target_url = ${groovy.json.JsonOutput.toJson(env.BUILD_URL ?: '')}
context = 'jenkins/vllm-xpu-kernel-ci'

payload = json.dumps({
    'state': state,
    'target_url': target_url,
    'description': description,
    'context': context,
}).encode()

username = os.environ.get('STATUS_GITHUB_USERNAME', '')
password = os.environ.get('STATUS_GITHUB_PASSWORD', '')

request = urllib.request.Request(
    f'https://api.github.com/repos/{repo}/statuses/{sha}',
    data=payload,
    method='POST',
)
request.add_header('Accept', 'application/vnd.github+json')
request.add_header('Content-Type', 'application/json')
if username or password:
    import base64
    token = base64.b64encode(f"{username}:{password}".encode()).decode()
    request.add_header('Authorization', f'Basic {token}')

with urllib.request.urlopen(request) as response:
    response.read()
PY
""",
                label: "Publish GitHub status: ${state}"
            )
        }

        echo "[Jenkinsfile] Published GitHub status state='${state}' for ${repoFullName}@${statusSha.take(12)}"
    } catch (Throwable statusError) {
        echo "[Jenkinsfile] Failed to publish GitHub status state='${state}' for ${repoFullName}@${statusSha.take(12)}: ${statusError.getMessage()}"
    }
}

def publishGitHubCommitStatusOnBuildNode = { String state, String description ->
    node(BUILD_NODE_LABEL_VALUE) {
        publishGitHubCommitStatus(state, description)
    }
}

def uploadKernelWheelToArtifactory = {
    if (!UPLOAD_WHL_TO_ARTIFACTORY_VALUE) {
        echo '[Jenkinsfile] UPLOAD_WHL_TO_ARTIFACTORY=false, skipping Artifactory upload'
        return
    }

    def uploadPath = ARTIFACTORY_UPLOAD_PATH_VALUE?.trim() ?: 'local-ci'
    def wheelPath = sh(
        script: '''#!/bin/bash
set -euo pipefail
ls -1 dist/*.whl | head -n 1
''',
        returnStdout: true
    ).trim()

    if (!wheelPath) {
        error('[Jenkinsfile] Kernel wheel upload requested, but no dist/*.whl artifact was found')
    }

    def uploadUrl = "https://af01p-ba.devtools.intel.com/artifactory/aipc_releases-ba-local/${uploadPath}/${wheelPath.tokenize('/').last()}"
    def runUpload = {
        sh(
            script: """#!/bin/bash
set -euo pipefail
mkdir -p \"${WORKSPACE}/logs/kernel-ci\"
if ! python3 \"${WORKSPACE}/ci/upload2art.py\" --file \"${wheelPath}\" --path \"${uploadPath}\" >\"${WORKSPACE}/logs/kernel-ci/upload-artifactory.log\" 2>&1; then
    cat \"${WORKSPACE}/logs/kernel-ci/upload-artifactory.log\" >&2 || true
    exit 1
fi
printf '%s\n' ${groovy.json.JsonOutput.toJson(uploadUrl)} | tee \"${WORKSPACE}/logs/kernel-ci/kernel-wheel-artifactory-url.txt\"
""",
            label: 'Upload kernel wheel to Artifactory'
        )
    }

    if (UPLOAD_ARTIFACTORY_CREDENTIAL_ID_VALUE?.trim() && !UPLOAD_ARTIFACTORY_CREDENTIAL_ID_IS_RAW_VALUE) {
        withCredentials([usernamePassword(credentialsId: UPLOAD_ARTIFACTORY_CREDENTIAL_ID_VALUE, usernameVariable: 'ARTIFACTORY_USERNAME', passwordVariable: 'ARTIFACTORY_PASSWORD')]) {
            runUpload()
        }
    } else if (UPLOAD_ARTIFACTORY_CREDENTIALS_RAW_VALUE?.trim()) {
        withEnv(["UPLOAD_ARTIFACTORY_CREDENTIALS=${UPLOAD_ARTIFACTORY_CREDENTIALS_RAW_VALUE}"]) {
            runUpload()
        }
    } else {
        error('[Jenkinsfile] UPLOAD_WHL_TO_ARTIFACTORY=true requires UPLOAD_ARTIFACTORY_CREDENTIAL_ID or UPLOAD_ARTIFACTORY_CREDENTIALS')
    }

    echo "[Jenkinsfile] Uploaded kernel wheel to ${uploadUrl}"
}

def checkoutTriggerSource = {
    resolveEffectiveTriggerContext()

    def configuredScm = scm
    def remoteConfig = configuredScm?.userRemoteConfigs ? configuredScm.userRemoteConfigs[0] : null
    def repoUrl = remoteConfig?.url ?: (REPO_FULL_NAME_VALUE ? "https://github.com/${REPO_FULL_NAME_VALUE}.git" : '')
    def credentialsId = remoteConfig?.credentialsId

    if (!repoUrl?.trim()) {
        error('[Jenkinsfile] Unable to resolve repository URL for webhook-triggered checkout')
    }

    def remoteName = 'origin'
    def refspecs = []
    def branchName = ''
    def checkoutTarget = ''

    if (TRIGGER_KIND_VALUE == 'pr_merge' && EFFECTIVE_PR_MERGE_COMMIT_SHA_VALUE?.trim()) {
        branchName = EFFECTIVE_PR_TARGET_BRANCH_VALUE
        refspecs << "+refs/heads/${EFFECTIVE_PR_TARGET_BRANCH_VALUE}:refs/remotes/${remoteName}/${EFFECTIVE_PR_TARGET_BRANCH_VALUE}"
        checkoutTarget = EFFECTIVE_PR_MERGE_COMMIT_SHA_VALUE
    } else if (EFFECTIVE_PR_NUMBER_VALUE?.trim()) {
        branchName = "pr/${EFFECTIVE_PR_NUMBER_VALUE}/head"
        refspecs << "+refs/pull/${EFFECTIVE_PR_NUMBER_VALUE}/head:refs/remotes/${remoteName}/pr/${EFFECTIVE_PR_NUMBER_VALUE}/head"
        checkoutTarget = "refs/remotes/${remoteName}/pr/${EFFECTIVE_PR_NUMBER_VALUE}/head"
    } else {
        branchName = EFFECTIVE_PR_SOURCE_BRANCH_VALUE
        refspecs << "+refs/heads/${EFFECTIVE_PR_SOURCE_BRANCH_VALUE}:refs/remotes/${remoteName}/${EFFECTIVE_PR_SOURCE_BRANCH_VALUE}"
        checkoutTarget = EFFECTIVE_PR_HEAD_SHA_VALUE?.trim() ?: "refs/remotes/${remoteName}/${EFFECTIVE_PR_SOURCE_BRANCH_VALUE}"
    }

    def userRemoteConfig = [
        url: repoUrl,
        refspec: refspecs.join(' ')
    ]
    if (credentialsId?.trim()) {
        userRemoteConfig.credentialsId = credentialsId
    }

    echo "[Jenkinsfile] Checkout source repo='${repoUrl}', trigger='${TRIGGER_KIND_VALUE}', branch='${branchName}', target='${checkoutTarget}'"
    checkout(changelog: false, poll: false, scm: [
        $class: 'GitSCM',
        branches: [[name: checkoutTarget]],
        doGenerateSubmoduleConfigurations: false,
        extensions: [],
        submoduleCfg: [],
        userRemoteConfigs: [userRemoteConfig]
    ])
}

echo "[Jenkinsfile] Using GIT_CREDENTIAL_ID='${GIT_CREDENTIAL_ID_VALUE}' for private FetchContent clones"
echo "[Jenkinsfile] Trigger kind='${TRIGGER_KIND_VALUE}', reason='${TRIGGER_REASON_VALUE}', webhook event='${WEBHOOK_EVENT_VALUE}', action='${WEBHOOK_ACTION_VALUE}', merged='${WEBHOOK_PR_MERGED_VALUE}'"
echo "[Jenkinsfile] Artifactory upload path='${ARTIFACTORY_UPLOAD_PATH_VALUE}' (override='${ARTIFACTORY_UPLOAD_PATH_OVERRIDE_VALUE}')"

currentBuild.displayName = "#${BUILD_NUMBER}-kernel-ci-${TRIGGER_KIND_VALUE}-${PR_SOURCE_BRANCH_VALUE}"
currentBuild.description = "${TRIGGER_KIND_VALUE} ${BUILD_NODE_LABEL_VALUE}->${TEST_NODE_LABEL_VALUE} ${PR_SOURCE_BRANCH_VALUE} -> ${PR_TARGET_BRANCH_VALUE}"

if (!shouldRunBuild) {
    currentBuild.result = 'NOT_BUILT'
    echo "[Jenkinsfile] Skipping build: ${skipReason}"
    return
}

try {
    timeout(time: BUILD_TIMEOUT_HOURS_VALUE.toInteger(), unit: 'HOURS') {
        node(BUILD_NODE_LABEL_VALUE) {
            try {
                publishGitHubCommitStatus('pending', "Kernel CI started (${TRIGGER_KIND_VALUE})")
                resetWorkspace()
                checkoutTriggerSource()
                withEnv(buildEnvList() + ['PIPELINE_STAGE=build']) {
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
                uploadKernelWheelToArtifactory()
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
                    checkoutTriggerSource()
                    unstash 'kernel-ci-build'
                    withEnv(buildEnvList() + ['PIPELINE_STAGE=test']) {
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
    publishGitHubCommitStatusOnBuildNode('success', 'Kernel CI passed')
} catch (org.jenkinsci.plugins.workflow.steps.FlowInterruptedException interruptedException) {
    currentBuild.result = currentBuild.result ?: 'ABORTED'
    publishGitHubCommitStatusOnBuildNode('error', "Kernel CI ${currentBuild.result.toLowerCase()}")
    throw interruptedException
} catch (Throwable throwable) {
    currentBuild.result = 'FAILURE'
    publishGitHubCommitStatusOnBuildNode('failure', 'Kernel CI failed')
    throw throwable
}