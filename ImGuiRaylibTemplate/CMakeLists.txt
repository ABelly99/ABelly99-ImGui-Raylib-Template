cmake_minimum_required(VERSION 3.20)
project(ImGuiRaylibTemplate LANGUAGES C CXX)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)

include(FetchContent)
if(POLICY CMP0135)
    cmake_policy(SET CMP0135 NEW)
endif()

# ---------------------------------------------------------------------------
# raylib 5.5 - downloaded automatically on first configure (needs internet once)
# ---------------------------------------------------------------------------
set(BUILD_EXAMPLES OFF CACHE BOOL "" FORCE)
set(BUILD_GAMES    OFF CACHE BOOL "" FORCE)

FetchContent_Declare(
    raylib
    URL https://github.com/raysan5/raylib/archive/refs/tags/5.5.zip
)
FetchContent_MakeAvailable(raylib)

# ---------------------------------------------------------------------------
# rlImGui - the raylib <-> Dear ImGui glue. Downloaded on first configure.
# It is not a CMake project, so it is populated and compiled by hand below.
# ---------------------------------------------------------------------------
FetchContent_Declare(
    rlimgui
    URL https://github.com/raylib-extras/rlImGui/archive/refs/heads/main.zip
)
FetchContent_GetProperties(rlimgui)
if(NOT rlimgui_POPULATED)
    FetchContent_Populate(rlimgui)
endif()

# ---------------------------------------------------------------------------
# Dear ImGui - bundled in ./imgui (core only, no backends)
# ---------------------------------------------------------------------------
set(IMGUI_DIR ${CMAKE_CURRENT_SOURCE_DIR}/imgui)
if(NOT EXISTS ${IMGUI_DIR}/imgui.cpp)
    message(FATAL_ERROR "ImGui not found at ${IMGUI_DIR}. Keep the 'imgui' folder next to CMakeLists.txt.")
endif()

add_library(imgui STATIC
    ${IMGUI_DIR}/imgui.cpp
    ${IMGUI_DIR}/imgui_draw.cpp
    ${IMGUI_DIR}/imgui_tables.cpp
    ${IMGUI_DIR}/imgui_widgets.cpp
    ${IMGUI_DIR}/imgui_demo.cpp
)
target_include_directories(imgui PUBLIC ${IMGUI_DIR})

# ---------------------------------------------------------------------------
# rlImGui glue library
# ---------------------------------------------------------------------------
add_library(rlimgui STATIC ${rlimgui_SOURCE_DIR}/rlImGui.cpp)
target_include_directories(rlimgui PUBLIC ${rlimgui_SOURCE_DIR})
target_link_libraries(rlimgui PUBLIC imgui raylib)

# ---------------------------------------------------------------------------
# Your app. Plain console-style entry point (int main), so no subsystem setup.
# ---------------------------------------------------------------------------
add_executable(ImGuiApp src/main.cpp)
target_link_libraries(ImGuiApp PRIVATE rlimgui)

# Keep the working directory at the project root so "assets/..." paths work
set_target_properties(ImGuiApp PROPERTIES
    VS_DEBUGGER_WORKING_DIRECTORY "${CMAKE_CURRENT_SOURCE_DIR}"
)
