.PHONY: all setup compile clean help

# Default target
all: setup compile

# Run environment setup script
setup:
	@echo "=== Setting up OpenFOAM environment ==="
	@bash 1_setup_env.sh
	@echo "=== Environment setup complete ==="

# Run OpenFOAM compilation script
compile: setup
	@echo "=== Compiling OpenFOAM ==="
	@bash 2_compile_openfoam.sh
	@echo "=== Compilation complete ==="

# Help target
help:
	@echo "OpenFOAM Build Makefile"
	@echo ""
	@echo "Available targets:"
	@echo "  make all      - Run both setup and compile (default)"
	@echo "  make setup    - Run environment setup only"
	@echo "  make compile  - Run compilation (includes setup)"
