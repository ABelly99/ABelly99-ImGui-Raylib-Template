cmake_minimum_required(VERSION 3.20)
project(ImGuiDX11Base LANGUAGES CXX)

if(NOT CMAKE_SYSTEM_NAME STREQUAL "Windows")
    message(FATAL_ERROR "This project uses Win32 + DirectX 11 and only builds on Windows.")
endif()

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# ---------------------------------------------------------------------------
# Dear ImGui (bundled in ./imgui, no download needed)
# Core + Win32 and DX11 backends. The imstb_*.h headers sit next to imgui.cpp
# and are picked up automatically through the include directory.
# ---------------------------------------------------------------------------
set(IMGUI_DIR ${CMAKE_CURRENT_SOURCE_DIR}/imgui)

if(NOT EXISTS ${IMGUI_DIR}/imgui.cpp)
    message(FATAL_ERROR "ImGui not found in ${IMGUI_DIR}. The 'imgui' folder must sit next to CMakeLists.txt.")
endif()

add_library(imgui STATIC
    ${IMGUI_DIR}/imgui.cpp
    ${IMGUI_DIR}/imgui_draw.cpp
    ${IMGUI_DIR}/imgui_tables.cpp
    ${IMGUI_DIR}/imgui_widgets.cpp
    ${IMGUI_DIR}/imgui_demo.cpp
    ${IMGUI_DIR}/backends/imgui_impl_win32.cpp
    ${IMGUI_DIR}/backends/imgui_impl_dx11.cpp
)
target_include_directories(imgui PUBLIC
    ${IMGUI_DIR}
    ${IMGUI_DIR}/backends
)
target_link_libraries(imgui PUBLIC d3d11 dxgi d3dcompiler dwmapi)
target_compile_options(imgui PRIVATE $<$<CXX_COMPILER_ID:MSVC>:/utf-8>)

# ---------------------------------------------------------------------------
# Your app. WIN32 = /SUBSYSTEM:WINDOWS, so _tWinMain works with no extra setup.
# ---------------------------------------------------------------------------
add_executable(ImGuiApp WIN32 src/main.cpp)
target_link_libraries(ImGuiApp PRIVATE imgui)

if(MSVC)
    # Press F5 in Visual Studio and it runs the app, not the imgui library
    set_property(DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR} PROPERTY VS_STARTUP_PROJECT ImGuiApp)
endif()
