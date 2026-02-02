#!/usr/bin/env bash

set -e
. ./install/setup.bash

if [ $# -ne 3 ]; then
    echo "Usage: $0 <rules> <conditions> <deployment>"
    exit 1
fi

RULES="$1"
CONDITIONS="$2"
DEPLOYMENT="$3"

TEST_NAME="test_${RULES}_$CONDITIONS"
TEST_DIR="./scalability_test_cases"
LIBRARIES_DIR="$TEST_DIR/libraries"
MODELS_DIR="$TEST_DIR/models"
TEST_CASES_DIR="$TEST_DIR/test_cases"

TEST_FILE="$TEST_CASES_DIR/$TEST_NAME.json"


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

CONFIGURATORS_DIR="./scalability_test_cases/configurators"
if [ ! -d "$CONFIGURATORS_DIR" ]; then
    echo "No such directory: $CONFIGURATORS_DIR"
    exit 1
fi

LIB_FILE="$LIBRARIES_DIR/SLEECLibrary_${CONDITIONS}.asm"
MODEL_FILE="$MODELS_DIR/${TEST_NAME}.asm"

if [ ! -f "$LIB_FILE" ]; then
    echo "Library file for test missing: $LIB_FILE. Generate it using the generator."
    exit 1
fi

if [ ! -f "$MODEL_FILE" ]; then
    echo "ASM model for testing missing: $MODEL_FILE. Generate it using the generator."
    exit 1
fi

pushd "$CONFIGURATORS_DIR" >/dev/null
python3 asmeta_configurator.py -n "$TEST_NAME" -c "$CONDITIONS" -d "$DEPLOYMENT"
popd >/dev/null

sleep 1

ros2 run ari_test_runner scalability_test_runner --ros-args -p testcase_file:="$TEST_FILE_ABS"
