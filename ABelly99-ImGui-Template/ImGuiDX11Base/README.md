# ImGui + Win32 + DirectX 11 base

Everything needed is in this folder. No downloads, no internet required.

## Requirements
- Windows 10/11
- Visual Studio 2019 or 2022 with the "Desktop development with C++" workload
  (this includes CMake), or a standalone CMake 3.20+ plus any MSVC toolchain

## Build and run

Option A - double-click `build.bat`.
It configures, builds a Release exe, and launches `build\Release\ImGuiApp.exe`.

Option B - Visual Studio: File > Open > Folder... and pick this folder.
Select `ImGuiApp.exe` as the startup item and press F5.

Option C - generate a normal .sln:
    cmake -S . -B build
    Then open build\ImGuiDX11Base.sln and press F5.

## Layout
    CMakeLists.txt   builds ImGui as a static lib, then the app
    build.bat        one-click build + run
    src/main.cpp     the application (add more .cpp files to add_executable in CMakeLists.txt)
    imgui/           Dear ImGui 1.93.1 WIP (master snapshot): core, imstb_*.h headers,
                     and only the Win32 + DX11 backends, plus LICENSE.txt

## Updating ImGui
Replace the files in `imgui/` (and `imgui/backends/`) with newer ones, then delete the `build` folder.
