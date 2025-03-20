cmake_minimum_required(VERSION 3.16)

project(godot_cpp_cmake_template VERSION 1.0 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

add_subdirectory(../godot_cpp_cmaker build)

file(GLOB SOURCES "src/*.cpp")
add_library(godot_cpp_cmake_template SHARED ${SOURCES})

gdextension(godot_cpp_cmake_template)