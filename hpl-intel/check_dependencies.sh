#!/bin/bash

set -euo pipefail

PKGS=( make gcc build-essential gfortran openmpi-bin libopenmpi-dev libopenblas-dev wget )
MISSING_PKGS=()

for p in "${PKGS[@]}"; do
    if ! dpkg --status "$p" &>/dev/null; then
        MISSING_PKGS+=( "$p" ) 
    fi
done

CMDS=( mpicc mpirun )
MISSING_CMDS=()

for cmd in "${NEEDED[@]}"; do
    if ! command -v "$cmd" &>/dev/null; then
        MISSING+=( "$cmd" )
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
        echo "Note: 'mpirun' comes from openmpi-bin; 'mpicc' comes from libopenmpi-dev."
        echo "If packages are installed, check your PATH or login shell environment."
    fi

    exit 1
fi

echo "All dependencies are available."
