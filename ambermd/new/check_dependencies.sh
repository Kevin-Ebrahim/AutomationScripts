#!/bin/bash

set -euo pipefail

# Amber / AmberTools OS-level dependencies checker for Ubuntu/Debian

# Commands we expect in PATH (no duplicates of package names below)
REQUIRED_CMDS=(
    gcc
    g++
    gfortran

    cmake
    make
    tcsh

    flex
    bison
    patch
    bc
    wget
    bzip2

    mpicc
    mpirun
    ssh
)

# Debian/Ubuntu packages we expect installed (no overlap with REQUIRED_CMDS)
# Based on the tutorial + practical Amber build experience on Ubuntu
REQUIRED_PKGS=(
    build-essential

    cmake
    tcsh

    flex
    bison
    patch
    bc
    wget
    bzip2

    xorg-dev
    zlib1g-dev      # libz-dev in the tutorial
    libbz2-dev

    openmpi-bin
    libopenmpi-dev
    openssh-client

    # Helpful extras (not strictly in the table but usually needed)
    python3
    python3-venv
    curl
    rsync
    xz-utils
)

echo "=== Amber / AmberTools basic dependency check ==="
echo

missing_cmds=()
for cmd in "${REQUIRED_CMDS[@]}"; do
    if ! command -v "$cmd" &>/dev/null; then
        echo "  - MISSING command: $cmd"
        missing_cmds+=("$cmd")
    else
        echo "  - Found command:   $cmd -> $(command -v "$cmd")"
    fi
done

echo
echo "=== Checking Debian/Ubuntu packages ==="
missing_pkgs=()
if command -v dpkg &>/dev/null; then
    for pkg in "${REQUIRED_PKGS[@]}"; do
        if ! dpkg -s "$pkg" &>/dev/null; then
            echo "  - MISSING package: $pkg"
            missing_pkgs+=("$pkg")
        else
            echo "  - Present package: $pkg"
        fi
    done
else
    echo "dpkg not found; skipping package-level checks (non-Debian/Ubuntu host?)."
fi

echo
echo "=== Compiler version sanity checks (tutorial: GCC/GFortran >= 13.x) ==="

check_gcc_like() {
    local name="$1" cmd="$2" min_major="$3" min_minor="$4"

    if ! command -v "$cmd" &>/dev/null; then
        echo "  - $name: NOT FOUND (skipping version check)"
        return
    fi

    local ver_full ver_major ver_minor ver_minor_rest
    ver_full="$("$cmd" -dumpfullversion 2>/dev/null || "$cmd" -dumpversion)"
    ver_major="${ver_full%%.*}"
    ver_minor_rest="${ver_full#*.}"
    ver_minor="${ver_minor_rest%%.*}"

    if [[ ! "$ver_major" =~ ^[0-9]+$ ]]; then
        echo "  - $name: version '$ver_full' (could not parse major version)"
        return
    fi

    if (( ver_major > min_major )) || { (( ver_major == min_major )) && (( ver_minor >= min_minor )); }; then
        echo "  - $name: $ver_full (OK, >= ${min_major}.${min_minor})"
    else
        echo "  - $name: $ver_full (WARNING: tutorial suggests >= ${min_major}.${min_minor})"
    fi
}

check_gcc_like "GCC"      gcc      13 3
check_gcc_like "G++"      g++      13 2
check_gcc_like "GFortran" gfortran 13 3

echo
install_failed=0

if ((${#missing_cmds[@]} > 0)); then
    echo "ERROR: Missing required commands: ${missing_cmds[*]}"
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

if (( install_failed != 0 )); then
    echo
    echo "Amber dependency check FAILED."
    exit 1
fi

echo
echo "All required commands/packages for Amber/AmberTools appear to be installed."
echo "You should be ready to run ./run_cmake for ambertools25_src."

