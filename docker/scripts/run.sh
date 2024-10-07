#!/bin/bash
set -e

if [ "$#" -lt 1 ]; then
    echo "Usage: $0  [arguments]"
    exit -1
fi

PROG_PATH=$(realpath "$1")
PROG_DIR=$(dirname "${PROG_PATH}")
PROG_NAME=$(basename "${PROG_PATH}")
shift  # Retire le premier argument

docker run --rm \
    -v "${PROG_DIR}":/projet \
    ubuntu-dev \
    "/projet/${PROG_NAME}" "$@"