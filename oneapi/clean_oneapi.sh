#!/usr/bin/env bash
set -euo pipefail

########################################
# Config (override via env if you want)
########################################

# Where oneAPI was installed (must match install_oneapi_offline.sh)
INSTALL_ROOT="${INSTALL_ROOT:-$HOME/intel/oneapi}"

# Where offline installers were downloaded
DOWNLOAD_DIR="${DOWNLOAD_DIR:-$HOME/tmp/oneapi-installers}"

# Intel’s user-level package manager dir (created by the installer)
PACKAGEMAN_ROOT="${PACKAGEMAN_ROOT:-$HOME/intel/packagemanager}"

# Control what to remove:
REMOVE_INSTALL_ROOT="${REMOVE_INSTALL_ROOT:-yes}"      # yes/no
REMOVE_DOWNLOAD_DIR="${REMOVE_DOWNLOAD_DIR:-yes}"      # yes/no
REMOVE_PACKAGEMAN_ROOT="${REMOVE_PACKAGEMAN_ROOT:-yes}" # yes/no

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

check_not_root() {
    if [[ "$(id -u)" -eq 0 ]]; then
        err "Do not run this as root. It is meant to clean a user-level oneAPI install in \$HOME."
    fi
}

safe_rm_dir() {
    local path="$1"
    local label="$2"

    # Empty or root safety guard
    if [[ -z "$path" || "$path" == "/" ]]; then
        err "Refusing to remove suspicious path for $label: '$path'"
    fi

    if [[ -d "$path" ]]; then
        info "Removing $label at: $path"
        rm -rf -- "$path"
    else
        info "Nothing to remove for $label (directory not found): $path"
    fi
}

########################################
# Main
########################################

check_not_root

info "Cleaning Intel oneAPI installation and related files (user-level)."

if [[ "$REMOVE_INSTALL_ROOT" == "yes" ]]; then
    safe_rm_dir "$INSTALL_ROOT" "oneAPI install root"
else
    info "Skipping removal of INSTALL_ROOT (REMOVE_INSTALL_ROOT != yes): $INSTALL_ROOT"
fi

if [[ "$REMOVE_PACKAGEMAN_ROOT" == "yes" ]]; then
    safe_rm_dir "$PACKAGEMAN_ROOT" "Intel packagemanager root"
else
    info "Skipping removal of PACKAGEMAN_ROOT (REMOVE_PACKAGEMAN_ROOT != yes): $PACKAGEMAN_ROOT"
fi

if [[ "$REMOVE_DOWNLOAD_DIR" == "yes" ]]; then
    safe_rm_dir "$DOWNLOAD_DIR" "offline installers directory"
else
    info "Skipping removal of DOWNLOAD_DIR (REMOVE_DOWNLOAD_DIR != yes): $DOWNLOAD_DIR"
fi

info "Clean complete."

