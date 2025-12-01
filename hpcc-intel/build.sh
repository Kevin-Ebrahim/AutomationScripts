#!/bin/bash
# ==========================================================
# HPCC (High Performance Computing Challenge) Installer
# Using Intel oneAPI MPI + MKL
# ==========================================================
# This script:
#  - Sources oneAPI environment
#  - Builds HPCC with Intel MPI + MKL
#  - Installs the binary system-wide
#  - Performs a quick verification test
#
# Works on Ubuntu/Debian clusters with oneAPI installed.
# ==========================================================

set -euo pipefail

echo "=== HPCC (High Performance Computing Challenge) Installer ==="
echo ">>> Using Intel oneAPI MPI and MKL <<<"

# Step 1: Ensure oneAPI environment is available
if [ -f $HOME/tools/intel/oneapi/setvars.sh ]; then
            echo "[+] Sourcing Intel oneAPI environment..."
                source $HOME/tools/intel/oneapi/setvars.sh > /dev/null 2>&1 || true
        else
                    echo "[!] Intel oneAPI not found in $HOME/tools/intel/"
                        echo "    Please install the HPCKit before running this script."
                            exit 1
fi

# Step 2: Install build dependencies
echo "[+] Installing build tools..."
sudo apt update -y
sudo apt install -y build-essential wget tar

# Step 3: Create install directory
INSTALL_DIR="$HOME/benchmarks/hpcc"
sudo mkdir -p "$INSTALL_DIR"
sudo chown $USER:$USER "$INSTALL_DIR"
cd "$INSTALL_DIR"

# Step 4: Download HPCC source
if [ ! -f "hpcc.tar.gz" ]; then
            echo "[+] Downloading HPCC source..."
                wget http://icl.utk.edu/projectsfiles/hpcc/download/hpcc-1.5.0.tar.gz -O hpcc.tar.gz
fi

# Step 5: Extract HPCC
echo "[+] Extracting HPCC..."
tar -xzf hpcc.tar.gz
cd hpcc-1.5.0

# Step 6: Create Makefile for Intel oneAPI
echo "[+] Creating HPCC Makefile for Intel compilers..."

cd hpl/
if [ ! -f "Make.Linux_IntelOneAPI" ]; then
    cat > Make.Linux_IntelOneAPI << 'EOF'
    # -----------------------------------------------------------------------
# HPCC Makefile for Intel oneAPI Compilers and MKL
# -----------------------------------------------------------------------
SHELL         = /bin/sh
ARCH          = Linux_IntelOneAPI

# -----------------------------------------------------------------------
# Essential shell commands
# -----------------------------------------------------------------------
ARCHIVER      = ar
ARFLAGS       = rcs
RANLIB        = ranlib
TOUCH         = touch
CD            = cd
MKDIR         = mkdir -p
LN_S          = ln -s
TOPdir        = $(CURDIR)
RM            = rm -f
CP            = cp -f
MAKE          = make
BASEdir       = $(HOME)/benchmarks/hpcc/hpcc-1.5.0/hpl

# -----------------------------------------------------------------------
# MPI, MKL and HPL directories
# -----------------------------------------------------------------------
MPdir         = $(I_MPI_ROOT)
MPinc         = $(MPdir)/include
MPlib         = $(MPdir)/lib/release

LAdir         = $(MKLROOT)/lib/intel64
LAinc         = $(MKLROOT)/include
LAlib         = -L$(MKLROOT)/lib/intel64 -lmkl_intel_lp64 -lmkl_intel_thread -lmkl_core -liomp5 -lpthread -lm -ldl

INCdir        = $(BASEdir)/include
HPLlib        = $(BASEdir)/lib/$(ARCH)/libhpl.a
BINdir        = $(BASEdir)/bin/$(ARCH)
HPL_LIBS      = $(HPLlib) $(LAlib)
HPL_make_libs = $(HPLlib) $(LAlib)

# -----------------------------------------------------------------------
# Compilers, linker files and flags
# -----------------------------------------------------------------------
CC            = mpiicx
CCFLAGS       = -O3 -xHost -std=c99 -fomit-frame-pointer -I$(INCdir)    \
                -I$(MPinc) -I$(LAinc) -qopenmp
CCNOOPT       = -I$(INCdir) -I$(MPinc) -I$(LAinc)

LINKER        = mpiicx
LINKFLAGS     = -O3 -xHost -qopenmp

F77           = mpiifx
F77FLAGS      = -O3 -xHost -I$(INCdir) -I$(MPinc) -I$(LAinc) -qopenmp

LD            = mpiicx
LDFLAGS       = -O3 -xHost -qopenmp
LIBS          = $(LAlib)

# -----------------------------------------------------------------------
# HPCC options
# -----------------------------------------------------------------------
HPCC_OPTS     = -DHPL_CALL_CBLAS

EOF
fi

# Step 7: Update INCdep in all Make.* files in makes/ directory
echo "[+] Updating INCdep headers in make files..."

TARGET_DIR="makes"

if [ -d "$TARGET_DIR" ]; then
    echo "[+] Found makes directory, updating INCdep..."

    for file in "$TARGET_DIR"/Make.*; do
        if [ -f "$file" ]; then
            echo "    Updating $(basename $file) ..."
            cp "$file" "$file.bak"

            # Use awk to replace the INCdep block
            awk '
                BEGIN { in_block=0 }
                # Start of INCdep block
                /^INCdep[[:space:]]*=/ {
                    in_block=1
                    print "INCdep           = \\"
                    print "   $(INCdir)/hpccmema.h $(INCdir)/hpl_auxil.h $(INCdir)/hpl_blas.h      \\"
                    print "   $(INCdir)/hpl_comm.h $(INCdir)/hpl_gesv.h $(INCdir)/hpl_grid.h       \\"
                    print "   $(INCdir)/hpl.h $(INCdir)/hpl_matgen.h $(INCdir)/hpl_misc.h          \\"
                    print "   $(INCdir)/hpl_panel.h $(INCdir)/hpl_pauxil.h $(INCdir)/hpl_pfact.h   \\"
                    print "   $(INCdir)/hpl_pgesv.h $(INCdir)/hpl_pmatgen.h $(INCdir)/hpl_pmisc.h  \\"
                    print "   $(INCdir)/hpl_ptest.h $(INCdir)/hpl_ptimer.h $(INCdir)/hpl_test.h    \\"
                    print "   $(INCdir)/hpl_timer.h"
                    next
                }
                # End of block when we hit a line starting with # or empty line after continuation
                in_block && /^[^[:space:]]/ && !/\\[[:space:]]*$/ {
                    in_block=0
                }
                # Skip lines that are part of the old INCdep block
                in_block { next }
                # Print all other lines
                !in_block { print }
            ' "$file" > "$file.tmp" && mv "$file.tmp" "$file"
        fi
    done

    echo "[✓] INCdep updated in all Make.* files"
else
    echo "[!] Warning: $TARGET_DIR not found. Skipping INCdep update."
fi
echo "All Make.* files updated successfully."

# Step 8: Update arch from UNKNOWN to Linux_IntelOneAPI
echo "[+] Updating architecture in Makefile and Make.top..."
if [ -f "Makefile" ]; then
    cp Makefile Makefile.bak
    sed -i 's/^arch[[:space:]]*=[[:space:]]*UNKNOWN/arch             = Linux_IntelOneAPI/' Makefile
    echo "    Updated Makefile"
fi

if [ -f "Make.top" ]; then
    cp Make.top Make.top.bak
    sed -i 's/^arch[[:space:]]*=[[:space:]]*UNKNOWN/arch             = Linux_IntelOneAPI/' Make.top
    echo "    Updated Make.top"
fi
echo "[✓] Architecture updated to Linux_IntelOneAPI"

# Step 9: Add <omp.h> header to FFT C files that use OpenMP
echo "[+] Adding <omp.h> to FFT source files..."
cd ..

FFT_DIR="FFT"

if [ -d "$FFT_DIR" ]; then
    for cfile in "$FFT_DIR"/*.c; do
        if [ -f "$cfile" ]; then
            # Check if file uses OpenMP functions (omp_*)
            if grep -q "omp_" "$cfile"; then
                # Check if omp.h is already included
                if ! grep -q "#include.*<omp\.h>" "$cfile" && ! grep -q '#include.*"omp\.h"' "$cfile"; then
                    echo "    Adding <omp.h> to $(basename $cfile)..."
                    cp "$cfile" "$cfile.bak"

                    # Add #include <omp.h> after the last #include statement
                    awk '
                        /#include/ { last_include = NR }
                        { lines[NR] = $0 }
                        END {
                            for (i = 1; i <= NR; i++) {
                                print lines[i]
                                if (i == last_include) {
                                    print "#include <omp.h>"
                                }
                            }
                        }
                    ' "$cfile.bak" > "$cfile"
                else
                    echo "    $(basename $cfile) already has <omp.h>"
                fi
            fi
        fi
    done
    echo "[✓] OpenMP headers updated in FFT directory"
else
    echo "[!] Warning: $FFT_DIR not found. Skipping OpenMP header addition."
fi

# Step 10: Finally building hpl and hpcc
echo "[+] Building HPL ..."
cd hpl/
make arch=Linux_IntelOneAPI

echo "[+] Now building HPCC ..."
cd ..
make arch=Linux_IntelOneAPI

# Step 11: Verify Build
# Step 11: Verify Build
HPCC_BIN="$(pwd)/hpcc"
XHPL_BIN="$(pwd)/hpl/bin/Linux_IntelOneAPI/xhpl"

if [[ -x "$HPCC_BIN" ]]; then
    echo "[✓] HPCC build successful!"
    echo "[+] HPCC binary: $HPCC_BIN"
else
    echo "[✗] HPCC binary not found at $HPCC_BIN"
    exit 1
fi

if [[ -x "$XHPL_BIN" ]]; then
    echo "[✓] HPL (xhpl) built successfully!"
    echo "[+] HPL binary: $XHPL_BIN"
else
    echo "[!] Note: xhpl not found at $XHPL_BIN (HPCC may still be fine)."
fi

echo
echo "=== Next Steps ==="
echo "Run HPCC: mpirun -np <ranks> $HPCC_BIN"
echo "Run HPL:  cd $(dirname "$XHPL_BIN") && mpirun -np <ranks> ./xhpl"
