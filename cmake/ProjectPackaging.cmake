include(CPackComponent)

# Set default packaging install prefix path
if (CMAKE_INSTALL_PREFIX_INITIALIZED_TO_DEFAULT)
    set(CPACK_PACKAGING_INSTALL_PREFIX ${CMAKE_INSTALL_PREFIX})
endif()

# Specify general information
set(CPACK_PACKAGE_NAME "Template01")
set(CPACK_PACKAGE_CONTACT "maintainer@denoming.com")
set(CPACK_PACKAGE_VENDOR "DENOMING")
set(CPACK_PACKAGE_DESCRIPTION_SUMMARY "Template01 project")
set(CPACK_PACKAGE_INSTALL_DIRECTORY ${CPACK_PACKAGE_NAME})
set(CPACK_COMPONENTS_ALL
    # List all components to generate packages for
    # ...
    Template01_Runtime
)
set(CPACK_VERBATIM_VARIABLES YES)
set(CPACK_SOURCE_GENERATOR "TGZ")
set(CPACK_SOURCE_IGNORE_FILES
    /\\.git/
    /\\.idea/
    /build-?.*/
)

# Specify version information
set(CPACK_PACKAGE_VERSION_MAJOR ${PROJECT_VERSION_MAJOR})
set(CPACK_PACKAGE_VERSION_MINOR ${PROJECT_VERSION_MINOR})
set(CPACK_PACKAGE_VERSION_PATCH ${PROJECT_VERSION_PATCH})

# Includes additional files if they are exist
if(EXISTS "${PROJECT_SOURCE_DIR}/DESCRIPTION.md")
    set(CPACK_PACKAGE_DESCRIPTION_FILE "${PROJECT_SOURCE_DIR}/DESCRIPTION.md")
endif()
if(EXISTS "${PROJECT_SOURCE_DIR}/WELCOME.md")
    set(CPACK_RESOURCE_FILE_WELCOME "${PROJECT_SOURCE_DIR}/WELCOME.md")
endif()
if (EXISTS "${PROJECT_SOURCE_DIR}/LICENSE.md")
    set(CPACK_RESOURCE_FILE_LICENSE "${PROJECT_SOURCE_DIR}/LICENSE.md")
endif()
if (EXISTS "${PROJECT_SOURCE_DIR}/README.md")
    set(CPACK_RESOURCE_FILE_README "${PROJECT_SOURCE_DIR}/README.md")
endif()

# Specify the list of generators
list(APPEND CMAKE_MODULE_PATH "${PROJECT_SOURCE_DIR}/config/generators")
if(CMAKE_SYSTEM_NAME STREQUAL "Linux")
    set(CPACK_GENERATOR "TGZ;DEB")
    include(tgzFormat)
    include(debFormat)
else()
    set(CPACK_GENERATOR "TGZ")
    include(tgzFormat)
endif()

#
# Declare all component
# ...

cpack_add_component(Template01_Runtime
    DISPLAY_NAME Runtime
    DESCRIPTION "Template01 Runtime"
    REQUIRED
)

include(CPack)
