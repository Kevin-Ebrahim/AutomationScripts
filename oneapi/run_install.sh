#!/bin/bash

set -euo pipefail

DOWNLOAD_DIR="$HOME/tmp/oneapi-installers"

# Base Toolkit offline installer (Linux, 2025.3)
BASE_INSTALLER="intel-oneapi-base-toolkit-2025.3.0.375_offline.sh"

# HPC Toolkit offline installer (Linux, 2025.3)
HPC_INSTALLER="intel-oneapi-hpc-toolkit-2025.3.0.381_offline.sh"

err() {
    echo "[$(basename "$0")] ERROR: $*" >&2
    exit 1
}

run_installer_user() {
    local file="$1"

    cd "$DOWNLOAD_DIR" || exit 1
    sudo apt update
    sudo apt-get install -y xdg-utils libxcb-dri3-0 libnotify4 libgbm1 libatspi2.0-0 libgtk-3-0

    echo "Running installer: $file"
    # Non-root + --silent uses default user install dir: ~/intel/oneapi
    # --cli avoids GUI; --eula accept is required
    sh "./$file" -a --silent --cli --eula accept
    echo "$file installer complete"
}

if [[ "$(id -u)" -eq 0 ]]; then
    err "Run this script as a regular user, not root. \
        It is designed to install oneAPI into \$HOME/intel/oneapi."
fi

[[ -d "$DOWNLOAD_DIR" ]] || err "DOWNLOAD_DIR does not exist: $DOWNLOAD_DIR. Run download.sh first."

run_installer_user "$BASE_INSTALLER"
run_installer_user "$HPC_INSTALLER"

echo "All oneAPI installers completed. If present, you can now run:"
echo "  source \"\$HOME/intel/oneapi/setvars.sh\""
