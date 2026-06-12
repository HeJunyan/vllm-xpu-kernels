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


def pytest_collection_modifyitems(config, items):
    """In mini scope, only keep test_wan22_kernels_mini.py from wan_ut."""
    if not _is_mini_scope():
        return

    items[:] = [item for item in items if "test_wan22_kernels_mini" in item.nodeid]


def pytest_sessionfinish(session, exitstatus):
    """Generate report after all tests complete."""
    try:
        import test_wan22_kernels_ops_bf16

        if test_wan22_kernels_ops_bf16.TEST_RESULTS:
            test_wan22_kernels_ops_bf16.generate_markdown_report()
    except Exception as e:
        print(f"Warning: Could not generate report: {e}")
