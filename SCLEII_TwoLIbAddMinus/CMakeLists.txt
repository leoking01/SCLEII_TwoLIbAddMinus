cmake_minimum_required(VERSION 3.0)
project( SCLEII_TwoLIbAddMinus VERSION 1.0)

set(CMAKE_WINDOWS_EXPORT_ALL_SYMBOLS ON)
if(MSVC)
    set(CMAKE_DEBUG_POSTFIX "d")
endif()
#link_directories(${CMAKE_BINARY_DIR} )

message( "CMAKE_C_COMPILER = ${CMAKE_C_COMPILER}"  )
message( "CMAKE_C_COMPILER_VERSION = ${CMAKE_C_COMPILER_VERSION}"  )
message( "CMAKE_CXX_PLATFORM_ID = ${CMAKE_CXX_PLATFORM_ID}"  )
message( "CMAKE_CXX_COMPILER_TARGET = ${CMAKE_CXX_COMPILER_TARGET}"  )
message( "CMAKE_CXX_COMPILER_AR = ${CMAKE_CXX_COMPILER_AR}"  )
message( "CMAKE_C_COMPILER_ABI = ${CMAKE_C_COMPILER_ABI}"  )
message( "CMAKE_C_COMPILER_TARGET = ${CMAKE_C_COMPILER_TARGET}"  )
message( "CMAKE_HOST_SYSTEM = ${CMAKE_HOST_SYSTEM}"  )
message( "CMAKE_HOST_SYSTEM_NAME = ${CMAKE_HOST_SYSTEM_NAME}"  )
message( "CMAKE_VS_PLATFORM_NAME = ${CMAKE_VS_PLATFORM_NAME}"  )
message( "CMAKE_VS_PLATFORM_TOOLSET = ${CMAKE_VS_PLATFORM_TOOLSET}"  )
message( "CMAKE_CXX_COMPILER_VERSION = ${CMAKE_CXX_COMPILER_VERSION}"  )

# 改变安装路径可以使用下面的语句，Unix: "/usr/local", Windows: "c:/Program Files/${PROJECT_NAME}" 为默认值，所有的DESTINATION均以此目录为根目录
# set(CMAKE_INSTALL_PREFIX ${CMAKE_BINARY_DIR}/mymath)
set(CMAKE_INSTALL_PREFIX ${CMAKE_BINARY_DIR}/../${PROJECT_NAME}_${CMAKE_CXX_COMPILER_VERSION}_install)



# 如果想生成静态库，使用下面的语句
# add_library(mymath mymath.cc)
# target_include_directories(mymath PUBLIC ${CMAKE_SOURCE_DIR}/include)

# 如果想生成动态库，使用下面的语句
add_library(mymath SHARED MyMath/mymath.cc)
target_include_directories(mymath PRIVATE  ${CMAKE_SOURCE_DIR}/MyMath/include)
set_target_properties(mymath PROPERTIES PUBLIC_HEADER ${CMAKE_SOURCE_DIR}/MyMath/include/mymath.h)


# 如果想生成动态库，使用下面的语句
add_library(minus SHARED minus/minus_opera.cc)
target_include_directories(minus PRIVATE  ${CMAKE_SOURCE_DIR}/minus/include)
set_target_properties(minus PROPERTIES PUBLIC_HEADER ${CMAKE_SOURCE_DIR}/minus/include/minus_opera.h)


# 生成可执行文件
add_executable(mymathapp app/mymathApp.cc)
target_link_directories(mymathapp PRIVATE ${CMAKE_BINARY_DIR})
target_link_libraries(mymathapp mymath)
target_include_directories(mymathapp PRIVATE ${CMAKE_SOURCE_DIR}/MyMath/include)

# install
include(CMakePackageConfigHelpers)

#//---MyMath---------------------------------------------
# 写入库的版本信息

write_basic_package_version_file(
    MyMathConfigVersion.cmake
    VERSION ${PACKAGE_VERSION}
    COMPATIBILITY AnyNewerVersion
)

# 将库文件，可执行文件，头文件安装到指定目录
install(TARGETS mymath    mymathapp
    EXPORT MyMathTargets
    LIBRARY DESTINATION lib
    ARCHIVE DESTINATION lib
    RUNTIME DESTINATION bin
    PUBLIC_HEADER DESTINATION include
)

# 将库的相关信息输出为MyMathConfig.cmake，供find_package查找
install(EXPORT MyMathTargets
    FILE MyMathTargets.cmake
    NAMESPACE MyMath::
    DESTINATION lib/cmake/MyMath
)

configure_file(MyMath/MyMathConfig.cmake.in  MyMath/MyMathConfig.cmake @ONLY)
install(FILES "${CMAKE_CURRENT_BINARY_DIR}/MyMath/MyMathConfig.cmake"
    "${CMAKE_CURRENT_BINARY_DIR}/MyMathConfigVersion.cmake"
    DESTINATION lib/cmake/MyMath
)



#//---minus---------------------------------------------
# 写入库的版本信息
#include(CMakePackageConfigHelpers)
write_basic_package_version_file(
    minusConfigVersion.cmake
    VERSION ${PACKAGE_VERSION}
    COMPATIBILITY AnyNewerVersion
)

# 将库文件，可执行文件，头文件安装到指定目录
install(TARGETS   minus
    EXPORT minusTargets
    LIBRARY DESTINATION lib
    ARCHIVE DESTINATION lib
    RUNTIME DESTINATION bin
    PUBLIC_HEADER DESTINATION include
)

# 将库的相关信息输出为MyMathConfig.cmake，供find_package查找
install(EXPORT MyMathTargets
    FILE minusTargets.cmake
    NAMESPACE minus::
    DESTINATION lib/cmake/minus
)

configure_file(minus/minusConfig.cmake.in  minus/minusConfig.cmake @ONLY)
install(FILES "${CMAKE_CURRENT_BINARY_DIR}/minus/minusConfig.cmake"
    "${CMAKE_CURRENT_BINARY_DIR}/minusConfigVersion.cmake"
    DESTINATION lib/cmake/minus
)
