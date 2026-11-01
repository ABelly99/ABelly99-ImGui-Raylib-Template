// main.cpp - raylib window with a Dear ImGui overlay (via rlImGui)
#include "raylib.h"
#include "imgui.h"
#include "rlImGui.h"

int main()
{
    InitWindow(1280, 720, "raylib + Dear ImGui");
    SetTargetFPS(60);

    rlImGuiSetup(true); // dark style

    bool showDemo = false;

    while (!WindowShouldClose())
    {
        BeginDrawing();
        ClearBackground(Color{ 20, 20, 25, 255 });

        DrawText("raylib is drawing this text", 20, 20, 20, RAYWHITE);

        rlImGuiBegin();

        ImGui::Begin("Hello");
        ImGui::Text("ImGui is running on top of raylib.");
        ImGui::Text("FPS: %d", GetFPS());
        ImGui::Checkbox("Show ImGui demo window", &showDemo);
        ImGui::End();

        if (showDemo)
            ImGui::ShowDemoWindow(&showDemo);

        rlImGuiEnd();

        EndDrawing();
    }

    rlImGuiShutdown();
    CloseWindow();
    return 0;
}
