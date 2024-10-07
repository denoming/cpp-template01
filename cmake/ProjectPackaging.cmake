# Set default packaging install prefix path
if (CMAKE_INSTALL_PREFIX_INITIALIZED_TO_DEFAULT)
    set(CPACK_PACKAGING_INSTALL_PREFIX ${CMAKE_INSTALL_PREFIX})
endif()

# Specify general information
set(CPACK_PACKAGE_NAME                  "Template01")
set(CPACK_PACKAGE_VENDOR                "DENOMING")
set(CPACK_PACKAGE_DESCRIPTION_SUMMARY   "Template01 project")
set(CPACK_PACKAGE_INSTALL_DIRECTORY     ${CPACK_PACKAGE_NAME})
set(CPACK_VERBATIM_VARIABLES            YES)

# Specify version information
set(CPACK_PACKAGE_VERSION_MAJOR ${PROJECT_VERSION_MAJOR})
set(CPACK_PACKAGE_VERSION_MINOR ${PROJECT_VERSION_MINOR})
set(CPACK_PACKAGE_VERSION_PATCH ${PROJECT_VERSION_PATCH})

# Includes additional files if they are exist
if(EXISTS "${PROJECT_SOURCE_DIR}/DESCRIPTION")
    set(CPACK_PACKAGE_DESCRIPTION_FILE ${PROJECT_SOURCE_DIR}/DESCRIPTION)
endif()
if(EXISTS "${PROJECT_SOURCE_DIR}/WELCOME")
    set(CPACK_RESOURCE_FILE_WELCOME "${PROJECT_SOURCE_DIR}/WELCOME")
endif()
if (EXISTS "${PROJECT_SOURCE_DIR}/LICENSE")
    set(CPACK_RESOURCE_FILE_LICENSE "${PROJECT_SOURCE_DIR}/LICENSE")
endif()
if (EXISTS "${PROJECT_SOURCE_DIR}/LICENSE")
    set(CPACK_RESOURCE_FILE_LICENSE "${PROJECT_SOURCE_DIR}/LICENSE")
endif()
if (EXISTS "${PROJECT_SOURCE_DIR}/README")
    set(CPACK_RESOURCE_FILE_README "${PROJECT_SOURCE_DIR}/README")
endif()
if (EXISTS "${PROJECT_SOURCE_DIR}/README.md")
    set(CPACK_RESOURCE_FILE_README "${PROJECT_SOURCE_DIR}/README.md")
endif()

# Specify default generators
if(WIN32)
    set(CPACK_GENERATOR ZIP WIX)
elseif(APPLE)
    set(CPACK_GENERATOR TGZ productbuild)
elseif(CMAKE_SYSTEM_NAME STREQUAL "Linux")
    set(CPACK_GENERATOR TGZ STGZ DEB)
else()
    set(CPACK_GENERATOR TGZ)
endif()

# Specify include file with generator specific overrides
set(CPACK_PROJECT_CONFIG_FILE "${PROJECT_SOURCE_DIR}/config/misc/cpackGeneratorOverrides.cmake")

include(CPack)

# Define additional information for single exists component
cpack_add_component(MyApp_Runtime
    DISPLAY_NAME Runtime
    DESCRIPTION "Plain binary application"
    REQUIRED
)
