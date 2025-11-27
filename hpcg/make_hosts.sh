#!/bin/bash

# Env vars
#   HOSTS_DIR  – where to write hostfiles (default: $HOME/Wits-A-2025/scripts/hostfiles)
#   OMPI_HOSTS – Open MPI hostfile path (default: $HOSTS_DIR/hosts.ompi)
#   IMPI_HOSTS – Intel MPI hostfile path (default: $HOSTS_DIR/hosts.intel)
#   NODES      – space-separated list like "nodeA:slots nodeB:slots" (default: $(hostname))
#   NSLOTS     – default slots per node if not specified in NODES (fallback to SLOTS, else nproc)

set -euo pipefail

HOSTS_DIR="${HOSTS_DIR:-$HOME/Wits-A-2025/scripts/hostfiles}"
OMPI_HOSTS="${OMPI_HOSTS:-${HOSTS_DIR}/hosts.ompi}"
IMPI_HOSTS="${IMPI_HOSTS:-${HOSTS_DIR}/hosts.intel}"
NODES="${NODES:-$(hostname)}"
NSLOTS="${NSLOTS:-${SLOTS:-$(nproc)}}"

mkdir -p "$HOSTS_DIR"
: >"$OMPI_HOSTS"
: >"$IMPI_HOSTS"

# NODES can be like "node1:24 node2:16" or just "node1 node2" (then NSLOTS is used)
for n in $NODES; do
    if [[ "$n" == *:* ]]; then
        node=${n%%:*}
        slots=${n##*:}
    else
        node="$n"
        slots="$NSLOTS"
    fi
    # Open MPI hostfile format: "node slots=N"
    echo "$node slots=$slots" >>"$OMPI_HOSTS"
    # Intel MPI hostfile format: "node:N"
    echo "$node:$slots" >>"$IMPI_HOSTS"
done

echo "Hostfiles generated:"
echo "  Open MPI : $OMPI_HOSTS"
echo "  Intel MPI: $IMPI_HOSTS"
