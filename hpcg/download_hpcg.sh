#!/bin/bash

set -euo pipefail

HPCG_VERSION="3.1"
REPO_URL="https://github.com/hpcg-benchmark/hpcg.git"

INSTALL_DIR="$HOME/benchmarks/hpcg/hpcg-${HPCG_VERSION}"
PARENT_DIR="$(dirname "$INSTALL_DIR")"

if [[ -d "$INSTALL_DIR" ]]; then
    echo "Error: Directory $INSTALL_DIR already exists. Remove it or choose another path." >&2
    exit 1
fi

# Ensure parent is writable
mkdir -p "$PARENT_DIR"
if [[ ! -w "$PARENT_DIR" ]]; then
    echo "Error: $PARENT_DIR is not writable by $(whoami)."
    echo "Fix with:"
    echo "  sudo chown -R \"$USER\":\"$(id -gn)\" \"$PARENT_DIR\""
    exit 1
fi

echo "Cloning HPCG source from $REPO_URL ..."
git clone --depth 1 "$REPO_URL" "$INSTALL_DIR"

echo "HPCG source is ready in $INSTALL_DIR"
