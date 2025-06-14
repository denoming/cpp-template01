include(FeatureSummary)

option(TEMPLATE01_ENABLE_TESTS "Enable testing" ON)
add_feature_info(
    ENABLE_TESTS TEMPLATE01_ENABLE_TESTS "Build project with tests"
)

option(TEMPLATE01_ENABLE_DOC "Enable building documentation" OFF)
add_feature_info(
    ENABLE_DOC TEMPLATE01_ENABLE_DOC "Build project documentation"
)

feature_summary(WHAT ALL)
