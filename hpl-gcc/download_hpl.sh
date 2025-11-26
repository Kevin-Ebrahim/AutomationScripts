#!/bin/bash

set -euo pipefail

HPL_VERSION="2.3"
HPL_URL="https://netlib.org/benchmark/hpl/hpl-${HPL_VERSION}.tar.gz"
HPL_TAR="hpl-${HPL_VERSION}.tar.gz"
INSTALL_DIR="$HOME/benchmarks/hpl/hpl-${HPL_VERSION}"

if [[ -d "$INSTALL_DIR" ]]; then
    echo "Error: Directory $INSTALL_DIR already exists. Remove it or choose another path." >&2
    exit 1
fi

sudo mkdir -p "$(dirname "$INSTALL_DIR")"

if [[ ! -f "/tmp/${HPL_TAR}" ]]; then
    echo "Downloading  HPL ${HPL_VERSION} from netlib..."
    wget "$HPL_URL" -O "/tmp/${HPL_TAR}" || { echo "Download failed. Check network or URL." >&2; exit 1; }
else
    echo "Using cached /tmp/${HPL_TAR}"
fi

echo "Extracting HPL tarball..."
tar -xzf "/tmp/${HPL_TAR}" -C "$(dirname "$INSTALL_DIR")" || { echo "Extraction failed." >&2; exit 1; }

echo "Removing HPL tarball..."
rm -rf "/tmp/${HPL_TAR}"

# Rename only when the unpacked name is different from INSTALL_DIR
if [[ ! -d  "$INSTALL_DIR" ]]; then
    mv "$(dirname "$INSTALL_DIR")/hpl-${HPL_VERSION}" "$INSTALL_DIR" || { echo "Rename failed." >&2; exit 1; }
fi

echo "HPL source is ready in $INSTALL_DIR"
