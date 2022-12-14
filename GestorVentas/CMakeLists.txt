cmake_minimum_required(VERSION 3.16)

project(GestorVentas VERSION 0.1 LANGUAGES CXX)

set(CMAKE_INCLUDE_CURRENT_DIR ON)

set(CMAKE_AUTOUIC ON)
set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 6.2 COMPONENTS Quick REQUIRED)

qt_add_executable(appGestorVentas
    main.cpp
    provisorimagenes.h provisorimagenes.cpp
)

qt_add_qml_module(appGestorVentas
    URI GestorVentas
    VERSION 1.0
    QML_FILES main.qml
    QML_FILES Boton.qml
    QML_FILES CampoInput.qml
    QML_FILES Calendario.qml
)

set_target_properties(appGestorVentas PROPERTIES
    MACOSX_BUNDLE_GUI_IDENTIFIER my.example.com
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_link_libraries(appGestorVentas
    PRIVATE Qt6::Quick)

install(TARGETS appGestorVentas
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR})
