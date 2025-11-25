#!/usr/bin/env bash
set -euo pipefail

########################################
# Config (override via env if you want)
########################################

# oneAPI version string is informational here; file names are pinned to 2025.3
ONEAPI_VERSION="${ONEAPI_VERSION:-2025.3.0}"

# Where Intel will install oneAPI for a non-root user (default from Intel docs)
INSTALL_ROOT="${INSTALL_ROOT:-$HOME/intel/oneapi}"

# Where to download the offline installers
DOWNLOAD_DIR="${DOWNLOAD_DIR:-$HOME/tmp/oneapi-installers}"

# Whether to keep the downloaded .sh files after installation:
#   yes  -> keep them
#   no   -> delete after successful install
KEEP_INSTALLERS="${KEEP_INSTALLERS:-yes}"

# Base Toolkit offline installer (Linux, 2025.3)
BASE_INSTALLER="${BASE_INSTALLER:-intel-oneapi-base-toolkit-2025.3.0.375_offline.sh}"
BASE_URL="${BASE_URL:-https://registrationcenter-download.intel.com/akdlm/IRC_NAS/d640da34-77cc-4ab2-8019-ac5592f4ec19/intel-oneapi-base-toolkit-2025.3.0.375_offline.sh}"

# HPC Toolkit offline installer (Linux, 2025.3)
HPC_INSTALLER="${HPC_INSTALLER:-intel-oneapi-hpc-toolkit-2025.3.0.381_offline.sh}"
HPC_URL="${HPC_URL:-https://registrationcenter-download.intel.com/akdlm/IRC_NAS/66021d90-934d-41f4-bedf-b8c00bbe98bc/intel-oneapi-hpc-toolkit-2025.3.0.381_offline.sh}"

########################################
# Helpers
########################################

err() {
    echo "[$(basename "$0")] ERROR: $*" >&2
    exit 1
}

info() {
    echo "[$(basename "$0")] $*"
}

check_prereqs() {
    if [[ "$(id -u)" -eq 0 ]]; then
        err "Run this script as a regular user, not root. \
It is designed to install oneAPI into \$HOME/intel/oneapi."
    fi

    command -v wget >/dev/null 2>&1 || err "wget not found. Install it (e.g. 'sudo apt install wget') and rerun."
    command -v sh >/dev/null 2>&1 || err "POSIX sh not found in PATH."
}

download_installer() {
    local url="$1"
    local file="$2"

    mkdir -p "$DOWNLOAD_DIR"
    cd "$DOWNLOAD_DIR"

    if [[ -f "$file" ]]; then
        info "Using existing installer: $DOWNLOAD_DIR/$file"
    else
        info "Downloading $file"
        wget -O "$file" "$url"
    fi

    chmod +x "$file"
}

run_installer_user() {
    local file="$1"

    cd "$DOWNLOAD_DIR"

    info "Running installer (user-level, silent): $file"
    # Non-root + --silent uses default user install dir: ~/intel/oneapi
    # --cli avoids GUI; --eula accept is required by Intel's docs.
    sh "./$file" -a --silent --cli --eula accept
}

cleanup_installers() {
    if [[ "$KEEP_INSTALLERS" != "yes" ]]; then
        info "Removing downloaded installers from $DOWNLOAD_DIR"
        rm -f "$DOWNLOAD_DIR/$BASE_INSTALLER" "$DOWNLOAD_DIR/$HPC_INSTALLER" || true
    else
        info "Keeping installers in $DOWNLOAD_DIR (set KEEP_INSTALLERS=no to delete)."
    fi
}

########################################
# Main
########################################

check_prereqs

info "Target oneAPI version: $ONEAPI_VERSION"
info "Expected install root: $INSTALL_ROOT"
if [[ -d "$INSTALL_ROOT" ]]; then
    info "NOTE: $INSTALL_ROOT already exists. The Intel installers may update or add components there."
fi

# 1. Download installers
download_installer "$BASE_URL" "$BASE_INSTALLER"
download_installer "$HPC_URL" "$HPC_INSTALLER"

# 2. Run installers (Base first, then HPC)
run_installer_user "$BASE_INSTALLER"
run_installer_user "$HPC_INSTALLER"

# 3. Optional cleanup
cleanup_installers

# 4. Final message
echo
info "Intel oneAPI Base + HPC Toolkits should now be installed."
if [[ -f "$INSTALL_ROOT/setvars.sh" ]]; then
    echo
    echo "To use oneAPI in your shell, run:"
    echo "  source \"$INSTALL_ROOT/setvars.sh\""
else
    echo
    echo "WARNING: $INSTALL_ROOT/setvars.sh not found."
    echo "Check installer logs or $INSTALL_ROOT contents to verify installation."
fi

