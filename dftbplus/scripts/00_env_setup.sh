#!/bin/bash
# scripts/00_env_setup.sh

echo "--------------------------------------------------------"
echo "Initializing Intel OneAPI Environment..."

# 1. Source Intel Environment
INTEL_LOCATIONS=(
    "/opt/intel/oneapi/setvars.sh"
    "$HOME/intel/oneapi/setvars.sh"
    "/usr/local/intel/oneapi/setvars.sh"
    "/scratch/intel/oneapi/setvars.sh"
)

FOUND_INTEL="NO"
for loc in "${INTEL_LOCATIONS[@]}"; do
    if [ -f "$loc" ]; then
        source "$loc" > /dev/null
        FOUND_INTEL="YES"
        break
    fi
done

if [ "$FOUND_INTEL" == "NO" ]; then
    if command -v module &> /dev/null; then
        module load intel 2>/dev/null || module load intel-oneapi 2>/dev/null || module load compiler/latest 2>/dev/null
        module load mpi 2>/dev/null
    fi
fi

# 2. Set MPI Wrappers as Compilers
# This fixes the include path issues
export CC=mpiicx
export CXX=mpiicpx
export FC=mpiifx
export F77=mpiifx
export F90=mpiifx

# 3. Verify Wrapper
if ! command -v mpiifx &> /dev/null; then
    echo "❌ Error: Intel MPI Wrapper 'mpiifx' not found."
    echo "   Ensure 'intel-hpckit' is installed and 'module load mpi' is run."
    exit 1
fi

# 4. Flags
# -ipo requires lots of RAM. If build fails with OOM, remove -ipo.
# -xCORE-AVX512 is safer if compiling on a different headnode for a modern cluster
# Removing -ipo to fix linker errors between Fortran and C
export CFLAGS="-O3 -xHost -qopenmp"
export FFLAGS="-O3 -xHost -qopenmp"
export CXXFLAGS="-O3 -xHost -qopenmp"

echo "Environment Ready (MPI Wrappers Active)."
echo "--------------------------------------------------------"
