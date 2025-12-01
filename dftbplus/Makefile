# =============================================================================
# Makefile for High-Performance DFTB+ (Intel/MKL Build)
# =============================================================================

# Define shell to ensure source works
SHELL := /bin/bash

# --- Targets ---

.PHONY: all deps build clean test help

all: build

# 1. Install OS level tools (requires sudo)
deps:
	@chmod +x scripts/01_install_os_deps.sh
	@./scripts/01_install_os_deps.sh

# 2. Build with Intel Compilers and MKL
# Note: We source the env setup inside the shell command to ensure vars persist
build:
	@chmod +x scripts/00_env_setup.sh
	@chmod +x scripts/02_build_intel.sh
	@source ./scripts/00_env_setup.sh && ./scripts/02_build_intel.sh

# 3. Clean build artifacts
clean:
	@echo "Removing build directory..."
	@rm -rf _build_intel

# 4. Quick Test (Run ctest)
test:
	@source ./scripts/00_env_setup.sh && cd _build_intel && ctest

help:
	@echo "DFTB+ Intel Speed Build"
	@echo "-----------------------"
	@echo "make deps   -> Install git/cmake (requires sudo)"
	@echo "make build  -> Compile with icx/ifx and MKL -O3 -xHost"
	@echo "make test   -> Run test suite"
	@echo "make clean  -> Remove build artifacts"
