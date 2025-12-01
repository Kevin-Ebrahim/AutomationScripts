SHELL       := /usr/bin/env bash

# ---------------------------------------------------------------------------
# Cluster settings (override on the command line if you like)
# ---------------------------------------------------------------------------
HPCG_VERSION ?= 3.1
ARCH         ?= openblas_ompi_gcc
NP           ?= $(shell nproc)

# --- host/slot description --------------------------------------------------
NODES        ?= $(shell hostname)
SLOTS        ?= $(NP)

SCRIPT_DIR   := $(shell echo $(HOME)/Wits-A-2025/scripts/hpcg)
HOSTS_DIR    := $(shell echo $(HOME)/Wits-A-2025/scripts/hostfiles)
HOSTFILE     ?= $(HOSTS_DIR)/hosts.ompi

# ---------------------------------------------------------------------------
# HPCG build layout
# ---------------------------------------------------------------------------
HPCG_DIR     ?= $(HOME)/benchmarks/hpcg/hpcg-$(HPCG_VERSION)
BIN_DIR      := $(HPCG_DIR)/bin/$(ARCH)
HPCGDAT       = $(BIN_DIR)/HPCG.dat

.PHONY: all check download build hpcgdat hosts run clean regen
all: run

hosts: $(HOSTFILE)

$(HOSTFILE): regen
	@echo "=== Generating hostfiles ==="
	@echo "HOSTS_DIR='$(HOSTS_DIR)'"
	@HOSTS_DIR="$(HOSTS_DIR)" NODES="$(NODES)" SLOTS="$(SLOTS)" $(SCRIPT_DIR)/make_hosts.sh

check:
	@$(SCRIPT_DIR)/check_dependencies.sh

download: check
	@echo "=== Ensuring HPCG $(HPCG_VERSION) source ==="
	@if [ -d "$(HPCG_DIR)/setup" ]; then \
		echo "Source tree present – skipping download."; \
	else \
		echo "Downloading / extracting source..."; \
		$(SCRIPT_DIR)/download_hpcg.sh; \
	fi

build: download
	@echo "=== Building HPCG (ARCH=$(ARCH)) ==="
	@ARCH=$(ARCH) $(SCRIPT_DIR)/build_hpcg.sh

hpcgdat: $(HPCGDAT)

# Treat HPCG.dat as a file target; generate only when asked or if missing
$(HPCGDAT): build
	@echo "=== Generating HPCG.dat (ARCH=$(ARCH)) ==="
	@ARCH=$(ARCH) NX=$(NX) NY=$(NY) NZ=$(NZ) RUN_TIME=$(RUN_TIME) $(SCRIPT_DIR)/make_hpcg_dat.sh

run: build
	@echo "=== Running HPCG benchmark (ARCH=$(ARCH), NP=$(NP)) ==="
	@[ -f "$(HOSTFILE)" ] || $(MAKE) $(HOSTFILE)
	@[ -f "$(HPCGDAT)" ] || ( echo "No HPCG.dat found -> generating a default one."; ARCH=$(ARCH) $(SCRIPT_DIR)/make_hpcg_dat.sh )
	@ARCH=$(ARCH) NP=$(NP) HOSTFILE=$(HOSTFILE) $(SCRIPT_DIR)/run_hpcg.sh

clean:
	@echo "=== Removing HPCG build tree $(HPCG_DIR) ==="
	@ARCH=$(ARCH) $(SCRIPT_DIR)/clean_hpcg.sh
