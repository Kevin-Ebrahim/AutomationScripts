#!/usr/bin/env bash
# ==========================================================
# ASCOT5 download + build (MPI=1) into ~/benchmarks/ascot
# ==========================================================
# Assumes you have modulefiles for gcc/openmpi/hdf5 (like you showed).
# Creates:
#   ~/benchmarks/ascot/ascot5-<gitshort>/   (source)
#   ~/benchmarks/ascot/ascot5-<gitshort>/build/ (build outputs from make)
#
# Usage:
#   ./install_ascot.sh
#
# Optional env overrides:
#   ASCOT_PREFIX="$HOME/benchmarks/ascot"
#   ASCOT_REPO="https://github.com/ascot4fusion/ascot5.git"
#   MAKE_JOBS=24
#   MODULES="gcc/15.2.0 openmpi/openmpi-5.0.8-gcc-15.2.0 hdf5/1.14.6"
# ==========================================================

set -euo pipefail

ASCOT_PREFIX="${ASCOT_PREFIX:-$HOME/benchmarks/ascot}"
ASCOT_REPO="${ASCOT_REPO:-https://github.com/ascot4fusion/ascot5.git}"
MAKE_JOBS="${MAKE_JOBS:-$(nproc)}"
MODULES="${MODULES:-gcc/15.2.0 openmpi/openmpi-5.0.8-gcc-15.2.0 hdf5/1.14.6}"

# ---- Clone or update repo in a temp checkout, then copy into versioned folder ----
WORKDIR="${ASCOT_PREFIX}/_src"
mkdir -p "$WORKDIR"

if [[ -d "$WORKDIR/.git" ]]; then
  log "Updating existing checkout: $WORKDIR"
  git -C "$WORKDIR" fetch --all --tags
  git -C "$WORKDIR" pull --ff-only
fi

