#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$HOME/Wits-A-2025/scripts/hpcg"
"$SCRIPT_DIR/check_dependencies.sh"

HPCG_VERSION="3.1"
ARCH="${ARCH:-openblas_ompi_gcc}"

HPCG_DIR="$HOME/benchmarks/hpcg/hpcg-${HPCG_VERSION}"
BIN_DIR="$HPCG_DIR/bin/$ARCH"
HPCG_EXE="$BIN_DIR/xhpcg"
MAKEFILE="setup/Make.${ARCH}"

if [[ ! -d "$HPCG_DIR" ]]; then
	echo "Error: HPCG directory $HPCG_DIR not found. Run download_hpcg.sh first." >&2
	exit 1
fi

if [[ -x "$HPCG_EXE" ]]; then
	echo "HPCG binary already present ($HPCG_EXE). Skipping rebuild."
	exit 0
fi

cd "$HPCG_DIR"

# Re-generate arch Makefile only when the target doesn’t exist
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

# Configure compilers/flags/paths for this ARCH (operates on setup/Make.${ARCH})
"$SCRIPT_DIR/configure_hpcg.sh" "$MAKEFILE" "$ARCH" "$HPCG_DIR"

# Clean only if this ARCH was built before
if [[ -d "bin/${ARCH}" ]]; then
	echo "Cleaning previous build (ARCH=$ARCH)..."
	make clean arch="$ARCH" BIN="$BIN_DIR"
else
	echo "No previous build for ARCH=$ARCH - skipping clean."
fi

echo "Compiling HPCG..."
# Force output dir via CLI so it overrides any BIN assignments in Makefiles
make arch="$ARCH" BIN="$BIN_DIR"

# Ensure binary is where our scripts expect it
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

