include(GNUInstallDirs)

add_executable(Template01-main "")
add_executable(Template01::Main ALIAS Template01-main)

set_target_properties(Template01-main
    PROPERTIES
        OUTPUT_NAME main
)

target_sources(Template01-main
    PRIVATE
        main.cpp
)

target_compile_features(Template01-main PRIVATE cxx_std_20)

install(
    TARGETS Template01-main
    COMPONENT Template01_Runtime
)
