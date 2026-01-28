#!/usr/bin/env bash

set -e
. ./install/setup.bash

if [ $# -ne 1 ]; then
    echo "Usage: $0 <test_name>"
    exit 1
fi

TEST_NAME="$1"
TEST_DIR="./scalabilitt_tests"
LIBRARIES_DIR="$TEST_DIR/libraries"
MODELS_DIR="$TEST_DIR/models"
TEST_FILE="$TEST_DIR/$TEST_NAME.json"


if [ ! -f "$TEST_FILE" ]; then
    echo "No such file: $TEST_FILE"
    exit 1
fi


if command -v realpath >/dev/null 2>&1; then
    TEST_FILE_ABS=$(realpath "$TEST_FILE")
else
    TEST_FILE_ABS="$(cd "$(dirname "$TEST_FILE")"; pwd)/$(basename "$TEST_FILE")"
fi

echo "Running with test file: $TEST_FILE_ABS"

ros2 run ari_test_runner testcase_runner --ros-args -p testcase_file:="$TEST_FILE_ABS"
