# vLLM XPU Kernel PR CI

Jenkins kernel CI for this repository is online.

## Jenkins Job

- Jenkins job:
   https://jenkins-aten-caffe2.sh.intel.com/view/workspace_wenjun/job/vllm-xpu-kernel-ci/
- Pipeline entry:
   [ci/Jenkinsfile.groovy](../ci/Jenkinsfile.groovy)
- Stage runner:
   [ci/run_kernel_ci.sh](../ci/run_kernel_ci.sh)

## Summary

- CI is PR-oriented and targets `vllm-xpu-kernels` validation.
- The pipeline runs merge precheck, wheel build, and kernel UT in separate stages.
- Build node and test node are scheduled independently. The built wheel is stashed after build and reused in test.
- Logs, test results, and wheel artifacts are archived in Jenkins.
- Build and test logs are streamed to the Jenkins console, so long-running compile progress is visible live.

## Trigger Model

- This job is PR-oriented and is intended to run against the PR source/target branch pair.
- Trigger classification now lives inside [ci/Jenkinsfile.groovy](../ci/Jenkinsfile.groovy) itself (`TRIGGER_KIND_VALUE`), driven by GitHub webhook payload fields (`WEBHOOK_EVENT`, `WEBHOOK_ACTION`, `WEBHOOK_PR_MERGED`, etc.) passed in as job parameters/env by the webhook layer:
   - `pr_auto`: automatic webhook-driven runs on `pull_request` `opened` / `reopened` / `ready_for_review` / `synchronize`.
   - `comment`: triggered by a PR comment (`issue_comment` webhook event, e.g. `/run` or `recheck`).
   - `pr_merge`: triggered when a `pull_request` webhook event reports `merged=true`.
   - `manual`: manually started Jenkins build, or legacy/no webhook context.
   - `push` and `pr_closed` (closed without merge) are explicitly not supported triggers; the pipeline skips the build (`NOT_BUILT`) for these.
- Each trigger kind can be independently disabled via `ENABLE_PR_AUTOMATIC_TRIGGER`, `ENABLE_PR_MERGE_TRIGGER`, `ENABLE_PR_COMMENT_TRIGGER` (all default `true`).
- `FORCE_TRIGGER_KIND` can override detection for manual testing (`pr_auto`, `pr_merge`, `comment`, or `manual`).
- Triggering itself is webhook-based (GitHub webhook -> Jenkins), replacing the older comment-polling/GHPRB setup.
- The pipeline also publishes a GitHub commit status (`jenkins/vllm-xpu-kernel-ci`) back to the PR head SHA (or merge commit SHA for merge-triggered runs) for `pending`/`success`/`failure`/`error` states.
- **Superseded-build cancellation**: when a new webhook-driven build starts for a PR (identified by the `PR_NUMBER`/`ISSUE_NUMBER` job parameter) that already has an older build still running, the pipeline automatically aborts that older build before proceeding. This prevents stale commits from continuing to build/test (and report GitHub status) after a newer push/comment has arrived for the same PR. This only compares builds of the same PR number; concurrent builds for different PRs are unaffected. This requires the Jenkins controller to allow the `@NonCPS` script's use of `jenkins.model.Jenkins`/`hudson.model.*` (approve the relevant signatures once under *Manage Jenkins > In-process Script Approval* if the job runs with the Groovy sandbox enabled).

## Artifact Publishing (Artifactory Upload)

- After a successful build, the pipeline uploads the built kernel wheel to Artifactory via [ci/upload2art.py](../ci/upload2art.py), unless `UPLOAD_WHL_TO_ARTIFACTORY=false`.
- Base remote repository: `https://af01p-ba.devtools.intel.com/artifactory/aipc_releases-ba-local/`
- To keep PR-auto, comment-triggered, and merge-triggered builds from landing in the same folder, the upload subpath now defaults per `TRIGGER_KIND_VALUE` instead of a single shared `local-ci` path:
   - `pr_auto` -> `local-ci/pr`
   - `comment` -> `local-ci/pr-comment`
   - `pr_merge` -> `local-ci/merge`
   - anything else (`manual`, etc.) -> `local-ci/manual`
- Set `ARTIFACTORY_UPLOAD_PATH` explicitly to override this default and force a specific subpath regardless of trigger kind.
- Upload credentials come from `UPLOAD_ARTIFACTORY_CREDENTIAL_ID` (Jenkins credential ID) or, if not set, raw `UPLOAD_ARTIFACTORY_CREDENTIALS`.
- The resolved upload path and the final Artifactory URL are logged to `logs/kernel-ci/upload-artifactory.log` and `logs/kernel-ci/kernel-wheel-artifactory-url.txt`.
- Wheels uploaded before the per-trigger split still sit loose directly under `local-ci/`. Use [ci/cleanup_legacy_artifactory_whl.py](../ci/cleanup_legacy_artifactory_whl.py) (manual, local-only, requires your own Artifactory credentials) to list, move them into `local-ci/legacy/`, or delete them.

## Planned Enhancements

- Support temporary removal of specific kernel UT cases when short-term CI stability or infra triage requires a targeted exclusion.

## What The CI Tests

- Jenkins checks out the PR merge ref through `checkout scm`.
- `KERNEL_BRANCH` defaults from `ghprbSourceBranch`, `CHANGE_BRANCH`, or `BRANCH_NAME`.
- `KERNEL_TARGET_BRANCH` defaults from `ghprbTargetBranch` or `CHANGE_TARGET`.
- Before build, the script fetches the target branch and runs a merge precheck to confirm the current HEAD can merge cleanly.

## Runtime Flow

- Build node:
   reset workspace, checkout source, enter build stage.
- Build stage:
   run merge precheck, prepare host dependency sources, and build wheel.
- Test node:
   checkout source again, unstash build artifacts, enter test stage.
- Test stage:
   reuse built wheel if present and run kernel UT.
- Test stage is skipped entirely (test node is never entered) when `RUN_TESTS=false`.

Shell entrypoints used by Jenkins:

```bash
bash ci/run_kernel_ci.sh build
bash ci/run_kernel_ci.sh test
```

## Test Stage Script (`ci/run_kernel_ut.sh`)

`run_kernel_ci.sh test` installs the built wheel (or reinstalls in editable mode as a
fallback) inside the test container, then hands off to
[ci/run_kernel_ut.sh](../ci/run_kernel_ut.sh):

```bash
bash /workspace/src/ci/run_kernel_ut.sh "${TEST_SCOPE:-ci}"
```

What this script does:

- Resolves scope from its first argument, falling back to `TEST_SCOPE` env, default `ci`.
- Sets up the runtime environment: sources `/opt/gfx-deps/env.sh`, oneAPI `setvars.sh`,
   and any available oneCCL `setvars.sh`, then prepends `LD_LIBRARY_PATH` with the oneCCL
   MPI lib dir, torch's own `lib` dir, any dir containing `libc10_xpu.so`, and
   conda/venv `lib` dirs.
- Validates kernel imports before running any test: imports `torch`, `triton`,
   `vllm_xpu_kernels`, `triton.backends`, and the compiled extensions
   `vllm_xpu_kernels._C`, `_moe_C`, `_xpu_C`, and prints `torch.xpu.is_available()` /
   `device_count()`. On import failure it prints diagnostics (`sys.executable`,
   `sys.prefix`, torch origin, `LD_LIBRARY_PATH`, discovered `libc10_xpu.so` paths) and
   exits non-zero before pytest ever runs.
- Ensures `pytest` is installed (falls back to `pip install pytest` if missing).
- Runs `pytest -v -s tests` with `XPU_KERNEL_TEST_SCOPE=<scope>`, writing
   `pytest.junit.xml` under `TEST_RESULTS_DIR` (mounted from
   `test-results/kernel-ci` by the Jenkins pipeline).
- Skips `tests/test_cache.py` automatically if that file exists.
- Appends `EXTRA_PYTEST_ARGS` (space-split) plus any extra CLI arguments passed to the
   script, so both Jenkins parameters and manual local runs can narrow test selection.

This is the layer that actually enforces "does the built kernel import and run", not
just "does it compile" — a wheel that builds successfully can still fail here if the
runtime `LD_LIBRARY_PATH`/XPU driver setup is wrong.

## Default Behavior

- Default platform is `VLLM_XPU_KERNEL_PLATFORM=cri`.
- For `cri`, if `BUILD_ON_SIMULATOR_CRI` is empty, CI sets it to `1` by default.
- If `MAX_JOBS` is not set, the build script uses about 75% of host CPUs and caps it with `VLLM_XPU_KERNEL_MAX_JOBS_CAP`.
- If `ccache` is available, CI enables it automatically.
- If `CCACHE_HOST_DIR` is provided, it is reused across runs.
- `RUN_TESTS` defaults to `true`. Set it to `false` to build only and skip the test stage/node.
- On compiler crash, the build retries once with `VLLM_XPU_KERNEL_RETRY_ON_COMPILER_CRASH=1` (default), falling back to `MAX_JOBS=1`, `VERBOSE=1`, `CCACHE_DISABLE=true`.

## Kernel Config Defaults

- Current PR CI defaults are:
   `VLLM_CHUNK_PREFILL_CONFIG=chunk_prefill_default.conf`
- Current PR CI defaults are also:
   `VLLM_PAGED_DECODE_CONFIG=paged_decode_default.conf`
- This avoids accidental fallback to full kernel build coverage in normal PR validation.

Why this matters:

- `chunk_prefill_full.conf`: 216 combinations
- `paged_decode_full.conf`: 384 combinations
- `chunk_prefill_default.conf`: about 13 combinations
- `paged_decode_default.conf`: about 24 combinations
- Full config significantly increases compile time, so PR CI now defaults to the reduced config footprint.

## Main Parameters

- `BUILD_NODE_LABEL`
   Jenkins label for build stage.
- `TEST_NODE_LABEL`
   Jenkins label for test stage.
- `RUN_TESTS` (default `true`)
   When `false`, the test node/stage is skipped entirely after build; only the wheel is built and archived.
- `TEST_SCOPE`
   Passed through as `XPU_KERNEL_TEST_SCOPE` to [ci/run_kernel_ut.sh](../ci/run_kernel_ut.sh) to control UT scope.
- `MAX_JOBS`
   Manual override for build parallelism.
- `VLLM_XPU_KERNEL_MAX_JOBS_CAP` (default `64`)
   Upper bound applied when `MAX_JOBS` is auto-detected from host CPU count.
- `CCACHE_HOST_DIR`
   Persistent ccache directory on Jenkins host.
- `NO_CACHE` (default `false`)
   Disable Docker build layer cache when building the CI image.
- `VLLM_XPU_KERNEL_PLATFORM`
   Platform mode such as `cri` or `nvl`.
- `BUILD_ON_SIMULATOR_CRI`
   Override CRI simulator flag.
- `VLLM_CHUNK_PREFILL_CONFIG`
   Chunk prefill kernel config preset or custom config file.
- `VLLM_PAGED_DECODE_CONFIG`
   Paged decode kernel config preset or custom config file.
- `VLLM_XPU_KERNEL_RETRY_ON_COMPILER_CRASH` (default `1`)
   Whether to retry once with reduced parallelism/ccache disabled after a compiler crash.
- `PREBUILT_KERNEL_WHL`
   Path or URL to a prebuilt wheel to reuse instead of building from source.
- `EXTRA_ENV`
   Extra environment variables for the build, for example `FOO=1 BAR=2`.
- `EXTRA_PYTEST_ARGS`
   Extra pytest selection or verbosity arguments.
- `KEEP_WORKSPACE`
   Keep Jenkins workspace after run for debugging.
- `DOCKER_IMAGE_NAME` / `DOCKERFILE_PATH` / `BASE_IMAGE`
   Build image name, Dockerfile path, and optional base image for the CI runtime.
   If `BASE_IMAGE` is set, the script reuses or pulls that image and skips the local Dockerfile build path; otherwise it builds the CI image from `DOCKERFILE_PATH`.
- `NODE_PROXY` / `BUILD_TIMEOUT_HOURS`
   Proxy used inside the build/test containers, and build stage timeout in hours.
- `GIT_CREDENTIAL_ID`
   Jenkins credential ID used for private dependency clones (for example cutlass, oneDNN).
- `WORKSPACE_RECLAIM_IMAGE`
   Image used to reclaim workspace file ownership before checkout/cleanup.
- `UPLOAD_WHL_TO_ARTIFACTORY` (default `true`)
   Whether to upload the built wheel to Artifactory after a successful build.
- `ARTIFACTORY_UPLOAD_PATH`
   Explicit override for the Artifactory subpath. If unset, the subpath is derived from the trigger kind (see Artifact Publishing above).
- `UPLOAD_ARTIFACTORY_CREDENTIAL_ID` / `UPLOAD_ARTIFACTORY_CREDENTIALS`
   Jenkins credential ID (username/password) or raw credentials string used to authenticate the Artifactory upload.
- `ENABLE_PR_AUTOMATIC_TRIGGER` / `ENABLE_PR_MERGE_TRIGGER` / `ENABLE_PR_COMMENT_TRIGGER` (default `true`)
   Per-trigger-kind kill switches; set to `false` to make the pipeline skip (`NOT_BUILT`) runs of that kind.
- `FORCE_TRIGGER_KIND`
   Manually force `TRIGGER_KIND_VALUE` to `pr_auto`, `pr_merge`, `comment`, or `manual` for testing.

## Recommended Usage

- Default PR validation:
   use the default settings. This is the recommended path for normal PR checks.
- Faster repeated builds:
   set `CCACHE_HOST_DIR` to a persistent location.
- Debug slow or unstable builds:
   lower `MAX_JOBS`, keep workspace, and inspect archived logs.
- Build-only validation (skip UT):
   set `RUN_TESTS=false` to save test-node time when only the wheel build needs checking.
- Broader kernel coverage validation:
   explicitly set both kernel config variables to `full.conf` only when needed.

Example for a fast PR-oriented run:

```text
BUILD_NODE_LABEL=bmg816790_8card
TEST_NODE_LABEL=bmg816790_8card
TEST_SCOPE=ci
CCACHE_HOST_DIR=/mnt/ccache/vllm-xpu-kernels
VLLM_XPU_KERNEL_PLATFORM=cri
VLLM_CHUNK_PREFILL_CONFIG=chunk_prefill_default.conf
VLLM_PAGED_DECODE_CONFIG=paged_decode_default.conf
```

Example for broader coverage investigation:

```text
TEST_SCOPE=ci
MAX_JOBS=16
KEEP_WORKSPACE=true
VLLM_CHUNK_PREFILL_CONFIG=chunk_prefill_full.conf
VLLM_PAGED_DECODE_CONFIG=paged_decode_full.conf
```

## Archived Outputs

- `logs/**`
- `dist/*.whl`
- `test-results/**`

Important files to check:

- `logs/kernel-ci/merge_precheck.log`
- `logs/kernel-ci/build-wheel.log`
- `logs/kernel-ci/run-tests.log`
- `logs/kernel-wheel-build.log`
- `logs/kernel-wheel-build.retry.log`
- `test-results/kernel-ci/*`

## References

- [ci/Jenkinsfile.groovy](../ci/Jenkinsfile.groovy)
- [ci/run_kernel_ci.sh](../ci/run_kernel_ci.sh)
- [ci/run_kernel_ut.sh](../ci/run_kernel_ut.sh)