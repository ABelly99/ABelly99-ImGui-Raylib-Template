# raylib + Dear ImGui template (Visual Studio / CMake)

A ready-to-use C++ starting point: a raylib window with a Dear ImGui overlay.

## Folder layout
```
ImGuiRaylibTemplate/
├── CMakeLists.txt     build script (downloads raylib + rlImGui, builds ImGui)
├── build.bat          optional one-click build from a command prompt
├── src/
│   └── main.cpp       your application code
├── assets/            put textures, fonts, sounds here (loaded as "assets/x.png")
└── imgui/             Dear ImGui 1.93.1 WIP core (MIT, see imgui/LICENSE.txt)
```

raylib 5.5 and rlImGui are NOT stored in this repo. CMake downloads them the first time you configure.

## Requirements
- Windows 10/11
- Visual Studio 2022 (or Insiders) with the **Desktop development with C++** workload.
  This includes MSVC, the Windows SDK and CMake.
- Internet access the first time you open or build the project.

## Use this as a template (GitHub)
1. Click **Use this template** on the repo page, or clone it:
   `git clone https://github.com/<you>/<repo>.git`
2. In Visual Studio: **File → Clone repository** (or **Open → Git repository**) and paste the URL.

To make your repo a template: **Settings → General → tick "Template repository"**.

## Build and run

**Visual Studio (recommended)**
1. **File → Open → Folder...** and select this folder.
2. Wait for CMake to configure (the status bar shows progress; the first time takes a minute or two).
3. In the toolbar, pick **ImGuiApp.exe** as the startup item.
4. Press **F5** (debug) or **Ctrl+F5** (run without debugger).

**Command line**
Double-click `build.bat`. It builds a Release exe and launches it.

## Adding your own code
- Put new `.cpp` files in `src/` and add them to `add_executable(ImGuiApp ...)` in `CMakeLists.txt`.
- Put assets in `assets/`. The debugger working directory is set to the project root, so `"assets/logo.png"` works.
- To change the raylib version, edit the tag `5.5` in `CMakeLists.txt`.

## Third-party code
- raylib 5.5: zlib licence (downloaded at build time)
- rlImGui: zlib licence (downloaded at build time)
- Dear ImGui: MIT licence (bundled in `imgui/`)
