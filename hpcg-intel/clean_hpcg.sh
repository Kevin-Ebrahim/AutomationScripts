#!/usr/bin/env bash
set -euo pipefail

HPCG_VERSION="${HPCG_VERSION:-3.1}"
ARCH="${ARCH:-openblas_ompi_gcc}"
HPCG_DIR="${HPCG_DIR:-$HOME/benchmarks/hpcg/hpcg-${HPCG_VERSION}}"

if [[ ! -d "$HPCG_DIR" ]]; then
    echo "Nothing to clean; $HPCG_DIR not found."
    exit 0
fi

echo "Cleaning HPCG (arch=$ARCH) in $HPCG_DIR …"

# Try HPCG's native clean (if present)
if make -C "$HPCG_DIR" arch="$ARCH" clean >/dev/null 2>&1; then
    true
else
    echo "(HPCG clean returned non-zero; continuing with manual clean)"
fi

# Manual clean of common HPCG build artifacts
rm -rf \
    "$HPCG_DIR/bin/$ARCH" \
    "$HPCG_DIR/setup/Make.$ARCH"

# Also prune any benchmark outputs left in the arch bin dir (if it still exists)
if [[ -d "$HPCG_DIR/bin/$ARCH" ]]; then
    rm -f "$HPCG_DIR/bin/$ARCH"/HPCG-Benchmark_* 2>/dev/null || true
    rm -f "$HPCG_DIR/bin/$ARCH"/hpcg*.{txt,yaml,log} 2>/dev/null || true
fi

echo "Done."

