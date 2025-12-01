#!/bin/bash
set -euo pipefail

DOWNLOAD_DIR="$HOME/tmp/oneapi-installers"

BASE_INSTALLER="intel-oneapi-base-toolkit-2025.3.0.375_offline.sh"
HPC_INSTALLER="intel-oneapi-hpc-toolkit-2025.3.0.381_offline.sh"

LOG_DIR="$DOWNLOAD_DIR/logs"
mkdir -p "$LOG_DIR"

err() {
    echo "[$(basename "$0")] ERROR: $*" >&2
    exit 1
}

install_deps() {
    sudo apt update
    sudo apt-get install -y \
        xdg-utils \
        libxcb-dri3-0 \
        libnotify4 \
        libgbm1 \
        libatspi2.0-0 \
        libgtk-3-0 || true
}

run_installer_user() {
    local file="$1"
    local logfile="$LOG_DIR/${file%.sh}_$(date +%Y%m%d_%H%M%S).log"

    cd "$DOWNLOAD_DIR" || err "Cannot cd to $DOWNLOAD_DIR"
    [[ -f "./$file" ]] || err "Installer not found: $DOWNLOAD_DIR/$file"

    chmod +x "./$file" || true

    echo "============================================================"
    echo "Running installer: $file"
    echo "Log file:          $logfile"
    echo "Install location:  $HOME/intel/oneapi"
    echo "============================================================"

    set +e
    bash "./$file" -a --silent --cli --eula accept >"$logfile" 2>&1
    local rc=$?
    set -e

    if [[ $rc -ne 0 ]]; then
        echo
        echo "[$(basename "$0")] Installer FAILED: $file (exit code: $rc)" >&2
        echo "Last 80 log lines:" >&2
        tail -n 80 "$logfile" >&2
        exit "$rc"
    fi

    echo "$file installer complete"
}

if [[ "$(id -u)" -eq 0 ]]; then
    err "Run this script as a regular user (it installs into \$HOME/intel/oneapi)."
fi

[[ -d "$DOWNLOAD_DIR" ]] || err "DOWNLOAD_DIR does not exist: $DOWNLOAD_DIR. Run download.sh first."

install_deps

run_installer_user "$BASE_INSTALLER"
run_installer_user "$HPC_INSTALLER"

echo
echo "All oneAPI installers completed. Activate with:"
echo "  source \"$HOME/intel/oneapi/setvars.sh\""

