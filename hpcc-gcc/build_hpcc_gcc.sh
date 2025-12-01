#!/bin/bash
# build_hpcc_gcc.sh
# Automates the configuration and compilation of HPCC 1.5.0b

# --- Configuration ---
WORK_DIR="$HOME/benchmarks/hpcc-gcc"
HPCC_VER="1.5.0b"
HPCC_DIR="$WORK_DIR/src/hpcc-$HPCC_VER"
ARCH="gcc"

if [ ! -d "$HPCC_DIR" ]; then
    echo "Error: HPCC directory not found."
    exit 1
fi

cd "$HPCC_DIR"

echo "--- Configuring HPCC (OPTIMIZED) for architecture: $ARCH ---"

# 1. Start with the standard Linux template
if [ -f "hpl/setup/Make.Linux_PII_CBLAS_gm" ]; then
    cp hpl/setup/Make.Linux_PII_CBLAS_gm hpl/Make.$ARCH
else
    cp hpl/setup/Make.Unix hpl/Make.$ARCH
fi

# 2. General Settings
sed -i "s/^ARCH .*=.*/ARCH         = $ARCH/" hpl/Make.$ARCH
sed -i "s/^TOPdir .*=.*/TOPdir       = ..\/..\/../" hpl/Make.$ARCH
sed -i "s/^CC .*=.*/CC           = mpicc/" hpl/Make.$ARCH
sed -i "s/^LINKER .*=.*/LINKER       = mpicc/" hpl/Make.$ARCH

# 3. OPTIMIZATION SECTION
# -march=native: Target this specific CPU
# -ffast-math: Aggressive floating point optimization
# REMOVED: -DUSING_FFTW (Causes build failure with FFTW3)
# -DHPCC_MEMALLCTR: Use custom memory allocator
sed -i "s/^CCFLAGS .*=.*/CCFLAGS      = \$(HPL_DEFS) -fomit-frame-pointer -O3 -funroll-loops -march=native -mtune=native -ffast-math -W -Wall -Wno-misleading-indentation -DHPCC_MEMALLCTR/" hpl/Make.$ARCH

# 4. LINKING LIBRARIES (System OpenBLAS only)
sed -i "s/^MPdir .*=.*/MPdir        =/" hpl/Make.$ARCH
sed -i "s/^MPinc .*=.*/MPinc        =/" hpl/Make.$ARCH
sed -i "s/^MPlib .*=.*/MPlib        =/" hpl/Make.$ARCH
sed -i "s/^LAdir .*=.*/LAdir        =/" hpl/Make.$ARCH
sed -i "s/^LAinc .*=.*/LAinc        =/" hpl/Make.$ARCH
# Link only OpenBLAS (Removed -lfftw3)
sed -i "s/^LAlib .*=.*/LAlib        = -lopenblas/" hpl/Make.$ARCH

# 5. SOURCE PATCHING (OpenMPI 5+ Fixes)
# This is required because your OpenMPI version is very new
echo "--- Patching Source Code for OpenMPI 5+ ---"
grep -rl "MPI_Address" . | xargs sed -i 's/MPI_Address/MPI_Get_address/g'
grep -rl "MPI_Type_struct" . | xargs sed -i 's/MPI_Type_struct/MPI_Type_create_struct/g'
grep -rl "MPI_Type_hvector" . | xargs sed -i 's/MPI_Type_hvector/MPI_Type_create_hvector/g'
grep -rl "MPI_Type_hindexed" . | xargs sed -i 's/MPI_Type_hindexed/MPI_Type_create_hindexed/g'

# 6. Build
echo "--- Starting Optimized Compilation ---"
# Clean previous attempts to avoid mixed object files
make arch=$ARCH clean_arch 2>/dev/null
make arch=$ARCH

if [ -f "hpcc" ]; then
    echo "------------------------------------------------"
    echo "SUCCESS: Optimized HPCC executable created."
    echo "You can now run 'make run'"
    echo "------------------------------------------------"
else
    echo "FAILURE: Compilation failed."
    exit 1
fi
