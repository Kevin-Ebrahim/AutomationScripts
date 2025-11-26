#!/bin/bash

set -euo pipefail

AMBER_BASE="$HOME/benchmarks/amber"
SRC_DIR="$AMBER_BASE/pmemd24_src"
BUILD_DIR="$SRC_DIR/build"

if [[ ! -d "$SRC_DIR" ]]; then
    echo "Nothing to clean. $SRC_DIR found."
    exit 0
fi

echo "Cleaning AmberMD in:"
echo "  source: $SRC_DIR"
echo "  build : $BUILD_DIR"
echo "  install: $SRC_DIR"

# Clean CMake build artifacts
if [[ -d "$BUILD_DIR" ]]; then
    if [[ -x "$BUILD_DIR/clean_build" ]]; then
        # auto-confirm its prompt
        yes | "$BUILD_DIR/clean_build" || true
    else
        rm -rf "$BUILD_DIR"/{CMakeCache.txt,CMakeFiles,cmake.log,cmake_install.cmake,Makefile} 2>/dev/null || true
    fi
fi

# Remove installed prefix (this takes the pmemd.MPI binary with it)
if [[ -d "$SRC_DIR" ]]; then
    rm -rf --one-file-system "$SRC_DIR"
fi

echo "Done."
