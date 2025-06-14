set(DOXYGEN_CFG_IN ${PROJECT_SOURCE_DIR}/doc/Doxyfile.in)
set(DOXYGEN_CFG_OUT ${CMAKE_CURRENT_BINARY_DIR}/Doxyfile)
set(DOXYGEN_LAY_IN ${PROJECT_SOURCE_DIR}/doc/DoxygenLayout.xml.in)
set(DOXYGEN_LAY_OUT ${CMAKE_CURRENT_BINARY_DIR}/DoxygenLayout.xml)

configure_file(${DOXYGEN_CFG_IN} ${DOXYGEN_CFG_OUT} @ONLY)
configure_file(${DOXYGEN_LAY_IN} ${DOXYGEN_LAY_OUT} @ONLY)

# Search for PlantUML
find_program(PLANT_UML_PATH
        NAMES plantuml plantuml.jar
        PATHS /usr/bin /usr/local/bin /usr/share /usr/local/share)
if(NOT PLANT_UML_PATH)
    message(WARNING "PlantUML has not been found")
endif()

# Search for Dot (Graphviz)
find_program(DOT_PATH
        NAMES dot
        PATHS /usr/bin/dot /usr/local/bin)
if(NOT DOT_PATH)
    message(WARNING "Dot (Graphviz) has not been found")
endif()

add_custom_target(novums-doc ALL
    COMMAND ${DOXYGEN_EXECUTABLE} ${DOXYGEN_OUT}
    COMMAND cmake -E copy_directory ${CMAKE_CURRENT_BINARY_DIR}/html ${TEMPLATE01_STAGING_DIR}/doc
    WORKING_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}
    COMMENT "Generating Documentation"
    VERBATIM)
