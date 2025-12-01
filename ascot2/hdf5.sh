#!/bin/bash

set -eo pipefail

### --- SETTINGS ---
INSTALL_DIR="$HOME/tools/hdf5"
DOWNLOAD_DIR="$HOME/downloads/tools"
TMP_DIR="$HOME/tmp"
MODULE_DIR="$HOME/modulefiles"
HDF5_VERSION="1.14.6"
MODULE_FILE="$MODULE_DIR/hdf5/$HDF5_VERSION" # Target modulefile path

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Function to print colored messages
print_status() {
    echo -e "${GREEN}[INFO]${NC} $1"
}
print_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}
print_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

### --- INTERACTIVE CHECK AND CLEANUP ---
if [ -d "$INSTALL_DIR" ]; then
    print_warning "HDF5 installation directory '$INSTALL_DIR' already exists."
    read -p "Do you want to remove the existing setup and rebuild HDF5? (y/n): " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        print_status "Removing existing HDF5 installation and temporary files..."
        rm -rf "$INSTALL_DIR" "$TMP_DIR/hdf5/hdf5_$HDF5_VERSION"
        print_status "Existing setup removed. Proceeding with fresh build."
    else
        # Check for installation integrity if user chooses to keep it
        if [ -f "$INSTALL_DIR/lib/libhdf5.a" ] && [ -f "$MODULE_FILE.lua" ]; then
            print_status "Existing HDF5 installation and modulefile found. Skipping build."
            exit 0
        else
            print_warning "Existing HDF5 installation appears incomplete or missing modulefile. Rebuilding..."
        fi
    fi
fi

### MPI compilers
CC=mpicc
CXX=mpicxx
FC=mpifort

# Verify compilers
echo "Using CC: $(which $CC)"
echo "Using CXX: $(which $CXX)"

### --- DOWNLOAD HDF5 ---
mkdir -p "$DOWNLOAD_DIR" "$TMP_DIR" "$INSTALL_DIR"

cd "$DOWNLOAD_DIR"

if [ ! -f "hdf5_$HDF5_VERSION.tar.gz" ]; then
    print_status "Downloading HDF5 version $HDF5_VERSION..."
    wget "https://github.com/HDFGroup/hdf5/archive/refs/tags/hdf5_$HDF5_VERSION.tar.gz"
fi

HDF5_SOURCE_DIR="$TMP_DIR/hdf5_$HDF5_VERSION"

if [ ! -d "$HDF5_SOURCE_DIR" ]; then
    print_status "Extracting HDF5 source code..."
    tar -xf "hdf5_$HDF5_VERSION.tar.gz" -C "$TMP_DIR"
    mv "$TMP_DIR/hdf5-hdf5_$HDF5_VERSION" "$HDF5_SOURCE_DIR" # Fix for common extraction name
fi

### --- CONFIGURE, BUILD & INSTALL ---
cd "$HDF5_SOURCE_DIR"

print_status "Configuring HDF5 $HDF5_VERSION..."

# Create and enter build directory
mkdir -p build && cd build

# Configure using CMake
cmake .. \
    -DCMAKE_INSTALL_PREFIX="$INSTALL_DIR" \
    -DCMAKE_C_COMPILER="$CC" \
    -DCMAKE_CXX_COMPILER="$CXX" \
    -DCMAKE_Fortran_COMPILER="$FC" \
    -DBUILD_SHARED_LIBS=ON \
    -DHDF5_ENABLE_PARALLEL=ON \
    -DHDF5_BUILD_TESTING=ON

# Get number of CPU cores for parallel build
NPROC=$(nproc 2>/dev/null || echo 4)

print_status "Building HDF5 with $NPROC parallel jobs..."
make -j$NPROC

print_status "Installing HDF5..."
make install

# Clean up build artifacts (optional)
cd ..
rm -rf build
cd "$TMP_DIR"


### --- CREATE LMOD MODULEFILE ---
print_status "Creating Lmod modulefile at $MODULE_FILE.lua..."
mkdir -p "$MODULE_DIR/hdf5"
HDF5_ROOT_LUA='$HOME/tools/hdf5' # Path used inside the modulefile

# Note: The actual module file name will be '1.14.6.lua' inside the 'hdf5' folder
cat > "$MODULE_FILE.lua" << EOF
-- HDF5 $HDF5_VERSION Module File
-- Hierarchical Data Format 5 (HDF5) library

help([[
HDF5 $HDF5_VERSION - Hierarchical Data Format 5

This module loads the HDF5 library version $HDF5_VERSION with parallel (MPI) support.
HDF5 is a data model, library, and file format for storing and managing data.
]])

whatis("Name: HDF5")
whatis("Version: $HDF5_VERSION")
whatis("Category: library")
whatis("Description: Hierarchical Data Format 5 library")

local hdf5_root = pathJoin(os.getenv("HOME"), "tools", "hdf5")
local version = "$HDF5_VERSION"

if not isDir(hdf5_root) then
    LmodError("HDF5 installation directory not found: " .. hdf5_root)
end

conflict("hdf5")

-- Environment variables
setenv("HDF5_ROOT", hdf5_root)
setenv("HDF5_VERSION", version)

-- Update PATH
prepend_path("PATH", pathJoin(hdf5_root, "bin"))

-- Update library paths
prepend_path("LD_LIBRARY_PATH", pathJoin(hdf5_root, "lib"))
prepend_path("LIBRARY_PATH", pathJoin(hdf5_root, "lib"))

-- Update include paths
prepend_path("C_INCLUDE_PATH", pathJoin(hdf5_root, "include"))
prepend_path("CPLUS_INCLUDE_PATH", pathJoin(hdf5_root, "include"))

-- Update pkg-config path
prepend_path("PKG_CONFIG_PATH", pathJoin(hdf5_root, "lib/pkgconfig"))

if mode() == "load" then
    LmodMessage("HDF5 " .. version .. " loaded.")
    LmodMessage("Please ensure you run 'module use \$HOME/modulefiles' first.")
end
EOF

print_status "HDF5 installation and modulefile setup complete!"
echo "To use HDF5, run: module load hdf5/$HDF5_VERSION"

