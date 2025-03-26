# Godot C++ CMake Template ⚙️🎮

A **minimal**, no-cruft template for creating a [Godot](https://godotengine.org/) project paired with a C++ [GDExtension](https://docs.godotengine.org/en/stable/tutorials/scripting/gdextension/index.html), built using [CMake](https://cmake.org/).

## 🚀 Getting Started

```sh
git clone git@github.com:yehuthi/godot_cpp_cmake_template.git PROJECT_DIRECTORY
```
On **🪟 Windows**: enter the directory and run [`init.ps1`](init.ps1).  
On **🐧 Linux** and **🍎 macOS**: `cd` into the directory and run [`./init`](./init).

📁 The Godot project lives in  [`game`](./game/).

### Other

```shell
git clone git@github.com:yehuthi/godot_cpp_cmake_template.git PROJECT_DIRECTORY
cd PROJECT_DIRECTORY
git submodule update --init --recursive
mkdir build
cd build
cmake ..
cmake --build .
```

📁 The Godot project lives in  [`game`](./game/).

#### 🧹 Clean Up

To clean up the template:
- 🗑️ Remove [`src/gdexample.cpp`](./src/gdexample.cpp), its header [`src/gdexample.hpp`](./src/gdexample.hpp), and its reference inside [`src/register_types.cpp`](./src/register_types.cpp) (though you might want to use it first to test the build works).
- 🔍 Find & Replace `godot_cpp_cmake_template` with your project name.
- 📝 Replace this README file with your own.

## 🙏 Credits

Big thanks to [mieko](https://github.com/mieko) for helping on MacOS.
