#include <iostream>
#include <SDL3/SDL.h>
#include <SDL3/SDL_main.h>

const int WIDTH = 640;
const int HEIGHT = 480;

int main(int argc, char* argv[]) {

    SDL_Window *window;               
    bool done = false;

    SDL_Init(SDL_INIT_VIDEO);

    // Create an application window with the following settings:
    window = SDL_CreateWindow("An SDL3 window", WIDTH, HEIGHT, SDL_WINDOW_OPENGL);

    // Check that the window was successfully created
    if (window == NULL) {
        // In the case that the window could not be made...
        SDL_LogError(SDL_LOG_CATEGORY_ERROR, "Could not create window: %s\n", SDL_GetError());
        SDL_Quit();
        return 1;
    }

    while (!done) {
        SDL_Event event;

        while (SDL_PollEvent(&event)) {
            if (event.type == SDL_EVENT_QUIT) {
                done = true;
            }
        }
        // Do game logic, present a frame, etc.
    }

    SDL_DestroyWindow(window);
    SDL_Quit();
    return 0;
}