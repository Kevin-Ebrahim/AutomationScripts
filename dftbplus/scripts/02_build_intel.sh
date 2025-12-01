#!/bin/bash
# scripts/02_build_intel.sh

VERSION="24.1"
INSTALL_PREFIX="$HOME/benchmarks/dftbplus/${VERSION}"
SRC_DIR="dftbplus_src"
BUILD_DIR="_build_intel"

# Stop on error
set -e

# --- 1. Download ---
if [ ! -d "$SRC_DIR" ]; then
    echo "Cloning DFTB+..."
    git clone https://github.com/dftbplus/dftbplus.git "$SRC_DIR"
fi

echo "Updating submodules..."
cd "$SRC_DIR"
git submodule update --init --recursive
./utils/get_opt_externals
cd ..

# --- 2. Configure with CMake (Using MPI Wrappers) ---
# We intentionally use mpiicx / mpiifx to guarantee correct MPI linking
echo "Configuring CMake with Intel MPI Wrappers..."

cmake -B "$BUILD_DIR" -S "$SRC_DIR" \
      -DCMAKE_INSTALL_PREFIX="$INSTALL_PREFIX" \
      -DCMAKE_C_COMPILER=mpiicx \
      -DCMAKE_Fortran_COMPILER=mpiifx \
      -DWITH_OMP=TRUE \
      -DWITH_MPI=TRUE \
      -DWITH_SCLA=TRUE \
      -DWITH_API=OFF \
      -DBUILD_TESTING=OFF \
      -DBUILD_SHARED_LIBS=TRUE \
      -DWITH_LAPACK=TRUE \
      -DENABLE_DYNAMIC_LOADING=TRUE \
      -DSCALAPACK_LIBRARY="-lmkl_scalapack_lp64 -lmkl_blacs_intelmpi_lp64" \
      -DLAPACK_LIBRARY="-lmkl_intel_lp64 -lmkl_intel_thread -lmkl_core -liomp5 -lpthread -lm -ldl" \
      -DBLAS_LIBRARY="-lmkl_intel_lp64 -lmkl_intel_thread -lmkl_core -liomp5 -lpthread -lm -ldl"

# --- 3. Build ---
# NOTE: We use -j4 to prevent running out of RAM.
# -ipo requires huge memory during the linking stage.
echo "Building with 4 threads (safe for headnode RAM)..."

if cmake --build "$BUILD_DIR" -- -j4; then
    echo "Build Successful."
else
    echo "----------------------------------------------------"
    echo "❌ Build Failed in parallel."
    echo "Retrying with -j1 to show the actual error message..."
    echo "----------------------------------------------------"
    cmake --build "$BUILD_DIR" -- -j1 || exit 1
fi

# --- 4. Install ---
echo "Installing..."
cmake --install "$BUILD_DIR"

echo "-----------------------------------------------------"
echo "Build Complete. Binary located at:"
echo "$INSTALL_PREFIX/bin/dftb+"
echo "-----------------------------------------------------"
