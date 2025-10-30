#!/bin/bash

set -euo pipefail

MAKEFILE="$1"
ARCH="$2"
HPL_DIR="$3"


# System OpenMPI
MPICC="/usr/bin/mpicc"
MPIRUN="/usr/bin/mpirun"
if [[ ! -x "$MPICC" ]]; then
    echo "ERROR: /usr/bin/mpicc not found. Install openmpi-bin (apt) or fix MPICC path." >&2
    exit 1
fi

# HPL settings
sed -i "s/^ARCH *=.*/ARCH = ${ARCH}/" "$MAKEFILE"
sed -i "s|^TOPdir *=.*|TOPdir = ${HPL_DIR}|" "$MAKEFILE"

# Compiler & MPI
sed -i -E "s|^CC[[:space:]]*=.*|CC = ${MPICC}|" "$MAKEFILE"
sed -i -E "s|^LINKER[[:space:]]*=.*|LINKER = \\\$(CC)|" "$MAKEFILE"

sed -i "s|^MPdir *=.*|MPdir =|" "$MAKEFILE"
sed -i "s|^MPinc *=.*|MPinc =|" "$MAKEFILE"
sed -i "s|^MPlib *=.*|MPlib =|" "$MAKEFILE"

# BLAS
LAINC_FLAGS=""
for d in /usr/include/x86_64-linux-gnu /usr/include/openblas /usr/include; do
    [[ -d "$d" ]] && LAINC_FLAGS+=" -I$d"
done
sed -i -E "s|^LAdir[[:space:]]*=.*|LAdir = /usr|" "$MAKEFILE" || true
sed -i -E "s|^LAinc[[:space:]]*=.*|LAinc =${LAINC_FLAGS}|" "$MAKEFILE"
sed -i -E "s|^LAlib[[:space:]]*=.*|LAlib = -lopenblas -lpthread -lm -ldl|" "$MAKEFILE"

echo "$(basename "$MAKEFILE") configured for ARCH=${ARCH}"
