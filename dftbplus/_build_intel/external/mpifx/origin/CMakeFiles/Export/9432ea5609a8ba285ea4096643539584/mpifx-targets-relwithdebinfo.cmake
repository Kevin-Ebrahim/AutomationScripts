#----------------------------------------------------------------
# Generated CMake target import file for configuration "RelWithDebInfo".
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "MpiFx::mpifx" for configuration "RelWithDebInfo"
set_property(TARGET MpiFx::mpifx APPEND PROPERTY IMPORTED_CONFIGURATIONS RELWITHDEBINFO)
set_target_properties(MpiFx::mpifx PROPERTIES
  IMPORTED_LOCATION_RELWITHDEBINFO "${_IMPORT_PREFIX}/lib/libmpifx.so"
  IMPORTED_SONAME_RELWITHDEBINFO "libmpifx.so"
  )

list(APPEND _cmake_import_check_targets MpiFx::mpifx )
list(APPEND _cmake_import_check_files_for_MpiFx::mpifx "${_IMPORT_PREFIX}/lib/libmpifx.so" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
