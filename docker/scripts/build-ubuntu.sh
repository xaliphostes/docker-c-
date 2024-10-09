#!/bin/bash
set -e

# Path of the Dockerfile
DOCKER_PATH=$(dirname "$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)")

# Building the image ubuntu-dev
docker build -t ubuntu-dev "$DOCKER_PATH"

echo "Docker image 'ubuntu-dev' built with success"
