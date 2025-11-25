#!/bin/bash

set -euo pipefail

OMPI_DIR="$HOME/openmpi"
TARBALL="$HOME/openmpi-5.0.8.tar.bz2"
URL="https://download.open-mpi.org/release/open-mpi/v5.0/openmpi-5.0.8.tar.bz2"

if [ ! -d "$OMPI_DIR" ]; then
    mkdir -p "$OMPI_DIR"
    echo "Downloading OpenMPI 5.0.8"
    wget -O "$TARBALL" "$URL"

    echo "Extracting to $OMPI_DIR"
    tar -xf "$TARBALL" -C "$OMPI_DIR" --strip-components=1
    rm -f "$TARBALL"

    echo "OpenMPI 5.0.8 downloaded and extracted successfully"

else
    echo "OpenMPI directory exists at $OMPI_DIR"
    echo "Remove it and rerun this script if you wish to redownload"
fi
