@echo off
setlocal
cd /d "%~dp0"

where cmake >nul 2>nul
if errorlevel 1 (
    echo CMake was not found. Install Visual Studio with the "Desktop development with C++"
    echo workload, or install CMake from https://cmake.org/download/
    pause
    exit /b 1
)

cmake -S . -B build
if errorlevel 1 ( echo Configure failed. & pause & exit /b 1 )

cmake --build build --config Release
if errorlevel 1 ( echo Build failed. & pause & exit /b 1 )

echo.
echo Built: build\Release\ImGuiApp.exe
start "" "build\Release\ImGuiApp.exe"
