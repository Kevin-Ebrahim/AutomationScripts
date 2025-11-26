#!/bin/bash

set -euo pipefail

HPL_VERSION="${HPL_VERSION:-2.3}"
ARCH="${ARCH:-inteloneapi}"
NP="${HPL_NP:-$(nproc)}"
HOSTFILE="${HOSTFILE:-$HOME/Wits-A-2025/scripts/hostfiles/hosts.intel}"

SCRIPT_DIR="$HOME/Wits-A-2025/scripts/hpl"
HPL_DIR="$HOME/benchmarks/hpl/hpl-${HPL_VERSION}"
BIN_DIR="$HPL_DIR/bin/$ARCH"
HPL_BIN="$HPL_DIR/bin/$ARCH/xhpl"
HPL_DAT="$HPL_DIR/bin/$ARCH/HPL.dat"

[[ -x "$HPL_BIN" ]] || {
    echo "HPL binary not found or not executable: $HPL_BIN" >&2
    echo "Did the build succeed with ARCH=$ARCH ?" >&2
    exit 1
}

MPIRUN="${MPIRUN:-}"
if [[ -z "${MPIRUN}" ]]; then
    if command -v spack >/dev/null 2>&1; then
        IMPI_BIN="$(spack location -i intel-oneapi-mpi 2>/dev/null)/mpi/latest/bin"
        [[ -x "$IMPI_BIN/mpirun" ]] && MPIRUN="$IMPI_BIN/mpirun"
    fi
fi
[[ -z "${MPIRUN}" ]] && MPIRUN="$(command -v mpirun || true)"
[[ -x "${MPIRUN:-/nonexistent}" ]] || { echo "Intel mpirun not found. Load modules or set MPIRUN=..."; exit 1; }

if [[ ! -f "$HPL_DAT" ]]; then
    "$SCRIPT_DIR/make_hpl_dat.sh"
fi

P=$(awk '$2 ~ /Ps$/ {print $1}'  "$HPL_DAT")
Q=$(awk '$2 ~ /Qs$/ {print $1}'  "$HPL_DAT")
if (( P * Q != NP )); then
    echo "HPL.dat grid ${P}*${Q} != NP ($NP).  Adjust Ps/Qs or NP."
fi

export I_MPI_OFI_PROVIDER=shm
MPI_CMD=(
    "$MPIRUN"
    ${HOSTFILE:+--hostfile "$HOSTFILE"}
    ${FLAGS:-}
    -genvlist LD_LIBRARY_PATH,PATH,CPATH,LIBRARY_PATH
    -genv I_MPI_FABRICS=shm:tcp
    -genv I_MPI_HYDRA_IFACE=enp8s0f0
    -np "$NP"
    "$HPL_BIN"
)

echo "Running HPL with $NP MPI rank(s)..."

cd "$BIN_DIR"
"${MPI_CMD[@]}" < "$HPL_DAT"
