# =============================================================================
# Makefile for building and installing DFTB+ on a cluster
#
# LOCATION: ~/AutomationScripts/dftbplus/Makefile
#
# ----- PREREQUISITES (Run this on ALL nodes first!) -----
# sudo apt update
# sudo apt install build-essential gfortran cmake git \
#                  openmpi-bin libopenmpi-dev \
#                  libopenblas-dev libscalapack-openmpi-dev
#
# ----- USAGE -----
# make dftbplus-help       # Show this help message
# make dftbplus-all        # Check deps, download, build, and install DFTB+
# make dftbplus-test       # Run tests after building
# make dftbplus-clean      # Remove the build directory
#
# =============================================================================

# --- User Configuration ---
# Version to install
VERSION     := 24.1

# Install destination (Updated to match your ~/apps structure)
# Note: I corrected the typo 'dtfb+' to 'dftbplus' for the new folder
PREFIX      := $(HOME)/apps/dftbplus

# Path for Slater-Koster files
SK_PATH     := $(HOME)/dftbplus-skfiles

# System dependencies
DEPS        := build-essential gfortran cmake git \
               openmpi-bin libopenmpi-dev \
               libopenblas-dev libscalapack-openmpi-dev

# --- Internal Variables ---
SRC_DIR     := dftbplus
BUILD_DIR   := _build
INSTALL_DIR := $(PREFIX)/$(VERSION)

# CMake configuration
# We explicitly point to the ScaLAPACK library per documentation advice.
CMAKE_OPTS := -DCMAKE_INSTALL_PREFIX=$(INSTALL_DIR) \
              -DWITH_MPI=YES \
              -DWITH_SCALAPACK=YES \
              -DWITH_API=YES \
              -DCMAKE_PREFIX_PATH="/usr/lib/x86_64-linux-gnu/openmpi" \
              -DSCALAPACK_LIBRARY="/usr/lib/x86_64-linux-gnu/libscalapack-openmpi.so"

# Tools
GIT         := git
CMAKE       := cmake
MAKE        := make
MKDIR       := mkdir -p
RM          := rm -rf

# Use 4 parallel jobs for compilation
MAKEFLAGS   += -j4

# =============================================================================

.PHONY: dftbplus-all dftbplus-build dftbplus-configure dftbplus-download \
        dftbplus-install dftbplus-test dftbplus-download-testdata \
        dftbplus-skfiles dftbplus-clean dftbplus-help dftbplus-check-deps

# Default target
all: dftbplus-all
dftbplus-all: dftbplus-install

# Installs the program
dftbplus-install: dftbplus-build
	@echo "------------------------------------------------------------------"
	@echo "Installing DFTB+ to $(INSTALL_DIR)..."
	@echo "------------------------------------------------------------------"
	@cd $(BUILD_DIR) && $(MAKE) install
	@echo "------------------------------------------------------------------"
	@echo "✅ DFTB+ $(VERSION) installed to $(INSTALL_DIR)"
	@echo ""
	@echo "NEXT STEPS:"
	@echo "1. Update your ~/.bashrc on ALL nodes:"
	@echo "   export PATH=\"$(INSTALL_DIR)/bin:\$$PATH\""
	@echo "   export DFTB_SK_PATH=\"$(SK_PATH)\""
	@echo "2. Run 'source ~/.bashrc'"
	@echo "------------------------------------------------------------------"

# Compiles the program
dftbplus-build: dftbplus-configure
	@echo "------------------------------------------------------------------"
	@echo "Building DFTB+ (using $(MAKEFLAGS) jobs)..."
	@echo "------------------------------------------------------------------"
	@$(MAKE) -C $(BUILD_DIR)

# Configures the build
dftbplus-configure: dftbplus-download dftbplus-check-deps
	@echo "------------------------------------------------------------------"
	@echo "Configuring build in $(BUILD_DIR)..."
	@echo "------------------------------------------------------------------"
	@$(MKDIR) -p $(BUILD_DIR)
	@cd $(BUILD_DIR) && $(CMAKE) ../$(SRC_DIR) $(CMAKE_OPTS)

# Downloads source and submodules
dftbplus-download:
	@if [ ! -d "$(SRC_DIR)" ]; then \
		echo "Downloading DFTB+ source code..."; \
		$(GIT) clone https://github.com/dftbplus/dftbplus.git $(SRC_DIR); \
	fi
	@echo "Updating git submodules..."
	@cd $(SRC_DIR) && $(GIT) submodule update --init --recursive

# Downloads test data
dftbplus-download-testdata: dftbplus-download
	@echo "Downloading test data..."
	@cd $(SRC_DIR) && ./utils/get_opt_externals

# Runs tests
dftbplus-test: dftbplus-build dftbplus-download-testdata
	@echo "------------------------------------------------------------------"
	@echo "Running tests..."
	@echo "------------------------------------------------------------------"
	@cd $(BUILD_DIR) && ctest

# Checks dependencies
dftbplus-check-deps:
	@echo "Checking system dependencies..."
	@for pkg in $(DEPS); do \
		dpkg -s $$pkg > /dev/null 2>&1 || \
		(echo "Error: Missing $$pkg. Run 'sudo apt install $$pkg' on all nodes." && exit 1); \
	done

# Creates SK directory
dftbplus-skfiles:
	@echo "Creating Slater-Koster directory at $(SK_PATH)..."
	@$(MKDIR) -p $(SK_PATH)

# Cleanup
dftbplus-clean:
	@echo "Cleaning up build directory..."
	@$(RM) $(BUILD_DIR)

# Help
help: dftbplus-help
dftbplus-help:
	@echo "DFTB+ Automation Script"
	@echo "Installs to: $(INSTALL_DIR)"
	@echo "Usage: make dftbplus-all"
