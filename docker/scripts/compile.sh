#!/bin/bash
set -e

if [ "$#" -lt 1 ]; then
    echo "Usage: $0  [options_g++]"
    exit -1
fi

SOURCE_FILE=$1
shift  # Retire le premier argument, laissant les options g++ éventuelles

# Obtient le chemin absolu du répertoire source
SRC_DIR=$(cd "$(dirname "${SOURCE_FILE}")" && pwd)
SOURCE_NAME=$(basename "${SOURCE_FILE}")
OUTPUT_NAME="${SOURCE_NAME%.*}"  # Retire l'extension .cpp

docker run --rm \
    -v "${SRC_DIR}":/projet \
    ubuntu-dev \
    bash -c "g++ /projet/${SOURCE_NAME} -o /projet/${OUTPUT_NAME} $*"

echo "Compilation terminée. Binaire créé : ${OUTPUT_NAME}"