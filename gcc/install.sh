#!/bin/bash

set -euo pipefail

trap 'ec=$?; (( ec != 0 )) && echo "Build/install failed (exit $ec)." >&2' EXIT
trap 'echo "Script interrupted" >&2; exit 2' INT TERM

GCC_VERSION="15.2.0"

WORK="/var/tmp/gcc-${GCC_VERSION}-work"
BUILD="${WORK}/build"

GCC_PREFIX="$HOME/compilers/gcc/gcc-${GCC_VERSION}"
GCC_OPT_FLAGS="-O2 -pipe"

CORES=$(nproc)
BOOT_CFLAGS="$GCC_OPT_FLAGS"

echo "Install prefix:   $GCC_PREFIX"
echo "Build directory:  $BUILD"
echo "Cores:            $CORES"
echo "FLAGS:            $BOOT_CFLAGS"
echo

if [[ ! -d "$BUILD" ]]; then
    echo "ERROR: Build directory '$BUILD' not found. Run configure.sh first." >&2
    exit 1
fi

cd "$BUILD"

echo "=== Building GCC 15.2.0 with bootstrap ==="
echo "This may take a while..."

make -j"$CORES" BOOT_CFLAGS="$BOOT_CFLAGS" bootstrap

echo
echo "=== Installing into $GCC_PREFIX ==="
mkdir -p "$(dirname "$GCC_PREFIX")"

if [[ -w "$(dirname "$GCC_PREFIX")" ]]; then
    make -j"$CORES" install
else
    echo "Install prefix parent directory not writable by current user; using sudo."
    sudo make -j"$CORES" install
fi

echo

# modulefile
MODULE_ROOT="$HOME/modulefiles/gcc"
mkdir -p "$MODULE_ROOT"
cat >"$MODULE_ROOT"/${GCC_VERSION} <<EOF
#%Module1.0
module-whatis "GCC ${GCC_VERSION}"
set root ${GCC_PREFIX}
prepend-path PATH            \$root/bin
prepend-path LD_LIBRARY_PATH \$root/lib64
prepend-path MANPATH         \$root/share/man
EOF

echo "Tip: ensure module use --append $HOME/modulefiles is in /etc/profile.d on nodes."
echo "Done. Load with:  module load gcc/${GCC_VERSION}"

echo "=== Sanity check ==="
if [[ -x "$GCC_PREFIX/bin/gcc" ]]; then
    "$GCC_PREFIX/bin/gcc" --version | head -n1
else
    echo "WARNING: $GCC_PREFIX/bin/gcc not found after install."
fi
