#!/bin/bash
# scripts/01_install_os_deps.sh

echo "Installing OS dependencies..."
sudo apt update
# We only need git, cmake and make.
# We DO NOT install gfortran or openblas to avoid linking conflicts.
sudo apt install -y build-essential git cmake make

echo "OS dependencies installed."
