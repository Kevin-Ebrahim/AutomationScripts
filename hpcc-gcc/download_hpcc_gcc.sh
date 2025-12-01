#!/bin/bash
# download.sh
# Downloads HPCC and OpenBLAS sources

# Config
WORK_DIR="$HOME/benchmarks/hpcc-gcc"
OPENBLAS_VER="0.3.26" # Recent stable version
HPCC_VER="1.5.0b"     # Standard competition version

echo "--- Creating Workspace at $WORK_DIR ---"
mkdir -p "$WORK_DIR/src"
mkdir -p "$WORK_DIR/libs"
cd "$WORK_DIR/src"

if [ ! -d "hpcc-$HPCC_VER" ]; then
    echo "Downloading HPCC $HPCC_VER..."
    wget -q --show-progress "http://icl.utk.edu/projectsfiles/hpcc/download/hpcc-$HPCC_VER.tar.gz"
    tar -xzf "hpcc-$HPCC_VER.tar.gz"
else
    echo "HPCC already downloaded."
fi

echo "--- Download Complete ---"
