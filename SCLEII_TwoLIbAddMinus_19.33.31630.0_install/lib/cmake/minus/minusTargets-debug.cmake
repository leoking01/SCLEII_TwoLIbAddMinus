#----------------------------------------------------------------
# Generated CMake target import file for configuration "Debug".
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "minus::mymath" for configuration "Debug"
set_property(TARGET minus::mymath APPEND PROPERTY IMPORTED_CONFIGURATIONS DEBUG)
set_target_properties(minus::mymath PROPERTIES
  IMPORTED_IMPLIB_DEBUG "${_IMPORT_PREFIX}/lib/mymathd.lib"
  IMPORTED_LOCATION_DEBUG "${_IMPORT_PREFIX}/bin/mymathd.dll"
  )

list(APPEND _cmake_import_check_targets minus::mymath )
list(APPEND _cmake_import_check_files_for_minus::mymath "${_IMPORT_PREFIX}/lib/mymathd.lib" "${_IMPORT_PREFIX}/bin/mymathd.dll" )

# Import target "minus::mymathapp" for configuration "Debug"
set_property(TARGET minus::mymathapp APPEND PROPERTY IMPORTED_CONFIGURATIONS DEBUG)
set_target_properties(minus::mymathapp PROPERTIES
  IMPORTED_LOCATION_DEBUG "${_IMPORT_PREFIX}/bin/mymathapp.exe"
  )

list(APPEND _cmake_import_check_targets minus::mymathapp )
list(APPEND _cmake_import_check_files_for_minus::mymathapp "${_IMPORT_PREFIX}/bin/mymathapp.exe" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
