#!/bin/bash
# clean_hpcc.sh
# Removes compiled binaries and object files to force a fresh build.

# --- Configuration ---
WORK_DIR="$HOME/benchmarks/hpcc-gcc"
HPCC_VER="1.5.0b"
HPCC_DIR="$WORK_DIR/src/hpcc-$HPCC_VER"

echo "--- Cleaning HPCC Workspace ---"

if [ -d "$HPCC_DIR" ]; then
    cd "$HPCC_DIR"

    # 1. Remove the final executable
    if [ -f "hpcc" ]; then
        echo "Removing hpcc executable..."
        rm -f hpcc
    fi

    # 2. Run the internal make clean (Recursive clean)
    # This cleans up hpl/lib, hpl/bin, etc.
    echo "Running internal make clean..."
    make clean > /dev/null 2>&1

    # 3. Aggressive cleanup of any stray object files specific to our arch
    # (Sometimes 'make clean' misses things if the arch name changed)
    find . -name "*.o" -delete
    find . -name "*.a" -delete

    echo "✅ Clean complete. Ready for rebuild."
else
    echo "⚠️  Directory $HPCC_DIR does not exist. Nothing to clean."
fi
