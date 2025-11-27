#!/bin/bash

set -euo pipefail

current_command=""
last_command=""

# Track last command that failed
trap 'last_command=$current_command; current_command=$BASH_COMMAND' DEBUG
trap 'ec=${ec-0}; ec=$?; if [[ ${ec} -ne 0 ]]; then echo "\"${last_command}\" failed with exit code ${ec}. Exiting."; fi' EXIT

# Make Lmod 'module' available & load desired GCC
if [ -f /etc/profile.d/lmod.sh ]; then
    . /etc/profile.d/lmod.sh
fi
module use --append "$HOME/modulefiles"
module load gcc/15.2.0

VERSION="5.0.8"
# Robust GCC version (full when available)
GCC_VERSION="$(gcc -dumpfullversion 2>/dev/null || gcc -dumpversion)"
BASE_DIR="$HOME/tools/openmpi/gcc_${GCC_VERSION}"
MPI_URL="https://download.open-mpi.org/release/open-mpi/v5.0/openmpi-${VERSION}.tar.gz"
MPI_TAR="openmpi-${VERSION}.tar.gz"
MPI_DIR="openmpi-${VERSION}"

mkdir -p "${BASE_DIR}"
pushd "${BASE_DIR}" >/dev/null

if [[ ! -f "${MPI_TAR}" ]]; then
    echo "Downloading Open MPI ${VERSION} ..."
    wget -c "${MPI_URL}" -O "${MPI_TAR}"
else
    echo "Found existing tarball ${MPI_TAR} — skipping download."
fi

if [[ ! -d "${MPI_DIR}" ]]; then
    echo "Extracting ${MPI_TAR} ..."
    tar -xzf "${MPI_TAR}"
else
    echo "Source directory ${MPI_DIR} already exists — skipping extract."
fi

popd >/dev/null
echo "Download + extract complete at ${BASE_DIR}/${MPI_DIR}"
