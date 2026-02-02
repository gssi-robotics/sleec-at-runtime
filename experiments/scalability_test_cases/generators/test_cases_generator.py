#!/usr/bin/env python3
"""Generate test case JSON files.

Usage examples:
  python3 test_cases_generator.py --name ariec -r 2 -c 2 -n 3

The output file is written to ./test_cases/<name>_<R>_<C>.json
"""
import argparse
import json
import os
import random

def generate_test_cases(name: str, R: int, C: int, N: int, out_dir: str) -> str:
    total = R * C
    test_cases = []

    for tid in range(1, N + 1):
        # indices that follow the pattern 1, C+1, 2C+1, ... (1-based)
        special_indices = list(range(1, total + 1, C))
        chosen = random.choice(special_indices) if special_indices else None

        conditions = {}
        for idx in range(1, total + 1):
            if idx in special_indices:
                val = (idx == chosen)
            else:
                val = random.choice([True, False])
            conditions[f"condition{idx}"] = val

        test_cases.append({"id": tid, "conditions": conditions})

    payload = {"test_cases": test_cases}

    os.makedirs(out_dir, exist_ok=True)
    filename = f"{name}_{R}_{C}.json"
    path = os.path.join(out_dir, filename)
    with open(path, "w") as f:
        json.dump(payload, f, indent=4)
    return path


def main(argv=None):
    parser = argparse.ArgumentParser(description="Generate test case JSON files")
    parser.add_argument("--name", type=str, required=True, help="base name for the file")
    parser.add_argument("-r", "--rules", type=int, required=True, help="number of rules (R)")
    parser.add_argument("-c", "--clauses", type=int, required=True, help="number of clauses per rule (C)")
    parser.add_argument("-n", "--num", type=int, required=True, help="number of test cases (N)")
    parser.add_argument("-o", "--out", default="test_cases", help="Output directory relative to script (default: test_cases)")
    args = parser.parse_args(argv)

    name = args.name
    R = args.rules
    C = args.clauses
    N = args.num

    script_dir = os.path.dirname(os.path.abspath(__file__))
    out_dir = os.path.join(script_dir, args.out)
    out_path = generate_test_cases(name, R, C, N, out_dir)
    print(f"Wrote {out_path}")


if __name__ == "__main__":
    main()
