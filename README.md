# Godot C++ CMake Template ⚙️🎮

A **minimal**, no-cruft template for creating a [Godot](https://godotengine.org/) project paired with a C++ [GDExtension](https://docs.godotengine.org/en/stable/tutorials/scripting/gdextension/index.html), built using [CMake](https://cmake.org/).

## ✨ Features

- 🧼 Clean and minimal
- 🛠️ Single-command setup for quick start
- 🌍 Cross-platform (tested on 🪟 Windows, 🐧 Linux, and 🍎 macOS)
- 🧩 [VSCode Snippets](#-vscode-snippets) for Godot boilerplate

## 🚀 Getting Started

```sh
git clone git@github.com:yehuthi/godot_cpp_cmake_template.git PROJECT_DIRECTORY
```
On **🪟 Windows**: run [`init.ps1`](init.ps1)  
On **🐧 Linux** and **🍎 macOS**: run [`./init`](./init)

> [!TIP]
> The `init` script has no magic in it, it will simply ask you for a project name, get an initial build going, and do some clean-up.

📁 The Godot project lives in  [`game`](./game/), and the GDExtension source files live in [`src`](./src/).

### 👷 Manual Setup

```shell
git clone git@github.com:yehuthi/godot_cpp_cmake_template.git PROJECT_DIRECTORY
cd PROJECT_DIRECTORY
git submodule update --init --recursive
mkdir build
cd build
cmake ..
cmake --build .
```

And then to clean up:
- 🗑️ Remove [`src/gdexample.cpp`](./src/gdexample.cpp), its header [`src/gdexample.hpp`](./src/gdexample.hpp), and its reference inside [`src/register_types.cpp`](./src/register_types.cpp) (though you might want to use it first to test the build works).
- 🔍 Find & Replace `godot_cpp_cmake_template` with your project name.
- 📝 Replace this README file with your own.

## 🧩 VSCode Snippets

Although the goal of this template is to be minimal, it includes VSCode snippets<sup>\*</sup>.
The rationale is that deleting a top-level directory ([`.vscode`](./.vscode)) is easy and fast, and the value of good snippets in a Godot project is great, as there is a lot of ritualistic boilerplate that has nothing to do with your project, and everything to do with data plumbing between your GDExtension and the Godot Engine.

All snippets start with `gd`, so you can simply begin to type it in a C++ file to explore your options, but here's an overview:
- `gdclass`: creates a class declaration (place in `.hpp`).
  - `gdclass_impl`: implements `gdclass` methods (place in `.cpp`).
  - `gdregister`: registers your class (place in `register_types.cpp`'s `initialize_gdextension_module`).
- `gdprop`: creates a property declaration (place in `.hpp`).
  - `gdprop_impl`: implements `gdprop` declarations (place in `.cpp`).
  - `gdprop_register`: registers a property (place in `_bind_methods` in `.cpp`).
- `gdmethod`: registers a method  (place in `_bind_methods` in `.cpp`).

<hr/>

<sup>\*</sup> In the future it will be a toggle in the init script.

## 🙏 Credits

Big thanks to [mieko](https://github.com/mieko) for testing on 🍎 macOS.
