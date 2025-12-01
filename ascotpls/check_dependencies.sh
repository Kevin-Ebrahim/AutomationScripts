#!/usr/bin/env bash
# ==========================================================
# ASCOT5 dependency checker (Ubuntu / generic Linux)
# ==========================================================

set -euo pipefail

# ---- Recommended minimums (from your tutorial) ----
REQ_GCC="8.0"
REQ_OMPI="4.1.4"
REQ_HDF5="1.12.2"
REQ_PY="3.9"
REQ_CMAKE="3.20"

REQ_NUMPY="1.21"
REQ_H5PY="3.7"
REQ_MPL="3.5"

REQ_SCIPY=""
REQ_PANDAS=""
REQ_IPYTHON=""

# ---- Pretty output helpers ----
if [[ -t 1 ]]; then
  RED=$'\033[31m'; GRN=$'\033[32m'; YLW=$'\033[33m'; BLU=$'\033[34m'; BLD=$'\033[1m'; RST=$'\033[0m'
else
  RED=""; GRN=""; YLW=""; BLU=""; BLD=""; RST=""
fi

ok()   { echo "${GRN}[PASS]${RST} $*"; }
warn() { echo "${YLW}[WARN]${RST} $*"; }
bad()  { echo "${RED}[FAIL]${RST} $*"; }

have_cmd() { command -v "$1" >/dev/null 2>&1; }

# version_ge A B  => true if A >= B
version_ge() {
  [[ "$(printf '%s\n' "$2" "$1" | sort -V | head -n1)" == "$2" ]]
}

extract_ver_firstmatch() {
  # IMPORTANT: use FIRST match (not last); avoid greedy regex bugs like 15.2.0 -> 2.0
  grep -oE '[0-9]+(\.[0-9]+){1,3}' | head -n1
}

FAILS=0

section() {
  echo
  echo "${BLD}== $* ==${RST}"
}

check_cmd_only() {
  local cmd="$1" hint="${2:-}"
  if have_cmd "$cmd"; then
    ok "$cmd: found ($(command -v "$cmd"))"
  else
    bad "$cmd: NOT found${hint:+  | Hint: $hint}"
    FAILS=$((FAILS+1))
  fi
}

check_version_cmd() {
  local label="$1" cmd="$2" req="$3" getver_cmd="$4" hint="${5:-}"
  if ! have_cmd "$cmd"; then
    bad "$label: $cmd NOT found${hint:+  | Hint: $hint}"
    FAILS=$((FAILS+1))
    return 0
  fi

  local ver
  ver="$($getver_cmd 2>/dev/null | extract_ver_firstmatch || true)"
  if [[ -z "${ver:-}" ]]; then
    warn "$label: found ($cmd) but couldn't parse version"
    return 0
  fi

  if [[ -n "$req" ]] && ! version_ge "$ver" "$req"; then
    bad "$label: version $ver < required $req${hint:+  | Hint: $hint}"
    FAILS=$((FAILS+1))
  else
    ok "$label: version $ver (required >= ${req:-any})"
  fi
}

check_python_pkg() {
  local pkg="$1" req="$2"
  local out
  out="$(python3 - <<PY
import sys
try:
    from importlib.metadata import version, PackageNotFoundError
except Exception:
    try:
        from importlib_metadata import version, PackageNotFoundError  # type: ignore
    except Exception:
        print("NO_METADATA")
        sys.exit(2)

try:
    v = version("$pkg")
    print(v)
except PackageNotFoundError:
    print("MISSING")
    sys.exit(1)
PY
)" || true

  if [[ "$out" == "MISSING" ]]; then
    bad "python pkg: $pkg NOT installed  | Hint: python3 -m pip install -U $pkg"
    FAILS=$((FAILS+1))
    return 0
  fi
  if [[ "$out" == "NO_METADATA" ]]; then
    warn "python pkg: $pkg installed? (couldn't query version metadata)"
    return 0
  fi

  if [[ -n "$req" ]] && ! version_ge "$out" "$req"; then
    bad "python pkg: $pkg version $out < required $req  | Hint: python3 -m pip install -U $pkg"
    FAILS=$((FAILS+1))
  else
    ok "python pkg: $pkg version $out (required >= ${req:-any})"
  fi
}

check_hdf5_parallel() {
  if have_cmd h5pcc; then
    ok "HDF5 parallel: h5pcc found ($(command -v h5pcc))"
    return 0
  fi

  if have_cmd h5cc; then
    local cfg
    cfg="$(h5cc -showconfig 2>/dev/null || true)"
    if echo "$cfg" | grep -qiE 'Parallel HDF5:[[:space:]]*yes'; then
      ok "HDF5 parallel: enabled (h5cc -showconfig reports Parallel HDF5: yes)"
    else
      warn "HDF5 parallel: not detected via h5cc -showconfig"
      warn "  If ASCOT needs parallel HDF5, install/build HDF5 with MPI (h5pcc) and rebuild ASCOT."
    fi
    return 0
  fi

  warn "HDF5 parallel: can't check (neither h5pcc nor h5cc found)"
}

echo "${BLD}ASCOT5 dependency check${RST}"
echo "Host: $(hostname)"
echo "Date: $(date -Is)"
echo

section "Base build tools"
check_cmd_only make "sudo apt install -y build-essential"
check_cmd_only git  "sudo apt install -y git"
check_version_cmd "CMake" cmake "$REQ_CMAKE" "cmake --version" "sudo apt install -y cmake"

section "C/C++ compiler"
check_version_cmd "GCC" gcc "$REQ_GCC" "gcc --version" "sudo apt install -y gcc g++"
if have_cmd gcc; then
  if gcc -fopenmp -x c - -o /dev/null <<< 'int main(){return 0;}' >/dev/null 2>&1; then
    ok "GCC OpenMP: -fopenmp works"
  else
    warn "GCC OpenMP: -fopenmp test failed (might still be fine depending on setup)"
  fi
fi

section "MPI"
check_version_cmd "OpenMPI (mpirun)" mpirun "$REQ_OMPI" "mpirun --version" "sudo apt install -y openmpi-bin"
check_cmd_only mpicc "sudo apt install -y libopenmpi-dev"
if have_cmd mpicc; then
  ok "mpicc: wrapper uses -> $(mpicc --showme:command 2>/dev/null || echo mpicc)"
fi

section "HDF5"
check_version_cmd "HDF5 tools (h5ls)" h5ls "$REQ_HDF5" "h5ls -V" "sudo apt install -y hdf5-tools"
if have_cmd h5cc; then ok "h5cc: found ($(command -v h5cc))"; else warn "h5cc: not found (dev package may be missing)"; fi
if have_cmd h5pcc; then ok "h5pcc: found ($(command -v h5pcc))"; else warn "h5pcc: not found (parallel HDF5 may be missing)"; fi
check_hdf5_parallel

section "Python"
check_version_cmd "Python3" python3 "$REQ_PY" "python3 --version" "sudo apt install -y python3 python3-venv python3-pip"
if have_cmd python3; then
  if python3 -m pip --version >/dev/null 2>&1; then
    ok "pip: available (python3 -m pip)"
  else
    bad "pip: not available  | Hint: sudo apt install -y python3-pip"
    FAILS=$((FAILS+1))
  fi
fi

section "Python packages (for a5py + scripts)"
if ! have_cmd python3; then
  bad "python3 missing; skipping python package checks"
  FAILS=$((FAILS+1))
else
  check_python_pkg "numpy" "$REQ_NUMPY"
  check_python_pkg "h5py" "$REQ_H5PY"
  check_python_pkg "matplotlib" "$REQ_MPL"
  check_python_pkg "scipy" "$REQ_SCIPY"
  check_python_pkg "pandas" "$REQ_PANDAS"
  check_python_pkg "ipython" "$REQ_IPYTHON"
fi

echo
section "Summary"
if [[ "$FAILS" -eq 0 ]]; then
  ok "All required checks passed."
  echo "You should be good to: make libascot MPI=1 && make ascot5_main MPI=1"
else
  bad "Found $FAILS problem(s). Fix the FAIL items above, then re-run this script."
fi

exit "$FAILS"

