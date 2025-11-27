#!/bin/bash

set -euo pipefail

# Commands we expect in PATH (no duplicates of package names below)
REQUIRED_CMDS=(
    gcc
    g++
    gfortran
    make
    tar
    pkg-config

    # fetchers commonly used in your download script(s)
    wget
    curl
)

# Debian/Ubuntu packages typically needed to build Open MPI (w/ Slurm + external hwloc)
REQUIRED_PKGS=(
    build-essential
    gfortran

    wget
    curl
    rsync
    xz-utils
    ca-certificates

    pkg-config
    python3

    # Open MPI build deps
    libnuma-dev
    libevent-dev

    # You requested: --with-slurm
    libslurm-dev

    # Optional but commonly useful for secure transports and compression
    libssl-dev
    zlib1g-dev
)

echo "=== Checking basic build tools ==="
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
echo "=== Checking Debian/Ubuntu packages ==="
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
if command -v gcc &>/dev/null; then
    host_ver_full="$(gcc -dumpfullversion 2>/dev/null || gcc -dumpversion)"
    echo "Host GCC: $host_ver_full"
else
    echo "ERROR: No gcc found in PATH; cannot build Open MPI."
    exit 1
fi

echo
install_failed=0

if ((${#missing_cmds[@]} > 0)); then
    echo "ERROR: Missing required tools: ${missing_cmds[*]}"
    install_failed=1
fi

if ((${#missing_pkgs[@]} > 0)); then
    echo
    echo "Missing packages: ${missing_pkgs[*]}"

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
echo "All required tools/packages appear to be installed."
echo "Note: If you enable UCX later (--with-ucx), also install: libucx-dev (or the UCX module/site install)."
