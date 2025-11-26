#!/bin/bash

set -euo pipefail

trap 'ec=$?; (( ec != 0 )) && echo "Configure failed (exit $ec)." >&2' EXIT
trap 'echo "Script interrupted" >&2; exit 2' INT TERM

GCC_VERSION="15.2.0"

# Source tree
SRC_ROOT="$HOME/compilers/gcc"
GCC_SRC_DIR="$SRC_ROOT/gcc-$GCC_VERSION"

# Build directory
WORK="/var/tmp/gcc-${GCC_VERSION}-work"
BUILD="${WORK}/build"

# Install prefix
GCC_PREFIX="$HOME/compilers/gcc/gcc-${GCC_VERSION}"

# Languages to build
GCC_LANGS="c,c++,fortran"

# Optimization flags
GCC_OPT_FLAGS="-O2 -pipe"

echo "GCC source dir:    $GCC_SRC_DIR"
echo "Work directory:    $WORK"
echo "Build directory:   $BUILD"
echo "Install prefix:    $GCC_PREFIX"
echo "Languages:         $GCC_LANGS"
echo "Opt flags:         $GCC_OPT_FLAGS"
echo

if [[ ! -d "$GCC_SRC_DIR" ]]; then
    echo "ERROR: GCC source directory '$GCC_SRC_DIR' not found. Run download.sh first." >&2
    exit 1
fi

echo "Fetching GCC prerequisites"
(
    cd "$GCC_SRC_DIR"
    ./contrib/download_prerequisites
)

# Fresh work tree
rm -rf "$WORK"
mkdir -p "$BUILD"
cd "$BUILD"

# Environment flags
export CFLAGS="$GCC_OPT_FLAGS"
export CXXFLAGS="$GCC_OPT_FLAGS"
export FCFLAGS="$GCC_OPT_FLAGS"

# Host compilers
export CC="gcc"
export CXX="g++"
export FC="gfortran"

echo "Running configure..."
"$GCC_SRC_DIR/configure" \
    --prefix="$GCC_PREFIX" \
    --enable-languages="$GCC_LANGS" \
    --disable-multilib \
    --enable-bootstrap

echo
echo "Configure finished successfully."
echo "Next step: run install.sh"
