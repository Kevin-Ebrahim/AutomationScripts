#!/bin/bash
set -e

# --- CUSTOM CONFIG FOR WITSA CLUSTER (INTEL EDITION - FIXED) ---
OF_VERSION="v2506"
INSTALL_DIR="$HOME/apps/openfoam"
BASHRC="$INSTALL_DIR/OpenFOAM-$OF_VERSION/etc/bashrc"

echo "=== [Phase 2] Intel Compilation Start ==="

# 1. Load Intel OneAPI Environment
# Sources the Intel tools so 'icx' becomes available
if [ -f "/opt/intel/oneapi/setvars.sh" ]; then
    echo "--> Loading Intel OneAPI..."
    source /opt/intel/oneapi/setvars.sh > /dev/null
else
    echo "WARNING: Could not find /opt/intel/oneapi/setvars.sh"
    echo "Check if Intel OneAPI is installed."
fi

# 2. Check Compiler
if ! command -v icx &> /dev/null; then
    echo "Error: Intel compiler 'icx' not found!"
    exit 1
fi
echo "--> Using Compiler: $(icx --version | head -n 1)"

# 3. Load OpenFOAM Environment
echo "--> Sourcing OpenFOAM environment..."
set +e
source "$BASHRC"
set -e

# 4. INJECT SPEED HACK (The "Brrrrr" Part)
# Since the rules file was missing, we force the flags here.
# -xHost: Optimize for THIS computer's CPU (AVX2/AVX512)
# -O3: Maximum optimization
echo "--> Injecting Speed Flags..."
export WM_CXXFLAGS="-xHost -O3"
export WM_CFLAGS="-xHost -O3"

# 5. Set Parallel Cores
export WM_NCOMPPROCS=$(nproc)
echo "--> Using $WM_NCOMPPROCS cores."

# 6. Run the Build
echo "--> Starting Intel Build..."
cd "$INSTALL_DIR/OpenFOAM-$OF_VERSION"

# Run wmake
./Allwmake -j -s -q

echo "=== Intel Build Complete ==="
echo "Add these to your ~/.bashrc:"
echo "source /opt/intel/oneapi/setvars.sh"
echo "source $BASHRC"
