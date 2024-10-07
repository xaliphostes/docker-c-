#!/bin/bash
set -e

# Chemin vers le Dockerfile
DOCKER_PATH=$(dirname "$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)")

# Construction de l'image ubuntu-dev
docker build -t ubuntu-dev "$DOCKER_PATH"

echo "Image Docker 'ubuntu-dev' construite avec succès"
