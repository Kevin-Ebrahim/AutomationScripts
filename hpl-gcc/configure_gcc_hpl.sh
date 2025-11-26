#!/bin/bash
set -euo pipefail

MAKEFILE="$1"
ARCH="$2"
HPL_DIR="$3"

if ! command -v spack >/dev/null 2>&1; then
    echo "Spack not found in PATH. Load Spack/Lmod first." >&2
    exit 1
fi

OMPI_DIR="$(spack location -i openmpi@4.1.8)"
OBLAS_DIR="$(spack location -i openblas)"

MPICC="${OMPI_DIR}/bin/mpicc"

RPATH_FLAGS="-Wl,-rpath,${OMPI_DIR}/lib -Wl,-rpath,${OBLAS_DIR}/lib"

sed -i -E "s|^ARCH[[:space:]]*=.*|ARCH = ${ARCH}|" "$MAKEFILE"
sed -i -E "s|^TOPdir[[:space:]]*=.*|TOPdir = ${HPL_DIR}|" "$MAKEFILE"

sed -i -E "s|^CC[[:space:]]*=.*|CC = ${MPICC}|" "$MAKEFILE"
sed -i -E "s|^LINKER[[:space:]]*=.*|LINKER = \\\$(CC)|" "$MAKEFILE"

sed -i -E "s|^MPdir[[:space:]]*=.*|MPdir = ${OMPI_DIR}|" "$MAKEFILE" || true
sed -i -E "s|^MPinc[[:space:]]*=.*|MPinc =|" "$MAKEFILE"
sed -i -E "s|^MPlib[[:space:]]*=.*|MPlib =|" "$MAKEFILE"

sed -i -E "s|^LAdir[[:space:]]*=.*|LAdir = ${OBLAS_DIR}|" "$MAKEFILE"
sed -i -E "s|^LAinc[[:space:]]*=.*|LAinc = -I\\\$(LAdir)/include|" "$MAKEFILE"
sed -i -E "s|^LAlib[[:space:]]*=.*|LAlib = -L\\\$(LAdir)/lib -lopenblas -lpthread -lm -ldl|" "$MAKEFILE"

sed -i -E "s|^HPL_DEFS[[:space:]]*=.*|HPL_DEFS = -I\\\$(INCdir) -DHPL_USE_F77MATH -DHPL_CALL_CBLAS|" "$MAKEFILE"
sed -i -E "s|^CCFLAGS[[:space:]]*=.*|CCFLAGS = \\\$(HPL_DEFS) -O3 -DNDEBUG -fopenmp \\\$(LAinc) \\\$(MPinc)|" "$MAKEFILE"
sed -i -E "s|^CFLAGS[[:space:]]*=.*|CFLAGS  = \\\$(HPL_DEFS) -O3 -DNDEBUG -fopenmp \\\$(LAinc) \\\$(MPinc)|" "$MAKEFILE"
sed -i -E "s|^LINKFLAGS[[:space:]]*=.*|LINKFLAGS = -O3 -fopenmp ${RPATH_FLAGS}|" "$MAKEFILE"

echo "$(basename "$MAKEFILE") configured for ARCH=${ARCH} (GCC/OpenMPI/OpenBLAS)"
