#----------------------------------------------------------------
# Generated CMake target import file for configuration "RelWithDebInfo".
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "DftbPlus::dftbplus" for configuration "RelWithDebInfo"
set_property(TARGET DftbPlus::dftbplus APPEND PROPERTY IMPORTED_CONFIGURATIONS RELWITHDEBINFO)
set_target_properties(DftbPlus::dftbplus PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELWITHDEBINFO "C;Fortran"
  IMPORTED_LOCATION_RELWITHDEBINFO "${_IMPORT_PREFIX}/lib/libdftbplus.a"
  )

list(APPEND _cmake_import_check_targets DftbPlus::dftbplus )
list(APPEND _cmake_import_check_files_for_DftbPlus::dftbplus "${_IMPORT_PREFIX}/lib/libdftbplus.a" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
