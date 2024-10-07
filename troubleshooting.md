# Troubleshooting Guide

## Common Issues and Solutions

1. **Binary doesn't run on macOS**
   - Normal: the binary is compiled for Linux
   - Solution: always use `run.sh` to execute

2. **Permission errors**
   - Issue: files created as root in the container
   - Solution: add `-u $(id -u):$(id -g)` to docker commands

3. **Slow performance**
   - Cause: volume synchronization can be slow
   - Solution: use a Docker volume for object files

## Customization Examples

1. **Dockerfile with more tools**
```dockerfile
FROM ubuntu:latest

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    build-essential \
    gcc \
    g++ \
    gdb \
    cmake \
    make \
    valgrind \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /project
```

2. **Compilation script with tests**
```bash
#!/bin/bash
set -e

./docker/scripts/compile.sh src/main.cpp -Wall -Wextra

echo "Running tests..."
./docker/scripts/run.sh src/main test
```