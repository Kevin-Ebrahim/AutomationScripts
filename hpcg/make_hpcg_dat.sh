#!/usr/bin/env bash
# make_hpcg_dat.sh
#
# Environment vars you may set (all optional):
#   HPCG_VERSION – defaults to 3.1
#   HPCG_DIR     – path to hpcg-VERSION (default: $HOME/benchmarks/hpcg/hpcg-$HPCG_VERSION)
#   ARCH         – build/arch subdir under bin/ (default: openblas_ompi_gcc)
#   NX, NY, NZ   – local problem sizes (default: 104, 104, 104)
#   RUN_TIME     – run time in seconds (default: 60)
#
# Behavior:
#   - If bin/$ARCH/HPCG.dat exists, reuse its values as fallbacks unless overridden by env vars.
#   - Writes a fresh bin/$ARCH/HPCG.dat with a canonical header + (nx ny nz) + (runtime).

set -euo pipefail

HPCG_VERSION="${HPCG_VERSION:-3.1}"
HPCG_DIR="${HPCG_DIR:-$HOME/benchmarks/hpcg/hpcg-$HPCG_VERSION}"
ARCH="${ARCH:-openblas_ompi_gcc}"

BIN_DIR="$HPCG_DIR/bin/$ARCH"
mkdir -p "$BIN_DIR"
HPCG_DAT="$BIN_DIR/HPCG.dat"

# --- Try to pull current defaults from an existing HPCG.dat (any reasonable layout) ---
# We look for the first line containing exactly three integers -> nx ny nz
# and then the next line containing a single integer -> runtime.
fNX=""
fNY=""
fNZ=""
fRT=""
if [[ -f "$HPCG_DAT" ]]; then
	# Extract nx ny nz
	readarray -t _triples < <(awk '
    {
      # Count integer tokens on the line
      n=split($0,a);
      c=0;
      for (i=1;i<=n;i++) if (a[i] ~ /^-?[0-9]+$/) c++;
      if (c==3) {
        print $0;
        exit;
      }
    }
  ' "$HPCG_DAT" || true)

	if [[ ${#_triples[@]} -gt 0 ]]; then
		# shellcheck disable=SC2206
		triple=(${_triples[0]})
		fNX="${triple[0]:-}"
		fNY="${triple[1]:-}"
		fNZ="${triple[2]:-}"
		# Now find the first single-integer line that occurs *after* that triple
		# We do this by toggling a flag once the triple is seen.
		fRT="$(awk -v X="$fNX" -v Y="$fNY" -v Z="$fNZ" '
      found=0
      {
        # detect the exact triple line
        if (!found) {
          n=split($0,a)
          if (n>=3 && a[1]==X && a[2]==Y && a[3]==Z) { found=1; next }
        } else {
          # after triple: first line that is a single integer becomes runtime
          if ($0 ~ /^-?[0-9]+$/) { print $0; exit }
        }
      }
    ' "$HPCG_DAT" 2>/dev/null || true)"
	fi
fi

# --- Use env overrides, else file values, else sane defaults ---
NX="${NX:-${fNX:-104}}"
NY="${NY:-${fNY:-104}}"
NZ="${NZ:-${fNZ:-104}}"
RUN_TIME="${RUN_TIME:-${fRT:-60}}"

# --- Write new HPCG.dat ---
# Canonical header used by the reference CPU build; harmless for accelerators too.
cat >"$HPCG_DAT" <<EOF
HPCG benchmark input file
Sandia National Laboratories; University of Tennessee, Knoxville
$NX $NY $NZ
$RUN_TIME
EOF

echo "Wrote $(realpath "$HPCG_DAT")"
echo "  NX=$NX NY=$NY NZ=$NZ  RUN_TIME=$RUN_TIME"
