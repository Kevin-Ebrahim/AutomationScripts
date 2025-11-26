#!/bin/bash

set -euo pipefail

trap 'ec=$?; (( ec != 0 )) && echo "Download/extract failed (exit $ec)." >&2' EXIT
trap 'echo "Script interrupted" >&2; exit 2' INT TERM

# ---- Config ----
GCC_VERSION="15.2.0"
BACKING_DIR="$HOME/compilers/gcc" # NFS backing path on HEAD
ARCHIVE="gcc-${GCC_VERSION}.tar.xz"
MIRROR_URL="https://mirror.ufs.ac.za/gnu/gcc/gcc-${GCC_VERSION}/${ARCHIVE}"

# ---- Prep ----
mkdir -p "${BACKING_DIR}"

cd "${BACKING_DIR}"

# ---- Download (resume if partial) ----
if [ ! -f "${ARCHIVE}" ]; then
    echo "Downloading ${ARCHIVE} from UFS mirror…"
    wget -c --tries=5 --timeout=30 --read-timeout=20 -O "${ARCHIVE}" "${MIRROR_URL}"
else
    echo "Archive already present: ${ARCHIVE}"
fi

# ---- Extract (multi-threaded xz) ----
# Extract directly under BACKING_DIR to avoid NFS write overhead.
echo "Extracting ${ARCHIVE} into ${BACKING_DIR}…"
tar --use-compress-program="xz -d -T0" -xf "${ARCHIVE}"

echo "Download and decompression complete."
