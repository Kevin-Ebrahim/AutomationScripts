#!/bin/bash

set -euo pipefail

GCC_VERSION="${GCC_VERSION:-15.2.0}"

BUILD_ROOT="${BUILD_ROOT:-$HOME/software}"
BUILD_DIR="${BUILD_DIR:-$BUILD_ROOT/gcc-$GCC_VERSION-build}"

# Must match configure script
GCC_PREFIX="${GCC_PREFIX:-/opt/gcc/$GCC_VERSION}"
GCC_OPT_FLAGS="${GCC_OPT_FLAGS:--O3 -march=native -mtune=native}"

MAKE_JOBS="${MAKE_JOBS:-$(nproc)}"

BOOT_CFLAGS="${BOOT_CFLAGS:-$GCC_OPT_FLAGS}"

echo "Build directory:  $BUILD_DIR"
echo "Install prefix:   $GCC_PREFIX"
echo "Make jobs:        $MAKE_JOBS"
echo "BOOT_CFLAGS:      $BOOT_CFLAGS"
echo

if [[ ! -d "$BUILD_DIR" ]]; then
    echo "ERROR: Build directory '$BUILD_DIR' not found. Run gcc15_configure.sh first." >&2
    exit 1
fi

cd "$BUILD_DIR"

echo "=== Building GCC 15.2.0 with profile-guided bootstrap ==="
echo "This may take a while..."

make -j"$MAKE_JOBS" BOOT_CFLAGS="$BOOT_CFLAGS" profiledbootstrap

echo
echo "=== Installing into $GCC_PREFIX ==="
if [[ -w "$(dirname "$GCC_PREFIX")" ]]; then
    make install
else
    echo "Install prefix parent directory not writable by current user; using sudo."
    sudo make install
fi

echo
echo "=== Sanity check ==="
if [[ -x "$GCC_PREFIX/bin/gcc" ]]; then
    "$GCC_PREFIX/bin/gcc" --version | head -n1
else
    echo "WARNING: $GCC_PREFIX/bin/gcc not found after install."
fi

cat <<EOF

Done.

To use this GCC in your shell:
  export PATH="$GCC_PREFIX/bin:\$PATH"
  export LD_LIBRARY_PATH="$GCC_PREFIX/lib64:$GCC_PREFIX/lib:\$LD_LIBRARY_PATH"

Or wire it up via an Lmod modulefile as 'gcc/15.2.0' that prepends those paths.
EOF
