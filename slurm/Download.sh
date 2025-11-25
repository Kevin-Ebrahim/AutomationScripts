#!/bin/env bash

set -Eeuo pipefail

if [ ! -d "$HOME/slurm" ]; then
    mkdir -p "$HOME/slurm"
    wget -O $HOME/slurm.tar.bz2 https://download.schedmd.com/slurm/slurm-25.05.2.tar.bz2
    tar -xf "$HOME/slurm.tar.bz2" -C "$HOME/slurm" --strip-components=1
    rm "$HOME/slurm.tar.bz2"
else
    echo "Slurm directory already exits, remove and rerun this script if you wish to redownload"
fi
