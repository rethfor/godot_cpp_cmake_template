# Godot C++ CMake Template

This is a template for a [Godot](https://godotengine.org/) project with a C++ [GDExtension](https://docs.godotengine.org/en/stable/tutorials/scripting/gdextension/index.html) built using [CMake](https://cmake.org/).

The primary goal of this template is to be minimal and free of cruft.

## Setup

```shell
git clone git@github.com:yehuthi/godot_cpp_cmake_template.git PROJECT_DIRECTORY
cd PROJECT_DIRECTORY
git submodule update --init --recursive
mkdir build
cd build
cmake ..
cmake --build .
```

The [`game`](./game/) directory contains your Godot project.

## Clean Up

To clean up the template:
- Remove [`src/gdexample.cpp`](./src/gdexample.cpp) and [its header](./src/gdexample.hpp), and its reference in [`src/register_types.cpp`](./src/register_types.cpp) (though you might want to use it first to test the build works)
- Find & Replace "godot_cpp_cmake_template" with your project name.
- Set [game/project.godot](./game/project.godot) `config/name` to your project name, or do it from the GUI at the top of Project Settings. 
- Replace this README file with your own.
