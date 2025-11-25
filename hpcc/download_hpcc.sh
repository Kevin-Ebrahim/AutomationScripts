#!/bin/bash

set -euo pipefail

HPCC_VERSION="1.5.0"
HPCC_URL="http://icl.cs.utk.edu/projectsfiles/hpcc/download/hpcc-${HPCC_VERSION}.tar.gz"
HPCC_TAR="hpcc-${HPCC_VERSION}.tar.gz"
INSTALL_DIR="$HOME/benchmarks/hpcc/hpcc-${HPCC_VERSION}"
PARENT_DIR="$(dirname "$INSTALL_DIR")"
TMP_TAR="/tmp/${HPCC_TAR}"

if [[ -d "$INSTALL_DIR" ]]; then
    echo "Error: Directory $INSTALL_DIR already exists. Remove it or choose another path." >&2
    exit 1
fi

mkdir -p "$PARENT_DIR"
if [[ ! -w "$PARENT_DIR" ]]; then
    echo "Error: $PARENT_DIR is not writable by $(whoami)."
    echo "Fix with:"
    echo "  sudo chown -R \"$USER\":\"$(id -gn)\" \"$PARENT_DIR\""
    exit 1
fi

if [[ ! -f "$TMP_TAR" ]]; then
    echo "Downloading HPCC ${HPCC_VERSION} from official source..."
    wget "$HPCC_URL" -O "$TMP_TAR" || { echo "Download failed. Check network or URL." >&2; exit 1; }
else
    echo "Using cached $TMP_TAR"
fi

echo "Extracting HPCC tarball..."
tar -xzf "$TMP_TAR" -C "$PARENT_DIR" || { echo "Extraction failed." >&2; exit 1; }

echo "Removing HPCC tarball..."
rm -f "$TMP_TAR"

# Rename if extracted folder name differs (should be hpcc-1.5.0)
if [[ ! -d "$INSTALL_DIR" ]]; then
    mv "$(dirname "$INSTALL_DIR")/hpcc-${HPCC_VERSION}" "$INSTALL_DIR" || { echo "Rename failed." >&2; exit 1; }
fi

echo "HPCC source is ready in $INSTALL_DIR"

