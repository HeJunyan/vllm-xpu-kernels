#!/usr/bin/env python3
# SPDX-License-Identifier: Apache-2.0
"""Compute the average of `activated_experts` values found in a log file.

Usage:
    python avg_activated_experts.py [logfile]

If logfile is omitted, defaults to logs/run.log relative to this script.
"""
import sys
from pathlib import Path

import regex as re

PATTERN = re.compile(r"activated_experts\s+(-?\d+(?:\.\d+)?)")


def compute_average(log_path: Path):
    values = []
    with log_path.open("r", encoding="utf-8", errors="ignore") as f:
        for line in f:
            match = PATTERN.search(line)
            if match:
                values.append(float(match.group(1)))
    return values


def main():
    log_path = Path(sys.argv[1]) \
        if len(sys.argv) > 1 else Path(__file__).parent / "logs" / "run.log"

    if not log_path.exists():
        print(f"Log file not found: {log_path}", file=sys.stderr)
        sys.exit(1)

    values = compute_average(log_path)

    if not values:
        print("No 'activated_experts' entries found.")
        sys.exit(0)

    avg = sum(values) / len(values)
    print(f"count: {len(values)}")
    print(f"min: {min(values)}")
    print(f"max: {max(values)}")
    print(f"average: {avg:.4f}")


if __name__ == "__main__":
    main()
