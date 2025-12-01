#%Module1.0
## OpenBLAS 0.3.30 (OpenMP; BLAS/CBLAS/LAPACK/LAPACKE)
## Installed at: $HOME/tools/libraries/openblas/0.3.30

proc ModulesHelp { } {
    puts stderr "OpenBLAS 0.3.30 — OpenMP build (controls threads via OMP_NUM_THREADS)."
    puts stderr "Headers:  \$root/include   Libs: \$root/lib"
    puts stderr "Tip: load gcc/15.2.0 first so libgomp is available."
}

module-whatis "OpenBLAS 0.3.30 (OpenMP; BLAS/CBLAS/LAPACK/LAPACKE)"
conflict openblas

# Ensure matching GCC runtime (for libgomp from OpenMP build)
prereq gcc/15.2.0

set root /home/witsa/tools/libraries/openblas/0.3.30

# Compile- and run-time paths
prepend-path CPATH           $root/include
prepend-path LIBRARY_PATH    $root/lib
prepend-path LD_LIBRARY_PATH $root/lib
prepend-path PKG_CONFIG_PATH $root/lib/pkgconfig

# Convenience
setenv OPENBLAS_ROOT $root
