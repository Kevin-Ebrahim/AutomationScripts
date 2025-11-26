#!/bin/bash

set -euo pipefail

SCRIPT_DIR="$HOME/Wits-A-2025/scripts/hpl-gcc"
"$SCRIPT_DIR/check_dependencies.sh"

# Basic parameters (override ARCH via environment if you want)
HPL_VERSION="2.3"
ARCH="${ARCH:-gcc}"

HPL_DIR="$HOME/benchmarks/hpl/hpl-${HPL_VERSION}"
BIN_DIR="$HPL_DIR/bin/$ARCH"
HPL_EXE="$BIN_DIR/xhpl"
MAKEFILE="Make.${ARCH}"

if [[ ! -d "$HPL_DIR" ]]; then
    echo "Error: HPL directory $HPL_DIR not found. Run download_hpl.sh first." >&2
    exit 1
fi

if [[ -x "$HPL_EXE" ]]; then
    echo "HPL binary already present ($HPL_EXE). Skipping rebuild."
    exit 0
fi

cd "$HPL_DIR"

# re-generate only when the target doesn’t exist
cd setup
if [[ ! -f ../$MAKEFILE ]]; then
    [[ -x make_generic ]] && ./make_generic
    cp "${F:-Make.UNKNOWN}" ../"$MAKEFILE" 2>/dev/null || cp Make.Linux_PII_CBLAS ../"$MAKEFILE"
fi
cd ..

source "$SCRIPT_DIR/spack_load_gcc.sh"
"$SCRIPT_DIR/configure_gcc_hpl.sh" "$MAKEFILE" "$ARCH" "$HPL_DIR"

# Clean only if this ARCH was built before
if [[ -d "src/auxil/${ARCH}" ]]; then
    echo "Cleaning previous build (ARCH=$ARCH)..."
    make clean arch="$ARCH"
else
    echo "No previous build for ARCH=$ARCH - skipping clean."
fi

echo "Compiling HPL..."
make arch="$ARCH"

echo "Build complete. Binary is at $HPL_EXE"
