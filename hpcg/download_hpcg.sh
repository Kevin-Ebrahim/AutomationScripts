#!/bin/bash

set -euo pipefail

# Version label for your directory naming; code is from GitHub.
HPCG_VERSION="3.1"
REPO_URL="https://github.com/hpcg-benchmark/hpcg.git"

# Optional: pin to a tag/branch/commit (e.g., "HPCG-release-3-1-0" or a SHA).
# Leave empty to use the latest default branch.
HPCG_REF="${HPCG_REF:-}"

INSTALL_DIR="$HOME/benchmarks/hpcg/hpcg-${HPCG_VERSION}"
PARENT_DIR="$(dirname "$INSTALL_DIR")"

# Fail early if the destination already exists
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

# Check for git
if ! command -v git >/dev/null 2>&1; then
    echo "Error: git not found in PATH. Please install git." >&2
    exit 1
fi

echo "Cloning HPCG source from $REPO_URL ..."
git clone --depth 1 "$REPO_URL" "$INSTALL_DIR"

# Optionally check out a specific ref (tag/branch/commit)
if [[ -n "$HPCG_REF" ]]; then
    echo "Checking out HPCG ref: $HPCG_REF"
    git -C "$INSTALL_DIR" fetch --depth 1 origin "$HPCG_REF"
    git -C "$INSTALL_DIR" checkout --detach FETCH_HEAD
fi

# Quick sanity: ensure expected layout (setup/, src/, configure)
if [[ ! -d "$INSTALL_DIR/setup" || ! -d "$INSTALL_DIR/src" || ! -x "$INSTALL_DIR/configure" ]]; then
    echo "Error: Unexpected repository layout under $INSTALL_DIR." >&2
    exit 1
fi

echo "HPCG source is ready in $INSTALL_DIR"
echo "Tip: tags available include 'HPCG-release-3-1-0' (2019). Omit HPCG_REF to use latest fixes from GitHub."
