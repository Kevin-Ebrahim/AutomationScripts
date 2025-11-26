#!/bin/bash
set -euo pipefail

MAKEFILE="$1"
ARCH="$2"
HPL_DIR="$3"

if ! command -v spack >/dev/null 2>&1; then
    echo "spack not found in PATH. Load Spack/Lmod first." >&2
    exit 1
fi

IMPI_DIR="$(spack location -i intel-oneapi-mpi)"
MKL_ROOT="$(spack location -i intel-oneapi-mkl)"

COMP_ROOT="$(spack location -i intel-oneapi-compilers 2>/dev/null || true)"
if [[ -z "$COMP_ROOT" ]]; then
	COMP_ROOT="$(spack location -i intel-oneapi-openmp 2>/dev/null || true)"
fi

MPdir="${IMPI_DIR}/mpi/latest"
MPI_BIN="${MPdir}/bin"

CCVAL="${MPdir}/bin/mpiicx"
LINKER_make='\$(CC)'

MPinc="-I${MPdir}/include"
MPlib="-L${MPdir}/lib -lmpi"

LAdir="${MKL_ROOT}/mkl/latest"
LAinc_make='-I$(LAdir)/include'
MKL_LIBDIR="${LAdir}/lib/intel64"

IOMP_LIBDIR=""
if [[ -n "$COMP_ROOT" ]]; then
	IOMP_LIBDIR="$(find "$COMP_ROOT" -type f -name 'libiomp5.so*' -printf '%h\n' 2>/dev/null | head -n1 || true)"
fi

LAlib="-Wl,--start-group \
${MKL_LIBDIR}/libmkl_intel_lp64.so \
${MKL_LIBDIR}/libmkl_core.so \
${MKL_LIBDIR}/libmkl_intel_thread.so \
-Wl,--end-group \
-liomp5 -lpthread -lm -ldl"

RPATH_FLAGS="-Wl,-rpath,${MKL_LIBDIR}"
if [[ -n "$IOMP_LIBDIR" ]]; then
	RPATH_FLAGS="${RPATH_FLAGS} -Wl,-rpath,${IOMP_LIBDIR}"
fi

CFLAGS_OPT="-O3 -qopenmp -fp-model precise"
LINKFLAGS="${CFLAGS_OPT} ${RPATH_FLAGS}"
HPL_DEFS="-DHPL_USE_F77MATH -DHPL_CALL_CBLAS"

sed -i -e "s|^ARCH *=.*|ARCH = ${ARCH}|" "${MAKEFILE}"
sed -i -e "s|^TOPdir *=.*|TOPdir = ${HPL_DIR}|" "${MAKEFILE}"

sed -i -e "s|^MPdir *=.*|MPdir = ${MPdir}|" "${MAKEFILE}"
sed -i -e "s|^MPinc *=.*|MPinc = ${MPinc}|" "${MAKEFILE}"
sed -i -e "s|^MPlib *=.*|MPlib = ${MPlib}|" "${MAKEFILE}"

sed -i -e "s|^LAdir *=.*|LAdir = ${LAdir}|" "${MAKEFILE}"
sed -i -E "s|^LAinc[[:space:]]*=.*|LAinc = -I\\\$(LAdir)/include -I\\\$(INCdir)|" "$MAKEFILE"
sed -i -e "s|^LAlib *=.*|LAlib =${LAlib}|" "${MAKEFILE}"

sed -i -e "s|^CC *=.*|CC = ${CCVAL}|" "${MAKEFILE}"
sed -i -E "s|^LINKER[[:space:]]*=.*|LINKER = ${LINKER_make}|" "$MAKEFILE"

sed -i -E "s|^HPL_DEFS[[:space:]]*=.*|HPL_DEFS = -I\\\$(INCdir) -DHPL_USE_F77MATH -DHPL_CALL_CBLAS -fp-model precise|" "$MAKEFILE"
sed -i -E "s|^CCFLAGS[[:space:]]*=.*|CCFLAGS = \\\$(HPL_DEFS) -O3 -DNDEBUG -qopenmp -fp-model precise \\\$(LAinc) -I\\\$(INCdir) \\\$(MPinc)|" "$MAKEFILE"
sed -i -E "s|^CFLAGS[[:space:]]*=.*|CFLAGS  = \\\$(HPL_DEFS) -O3 -DNDEBUG -qopenmp -fp-model precise \\\$(LAinc) -I\\\$(INCdir) \\\$(MPinc)|" "$MAKEFILE"
sed -i -E "s|^LINKFLAGS[[:space:]]*=.*|LINKFLAGS = ${LINKFLAGS}|" "$MAKEFILE"

echo "$(basename "$MAKEFILE") configured for ARCH=${ARCH}"
