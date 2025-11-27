#!/bin/bash

set -Eeuo pipefail

trap 'ec=$?; echo "ERROR: (exit $ec) $BASH_COMMAND" >&2; exit $ec' ERR

# --- Make Lmod 'module' available & load desired GCC ---
if [ -f /etc/profile.d/lmod.sh ]; then
    . /etc/profile.d/lmod.sh
fi

command -v module >/dev/null 2>&1 || {
    echo "ERROR: module command not found (Lmod not sourced?)" >&2
    exit 1
}

module use --append "$HOME/modulefiles"
module load gcc/15.2.0

VERSION="5.0.8"
GCC_VERSION="$(gcc -dumpfullversion 2>/dev/null || gcc -dumpversion)"

BASE_DIR="$HOME/tools/openmpi/gcc_${GCC_VERSION}"
INSTALL_PREFIX="${BASE_DIR}/openmpi-${VERSION}"

MPI_DIR="openmpi-${VERSION}"

if [[ ! -d "${BASE_DIR}/${MPI_DIR}" ]]; then
    echo "Source directory ${BASE_DIR}/${MPI_DIR} not found."
    echo "Run the download script first"
    exit 1
fi

pushd "${BASE_DIR}/${MPI_DIR}" >/dev/null

CC="$(command -v gcc)"
CXX="$(command -v g++)"
FC="$(command -v gfortran)"
export CC CXX FC

# Conservative, stable optimisation for system libs
export CFLAGS="-O2 -fPIC -pipe"
export CXXFLAGS="-O2 -fPIC -pipe"
export FFLAGS="-O2 -fPIC -pipe"
export FCFLAGS="-O2 -fPIC -pipe"

echo "Configuring Open MPI ${VERSION} with thread and Fortran support ..."
./configure \
    --prefix="${INSTALL_PREFIX}" \
    --enable-mpi-thread-multiple \
    --enable-mpi-fortran \
    --with-slurm \
    --with-pmix=internal
