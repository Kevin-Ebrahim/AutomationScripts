#!/bin/bash
set -euo pipefail
MAKEFILE="$1" # e.g., Make.openblas_ompi_gcc
ARCH="$2"     # e.g., openblas_ompi_gcc
HPCG_DIR="$3" # e.g., $HOME/benchmarks/hpcg/hpcg-3.1

# Use MPI C++ compiler for HPCG
MPICXX="/usr/bin/mpicxx"
if [[ ! -x "$MPICXX" ]]; then
    echo "ERROR: $MPICXX not found. Install OpenMPI (mpicxx) or adjust path." >&2
    exit 1
fi

# Set top-level directory path
sed -i "s|^TOPdir *=.*|TOPdir = ${HPCG_DIR}|" "$MAKEFILE"

# Set ARCH label in Makefile (if applicable, some templates use $(arch) from command line)
sed -i "s/^arch *=.*/arch = ${ARCH}/" "$MAKEFILE" 2>/dev/null || true

# Configure compilers and MPI paths for HPCG
sed -i -E "s|^CXX[[:space:]]*=.*|CXX = ${MPICXX}|" "$MAKEFILE"
sed -i -E "s|^LINKER[[:space:]]*=.*|LINKER = \$(CXX)|" "$MAKEFILE"
# Clear MPI include/lib variables (mpicxx will handle these)
sed -i "s|^MPdir *=.*|MPdir =|" "$MAKEFILE"
sed -i "s|^MPinc *=.*|MPinc =|" "$MAKEFILE"
sed -i "s|^MPlib *=.*|MPlib =|" "$MAKEFILE"

# (Optional) Disable OpenMP for now to use MPI-only
sed -i "s|^HPCG_OPTS *=.*|HPCG_OPTS = -DHPCG_NO_OPENMP|" "$MAKEFILE" ||
    echo "HPCG_OPTS += -DHPCG_NO_OPENMP" >>"$MAKEFILE"

echo "$(basename "$MAKEFILE") configured for ARCH=${ARCH}"
