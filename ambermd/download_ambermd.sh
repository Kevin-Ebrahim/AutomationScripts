#!/bin/bash
set -euo pipefail

AMBER_VERSION="${AMBER_VERSION:-24}"
PMEMD_SRC_TAR="${PMEMD_SRC_TAR:-$HOME/tmp/pmemd24.tar.bz2}"

BENCHMARK_SUITE_VERSION="${BENCHMARK_SUITE_VERSION:-20}"
BENCHMARK_TAR="Amber${BENCHMARK_SUITE_VERSION}_Benchmark_Suite.tar.gz"
BENCHMARK_URL="https://ambermd.org/${BENCHMARK_TAR}"

INSTALL_DIR="$HOME/benchmarks/amber/pmemd24_src/"
BENCH_DIR="$HOME/benchmarks/amber/amber-benchmarks"
BENCH_TAR_PATH="/tmp/${BENCHMARK_TAR}"

# checks
[[ -d $INSTALL_DIR ]] && {
    echo "Error: $INSTALL_DIR exists." >&2
    exit 1
}

[[ -d $BENCH_DIR ]] && {
    echo "Error: $BENCH_DIR exists." >&2
    exit 1
}

[[ -f "$PMEMD_SRC_TAR" ]] || {
    echo "Error: PMEMD tar not found at $PMEMD_SRC_TAR" >&2
    exit 1
}

# extract pre-downloaded engine
mkdir -p "$INSTALL_DIR"

echo "Extracting Amber (PMEMD) source from $PMEMD_SRC_TAR ..."
tar -xjf "$PMEMD_SRC_TAR" --strip-components=1 -C "$INSTALL_DIR"
echo "Amber source ready at: $INSTALL_DIR"

# benchmark input: download + extract ---
mkdir -p "$BENCH_DIR"

if [[ ! -f "$BENCH_TAR_PATH" ]]; then
    echo "Downloading Amber Benchmark Suite (Amber${BENCHMARK_SUITE_VERSION})..."
    if ! wget -O "$BENCH_TAR_PATH" "$BENCHMARK_URL"; then
        echo "Error: download failed for $BENCHMARK_URL" >&2
        exit 1
    fi
else
    echo "Using cached $BENCH_TAR_PATH"
fi

echo "Extracting Amber benchmark suite to $BENCH_DIR ..."
tar -xzf "$BENCH_TAR_PATH" -C "$BENCH_DIR"

#rm -f "$BENCH_TAR_PATH"
#echo "Removed cached: $BENCH_TAR_PATH"

echo "Amber benchmark inputs ready at: $BENCH_DIR"
