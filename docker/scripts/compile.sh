#!/bin/bash
set -e

# Get the absolute path of the sources
SRC_DIR=$(cd "$(dirname "${.}")" && pwd)

docker run --rm \
    -v "${SRC_DIR}":/project \
    ubuntu-dev \
    bash -c "cd src && mkdir -p build && cd build && cmake .. && make"

echo "Compilation done"
