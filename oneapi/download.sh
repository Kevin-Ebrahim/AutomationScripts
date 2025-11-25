#!/bin/bash

set -euo pipefail

ONEAPI_VERSION="2025.3.0"

INSTALL_ROOT="$HOME/intel/oneapi"

DOWNLOAD_DIR="$HOME/tmp/oneapi-installers"

# Base Toolkit offline installer (Linux, 2025.3)
BASE_INSTALLER="intel-oneapi-base-toolkit-2025.3.0.375_offline.sh"
BASE_URL="https://registrationcenter-download.intel.com/akdlm/IRC_NAS/d640da34-77cc-4ab2-8019-ac5592f4ec19/intel-oneapi-base-toolkit-2025.3.0.375_offline.sh"

# HPC Toolkit offline installer (Linux, 2025.3)
HPC_INSTALLER="intel-oneapi-hpc-toolkit-2025.3.0.381_offline.sh"
HPC_URL="https://registrationcenter-download.intel.com/akdlm/IRC_NAS/66021d90-934d-41f4-bedf-b8c00bbe98bc/intel-oneapi-hpc-toolkit-2025.3.0.381_offline.sh"

err() {
    echo "[$(basename "$0")] ERROR: $*" >&2
    exit 1
}

check_prereqs() {
    if [[ "$(id -u)" -eq 0 ]]; then
        err "Run this script as a regular user, not root. \
            It is designed to install oneAPI into \$HOME/intel/oneapi"
    fi

    command -v wget >/dev/null 2>&1 || err "wget not found. Install it (e.g. 'sudo apt install wget') and rerun"
}

download_installer() {
    local url="$1"
    local file="$2"

    mkdir -p "$DOWNLOAD_DIR"
    cd "$DOWNLOAD_DIR" || exit 1

    if [[ -f "$file" ]]; then
        echo "Using existing installer: $DOWNLOAD_DIR/$file"
    else
        echo "Downloading $file"
        wget -O "$file" "$url"
    fi

    chmod +x "$file"
    echo "$file downloaded successfully"
}

check_prereqs

echo "Target oneAPI version: $ONEAPI_VERSION"
echo "Expected install root: $INSTALL_ROOT"
if [[ -d "$INSTALL_ROOT" ]]; then
    echo "NOTE: $INSTALL_ROOT already exists. The Intel installers may update or add components there"
fi

download_installer "$BASE_URL" "$BASE_INSTALLER"
download_installer "$HPC_URL" "$HPC_INSTALLER"

echo "Download complete. Installers are in: $DOWNLOAD_DIR"
