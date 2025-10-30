#!/bin/bash

set -euo pipefail

HPL_VERSION="${HPL_VERSION:-2.3}"
ARCH="${ARCH:-openblas_ompi_gcc}"
NP="${NP:-$(nproc)}"
HOSTFILE="${HOSTFILE:-$HOME/Wits-A-2025/scripts/hostfiles/hosts.ompi}"

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

command -v mpirun >/dev/null 2>&1 || {
    echo "mpirun not in PATH. Install MPICH/OpenMPI or adjust PATH." >&2
    exit 1
}

if [[ ! -f "$HPL_DAT" ]]; then
    "$SCRIPT_DIR/make_hpl_dat.sh"
fi

P=$(awk '$2 ~ /Ps$/ {print $1}'  "$HPL_DAT")
Q=$(awk '$2 ~ /Qs$/ {print $1}'  "$HPL_DAT")
if (( P * Q != NP )); then
    echo "HPL.dat grid ${P}*${Q} != NP ($NP).  Adjust Ps/Qs or NP."
fi

MPI_CMD=(
    mpirun
    ${HOSTFILE:+--hostfile "$HOSTFILE"}
    ${FLAGS:-}
    -np "$NP"
    "$HPL_BIN"
)

echo "Running HPL with $NP MPI rank(s)..."

cd "$BIN_DIR"
"${MPI_CMD[@]}" < "$HPL_DAT"
