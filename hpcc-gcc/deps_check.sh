#!/bin/bash
# deps_check.sh
# Checks for Essential HPC Build Tools & Hardware Capabilities

# Colors for output
GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

echo -e "----------------------------------------------------"
echo -e "      HPC COMPETITION: Dependency & System Check    "
echo -e "----------------------------------------------------"

missing_counter=0

check_cmd() {
    if command -v "$1" >/dev/null 2>&1; then
        # If command exists, get version (head -n 1 for brevity)
        VER=$($1 --version 2>&1 | head -n 1 | cut -d ')' -f 1)
        echo -e "[ ${GREEN}OK${NC} ] $1 found: $VER"
    else
        echo -e "[${RED}FAIL${NC}] $1 is MISSING"
        ((missing_counter++))
    fi
}

echo "--- 1. Compiler Suite ---"
# HPCC requires C and Fortran.
# Fortran is CRITICAL for BLAS and HPL.
check_cmd gcc
check_cmd g++
check_cmd gfortran

echo ""
echo "--- 2. MPI Library ---"
# We need the compiler wrappers (mpicc) and the runner (mpirun)
check_cmd mpicc
check_cmd mpirun

echo ""
echo "--- 3. Build Utilities ---"
check_cmd make
check_cmd wget
check_cmd tar

echo ""
echo "--- 4. Hardware Optimization Check ---"
# This checks if your CPU actually supports the vector instructions
# that -march=native will try to use.
if grep -q "avx512" /proc/cpuinfo; then
    echo -e "[ ${GREEN}FAST${NC} ] AVX-512 detected (Excellent for DGEMM)"
elif grep -q "avx2" /proc/cpuinfo; then
    echo -e "[${GREEN}GOOD${NC}] AVX2 detected"
else
    echo -e "[${YELLOW}WARN${NC}] No AVX2/512 found. Speed will be limited."
fi

echo ""
echo "----------------------------------------------------"
if [ $missing_counter -eq 0 ]; then
    echo -e "${GREEN}STATUS: READY TO BUILD.${NC}"
    echo "You can proceed with install_and_compile.sh"
else
    echo -e "${RED}STATUS: MISSING $missing_counter DEPENDENCIES.${NC}"
    echo "Run the installation commands below before proceeding."
fi
echo "----------------------------------------------------"
