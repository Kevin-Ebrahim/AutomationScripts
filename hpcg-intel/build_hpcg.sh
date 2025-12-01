#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$HOME/AutomationScripts/hpcg-intel"
"$SCRIPT_DIR/check_dependencies.sh"

HPCG_VERSION="3.1"
ARCH="${ARCH:-openblas_ompi_intel}"

HPCG_DIR="$HOME/benchmarks/hpcg-intel/hpcg-${HPCG_VERSION}"
BIN_DIR="$HPCG_DIR/bin/$ARCH"
HPCG_EXE="$BIN_DIR/xhpcg"
MAKEFILE="setup/Make.${ARCH}"

if [[ ! -d "$HPCG_DIR" ]]; then
    echo "Error: HPCG directory $HPCG_DIR not found. Run download_hpcg.sh first." >&2
    exit 1
fi

# Note: We do NOT exit here if the binary exists, because we want to force a rebuild
# with the new Intel flags. If you want to skip rebuilds later, uncomment these lines:
# if [[ -x "$HPCG_EXE" ]]; then
#    echo "HPCG binary already present ($HPCG_EXE). Skipping rebuild."
#    exit 0
# fi

# 1. Enter the HPCG directory
cd "$HPCG_DIR"

# 2. Setup the Makefile template
pushd setup >/dev/null
if [[ ! -f "Make.${ARCH}" ]]; then
    template=""
    for cand in Make.Linux_MPI Make.Linux_OMPI Make.Linux_OMP Make.generic; do
        [[ -f "$cand" ]] && { template="$cand"; break; }
    done
    if [[ -z "$template" ]]; then
        template="$(ls -1 Make.* 2>/dev/null | head -n1 || true)"
    fi
    if [[ -z "$template" ]]; then
        echo "Error: no Make.* template found in $PWD" >&2
        exit 1
    fi
    cp "$template" "Make.${ARCH}"
fi
popd >/dev/null

# 3. Configure compilers/flags/paths for this ARCH
"$SCRIPT_DIR/configure_hpcg.sh" "$MAKEFILE" "$ARCH" "$HPCG_DIR"

# 4. FORCE CLEAN (Critical Step)
# We ignore whether bin/ARCH exists. We must clean src/ to remove stale object files
# from previous builds (GCC/mixed attempts).
echo "Cleaning src directory to ensure a fresh build..."
make clean arch="$ARCH" BIN="$BIN_DIR"

# 5. Compile
echo "Compiling HPCG..."
make arch="$ARCH" BIN="$BIN_DIR"

# 6. Verify and Move Binary
mkdir -p "$BIN_DIR"
if [[ -x "$HPCG_EXE" ]]; then
    :
elif [[ -x "$HPCG_DIR/bin/xhpcg" ]]; then
    mv -f "$HPCG_DIR/bin/xhpcg" "$HPCG_EXE"
else
    echo "Build finished but $HPCG_EXE not found or not executable." >&2
    echo "Also checked $HPCG_DIR/bin/xhpcg, not found." >&2
    exit 1
fi

echo "Build complete. Binary is at $HPCG_EXE"
