#!/usr/bin/env bash
set -Eeuo pipefail

# Directory with the merged sources from script 1
AMBER_SRC_DIR="${AMBER_SRC_DIR:-$HOME/benchmarks/amber/ambertools25_src}"

# Where to install Amber (serial + later MPI will go here)
AMBER_INSTALL_DIR="${AMBER_INSTALL_DIR:-$HOME/benchmarks/amber/amber_builds}"

# Number of build threads
NPROCS="${NPROCS:-$(nproc)}"

echo "=== Amber serial build ==="
echo "AMBER_SRC_DIR      : $AMBER_SRC_DIR"
echo "AMBER_INSTALL_DIR  : $AMBER_INSTALL_DIR"
echo "NPROCS             : $NPROCS"
echo

[[ -d "$AMBER_SRC_DIR" ]] || {
    echo "Error: AMBER_SRC_DIR '$AMBER_SRC_DIR' does not exist." >&2
    exit 1
}

cd "$AMBER_SRC_DIR"

# Tutorial says: change to ambertools25_src/build
if [[ ! -d build ]]; then
    echo "Error: build directory not found under $AMBER_SRC_DIR" >&2
    exit 1
fi

cd build

[[ -f run_cmake ]] || {
    echo "Error: run_cmake script not found in $(pwd)" >&2
    exit 1
}

# Backup run_cmake once
if [[ ! -f run_cmake.orig ]]; then
    cp run_cmake run_cmake.orig
    echo "[+] Backed up run_cmake -> run_cmake.orig"
fi

echo "[+] Updating CMAKE_INSTALL_PREFIX in run_cmake ..."
if grep -q -- "-DCMAKE_INSTALL_PREFIX=" run_cmake; then
    sed -i "s|-DCMAKE_INSTALL_PREFIX=[^ ]*|-DCMAKE_INSTALL_PREFIX=$AMBER_INSTALL_DIR|g" run_cmake
else
    echo "Warning: -DCMAKE_INSTALL_PREFIX= not found in run_cmake; please check manually." >&2
fi

echo "[+] Ensuring MPI is disabled for serial build ..."
if grep -q "DMPI=TRUE" run_cmake; then
    sed -i "s/DMPI=TRUE/DMPI=FALSE/g" run_cmake
fi

# Optional: pre-empt the conda-libmamba-solver issue
export CONDA_SOLVER="${CONDA_SOLVER:-classic}"

echo "[+] Running run_cmake for serial build ..."
./run_cmake

echo "[+] Building and installing (serial) ..."
make install -j"$NPROCS"

echo
echo "=== Serial build complete ==="
echo "Amber installed into: $AMBER_INSTALL_DIR"
echo "You should now have serial binaries like 'sander' and 'pmemd' there."
