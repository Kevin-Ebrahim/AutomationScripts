#!/bin/bash

set -euo pipefail

GCC_VERSION="${GCC_VERSION:-15.2.0}"

SRC_ROOT="${SRC_ROOT:-$HOME/tmp}"
GCC_SRC_DIR="${GCC_SRC_DIR:-$SRC_ROOT/gcc-$GCC_VERSION}"

# Build directory
BUILD_ROOT="${BUILD_ROOT:-$HOME/software}"
BUILD_DIR="${BUILD_DIR:-$BUILD_ROOT/gcc-$GCC_VERSION-build}"

# Install prefix
GCC_PREFIX="${GCC_PREFIX:-/opt/gcc/$GCC_VERSION}"

# Languages to build
GCC_LANGS="${GCC_LANGS:-c,c++,fortran}"

# Optimization flags
GCC_OPT_FLAGS="${GCC_OPT_FLAGS:--O3 -march=native -mtune=native}"

mkdir -p "$BUILD_ROOT"

echo "GCC source dir:    $GCC_SRC_DIR"
echo "Build directory:   $BUILD_DIR"
echo "Install prefix:    $GCC_PREFIX"
echo "Languages:         $GCC_LANGS"
echo "Opt flags:         $GCC_OPT_FLAGS"
echo

if [[ ! -d "$GCC_SRC_DIR" ]]; then
    echo "ERROR: GCC source directory '$GCC_SRC_DIR' not found. Run gcc15_download.sh first." >&2
    exit 1
fi

mkdir -p "$BUILD_DIR"
cd "$BUILD_DIR"

# Reconfiguring
if [[ -f config.log ]]; then
    echo "config.log exists; re-running configure in $BUILD_DIR"
fi

# Environment flags
export CFLAGS="$GCC_OPT_FLAGS"
export CXXFLAGS="$GCC_OPT_FLAGS"
export FCFLAGS="$GCC_OPT_FLAGS"

# Host compilers
export CC="${CC:-gcc}"
export CXX="${CXX:-g++}"
export FC="${FC:-gfortran}"

echo "Running configure..."
"$GCC_SRC_DIR/configure" \
    --prefix="$GCC_PREFIX" \
    --enable-languages="$GCC_LANGS" \
    --disable-multilib \
    --enable-bootstrap \
    --enable-checking=release \
    --enable-lto \
    --enable-default-pie \
    --enable-default-ssp

echo
echo "Configure finished successfully."
echo "Next step: run gcc15_build_install.sh"
