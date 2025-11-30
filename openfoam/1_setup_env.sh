#!/bin/bash
set -e # Exit immediately if a command exits with a non-zero status.

# --- CUSTOM CONFIG FOR WITSA CLUSTER ---
OF_VERSION="v2506"
INSTALL_DIR="$HOME/apps/openfoam"
MPI_SETTING="SYSTEMOPENMPI"

# exact URLs from the documentation you provided
URL_OF="https://dl.openfoam.com/source/$OF_VERSION/OpenFOAM-$OF_VERSION.tgz"
URL_TP="https://dl.openfoam.com/source/$OF_VERSION/ThirdParty-$OF_VERSION.tgz"

echo "=== [Phase 1] Environment Setup for Wits-A (FIXED) ==="

# 1. Install System Dependencies
echo "--> Installing Ubuntu system dependencies..."
sudo apt-get update -y
sudo apt-get install -y build-essential flex bison cmake zlib1g-dev libopenmpi-dev openmpi-bin git wget

# 2. Directory Structure
echo "--> Entering directory: $INSTALL_DIR"
mkdir -p "$INSTALL_DIR"
cd "$INSTALL_DIR"

# 3. Download Source Code
# FIX: Now pointing to the specific .tgz files
if [ ! -d "OpenFOAM-$OF_VERSION" ]; then
    echo "--> Downloading OpenFOAM source..."
    wget -qO - "$URL_OF" | tar xvz

    # Rename safety check
    mv OpenFOAM-$OF_VERSION* OpenFOAM-$OF_VERSION 2>/dev/null || true
else
    echo "--> OpenFOAM source folder found. Skipping download."
fi

if [ ! -d "ThirdParty-$OF_VERSION" ]; then
    echo "--> Downloading ThirdParty source..."
    wget -qO - "$URL_TP" | tar xvz

    mv ThirdParty-$OF_VERSION* ThirdParty-$OF_VERSION 2>/dev/null || true
else
    echo "--> ThirdParty source folder found. Skipping download."
fi

# 4. Configure bashrc for System MPI
echo "--> Configuring OpenFOAM bashrc..."
BASHRC="$INSTALL_DIR/OpenFOAM-$OF_VERSION/etc/bashrc"

# Set MPI to System OpenMPI (Critical for Ubuntu Clusters)
sed -i 's/^export WM_MPLIB=.*/export WM_MPLIB=SYSTEMOPENMPI/' "$BASHRC"

echo "=== Setup Complete. Ready for Optimization. ==="
