#!/bin/env bash

set -Eeuo pipefail

export CFLAGS="-O3 -march=native"
export CXXFLAGS="-O3 -march=native"

#cd $HOME/slurm
#make -j$(nproc)
#make check
#sudo make install

make -C "$HOME/slurm" -j"$(nproc)"
make -C "$HOME/slurm" check

rm -rf /tmp/slurm-stage
make -C "$HOME/slurm" install DESTDIR=/tmp/slurm-stage
sudo rsync -a --chown=root:root /tmp/slurm-stage/ /

sudo ldconfig

sudo mkdir -p /var/spool/slurmd
sudo chown -R slurm:slurm /var/spool/slurmd
sudo chmod 755 /var/spool/slurmd

sudo mkdir -p /var/spool/slurmctld
sudo chown -R slurm:slurm /var/spool/slurmctld
sudo chmod 755 /var/spool/slurmctld
sudo touch /var/log/slurmctld.log
sudo chown -R slurm:slurm /var/log/slurmctld.log
sudo chmod 644 /var/log/slurmctld.log

sudo touch /var/log/slurmd.log
sudo chmod 644 /var/log/slurmd.log

sudo mkdir -p /var/lib/slurm
sudo chown -R slurm:slurm /var/lib/slurm

sudo mkdir -p /var/log/slurm
sudo chown -R slurm:slurm /var/log/slurm

sudo mkdir -p /var/run/slurm
sudo chown -R slurm:slurm /var/run/slurm

sudo mkdir -p /etc/slurm
sudo chown -R slurm:slurm /etc/slurm

if [[ -f "/etc/slurm/slurm.conf" ]]; then
    sudo mkdir -p /usr/local/etc
    sudo mv /etc/slurm/slurm.conf /usr/local/etc/slurm.conf
else
    echo "Please edit $HOME/tools/slurm/slurm.conf and put it in /usr/local/etc/"
fi
