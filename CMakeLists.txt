cmake_minimum_required(VERSION 3.28)

project(Template01
    VERSION 1.0.0
    DESCRIPTION "Plain binary application"
)

include(cmake/ProjectOptions.cmake)
include(cmake/ProjectConfigs.cmake)
if(PROJECT_IS_TOP_LEVEL)
    include(cmake/ProjectInstall.cmake)
endif()
if(PROJECT_IS_TOP_LEVEL)
    include(cmake/ProjectPackaging.cmake)
endif()

add_subdirectory(config)
if(TEMPLATE01_ENABLE_DOC)
    add_subdirectory(doc)
endif()
add_subdirectory(src)
if(TEMPLATE01_ENABLE_TESTS)
    add_subdirectory(test)
endif()
