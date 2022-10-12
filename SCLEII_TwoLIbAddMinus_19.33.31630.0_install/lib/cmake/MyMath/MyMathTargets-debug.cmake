#----------------------------------------------------------------
# Generated CMake target import file for configuration "Debug".
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "MyMath::mymath" for configuration "Debug"
set_property(TARGET MyMath::mymath APPEND PROPERTY IMPORTED_CONFIGURATIONS DEBUG)
set_target_properties(MyMath::mymath PROPERTIES
  IMPORTED_IMPLIB_DEBUG "${_IMPORT_PREFIX}/lib/mymathd.lib"
  IMPORTED_LOCATION_DEBUG "${_IMPORT_PREFIX}/bin/mymathd.dll"
  )

list(APPEND _cmake_import_check_targets MyMath::mymath )
list(APPEND _cmake_import_check_files_for_MyMath::mymath "${_IMPORT_PREFIX}/lib/mymathd.lib" "${_IMPORT_PREFIX}/bin/mymathd.dll" )

# Import target "MyMath::mymathapp" for configuration "Debug"
set_property(TARGET MyMath::mymathapp APPEND PROPERTY IMPORTED_CONFIGURATIONS DEBUG)
set_target_properties(MyMath::mymathapp PROPERTIES
  IMPORTED_LOCATION_DEBUG "${_IMPORT_PREFIX}/bin/mymathapp.exe"
  )

list(APPEND _cmake_import_check_targets MyMath::mymathapp )
list(APPEND _cmake_import_check_files_for_MyMath::mymathapp "${_IMPORT_PREFIX}/bin/mymathapp.exe" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
