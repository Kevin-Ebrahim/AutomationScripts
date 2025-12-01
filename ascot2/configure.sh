#!/bin/bash

set -euo pipefail

ASCOT_VERSION="5.6.2"
ASCOT_DIR="$HOME/benchmarks/ascot/ascot5-${ASCOT_VERSION}"

if [[ ! -d "$ASCOT_DIR" ]]; then
    echo "Error: ASCOT5 source directory $ASCOT_DIR not found. Run download_ascot5.sh first." >&2
    exit 1
fi

echo "Configuring ASCOT5 build environment in $ASCOT_DIR..."

# Loading environement variables
module use $HOME/modulefiles
module load hdf5/1.14.6

# Ensure MPI compiler wrappers are used for building (especially for HDF5).
# The HDF5 parallel compiler (h5pcc) will automatically include correct MPI/HDF5 flags.
export CC="mpicc"
export FC="mpifort"
export HDF5_CC=$(command -v mpicc || true)
export HDF5_CLINKER=$(command -v mpicc || true)

if command -v h5pcc &>/dev/null; then
    export CC="h5pcc"
fi

echo "Configuration complete. (CC=${CC}, FC=${FC})"
