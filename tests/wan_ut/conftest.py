"""Pytest configuration for WAN 2.2 test suite."""

import os
import sys

import pytest

# Add current directory to path
sys.path.insert(0, os.path.dirname(__file__))


def _is_mini_scope():
    """Check if running in mini test scope."""
    scope = os.getenv("XPU_KERNEL_TEST_SCOPE", "").strip().lower()
    if scope == "mini":
        return True
    if os.getenv("XPU_KERNEL_PYTEST_PROFILER", "").strip().upper() == "MINI":
        return True
    return False


def pytest_ignore_collect(collection_path, config):
    """In mini scope, avoid collecting non-mini WAN test files early.

    This keeps terminal collection summary aligned with the effective test set.
    """
    if not _is_mini_scope():
        return False

    path_str = str(collection_path).replace("\\", "/")
    if "/wan_ut/" not in path_str and not path_str.startswith("wan_ut/"):
        return False

    base = os.path.basename(path_str)
    if base.startswith("test_") and base.endswith(".py"):
        return "test_wan22_kernels_mini" not in base

    return False


def pytest_collection_modifyitems(config, items):
    """In mini scope, only filter tests inside wan_ut.

    Keep non-wan_ut items unchanged so this local conftest does not
    accidentally prune the global test session.
    """
    if not _is_mini_scope():
        return

    filtered = []
    removed = []
    for item in items:
        nodeid = item.nodeid
        # Only apply mini filtering to WAN UT subtree.
        if "/wan_ut/" not in nodeid and not nodeid.startswith("wan_ut/"):
            filtered.append(item)
            continue

        if "test_wan22_kernels_mini" in nodeid:
            filtered.append(item)
        else:
            removed.append(item)

    # If any items are pruned at this stage, report them as deselected
    # so pytest terminal summary remains semantically accurate.
    if removed:
        config.hook.pytest_deselected(items=removed)

    items[:] = filtered


def pytest_sessionfinish(session, exitstatus):
    """Generate report after all tests complete."""
    try:
        import test_wan22_kernels_ops_bf16

        if test_wan22_kernels_ops_bf16.TEST_RESULTS:
            test_wan22_kernels_ops_bf16.generate_markdown_report()
    except Exception as e:
        print(f"Warning: Could not generate report: {e}")
