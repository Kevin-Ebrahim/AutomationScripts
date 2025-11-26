#!/bin/bash

set -euo pipefail

# Paths
AMBER_VERSION="${AMBER_VERSION:-24}"
SRC_DIR="$HOME/benchmarks/amber/pmemd24_src"
PMEMD_BIN="$SRC_DIR/bin/pmemd.MPI"
SCRIPT_DIR="$HOME/Wits-A-2025/scripts/ambermd"

# Preconditions
[[ -d "$SRC_DIR" ]] || {
    echo "Error: source dir not found: $SRC_DIR"
    exit 1
}
[[ -d "$SRC_DIR/build" ]] || {
    echo "Error: build dir not found: $SRC_DIR/build"
    exit 1
}

[[ -d "$SCRIPT_DIR" ]] || {
    echo "Error: script dir not found: $SCRIPT_DIR"
    exit 1
}

if [[ -x "$PMEMD_BIN" ]]; then
    echo "pmemd.MPI already exists at $PMEMD_BIN. Skipping."
    exit 0
fi

# Optional patches
if [[ -x "$SRC_DIR/update_amber" ]]; then
    echo "Applying Amber updates (if any)..."
    yes | "$SRC_DIR/update_amber" --update || echo "Warning: update_amber failed or offline; continuing."
fi

# Configure (CPU-only, MPI, PMEMD only)
cd "$SRC_DIR/build"

unset AMBERHOME CUDA_HOME CUDA_PATH CUDA_TOOLKIT_ROOT_DIR

# Clean any stale CMake cache
rm -rf CMakeCache.txt CMakeFiles cmake.log cmake_install.cmake Makefile

rm -f run_cmake
cp "$SCRIPT_DIR/run_cmake" .

# Ensure run_cmake exists
[[ -x ./run_cmake ]] || {
    echo "Error: $SRC_DIR/build/run_cmake not found/executable"
    exit 1
}
./run_cmake

# Build & install
echo "Building and installing PMEMD (this may take a while)..."
make install -j"$(nproc)"

# Verify
if [[ -x "$PMEMD_BIN" ]]; then
    echo "Build complete. PMEMD MPI binary: $PMEMD_BIN"
else
    echo "Error: pmemd.MPI not found after build." >&2
    exit 1
fi
