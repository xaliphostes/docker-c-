# Introduction
This repos helps you to understand how to compile C++ code for Linux under **any**
platform (macOs, Window$, Linux flavor), install the generated binary and run it with arguments.

It uses docker images and containers.

# Usage

## First step

1. **Make the scripts executable**
```bash
chmod +x docker/scripts/*.sh
```

2. **Creation of the `ubuntu-dev` image**
```bash
./docker/scripts/build.sh
```

## Daily use

1. **Compile the C++ program**
```bash
./docker/scripts/compile.sh src/main.cpp
```
The generated binary is in the `src` folder.

2. **Execute the compiled program**
```bash
./docker/scripts/run.sh src/main
```
The output file is in the `src` folder.

## Examples

1. **Compile with options**
```bash
./docker/scripts/compile.sh src/main.cpp -O2 -Wall
```

2. **Execute with arguments**
```bash
./docker/scripts/run.sh src/main arg1 arg2
```

## Practical advices

1. **Useful alias** (to be added to `~/.bashrc` or `~/.zshrc`)
```bash
alias docker-build='~/project_dev/docker/scripts/build.sh'
alias docker-compile='~/project_dev/docker/scripts/compile.sh'
alias docker-run='~/project_dev/docker/scripts/run.sh'
```

2. **Interactif shell in the contener**
```bash
docker run -it --rm -v "$(pwd)":/project ubuntu-dev bash
```
