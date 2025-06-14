add_executable(Template01-tests "")

set_target_properties(Template01-tests
    PROPERTIES
        OUTPUT_NAME my-app-unit-tests
)

target_sources(Template01-tests
    PRIVATE ${CMAKE_CURRENT_LIST_DIR}/src/test.cpp
)

target_link_libraries(
        Template01-tests
    PRIVATE GTest::gtest_main GTest::gmock_main
)

if (NOT CMAKE_CROSSCOMPILING)
    gtest_discover_tests(Template01-tests TEST_LIST testList)
    set_property(
        DIRECTORY APPEND
        PROPERTY TEST_INCLUDE_FILES ${CMAKE_CURRENT_LIST_DIR}/setTestsOptions.cmake
    )
endif()

