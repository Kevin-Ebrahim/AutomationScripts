#----------------------------------------------------------------
# Generated CMake target import file for configuration "RelWithDebInfo".
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "ScalapackFx::scalapackfx" for configuration "RelWithDebInfo"
set_property(TARGET ScalapackFx::scalapackfx APPEND PROPERTY IMPORTED_CONFIGURATIONS RELWITHDEBINFO)
set_target_properties(ScalapackFx::scalapackfx PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELWITHDEBINFO "Fortran"
  IMPORTED_LOCATION_RELWITHDEBINFO "${_IMPORT_PREFIX}/lib/libscalapackfx.a"
  )

list(APPEND _cmake_import_check_targets ScalapackFx::scalapackfx )
list(APPEND _cmake_import_check_files_for_ScalapackFx::scalapackfx "${_IMPORT_PREFIX}/lib/libscalapackfx.a" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
