#!/bin/bash

set -euo pipefail

INSTALL_ROOT="$HOME/intel/oneapi"

DOWNLOAD_DIR="$HOME/tmp/oneapi-installers"

PACKAGEMAN_ROOT="$HOME/intel/packagemanager"

# Control what to remove:
REMOVE_INSTALL_ROOT="${REMOVE_INSTALL_ROOT:-yes}"
REMOVE_DOWNLOAD_DIR="${REMOVE_DOWNLOAD_DIR:-no}"
REMOVE_PACKAGEMAN_ROOT="${REMOVE_PACKAGEMAN_ROOT:-yes}"

safe_rm_dir() {
    local path="$1"
    local label="$2"

    # Empty or root safety guard
    if [[ -z "$path" || "$path" == "/" ]]; then
        echo "Refusing to remove suspicious path for $label: '$path'"
    fi

    if [[ -d "$path" ]]; then
        echo "Removing $label at: $path"
        rm -rf -- "$path"
    else
        echo "Nothing to remove for $label (directory not found): $path"
    fi
}

if [[ "$(id -u)" -eq 0 ]]; then
    echo "Do not run this as root. It is meant to clean a user-level oneAPI install in \$HOME."
fi

echo "Cleaning Intel oneAPI installation and related files (user-level)."

if [[ "$REMOVE_INSTALL_ROOT" == "yes" ]]; then
    safe_rm_dir "$INSTALL_ROOT" "oneAPI install root"
else
    echo "Skipping removal of INSTALL_ROOT (REMOVE_INSTALL_ROOT != yes): $INSTALL_ROOT"
fi

if [[ "$REMOVE_PACKAGEMAN_ROOT" == "yes" ]]; then
    safe_rm_dir "$PACKAGEMAN_ROOT" "Intel packagemanager root"
else
    echo "Skipping removal of PACKAGEMAN_ROOT (REMOVE_PACKAGEMAN_ROOT != yes): $PACKAGEMAN_ROOT"
fi

if [[ "$REMOVE_DOWNLOAD_DIR" == "yes" ]]; then
    safe_rm_dir "$DOWNLOAD_DIR" "offline installers directory"
else
    echo "Skipping removal of DOWNLOAD_DIR (REMOVE_DOWNLOAD_DIR != yes): $DOWNLOAD_DIR"
fi

echo "Clean complete."
