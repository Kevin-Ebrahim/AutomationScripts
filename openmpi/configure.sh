#!/bin/bash
set -euo pipefail

export CFLAGS="-O3 -march=native"
export CXXFLAGS="-O3 -march=native"
export FCFLAGS="-O3 -march=native"

sudo apt install -y build-essential gfortran pkg-config \
    libevent-dev libhwloc-dev libnuma-dev libucx-dev \
    libpmix-dev libpmix-bin

cd $HOME/openmpi

./configure \
    --prefix=/usr/local \
    --enable-shared \
    --disable-static \
    --with-pic \
    --with-slurm \
    --with-pmix=internal \
    --with-ucx \
    --with-libevent=external \
    --with-hwloc=external \
    --enable-mpi-fortran \
    --disable-debug

sudo apt remove -y openmpi-bin libopenmpi-dev
sudo apt autoremove -y
