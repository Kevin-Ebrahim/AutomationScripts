# Automation Scripts

## Purpose

Making automation scripts for various competition benchmarks.
Each directory contains a download, configure and build scripts, along with other required scripts for that specific benchmark that can be run to make benchmarking easy on any cluster.

## Tree

.
├── README.md
├── hpcg
│   └── download_hpcg.sh
└── hpl
    ├── Makefile
    ├── README.md
    ├── build_hpl.sh
    ├── check_dependencies.sh
    ├── clean_hpl.sh
    ├── configure_hpl.sh
    ├── download_hpl.sh
    ├── hplMakefile
    ├── make_hosts.sh
    ├── make_hpl_dat.sh
    └── run_hpl.sh
