#!/bin/bash

set -euo pipefail

export CFLAGS="-O3 -march=native"
export CXXFLAGS="-O3 -march=native"
export FCFLAGS="-O3 -march=native"

make -C "$HOME/openmpi" -j"$(nproc)"

make -C "$HOME/openmpi" check

rm -rf /tmp/openmpi-stage
make -C "$HOME/openmpi" install DESTDIR=/tmp/openmpi-stage
sudo rsync -a --chown=root:root /tmp/openmpi-stage/ /

sudo ldconfig
