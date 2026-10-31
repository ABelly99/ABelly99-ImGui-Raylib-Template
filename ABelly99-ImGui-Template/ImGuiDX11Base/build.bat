@echo off
setlocal
cd /d "%~dp0"

where cmake >nul 2>nul
if errorlevel 1 (
    echo CMake was not found. Install "Visual Studio" with the "Desktop development with C++" workload,
    echo or install CMake from https://cmake.org/download/ and run this again.
    pause
    exit /b 1
)

cmake -S . -B build
if errorlevel 1 (
    echo Configure failed. See the messages above.
    pause
    exit /b 1
)

cmake --build build --config Release
if errorlevel 1 (
    echo Build failed. See the messages above.
    pause
    exit /b 1
)

echo.
echo Built: build\Release\ImGuiApp.exe
start "" "build\Release\ImGuiApp.exe"
