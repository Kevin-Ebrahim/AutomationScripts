#!/bin/bash
set -euo pipefail

HPL_VERSION="${HPL_VERSION:-2.3}"
ARCH="${ARCH:-inteloneapi}"
HPL_DIR="${HPL_DIR:-$HOME/benchmarks/hpl/hpl-${HPL_VERSION}}"

if [[ ! -d "$HPL_DIR" ]]; then
	echo "Nothing to clean; $HPL_DIR not found."
	exit 0
fi

echo "Cleaning HPL (arch=$ARCH) in $HPL_DIR …"

# Use HPL's native cleaner
if make -C "$HPL_DIR" -f Make.top arch="$ARCH" clean >/dev/null 2>&1; then
	true
else
	echo "(HPL clean returned non-zero; continuing with manual clean)"
fi

rm -rf \
	"$HPL_DIR/bin/$ARCH" \
	"$HPL_DIR/lib/$ARCH" \
	"$HPL_DIR/include/$ARCH" \
	"$HPL_DIR"/src/*/"$ARCH" \
	"$HPL_DIR"/testing/*/"$ARCH"

echo "Done."
