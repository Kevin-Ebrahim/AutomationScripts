#!/bin/bash

set -euo pipefail

# Apt packages
PKGS=(make gcc g++ gfortran cmake openmpi-bin libopenmpi-dev wget tcsh flex bison patch bc xorg-dev zlib1g-dev libbz2-dev openssh-client)
MISSING_PKGS=()

if command -v dpkg >/dev/null 2>&1; then
    for p in "${PKGS[@]}"; do
        dpkg --status "$p" &>/dev/null || MISSING_PKGS+=("$p")
    done
fi

# Commands we need on PATH
CMDS=(gcc g++ gfortran make cmake mpicc mpirun mpifort tar)
MISSING_CMDS=()
for cmd in "${CMDS[@]}"; do
    command -v "$cmd" &>/dev/null || MISSING_CMDS+=("$cmd")
done

# At least one downloader
if ! command -v wget &>/dev/null && ! command -v curl &>/dev/null; then
    MISSING_CMDS+=("wget|curl")
fi

# Report
if ((${#MISSING_PKGS[@]})) || ((${#MISSING_CMDS[@]})); then
    if ((${#MISSING_PKGS[@]})); then
        echo "Missing packages: ${MISSING_PKGS[*]}" >&2
        if command -v apt-get >/dev/null 2>&1; then
            echo "Install with:" >&2
            echo "  sudo apt-get update && sudo apt-get install -y ${MISSING_PKGS[*]}" >&2
        fi
    fi
    if ((${#MISSING_CMDS[@]})); then
        echo "Missing commands on PATH: ${MISSING_CMDS[*]}" >&2
        echo "If packages are installed, check your PATH or login shell." >&2
    fi
    exit 1
fi

echo "All dependencies are available."
