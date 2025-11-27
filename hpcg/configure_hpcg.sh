#!/bin/bash

set -euo pipefail

MAKEFILE="$1"
ARCH="$2"
HPCG_DIR="$3"

# System MPICXX
MPICXX_BIN="${MPICXX:-$(command -v mpicxx || true)}"
if [[ -z "${MPICXX_BIN}" ]]; then
    echo "ERROR: mpicxx not found on PATH (or MPICXX not set)." >&2
    exit 1
fi

# HPCG Settings
sed -i "s|^TOPdir *=.*|TOPdir = ${HPCG_DIR}|" "$MAKEFILE"
sed -i -E 's|^BIN[[:space:]]*=.*|BIN = $(TOPdir)/bin/$(arch)|' "$MAKEFILE"
sed -i "s/^arch *=.*/arch = ${ARCH}/" "$MAKEFILE" 2>/dev/null || true

# Compilers / linker
sed -i -E "s|^CXX[[:space:]]*=.*|CXX = ${MPICXX_BIN}|" "$MAKEFILE"
sed -i -E "s|^LINKER[[:space:]]*=.*|LINKER = \$(CXX)|" "$MAKEFILE"

sed -i "s|^MPdir *=.*|MPdir =|" "$MAKEFILE"
sed -i "s|^MPinc *=.*|MPinc =|" "$MAKEFILE"
sed -i "s|^MPlib *=.*|MPlib =|" "$MAKEFILE"

# Prefer MPI-only by default: add -DHPCG_NO_OPENMP if not already present
if grep -q '^HPCG_OPTS' "$MAKEFILE"; then
    grep -q '\-DHPCG_NO_OPENMP' "$MAKEFILE" || sed -i 's|^HPCG_OPTS *= *\(.*\)$|HPCG_OPTS = \1 -DHPCG_NO_OPENMP|' "$MAKEFILE"
else
    echo 'HPCG_OPTS = -DHPCG_NO_OPENMP' >>"$MAKEFILE"
fi

echo "$(basename "$MAKEFILE") configured for ARCH=${ARCH}"

