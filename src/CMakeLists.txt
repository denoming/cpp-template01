include(GNUInstallDirs)

set(TARGET MyApp)

add_executable(${TARGET} "")
add_executable(My::App ALIAS ${TARGET})

set_target_properties(${TARGET}
    PROPERTIES
        OUTPUT_NAME my-app
)

target_sources(${TARGET}
    PRIVATE
        main.cpp
)

target_compile_features(${TARGET} PRIVATE cxx_std_20)

install(
    TARGETS ${TARGET}
    COMPONENT MyAppRuntime
)
