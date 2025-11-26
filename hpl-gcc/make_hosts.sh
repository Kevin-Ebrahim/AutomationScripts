#!/bin/bash

# Usage - NODES="headnode:16 node1:24 node2:16" ./generate_hosts.sh

set -euo pipefail

HOSTS_DIR="${HOSTS_DIR:-$HOME/Wits-A-2025/scripts/hostfiles}"
OMPI_HOSTS="${OMPI_HOSTS:-${HOSTS_DIR}/hosts.ompi}"
IMPI_HOSTS="${IMPI_HOSTS:-${HOSTS_DIR}/hosts.intel}"
NODES="${NODES:-$(hostname)}"
NSLOTS="${SLOTS:-$(nproc)}"

mkdir -p "$HOSTS_DIR"
: >"$OMPI_HOSTS"
: >"$IMPI_HOSTS"

for n in $NODES; do
    if [[ "$n" == *:* ]]; then
        node=${n%%:*}
        slots=${n##*:}
    else
        node="$n"
        slots="$NSLOTS"
    fi
    echo "$node slots=$slots" >>"$OMPI_HOSTS"   # Open MPI format
    echo "$node:$slots"      >>"$IMPI_HOSTS"    # Intel MPI format
done

echo "Hostfiles generated:"
echo "  Open MPI : $OMPI_HOSTS"
echo "  Intel MPI: $IMPI_HOSTS"
