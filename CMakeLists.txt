cmake_minimum_required(VERSION 3.18)

project(Template01
    VERSION 1.0.0
    DESCRIPTION "Plain binary application"
)

include(cmake/ProjectOptions.cmake)
include(cmake/ProjectConfigs.cmake)
if (CMAKE_SOURCE_DIR STREQUAL CMAKE_CURRENT_SOURCE_DIR)
    include(cmake/ProjectInstall.cmake)
endif()
if (CMAKE_SOURCE_DIR STREQUAL CMAKE_CURRENT_SOURCE_DIR)
    include(cmake/ProjectPackaging.cmake)
endif()

add_subdirectory(src)
if(TEMPLATE01_ENABLE_TESTS)
    add_subdirectory(test)
endif()
