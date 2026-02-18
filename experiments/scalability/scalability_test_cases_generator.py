#!/usr/bin/env python3
"""Orchestrate generation of SLEECLibrary, ASM model and test cases.

Usage: scalability_test_cases_generator.py -r R -c C -n N

This script calls the generator modules under `generators/`.
"""
from __future__ import annotations
import argparse
import os
from pathlib import Path

from generators import asm_generator, SLEECLibrary_generator, test_cases_generator

test_case_name = "test"

def generate_all(R: int, C: int, N: int, base_dir: str | None = None) -> dict:
    """Generate SLEECLibrary (up to C), ASM model and N test cases.

    Returns a dict with paths: {'sleeclib': Path, 'asm': Path, 'test_cases': Path}
    """
    global test_case_name
    script_dir = Path(__file__).parent
    if base_dir:
        base = Path(base_dir)
    else:
        base = script_dir

    libs_dir = base / "libraries"
    models_dir = base / "models"
    tests_dir = base / "test_cases"

    sleeclib_path = SLEECLibrary_generator.generate_sleeclibrary(C, libs_dir)
    asm_path = asm_generator.generate_and_write(test_case_name, R, C, str(models_dir))
    testcases_path = test_cases_generator.generate_test_cases(test_case_name, R, C, N, str(tests_dir))

    return {"sleeclib": Path(sleeclib_path), "asm": Path(asm_path), "test_cases": Path(testcases_path)}


def main(argv=None):
    parser = argparse.ArgumentParser(description="Generate scalability test artifacts.")
    parser.add_argument("-r", "--rules", type=int, required=True, help="number of rules (R)")
    parser.add_argument("-c", "--clauses", type=int, required=True, help="number of clauses per rule (C)")
    parser.add_argument("-n", "--num", type=int, required=True, help="number of test cases (N)")
    parser.add_argument("--out", default=None, help="base output dir (defaults to script dir)")
    args = parser.parse_args(argv)

    res = generate_all(args.rules, args.clauses, args.num, args.out)
    print("Generation complete:")
    print(f" SLEECLibrary: {res['sleeclib']}")
    print(f" ASM model:    {res['asm']}")
    print(f" Test cases:   {res['test_cases']}")


if __name__ == "__main__":
    raise SystemExit(main())
