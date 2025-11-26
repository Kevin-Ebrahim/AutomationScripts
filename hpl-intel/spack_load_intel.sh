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

REQUIRED=(intel-oneapi-compilers@2025.2.0 intel-oneapi-mkl@2025.2.0 intel-oneapi-mpi@2021.16.0)

missing=()
for spec in "${REQUIRED[@]}"; do
    pkg="${spec%%@*}"
    if ! is_loaded "$pkg"; then
        missing+=( "$spec" )
    fi
done

if ((${#missing[@]} == 0)); then
    echo "Spack: required Intel packages already loaded."
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

echo "Spack: Intel toolchain available."
