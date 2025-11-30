#!/bin/bash

set -euo pipefail

# Commands we expect in PATH (no duplicates of package names below)
REQUIRED_CMDS=(
    gcc
    g++
    gfortran
    make
    cmake
    git
    mpicc
    mpifort
    h5pcc
)

# Debian/Ubuntu dev packages for ASCOT5 dependencies
REQUIRED_PKGS=(
    build-essential

    wget
    curl
    rsync
    xz-utils

    cmake
    git
    gfortran
)

echo "=== Checking ASCOT5 required tools ==="
missing_cmds=()
for cmd in "${REQUIRED_CMDS[@]}"; do
    if ! command -v "$cmd" &>/dev/null; then
        echo "  - MISSING: $cmd"
        missing_cmds+=("$cmd")
    else
        echo "  - Found:   $cmd -> $(command -v "$cmd")"
    fi
done

echo
echo "=== Checking Debian/Ubuntu dev packages ==="
missing_pkgs=()
if command -v dpkg &>/dev/null; then
    for pkg in "${REQUIRED_PKGS[@]}"; do
        if ! dpkg -s "$pkg" &>/dev/null; then
            echo "  - MISSING: $pkg"
            missing_pkgs+=("$pkg")
        else
            echo "  - Present: $pkg"
        fi
    done
else
    echo "dpkg not found; skipping package-level checks (non-Debian/Ubuntu host?)."
fi

echo
install_failed=0

if ((${#missing_cmds[@]} > 0)); then
    echo "ERROR: Missing required tools: ${missing_cmds[*]}"
    install_failed=1
fi

if ((${#missing_pkgs[@]} > 0)); then
    echo
    echo "Missing dev packages: ${missing_pkgs[*]}"

    if command -v sudo &>/dev/null && command -v apt-get &>/dev/null; then
        read -r -p "Attempt to install them with 'sudo apt-get install -y'? [y/N] " ans
        case "${ans:-N}" in
        [Yy]*)
            sudo apt-get update
            sudo apt-get install -y "${missing_pkgs[@]}"
            ;;
        *)
            echo "Not installing packages automatically."
            install_failed=1
            ;;
        esac
    else
        echo "No sudo/apt-get detected; please install the missing packages manually."
        install_failed=1
    fi
fi

if ((install_failed != 0)); then
    echo
    echo "Dependency check FAILED."
    exit 1
fi

echo
echo "All required ASCOT5 tools and packages appear to be installed."
