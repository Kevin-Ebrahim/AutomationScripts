#!/usr/bin/env bash
set -Eeuo pipefail

# Where the tarballs live and where you want the sources
WORKDIR="${WORKDIR:-$HOME/benchmarks/ambermd}"
AMBERTOOLS_TARBALL="${AMBERTOOLS_TARBALL:-ambertools25.tar.bz2}"
AMBER24_TARBALL="${AMBER24_TARBALL:-amber24.tar.bz2}"

echo "=== Amber source preparation ==="
echo "WORKDIR          : $WORKDIR"
echo "AMBERTOOLS_TARBALL: $AMBERTOOLS_TARBALL"
echo "AMBER24_TARBALL   : $AMBER24_TARBALL"
echo

mkdir -p "$WORKDIR"
cd "$WORKDIR"

[[ -f "$AMBERTOOLS_TARBALL" ]] || {
    echo "Error: $AMBERTOOLS_TARBALL not found in $WORKDIR" >&2
    exit 1
}

[[ -f "$AMBER24_TARBALL" ]] || {
    echo "Error: $AMBER24_TARBALL not found in $WORKDIR" >&2
    exit 1
}

if [[ -d ambertools25_src ]]; then
    echo "[*] ambertools25_src already exists, skipping extraction."
else
    echo "[+] Extracting $AMBERTOOLS_TARBALL ..."
    tar xjf "$AMBERTOOLS_TARBALL"
fi

# Extract Amber24
if [[ -d amber24_src ]]; then
    echo "[*] amber24_src already exists, skipping extraction."
else
    echo "[+] Extracting $AMBER24_TARBALL ..."
    tar xjf "$AMBER24_TARBALL"
fi

# Ensure expected directories exist
[[ -d ambertools25_src ]] || {
    echo "Error: ambertools25_src directory not found after extraction." >&2
    exit 1
}

[[ -d amber24_src ]] || {
    echo "Error: amber24_src directory not found after extraction." >&2
    exit 1
}

echo "[+] Merging Amber24 content into ambertools25_src ..."

# Move directories from amber24_src to ambertools25_src
for d in benchmarks examples src; do
    if [[ -d "amber24_src/$d" ]]; then
        if [[ -d "ambertools25_src/$d" ]]; then
            echo "Error: target directory ambertools25_src/$d already exists." >&2
            echo "       Please resolve manually to avoid overwriting." >&2
            exit 1
        fi
        mv "amber24_src/$d" "ambertools25_src/"
    else
        echo "Warning: amber24_src/$d not found, skipping."
    fi
done

# Copy tests (merge)
if [[ -d amber24_src/test && -d ambertools25_src/test ]]; then
    echo "[+] Copying tests from amber24_src/test -> ambertools25_src/test ..."
    cp -r amber24_src/test/* ambertools25_src/test/
else
    echo "Warning: one of test directories missing, skipping test copy."
fi

echo "[+] Removing amber24_src ..."
rm -rf amber24_src

echo
echo "=== Done ==="
echo "Combined sources are in: $WORKDIR/ambertools25_src"
