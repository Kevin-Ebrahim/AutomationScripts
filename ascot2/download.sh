#!/bin/bash

set -euo pipefail

ASCOT_VERSION="5.6.2"
ASCOT_TAR="ascot5-${ASCOT_VERSION}.tar.gz"
ASCOT_URL="https://github.com/ascot4fusion/ascot5/archive/refs/tags/${ASCOT_VERSION}.tar.gz"

INSTALL_DIR="$HOME/benchmarks/ascot/ascot5-${ASCOT_VERSION}"
PARENT_DIR="$(dirname "$INSTALL_DIR")"
TMP_TAR="$HOME/benchmarks/ascot/${ASCOT_TAR}"

if [[ -d "$INSTALL_DIR" ]]; then
    echo "Error: Directory $INSTALL_DIR already exists. Remove it or choose another version." >&2
    exit 1
fi

mkdir -p "$PARENT_DIR"
if [[ ! -w "$PARENT_DIR" ]]; then
    echo "Error: $PARENT_DIR is not writable by user $(whoami)." >&2
    echo "You may fix this with:"
    echo "  sudo chown -R \"${USER}:$(id -gn)\" \"$PARENT_DIR\""
    exit 1
fi

if [[ ! -f "$TMP_TAR" ]]; then
    echo "Downloading ASCOT5 ${ASCOT_VERSION} source..."
    wget -q "$ASCOT_URL" -O "$TMP_TAR" || {
        echo "Download failed. Please check the URL or network connectivity." >&2
        exit 1
    }
else
    echo "Using cached tarball at $TMP_TAR"
fi

echo "Extracting ASCOT5 source..."
tar -xzf "$TMP_TAR" -C "$PARENT_DIR" || {
    echo "Extraction failed." >&2
    exit 1
}

rm -f "$TMP_TAR"

if [[ ! -d "$INSTALL_DIR" ]]; then
    mv "$PARENT_DIR/ascot5-${ASCOT_VERSION}" "$INSTALL_DIR" || {
        echo "Rename failed." >&2
        exit 1
    }
fi

echo "ASCOT5 source is ready in $INSTALL_DIR"
