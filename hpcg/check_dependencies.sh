#!/usr/bin/env bash
# check_dependencies.sh — prerequisites for building/running HPCG
#
# Notes:
# - HPCG is C++ (uses mpicxx), unlike HPL which needs Fortran/BLAS.
# - We keep apt package names for parity with your HPL script.
# - If you use another distro, install the equivalent packages.

set -euo pipefail

# Base packages: build tools, C/C++, MPI, and fetch tools
PKGS=( make gcc g++ build-essential openmpi-bin libopenmpi-dev wget tar )
MISSING_PKGS=()

for p in "${PKGS[@]}"; do
  if ! dpkg --status "$p" &>/dev/null; then
    MISSING_PKGS+=( "$p" )
  fi
done

# Commands needed at runtime/build time
CMDS=( mpicxx mpirun make g++ )
MISSING_CMDS=()

for cmd in "${CMDS[@]}"; do
  if ! command -v "$cmd" &>/dev/null; then
    MISSING_CMDS+=( "$cmd" )
  fi
done

if ((${#MISSING_PKGS[@]})) || ((${#MISSING_CMDS[@]})); then
  if ((${#MISSING_PKGS[@]})); then
    echo "Missing packages: ${MISSING_PKGS[*]}" >&2
    echo "Install with:"
    echo "  sudo apt-get update && sudo apt-get install -y ${MISSING_PKGS[*]}"
  fi

  if ((${#MISSING_CMDS[@]})); then
    echo "Missing commands on PATH: ${MISSING_CMDS[*]}" >&2
    echo "Notes:"
    echo "  - 'mpirun' comes from openmpi-bin"
    echo "  - 'mpicxx' comes from libopenmpi-dev"
    echo "If packages are installed, check your PATH or login shell environment."
  fi

  exit 1
fi

echo "All dependencies are available."

