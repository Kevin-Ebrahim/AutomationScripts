#!/bin/bash

set -euo pipefail

ASCOT_VERSION="5.6.2"
ASCOT_DIR="$HOME/benchmarks/ascot/ascot5-${ASCOT_VERSION}"
ASCOT_MAIN_EXE="$ASCOT_DIR/build/ascot5_main"
ASCOT_LIB="$ASCOT_DIR/build/libascot.so"
MAKEFILE="$ASCOT_DIR/src/Makefile"

module use $HOME/modulefiles
module load hdf5/1.14.6

if [[ ! -f "$MAKEFILE" ]]; then
    echo "Error: Makefile not found at $MAKEFILE" >&2
    exit 1
fi

echo "Patching $MAKEFILE to remove -shlib flags..."

# Make a backup
cp -v "$MAKEFILE" "${MAKEFILE}.bak_shlib"

# Remove all instances of -shlib (with or without surrounding spaces)
# This keeps everything else unchanged.
sed -i 's/[[:space:]]-shlib//g' "$MAKEFILE"
echo "Done. A backup was saved as ${MAKEFILE}.bak_shlib (first run)."

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
if [[ -x "$SCRIPT_DIR/check_dependencies.sh" ]]; then
    "$SCRIPT_DIR/check_dependencies.sh"
else
    echo "Warning: dependency check script not found. Proceeding assuming system has required packages."
fi

if [[ ! -d "$ASCOT_DIR" ]]; then
    echo "Error: ASCOT5 source directory $ASCOT_DIR not found. Run download_ascot5.sh first." >&2
    exit 1
fi

if [[ -x "$ASCOT_MAIN_EXE" ]]; then
    echo "ASCOT5 main binary already exists at $ASCOT_MAIN_EXE. Skipping rebuild."
    exit 0
fi

if [[ -x "$SCRIPT_DIR/configure_ascot5.sh" ]]; then
    "$SCRIPT_DIR/configure_ascot5.sh" "$ASCOT_DIR"
fi

echo "=== Building ASCOT5 (MPI enabled) ==="
cd "$ASCOT_DIR"
CORES=$(nproc)

echo "Compiling ASCOT5 library..."
make -j"$CORES" MPI=1 CC="${CC:-h5pcc}" libascot

echo "Compiling ASCOT5 main program..."
make -j"$CORES" MPI=1 CC="${CC:-h5pcc}" ascot5_main

echo "=== Build complete ==="
if [[ -x "$ASCOT_MAIN_EXE" ]]; then
    echo "ASCOT5 main executable built successfully: $ASCOT_MAIN_EXE"
    if [[ -f "$ASCOT_LIB" ]]; then
        echo "ASCOT5 library built successfully: $ASCOT_LIB"
    fi
    echo "You can now use mpirun to execute the ASCOT5 benchmark with the compiled binary."
else
    echo "Build finished, but the expected binary $ASCOT_MAIN_EXE was not found." >&2
    exit 1
fi
