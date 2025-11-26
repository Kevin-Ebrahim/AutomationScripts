#!/bin/bash

set -euo pipefail

REQUIRED_CMDS=(
    gcc
    g++
    make
    wget
    tar
    xz
)

# Debian/Ubuntu dev packages for GCC prereqs:
REQUIRED_PKGS=(
    build-essential
    wget
    curl
    flex
    bison
    texinfo
    libgmp-dev
    libmpfr-dev
    libmpc-dev
    libisl-dev
    zlib1g-dev
    libzstd-dev
    libexpat1-dev
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

# Check host GCC version (needs a reasonably modern C++ compiler). :contentReference[oaicite:3]{index=3}
echo
if command -v gcc &>/dev/null; then
    host_ver_full="$(gcc -dumpfullversion 2>/dev/null || gcc -dumpversion)"
    host_ver_major="${host_ver_full%%.*}"
    echo "Host GCC: $host_ver_full"
    if [[ "$host_ver_major" =~ ^[0-9]+$ ]] && ((host_ver_major < 7)); then
        echo "WARNING: Host GCC is quite old; GCC 15 prefers a modern C++11+ capable host."
    fi
else
    echo "ERROR: No system gcc found in PATH; cannot build GCC."
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
echo "All required tools/packages appear to be installed."
