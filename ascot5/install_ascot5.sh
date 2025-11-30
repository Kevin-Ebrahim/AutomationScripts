#!/bin/bash
# ASCOT5 Installation Script
# This script downloads, builds, and installs ASCOT5 fusion simulation code

set -e  # Exit on error

echo "======================================"
echo "ASCOT5 Installation Script"
echo "======================================"

# Configuration
INSTALL_DIR="${HOME}/benchmarks/ascot5"
BUILD_TYPE="Release"  # Options: Release, Debug
ENABLE_MPI=ON         # Set to OFF if you don't need MPI support
CONDA_ENV_NAME=ascot-env
PYTHON_VERSION=3.13.0

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'  # No Color

# Function to print colored messages
print_status() { echo -e "${GREEN}[INFO]${NC} $1"; }
print_warning() { echo -e "${YELLOW}[WARNING]${NC} $1"; }
print_error() { echo -e "${RED}[ERROR]${NC} $1"; }

# Check if running on Linux
if [[ "$OSTYPE" != "linux-gnu"* ]]; then
    print_warning "This script is optimized for Linux. Other systems may require modifications."
fi

# Step 1: Check for required dependencies
print_status "Checking for required dependencies..."
MISSING_DEPS=()
command -v git >/dev/null 2>&1 || MISSING_DEPS+=("git")
command -v cmake >/dev/null 2>&1 || MISSING_DEPS+=("cmake")
command -v gcc >/dev/null 2>&1 || MISSING_DEPS+=("gcc")
command -v gfortran >/dev/null 2>&1 || MISSING_DEPS+=("gfortran")
command -v h5cc >/dev/null 2>&1 || MISSING_DEPS+=("hdf5-dev")

if [ ${#MISSING_DEPS[@]} -ne 0 ]; then
    print_error "Missing dependencies: ${MISSING_DEPS[*]}"
    echo ""
    echo "Please install them using your package manager:"
    echo " Ubuntu/Debian: sudo apt-get install git cmake gcc gfortran libhdf5-dev libopenmpi-dev python3-pip"
    echo " Fedora/RHEL: sudo dnf install git cmake gcc gfortran hdf5-devel openmpi-devel python3-pip"
    echo " Arch: sudo pacman -S git cmake gcc gcc-fortran hdf5 openmpi python-pip"
    exit 1
fi
print_status "All required dependencies found!"

# Step 1.5: Set up conda environment
print_status "Setting up conda environment..."
sudo apt update
sudo apt-get -y install clang libclang-dev

if command -v conda >/dev/null 2>&1; then
    print_status "Conda detected!"

    # Check if the environment already exists
    if conda env list | grep -q "^${CONDA_ENV_NAME} "; then
        print_warning "Conda environment '${CONDA_ENV_NAME}' already exists."
        read -p "Do you want to use the existing environment? (y/n): " -n 1 -r
        echo
        if [[ $REPLY =~ ^[Yy]$ ]]; then
            print_status "Using existing environment..."
        else
            print_status "Removing existing environment..."
            conda env remove -n ${CONDA_ENV_NAME} -y
            print_status "Creating new conda environment '${CONDA_ENV_NAME}' with Python ${PYTHON_VERSION}..."
            conda create -n ${CONDA_ENV_NAME} python=${PYTHON_VERSION} -y
        fi
    else
        print_status "Creating new conda environment '${CONDA_ENV_NAME}' with Python ${PYTHON_VERSION}..."
        conda create -n ${CONDA_ENV_NAME} python=${PYTHON_VERSION} -y
    fi

    # Activate the environment
    print_status "Activating conda environment '${CONDA_ENV_NAME}'..."
    eval "$(conda shell.bash hook)"
    conda activate ${CONDA_ENV_NAME}

    # Install required Python packages
    print_status "Installing required Python packages in conda environment..."
    conda install -y numpy scipy h5py matplotlib wurlitzer
    PYTHON_CMD=$(which python)
    PIP_CMD=$(which pip)
    print_status "Using Python: $PYTHON_CMD"
    python --version
else
    print_warning "Conda not found. Using system Python..."
    PYTHON_CMD=python3
    PIP_CMD=pip3
fi

# Step 2: Clone ASCOT5 repository
print_status "Cloning ASCOT5 repository..."
if [ -d "$INSTALL_DIR" ]; then
    print_warning "Directory $INSTALL_DIR already exists."
    read -p "Do you want to remove it and clone fresh? (y/n): " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        rm -rf "$INSTALL_DIR"
    else
        print_status "Using existing directory..."
        cd "$INSTALL_DIR"
        git pull
    fi
fi

if [ ! -d "$INSTALL_DIR" ]; then
    git clone https://github.com/ascot4fusion/ascot5.git "$INSTALL_DIR"
fi
cd "$INSTALL_DIR"

# Step 3: Build ASCOT5
print_status "Building ASCOT5 (this may take several minutes)..."
NPROC=$(nproc 2>/dev/null || echo 4)
print_status "Building with $NPROC parallel jobs..."

if [ "$ENABLE_MPI" == "ON" ]; then
    print_status "Building with MPI support..."
    make libascot -j MPI=1
    make ascot5_main -j MPI=1
    make bbnbi5 -j MPI=1
else
    print_status "Building without MPI support..."
    make libascot -j
    make ascot5_main -j
    make bbnbi5 -j
fi

# Step 4: Install Python interface
print_status "Installing Python interface (a5py)..."
cd "$INSTALL_DIR"
export LD_LIBRARY_PATH="$INSTALL_DIR/build:$INSTALL_DIR:${LD_LIBRARY_PATH:-}"
echo "LD_LIBRARY_PATH set to: $LD_LIBRARY_PATH"
$PIP_CMD install -e .

# Step 5: Set up environment
print_status "Setting up environment..."
SHELL_RC="${HOME}/.bashrc"
if [ -n "${ZSH_VERSION:-}" ]; then
    SHELL_RC="${HOME}/.zshrc"
fi

if ! grep -q "ASCOT5" "$SHELL_RC"; then
    echo "" >> "$SHELL_RC"
    echo "# ASCOT5 Environment" >> "$SHELL_RC"
    echo "export ASCOT5_DIR=\"$INSTALL_DIR\"" >> "$SHELL_RC"
    echo "export PATH=\"\$ASCOT5_DIR/build:\$PATH\"" >> "$SHELL_RC"
    echo "export PYTHONPATH=\"\$ASCOT5_DIR:\$PYTHONPATH\"" >> "$SHELL_RC"
    echo "export LD_LIBRARY_PATH=\"\$ASCOT5_DIR:\$LD_LIBRARY_PATH\"" >> "$SHELL_RC"
    if command -v conda >/dev/null 2>&1; then
        echo "# Activate ASCOT5 conda environment" >> "$SHELL_RC"
        echo "# conda activate ${CONDA_ENV_NAME}" >> "$SHELL_RC"
    fi
    print_status "Environment variables added to $SHELL_RC"
else
    print_status "Environment variables already present in $SHELL_RC"
fi

export ASCOT5_DIR="$INSTALL_DIR"
export PATH="$ASCOT5_DIR/build:$PATH"
export PYTHONPATH="$ASCOT5_DIR:$PYTHONPATH"
export LD_LIBRARY_PATH="$ASCOT5_DIR:${LD_LIBRARY_PATH:-}"
print_status "Environment variables set for current session"

# Step 6: Verify installation
print_status "Verifying installation..."
if [ -f "$INSTALL_DIR/build/ascot5_main" ]; then
    print_status "ASCOT5 executable built successfully!"
    ls -lh "$INSTALL_DIR/build/ascot5_main"
else
    print_error "ASCOT5 executable not found. Build may have failed."
    exit 1
fi

if [ -f "$INSTALL_DIR/build/libascot.so" ]; then
    print_status "libascot.so found successfully!"
    ls -lh "$INSTALL_DIR/build/libascot.so"
elif [ -f "$INSTALL_DIR/libascot.so" ]; then
    print_status "libascot.so found successfully!"
    ls -lh "$INSTALL_DIR/libascot.so"
else
    print_warning "libascot.so not found in expected locations"
    print_status "Searching for libascot.so..."
    find "$INSTALL_DIR" -name "libascot.so" -o -name "libascot*.so*"
fi

# Test Python interface
print_status "Testing Python interface..."
echo "Python path: $(which python)"
echo "LD_LIBRARY_PATH: $LD_LIBRARY_PATH"
if $PYTHON_CMD -c "import a5py, inspect; print('a5py loaded from:', inspect.getfile(a5py))" 2>&1; then
    print_status "Python interface (a5py) installed successfully!"
else
    print_er_

