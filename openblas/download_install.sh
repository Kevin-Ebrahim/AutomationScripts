#!/bin/bash

set -euo pipefail

export GCC=$HOME/compilers/gcc/gcc-15.2.0
export PATH="$GCC/bin:$PATH"
export LD_LIBRARY_PATH="$GCC/lib64:$LD_LIBRARY_PATH"

mkdir -p "$HOME/tools/libraries/src" "$HOME/tools/libraries/openblas/0.3.30"
cd "$HOME/tools/libraries/src"
git clone https://github.com/xianyi/OpenBLAS.git openblas-0.3.30
cd openblas-0.3.30

# BLAS only (no LAPACK), OpenMP threads, portable kernels
make -j"$(nproc)" CC="$GCC/bin/gcc" DYNAMIC_ARCH=1 USE_OPENMP=1 NO_STATIC=1
make PREFIX="$HOME/tools/libraries/openblas/0.3.30" install
