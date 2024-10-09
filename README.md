# Introduction
This repos helps you to understand how to compile C++ code for Linux under **any**
platform (macOs, Window$, Linux flavor), install the generated binary and run it with arguments.

It uses docker images and containers.

> 📝 **_NOTE:_**  The C++ program reads an input text file, capitalizes each line, and writes the result to an output file.

The project structure is as follow:
```sh
project/
├── docker/
│   ├── Dockerfile     # the unbuntu-dev image
│   ├── scripts
│   │   ├── build-ubuntu.sh   # to create the unbuntu-dev image
│   │   ├── compile.sh # to compile the c++ code using cmake
│   │   └── run.sh     # to run the generated binary with arguments
├── src/
│   ├── input.txt      # An input file for testing the C++ code
│   ├── main.cpp       # The C++ code
│   └── CMakeLists.txt # The cmake file used to compile the code 
└── dist/              # where the binary will be generated
```

# Usage

## First step

1. **Make the scripts executable**

```bash
chmod +x docker/scripts/*.sh
```

2. **Creation of the `ubuntu-dev` image**

This is done only one time.
```bash
./docker/scripts/build-ubuntu.sh
```

## Daily use

1. **Compile the C++ program**

```bash
./docker/scripts/compile.sh src/main.cpp
```
The generated binary is in the `dist` folder.

2. **Execute the compiled program**

Usage:
```bash
./docker/scripts/run.sh <inputfile> <outputfile>
```
- The inputfile must be an existing file.
- The outputfile will be generated

Example:
```bash
./docker/scripts/run.sh ./src/input.txt ./dist/result.txt
```
The output file `result.txt` will be written in the `dist` folder.

## Examples

1. **Compile with options**

```bash
./docker/scripts/compile.sh src/main.cpp -O2 -Wall
```

## Practical advices

1. **Useful alias** (to be added to `~/.bashrc` or `~/.zshrc`)

```bash
alias docker-build='~/project_dev/docker/scripts/build-ubuntu.sh'
alias docker-compile='~/project_dev/docker/scripts/compile.sh'
alias docker-run='~/project_dev/docker/scripts/run.sh'
```

2. **Interactif shell in the contener**

```bash
docker run -it --rm -v "$(pwd)":/project ubuntu-dev bash
```
