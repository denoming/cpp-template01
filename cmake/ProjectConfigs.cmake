list(APPEND CMAKE_MODULE_PATH "${CMAKE_CURRENT_LIST_DIR}/modules")

include(BuildType)
include(BuildLocation)
include(BuildOptions)

if (TEMPLATE01_ENABLE_TESTS)
    enable_testing()
    include(AddGoogleTest)
    message(VERBOSE "Building with tests")
else()
    message(VERBOSE "Building without tests")
endif()
