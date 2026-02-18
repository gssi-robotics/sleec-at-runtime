#!/usr/bin/env python3
"""Test configurator for uploading/starting models and libraries on the ASMeta server.

Usage: test_configurator.py -n NAME -c CONDITIONS -d DEPLOYMENT

DEPLOYMENT: 'ros' -> localhost, 'docker' -> asmeta-server

This script follows the steps described in the task: clears running models and uploaded
models/libraries (except StandardLibrary.asm), uploads a SLEECLibrary_<C>.asm and
NAME.asm, starts the model and prints final lists.
"""

from __future__ import annotations

import argparse
import json
import sys
from pathlib import Path
from typing import Dict, List

import requests


def parse_args():
    p = argparse.ArgumentParser(description="Configure and start a test model on ASMeta server")
    p.add_argument("-n", "--name", required=True, help="Model name (without .asm)")
    p.add_argument("-c", "--conditions", required=True, type=int, help="Conditions number to select library variant")
    p.add_argument("-d", "--deployment", required=True, choices=["ros", "docker"], help="Deployment target: 'ros' or 'docker'")
    return p.parse_args()


def host_for_deployment(deployment: str) -> str:
    if deployment == "ros":
        return "localhost"
    if deployment == "docker":
        return "asmeta-server"
    raise ValueError(f"Unsupported deployment: {deployment}")


def get_json_or_raise(url: str, **kwargs):
    r = requests.get(url, **kwargs)
    r.raise_for_status()
    return r.json()


def main():
    args = parse_args()
    host = host_for_deployment(args.deployment)
    base = f"http://{host}:8080"

    # 1. GET running models
    try:
        running = get_json_or_raise(f"{base}/running-models", timeout=10)
    except Exception as e:
        print(f"ERROR: failed to get running models: {e}")
        sys.exit(2)

    models_map: Dict[str, str] = running.get("models", {})
    print("Found running models:", json.dumps(models_map))

    # 2. Stop running models one by one
    for model_id in list(models_map.keys()):
        try:
            r = requests.delete(f"{base}/stop-model", params={"id": model_id}, timeout=10)
            print(f"Stop model id={model_id}: {r.status_code} {r.text}")
        except Exception as e:
            print(f"WARNING: failed to stop model {model_id}: {e}")

    # 3. GET model-list
    try:
        model_list = get_json_or_raise(f"{base}/model-list", timeout=10)
    except Exception as e:
        print(f"ERROR: failed to get model list: {e}")
        sys.exit(3)

    models: List[str] = model_list.get("models", [])
    libraries: List[str] = model_list.get("libraries", [])
    print("Uploaded models:", models)
    print("Uploaded libraries:", libraries)

    # 4. Delete uploaded models one by one
    for model in models:
        try:
            r = requests.delete(f"{base}/delete-model", params={"name": model}, timeout=10)
            print(f"Delete model {model}: {r.status_code} {r.text}")
        except Exception as e:
            print(f"WARNING: failed to delete model {model}: {e}")

    # 5. Delete uploaded libraries one by one, except StandardLibrary.asm
    for lib in libraries:
        if lib == "StandardLibrary.asm":
            print("Skipping StandardLibrary.asm")
            continue
        try:
            r = requests.delete(f"{base}/delete-library", params={"name": lib}, timeout=10)
            print(f"Delete library {lib}: {r.status_code} {r.text}")
        except Exception as e:
            print(f"WARNING: failed to delete library {lib}: {e}")

    # 6. Upload library SLEECLibrary_C.asm from ../libraries
    repo_root = Path(__file__).resolve().parent.parent
    libraries_dir = repo_root / "libraries"
    lib_filename = f"SLEECLibrary_{args.conditions}.asm"
    lib_path = libraries_dir / lib_filename
    if not lib_path.exists():
        print(f"ERROR: library file not found: {lib_path}")
        sys.exit(4)
    with open(lib_path, "rb") as file:
        files = {"file": file}
        try:
            r = requests.post(f"{base}/upload-library", files=files, timeout=30)
            print(f"Upload library {lib_filename}: {r.status_code} {r.text}")
        except Exception as e:
            print(f"ERROR: failed to upload library {lib_filename}: {e}")
            sys.exit(6)

    # 7. Upload model NAME.asm from ../models
    models_dir = repo_root / "models"
    model_filename = f"{args.name}.asm"
    model_path = models_dir / model_filename
    if not model_path.exists():
        print(f"ERROR: model file not found: {model_path}")
        sys.exit(7)
    with open(model_path, "rb") as file:
        files = {"file": file}
        try:
            r = requests.post(f"{base}/upload-model", files=files, timeout=30)
            print(f"Upload model {model_filename}: {r.status_code} {r.text}")
        except Exception as e:
            print(f"ERROR: failed to upload model {model_filename}: {e}")
            sys.exit(9)

    # 8. Start the model NAME.asm
    try:
        r = requests.post(f"{base}/start", params={"name": model_filename}, timeout=10)
        print(f"Start model {model_filename}: {r.status_code} {r.text}")
    except Exception as e:
        print(f"ERROR: failed to start model {model_filename}: {e}")
        sys.exit(10)

    # 9. Check lists and running models and print them
    try:
        final_models = get_json_or_raise(f"{base}/model-list", timeout=10)
        final_running = get_json_or_raise(f"{base}/running-models", timeout=10)
    except Exception as e:
        print(f"ERROR: failed to get final lists: {e}")
        sys.exit(11)

    print("Final uploaded models:", final_models.get("models", []))
    print("Final uploaded libraries:", final_models.get("libraries", []))
    print("Final running models:", final_running.get("models", {}))


if __name__ == "__main__":
    main()
