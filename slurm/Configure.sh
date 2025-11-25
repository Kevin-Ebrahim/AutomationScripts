#!/bin/env bash
set -Eeuo pipefail

sudo apt install -y libmunge-dev libhwloc-dev libnuma-dev libssl-dev libsystemd-dev cgroup-tools libdbus-1-dev hwloc libhwloc-dev libpmix-bin libpmix-dev libpmix-dev libpmix2t64

# Create /usr/local/etc if not there
sudo mkdir -p /usr/local/etc

# Write a minimal cgroup.conf
sudo tee /usr/local/etc/cgroup.conf > /dev/null <<'EOF'
ConstrainCores=yes
ConstrainRAMSpace=yes
ConstrainDevices=yes
EOF

config() {
    export CFLAGS="-O3 -march=native"
    export CXXFLAGS="-O3 -march=native"
    cd $HOME/slurm
    ./configure \
        --with-pmix=/usr/lib/x86_64-linux-gnu/pmix2 \
        --with-hwloc=/usr \
        --with-munge=/usr \
        --with-systemdsystemunitdir=/etc/systemd/system
}

sudo apt remove -y slurm-wlm slurmctld slurmd slurm-client
sudo apt autoremove -y
config
