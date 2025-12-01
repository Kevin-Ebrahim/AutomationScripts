set(CMAKE_Fortran_COMPILER "/home/witsa/tools/intel/oneapi/mpi/2021.17/bin/mpiifx")
set(CMAKE_Fortran_COMPILER_ARG1 "")
set(CMAKE_Fortran_COMPILER_ID "IntelLLVM")
set(CMAKE_Fortran_COMPILER_VERSION "2025.3.0")
set(CMAKE_Fortran_COMPILER_WRAPPER "")
set(CMAKE_Fortran_PLATFORM_ID "Linux")
set(CMAKE_Fortran_SIMULATE_ID "")
set(CMAKE_Fortran_COMPILER_FRONTEND_VARIANT "GNU")
set(CMAKE_Fortran_SIMULATE_VERSION "")




set(CMAKE_AR "/usr/bin/ar")
set(CMAKE_Fortran_COMPILER_AR "CMAKE_Fortran_COMPILER_AR-NOTFOUND")
set(CMAKE_RANLIB "/usr/bin/ranlib")
set(CMAKE_LINKER "/usr/bin/ld")
set(CMAKE_Fortran_COMPILER_RANLIB "CMAKE_Fortran_COMPILER_RANLIB-NOTFOUND")
set(CMAKE_TAPI "CMAKE_TAPI-NOTFOUND")
set(CMAKE_COMPILER_IS_GNUG77 )
set(CMAKE_Fortran_COMPILER_LOADED 1)
set(CMAKE_Fortran_COMPILER_WORKS TRUE)
set(CMAKE_Fortran_ABI_COMPILED TRUE)

set(CMAKE_Fortran_COMPILER_ENV_VAR "FC")

set(CMAKE_Fortran_COMPILER_SUPPORTS_F90 1)

set(CMAKE_Fortran_COMPILER_ID_RUN 1)
set(CMAKE_Fortran_SOURCE_FILE_EXTENSIONS f;F;fpp;FPP;f77;F77;f90;F90;for;For;FOR;f95;F95;f03;F03;f08;F08)
set(CMAKE_Fortran_IGNORE_EXTENSIONS h;H;o;O;obj;OBJ;def;DEF;rc;RC)
set(CMAKE_Fortran_LINKER_PREFERENCE 20)
set(CMAKE_Fortran_LINKER_DEPFILE_SUPPORTED )
if(UNIX)
  set(CMAKE_Fortran_OUTPUT_EXTENSION .o)
else()
  set(CMAKE_Fortran_OUTPUT_EXTENSION .obj)
endif()

# Save compiler ABI information.
set(CMAKE_Fortran_SIZEOF_DATA_PTR "8")
set(CMAKE_Fortran_COMPILER_ABI "ELF")
set(CMAKE_Fortran_LIBRARY_ARCHITECTURE "x86_64-linux-gnu")

if(CMAKE_Fortran_SIZEOF_DATA_PTR AND NOT CMAKE_SIZEOF_VOID_P)
  set(CMAKE_SIZEOF_VOID_P "${CMAKE_Fortran_SIZEOF_DATA_PTR}")
endif()

if(CMAKE_Fortran_COMPILER_ABI)
  set(CMAKE_INTERNAL_PLATFORM_ABI "${CMAKE_Fortran_COMPILER_ABI}")
endif()

if(CMAKE_Fortran_LIBRARY_ARCHITECTURE)
  set(CMAKE_LIBRARY_ARCHITECTURE "x86_64-linux-gnu")
endif()





set(CMAKE_Fortran_IMPLICIT_INCLUDE_DIRECTORIES "/home/witsa/tools/intel/oneapi/mpi/2021.17/include/mpi;/home/witsa/tools/intel/oneapi/mpi/2021.17/include;/home/witsa/tools/intel/oneapi/umf/1.0/include;/home/witsa/tools/intel/oneapi/mkl/2025.3/include;/home/witsa/tools/intel/oneapi/dev-utilities/2025.3/include;/home/witsa/tools/intel/oneapi/ccl/2021.17/include;/home/witsa/tools/openmpi/gcc_15.2.0/openmpi-5.0.8/include;/home/witsa/tools/intel/oneapi/tbb/2022.3/include;/home/witsa/tools/intel/oneapi/ishmem/1.5/include;/home/witsa/tools/intel/oneapi/ippcp/2025.3/include;/home/witsa/tools/intel/oneapi/ipp/2022.3/include;/home/witsa/tools/intel/oneapi/dnnl/2025.3/include;/home/witsa/tools/intel/oneapi/compiler/2025.3/opt/compiler/include/intel64;/home/witsa/tools/intel/oneapi/compiler/2025.3/opt/compiler/include;/home/witsa/tools/intel/oneapi/compiler/2025.3/include;/usr/local/include;/home/witsa/tools/intel/oneapi/compiler/2025.3/lib/clang/21/include;/usr/include")
set(CMAKE_Fortran_IMPLICIT_LINK_LIBRARIES "mpifort;mpi;dl;rt;pthread;ifport;ifcoremt;imf;svml;m;ipgo;iomp5;irc;pthread;svml;c;gcc;gcc_s;irc_s;dl;c")
set(CMAKE_Fortran_IMPLICIT_LINK_DIRECTORIES "/home/witsa/tools/intel/oneapi/mpi/2021.17/lib;/home/witsa/tools/intel/oneapi/tcm/1.4/lib;/home/witsa/tools/intel/oneapi/umf/1.0/lib;/home/witsa/tools/intel/oneapi/tbb/2022.3/lib/intel64/gcc4.8;/home/witsa/tools/intel/oneapi/mkl/2025.3/lib;/home/witsa/tools/intel/oneapi/ishmem/1.5/lib;/home/witsa/tools/intel/oneapi/ippcp/2025.3/lib;/home/witsa/tools/intel/oneapi/ipp/2022.3/lib;/home/witsa/tools/intel/oneapi/dnnl/2025.3/lib;/home/witsa/tools/intel/oneapi/dal/2025.9/lib;/home/witsa/tools/intel/oneapi/compiler/2025.3/lib;/home/witsa/tools/intel/oneapi/ccl/2021.17/lib;/home/witsa/tools/openmpi/gcc_15.2.0/openmpi-5.0.8/lib;/home/witsa/tools/intel/oneapi/compiler/2025.3/lib/clang/21/lib/x86_64-unknown-linux-gnu;/home/witsa/compilers/gcc/gcc-15.2.0/lib/gcc/x86_64-pc-linux-gnu/15.2.0;/home/witsa/compilers/gcc/gcc-15.2.0/lib64;/lib/x86_64-linux-gnu;/lib64;/usr/lib/x86_64-linux-gnu;/usr/lib64;/home/witsa/compilers/gcc/gcc-15.2.0/lib;/lib;/usr/lib")
set(CMAKE_Fortran_IMPLICIT_LINK_FRAMEWORK_DIRECTORIES "")
