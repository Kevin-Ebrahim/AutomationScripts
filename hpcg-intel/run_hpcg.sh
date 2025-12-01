#!/bin/bash

set -euo pipefail

HPCG_VERSION="${HPCG_VERSION:-3.1}"
ARCH="${ARCH:-openblas_ompi_intel}" # using same default arch name as HPL
NP="${NP:-$(nproc)}"
HOSTFILE="${HOSTFILE:-$HOME/Wits-A-2025/scripts/hostfiles/hosts.ompi}"

HPCG_DIR="$HOME/benchmarks/hpcg/hpcg-${HPCG_VERSION}"
BIN_DIR="$HPCG_DIR/bin/$ARCH"
HPCG_BIN="$BIN_DIR/xhpcg"
HPCG_DAT="$BIN_DIR/HPCG.dat"

if [[ ! -x "$HPCG_BIN" ]]; then
    echo "HPCG binary not found: $HPCG_BIN. Build may have failed or not run." >&2
    exit 1
fi

command -v mpirun >/dev/null 2>&1 || {
    echo "Error: mpirun not found in PATH. Load/install MPI environment." >&2
    exit 1
}

if [[ ! -f "$HPCG_DAT" ]]; then
    echo "Warning: $HPCG_DAT not found. Using default HPCG settings; ensure HPCG.dat is present in $BIN_DIR." >&2
fi

MPI_CMD=(
    mpirun
    ${HOSTFILE:+--hostfile "$HOSTFILE"}
    -np
    "$NP"
    --map-by slot
    --bind-to core:overload-allowed
    "$HPCG_BIN"
)

echo "Running HPCG with $NP MPI rank(s)..."
cd "$BIN_DIR"
"${MPI_CMD[@]}"
