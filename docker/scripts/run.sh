#!/bin/bash
set -e

if [ "$#" -lt 1 ]; then
    echo "Usage: $0 <inputfile> <outputfile>"
    exit -1
fi

PROG_DIR=$(dirname $(dirname $(realpath "$1")))
PROG_NAME="project"

ls $PROG_DIR/dist

docker run --rm \
    -v "${PROG_DIR}":/project \
    ubuntu-dev \
    "/project/dist/${PROG_NAME}" "$@"
