#!/bin/bash
set -euo pipefail

if ! command -v spack >/dev/null 2>&1; then
    echo "spack not found in PATH. Load Spack/Lmod first." >&2
    exit 1
fi

is_loaded() {
    local pkg="$1"
    spack find --loaded 2>/dev/null | grep -iq -- "$pkg" && return 0 || return 1
}

REQUIRED=(gcc@15.1.0 openmpi@4.1.8 openblas)

missing=()
for spec in "${REQUIRED[@]}"; do
    pkg="${spec%%@*}"
    if ! is_loaded "$pkg"; then
        missing+=( "$spec" )
    fi
done

if ((${#missing[@]} == 0)); then
    echo "Spack: required gcc packages already loaded."
    return 0 2>/dev/null || exit 0
fi

echo "Spack: loading missing packages: ${missing[*]}"
for spec in "${missing[@]}"; do
    printf "  -> spack load %s\n" "$spec"
    if ! spack load "$spec"; then
        echo "ERROR: failed to spack load $spec" >&2
        return 1 2>/dev/null || exit 1
    fi
done

echo "Spack: gcc toolchain available."
