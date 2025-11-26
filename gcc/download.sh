#!/bin/bash

set -euo pipefail

GCC_VERSION="${GCC_VERSION:-15.2.0}"
SRC_ROOT="${SRC_ROOT:-$HOME/tmp}"
GCC_SRC_DIR="${GCC_SRC_DIR:-$SRC_ROOT/gcc-$GCC_VERSION}"
TARBALL="${TARBALL:-$SRC_ROOT/gcc-$GCC_VERSION.tar.xz}"

# Official GNU source URL
GCC_URL="${GCC_URL:-https://sourceware.org/pub/gcc/releases/gcc-$GCC_VERSION/gcc-$GCC_VERSION.tar.xz}"

mkdir -p "$SRC_ROOT"

echo "GCC version:   $GCC_VERSION"
echo "Source root:   $SRC_ROOT"
echo "Source dir:    $GCC_SRC_DIR"
echo "Tarball path:  $TARBALL"
echo "Download URL:  $GCC_URL"
echo

if [[ -d "$GCC_SRC_DIR" ]]; then
    echo "Source directory already exists: $GCC_SRC_DIR"
    echo "Skipping download/extract. Delete it if you want a fresh unpack."
    exit 0
fi

if [[ ! -f "$TARBALL" ]]; then
    echo "Downloading GCC $GCC_VERSION tarball..."
    wget -O "$TARBALL" "$GCC_URL"
else
    echo "Using existing tarball: $TARBALL"
fi

echo
echo "Extracting GCC source..."
tar -xf "$TARBALL" -C "$SRC_ROOT"

if [[ ! -d "$GCC_SRC_DIR" ]]; then
    echo "ERROR: Expected source dir '$GCC_SRC_DIR' not found after extraction." >&2
    exit 1
fi

echo "GCC source ready at: $GCC_SRC_DIR"
