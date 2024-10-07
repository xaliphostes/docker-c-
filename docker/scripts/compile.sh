#!/bin/bash
set -e

if [ "$#" -lt 1 ]; then
    echo "Usage: $0  [options_g++]"
    exit -1
fi

SOURCE_FILE=$1
shift  # Remove the first argument (program name)

# Get teh absolute path of the sources
SRC_DIR=$(cd "$(dirname "${SOURCE_FILE}")" && pwd)
SOURCE_NAME=$(basename "${SOURCE_FILE}")
OUTPUT_NAME="${SOURCE_NAME%.*}"  # Remove the .cpp extension

docker run --rm \
    -v "${SRC_DIR}":/projet \
    ubuntu-dev \
    bash -c "g++ /projet/${SOURCE_NAME} -o /projet/${OUTPUT_NAME} $*"

echo "Compilation done. Binary created : ${OUTPUT_NAME}"