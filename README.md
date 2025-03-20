# Godot C++ CMake Template

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

The "game" directory contains your Godot project.

## Clean Up

To clean up the template:
- Remove [`src/gdexample.cpp`](./src/gdexample.cpp) and [its header](./src/gdexample.hpp), and its reference in [`src/register_types.cpp`](./src/register_types.cpp) (though you might want to use it first to test the build works)
- Find & Replace "godot_cpp_cmake_template" with your project name.
