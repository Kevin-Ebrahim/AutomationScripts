SHELL       := /usr/bin/env bash

# ---------------------------------------------------------------------------
# Cluster settings (override on the command line if you like)
# ---------------------------------------------------------------------------
HPL_VERSION ?= 2.3
ARCH        ?= gcc
NP          ?= $(shell nproc)

# --- host/slot description --------------------------------------------------
NODES       ?= $(shell hostname)
SLOTS       ?= $(NP)

SCRIPT_DIR  := $(shell echo $(HOME)/Wits-A-2025/scripts/hpl-gcc)
HOSTS_DIR   := $(shell echo $(HOME)/Wits-A-2025/scripts/hostfiles)
HOSTFILE    ?= $(HOSTS_DIR)/hosts.ompi

# ---------------------------------------------------------------------------
# HPL build layout
# ---------------------------------------------------------------------------
HPL_DIR     ?= $(HOME)/benchmarks/hpl/hpl-$(HPL_VERSION)
BIN_DIR     := $(HPL_DIR)/bin/$(ARCH)
HPLDAT		 = $(BIN_DIR)/HPL.dat

.PHONY: all check download build hpldat hosts run clean regen
all: run

hosts: $(HOSTFILE)

$(HOSTFILE): regen
	@echo "=== Generating hostfiles ==="
	@echo "HOSTS_DIR='$(HOSTS_DIR)'"
	@HOSTS_DIR="$(HOSTS_DIR)" NODES="$(NODES)" SLOTS="$(SLOTS)" $(SCRIPT_DIR)/make_hosts.sh

check:
	@$(SCRIPT_DIR)/check_dependencies.sh

download: check
	@echo "=== Ensuring HPL $(HPL_VERSION) source ==="
	@if [ -d "$(HPL_DIR)/setup" ]; then \
	    echo "Source tree present – skipping download."; \
	else \
	    echo "Downloading / extracting source..."; \
	    $(SCRIPT_DIR)/download_hpl.sh; \
	fi

build: download
	@echo "=== Building HPL (ARCH=$(ARCH)) ==="
	@ARCH=$(ARCH) $(SCRIPT_DIR)/build_hpl.sh

hpldat: $(HPLDAT)

# Treat HPL.dat as a file target; generate only when asked or if missing
$(HPLDAT): build
	@echo "=== Generating HPL.dat (ARCH=$(ARCH)) ==="
	@ARCH=$(ARCH) N=$(N) NB=$(NB) P=$(P) Q=$(Q) $(SCRIPT_DIR)/make_hpl_dat.sh

run: build
	@echo "=== Running HPL benchmark (ARCH=$(ARCH), NP=$(NP)) ==="
	@[ -f "$(HOSTFILE)" ] || $(MAKE) $(HOSTFILE)
	@[ -f "$(HPLDAT)" ] || ( echo "No HPL.dat found -> generating a default one."; ARCH=$(ARCH) N=$(N) NB=$(NB) P=$(P) Q=$(Q) $(SCRIPT_DIR)/make_hpl_dat.sh )
	@ARCH=$(ARCH) NP=$(NP) HOSTFILE=$(HOSTFILE) $(SCRIPT_DIR)/run_hpl.sh

clean:
	@echo "=== Removing HPL build tree $(HPL_DIR) ==="
	@ARCH=$(ARCH) $(SCRIPT_DIR)/clean_hpl.sh
