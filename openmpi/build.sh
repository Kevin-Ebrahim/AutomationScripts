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

module use --append /cluster/modulefiles
module load gcc/15.2.0

VERSION="5.0.8"
GCC_VERSION="$(gcc -dumpfullversion 2>/dev/null || gcc -dumpversion)"

BASE_DIR="$HOME/tools/openmpi/gcc_${GCC_VERSION}"
INSTALL_PREFIX="${BASE_DIR}/openmpi-${VERSION}"

MODULES_ROOT="$HOME/modulefiles"
MODULES_DIR="${MODULES_ROOT}/openmpi"

CORES=$(nproc)
MPI_DIR="openmpi-${VERSION}"

if [[ ! -d "${BASE_DIR}/${MPI_DIR}" ]]; then
    echo "Source directory ${BASE_DIR}/${MPI_DIR} not found."
    echo "Run the download script first"
    exit 1
fi

pushd "${BASE_DIR}/${MPI_DIR}" >/dev/null

# Toolchain
CC="$(command -v gcc)"
CXX="$(command -v g++)"
FC="$(command -v gfortran)"
export CC CXX FC

echo "Building with -j${CORES} ..."
make -j"${CORES}"

echo "Installing into ${INSTALL_PREFIX} ..."
make install

popd >/dev/null

mkdir -p "${MODULES_DIR}"

MODULEFILE="${MODULES_DIR}/openmpi-${VERSION}-gcc-${GCC_VERSION}.lua"
cat >"${MODULEFILE}" <<EOF
-- -*- lua -*-
help([[
Open MPI ${VERSION} built with GCC ${GCC_VERSION}.
Provides mpicc/mpicxx/mpifort and runtime env.
]])

whatis("Open MPI ${VERSION} (GCC ${GCC_VERSION})")

depends_on("gcc/15.2.0")

local prefix = "${INSTALL_PREFIX}"
local libdir = pathJoin(prefix, "lib")
if (isDir(pathJoin(prefix, "lib64"))) then
  libdir = pathJoin(prefix, "lib64")
end

prepend_path("PATH",            pathJoin(prefix, "bin"))
prepend_path("MANPATH",         pathJoin(prefix, "share", "man"))
prepend_path("LD_LIBRARY_PATH", libdir)
prepend_path("PKG_CONFIG_PATH", pathJoin(libdir, "pkgconfig"))
prepend_path("CPATH",           pathJoin(prefix, "include"))
prepend_path("LIBRARY_PATH",    libdir)

setenv("MPI_HOME", prefix)
setenv("OPENMPI_HOME", prefix)
EOF

# Ensure modulepath is visible (system-wide if possible; else per-user)
PROFILE_SNIPPET="/etc/profile.d/cluster-modules.sh"
if [[ -w "$(dirname "${PROFILE_SNIPPET}")" ]]; then
    if [[ ! -f "${PROFILE_SNIPPET}" ]] || ! grep -q "${MODULES_ROOT}" "${PROFILE_SNIPPET}"; then
        echo "Setting up system-wide modulepath snippet at ${PROFILE_SNIPPET} ..."
        tee "${PROFILE_SNIPPET}" >/dev/null <<EOF
# Ensure Lmod is loaded and point MODULEPATH at the shared tree
[ -f /etc/profile.d/lmod.sh ] && . /etc/profile.d/lmod.sh
module use --append ${MODULES_ROOT}
EOF
        chmod 644 "${PROFILE_SNIPPET}"
    fi
else
    if ! grep -q "module use --append ${MODULES_ROOT}" "${HOME}/.bashrc"; then
        echo "module use --append ${MODULES_ROOT}" >>"${HOME}/.bashrc"
        echo "Added module use line to ~/.bashrc"
    fi
fi

echo "Open MPI ${VERSION} installation complete."
echo "Load with:  module load openmpi/openmpi-${VERSION}-gcc-${GCC_VERSION}"

# Sanity checks
"${INSTALL_PREFIX}/bin/mpirun" --version || true
"${INSTALL_PREFIX}/bin/ompi_info" --parsable --all 2>/dev/null | grep -E 'mpi:base:param:mpi_thread_multiple:value|mpi_thread_multiple' || true
