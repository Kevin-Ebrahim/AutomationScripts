# HPL Automation Makefile Guide

## Make targets

| Target                |
|-----------------------|
| `all`                 |
| `check`               |
| `download`            |
| `build`               |
| `hpldat`              |
| `hosts`               |
| `run`                 |
| `clean`               |

## `make` Invocation Guide

### `make check`

- **Function:** Verify dependencies are present

### `make download`

- **Function:** Download & extract HPL source
- **Notes:**
  
  - **Version:** 2.3
  
  - **Installation directory:** $HOME/benchmarks/hpl/hpl-2.3

### `make build`

- **Function:** Compile `xhpl` binary
- **Notes:**
  
  - Specify the architecture name using the `ARCH` overrider
    - Example: `make build ARCH=intel_gcc`
    - Default architecture is `inteloneapi`

### `make hpldat`

- **Function:** Generate a custom `HPL.dat` file
- **Notes:**
  
  - Specify the architecture name using the `ARCH` overrider
    - Example: `make hpldat ARCH=openmpi_gcc`
    - Default architecture is `inteloneapi`

  - Specify the HPL problem size (`Ns`) using the `N` overrider
    - Example: `make hpldat N=10000`
    - Default problem size is `2048`
  
  - Specify the HPL block size (`NBs`) using the `NB` overrider
    - Example: `make hpldat NB=192`
    - Default is `128`
  
  - Specify the HPL grid rows (`Ps`) using the `P` overrider
    - Example: `make hpldat P=4`
    - Default is the value given by `nproc`

  - Specify the HPL columns (`Qs`) using the `Q` overrider
    - Example: `make hpldat Q=4`
    - Default is `1`

### `make hosts`

- **Function:** Generate custom hostfiles for Intel and OpenMPI
- **Notes:**
  
  - Specify where to store host files using `HOSTS_DIR` overrider
    - Example: `make hosts HOSTS_DIR=~/Wits-A-2025/configs/hostfiles`
    - Default is `$HOME/Wits-A-2025/scripts/hostfiles`
  
  - Colon separated node list using `NODES`
    - Example: `make hosts NODES="headnode:16 node1:24 node2:16"`
    - Default is name returned by `hostname`
  
  - Set the default number of slots using `SLOTS` overrider
    - Example: `make hosts SLOTS=10`
    - Default is value returned by `nproc`

### `make run`

- **Function:** Launches `xhpl` binary with `mpirun`
- **Notes:**
  
  - Specify the architecture name using the `ARCH` overrider
    - Example: `make run ARCH=intel_ompi_gcc`
    - Default architecture is `inteloneapi`

  - Specify the number of processors HPL uses with the `NP` overrider
    - Example: `make run NP=16`
    - Default is the value given by `nproc`

  - Specify the hostfile HPL uses with the `HOSTFILE` overrider
    - Example: `make run HOSTFILE=hosts`
    - Default is `$HOME/Wits-A-2025/scripts/hostfiles/hosts`

### `make clean`

- **Function:** Removes build
- **Notes:**

  - Specify the architecture to clean using `ARCH` overrider
    - Example: `make clean ARCH=intel_ompi_gcc`

> Ensure product of grid rows and columns is equal to the number of processors during run i.e. `P x Q = NP`
>
> You can combine flags in any order

## Home directory Makefile (`hplMakefile`)

- **Function:** Run `Makefile` commands from any directory
- **Notes:**

  - This uses the same `Makefile` invocations as above, you just have to specify the `Makefile` name using the `-f` flag
    - Example: `make -f hplMakefile run`
  
  - All overrides discussed above work the same way

