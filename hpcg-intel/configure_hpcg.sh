#!/bin/bash

set -euo pipefail

MAKEFILE="$1"
ARCH="$2"
HPCG_DIR="$3"

# 1. Intel Compiler Detection
# Priority: mpiicpx (OneAPI LLVM) -> mpiicpc (Classic) -> mpicxx (Generic fallback)
if command -v mpiicpx &> /dev/null; then
    MPICXX_BIN=$(command -v mpiicpx)
    echo "Found Intel OneAPI compiler: $MPICXX_BIN"
elif command -v mpiicpc &> /dev/null; then
    MPICXX_BIN=$(command -v mpiicpc)
    echo "Found Intel Classic compiler: $MPICXX_BIN"
else
    MPICXX_BIN="${MPICXX:-$(command -v mpicxx || true)}"
fi

if [[ -z "${MPICXX_BIN}" ]]; then
    echo "ERROR: No Intel MPI compiler (mpiicpx/mpiicpc) or generic mpicxx found." >&2
    exit 1
fi

# 2. HPCG Directory Settings
sed -i "s|^TOPdir *=.*|TOPdir = ${HPCG_DIR}|" "$MAKEFILE"
sed -i -E 's|^BIN[[:space:]]*=.*|BIN = $(TOPdir)/bin/$(arch)|' "$MAKEFILE"
sed -i "s/^arch *=.*/arch = ${ARCH}/" "$MAKEFILE" 2>/dev/null || true

# 3. Compilers / Linker
sed -i -E "s|^CXX[[:space:]]*=.*|CXX = ${MPICXX_BIN}|" "$MAKEFILE"
sed -i -E "s|^LINKER[[:space:]]*=.*|LINKER = \$(CXX)|" "$MAKEFILE"

# 4. Intel Optimization Flags
# We overwrite CXXFLAGS but MUST preserve $(HPCG_OPTS)
# so the -DHPCG_NO_OPENMP flag is passed correctly.
if grep -q '^CXXFLAGS' "$MAKEFILE"; then
    sed -i 's|^CXXFLAGS *=.*|CXXFLAGS = -O3 -xHost -fno-alias $(HPCG_OPTS)|' "$MAKEFILE"
else
    echo 'CXXFLAGS = -O3 -xHost -fno-alias $(HPCG_OPTS)' >>"$MAKEFILE"
fi

# 5. Clear Generic MPI Paths (Intel wrapper handles this automatically)
sed -i "s|^MPdir *=.*|MPdir =|" "$MAKEFILE"
sed -i "s|^MPinc *=.*|MPinc =|" "$MAKEFILE"
sed -i "s|^MPlib *=.*|MPlib =|" "$MAKEFILE"

# 6. Hybrid vs MPI-only
# Note: Intel HPCG performance is usually best with Hybrid (MPI + OpenMP).
# However, this block keeps your original logic to force MPI-only if requested.
if grep -q '^HPCG_OPTS' "$MAKEFILE"; then
    grep -q '\-DHPCG_NO_OPENMP' "$MAKEFILE" || sed -i 's|^HPCG_OPTS *= *\(.*\)$|HPCG_OPTS = \1 -DHPCG_NO_OPENMP|' "$MAKEFILE"
else
    echo 'HPCG_OPTS = -DHPCG_NO_OPENMP' >>"$MAKEFILE"
fi

echo "$(basename "$MAKEFILE") configured for Intel (ARCH=${ARCH})"
