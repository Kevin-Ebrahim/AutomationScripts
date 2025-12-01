# Makefile for HPCC Competition Automation
# Usage:
#   make        -> Downloads (if needed) and builds the optimized version
#   make run    -> Runs the benchmark on the cluster
#   make clean  -> Removes build artifacts
#   make host   -> Helps you generate a hostfile (optional helper)

# --- defaults ---
NP       ?= 4
HOSTFILE ?= hosts
SCRIPT_DIR = .
WORK_DIR = $(HOME)/benchmarks/hpcc-gcc
HPCC_DIR = $(WORK_DIR)/src/hpcc-1.5.0b

.PHONY: all build optimized clean run help

# Default target
all: optimized

help:
	@echo "--- HPCC Automation System ---"
	@echo "Targets:"
	@echo "  make optimized  : Build with -march=native + FFTW (Competition Mode)"
	@echo "  make build      : Build generic GCC version (Safe Mode)"
	@echo "  make run        : Run benchmark (usage: make run NP=16 HOSTFILE=myhosts)"
	@echo "  make clean      : Wipe executables and object files"
	@echo "  make download   : Fetch source code"

download:
	@chmod +x $(SCRIPT_DIR)/download_hpcc_gcc.sh
	@$(SCRIPT_DIR)/download_hpcc_gcc.sh

# Calls the safe/generic build script
build: download
	@chmod +x $(SCRIPT_DIR)/build_hpcc_gcc.sh
	@$(SCRIPT_DIR)/build_hpcc_gcc.sh

# Calls the fast/optimized build script
optimized: download
	@if [ -f "$(SCRIPT_DIR)/build_hpcc_gcc.sh" ]; then \
		chmod +x $(SCRIPT_DIR)/build_hpcc_gcc.sh; \
		$(SCRIPT_DIR)/build_hpcc_gcc.sh; \
	else \
		echo "Error: build_hpcc_gcc.sh not found!"; \
		exit 1; \
	fi

clean:
	@chmod +x $(SCRIPT_DIR)/clean_hpcc.sh
	@$(SCRIPT_DIR)/clean_hpcc.sh
