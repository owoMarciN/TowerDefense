# Makefile for SDL3 Project on Windows (MinGW)

# Specify the SDL3 installation directory 
# (I'm using the sdl3-mingw64' release)

SDL3_PATH := D:/Aplikacje/SDL3/x86_64-w64-mingw32

# Compiler settings
CXX := g++
CXXFLAGS := -std=c++20 -Wall -g
INCLUDES := -I$(SDL3_PATH)/include -I./include

# Linker settings
LDFLAGS := -L$(SDL3_PATH)/lib -lSDL3

# Project structure
SRC_DIR := src
BIN_DIR := bin
BUILD_DIR := build
TARGET := $(BIN_DIR)/Game.exe

# Source files
SOURCES := $(wildcard $(SRC_DIR)/*.cpp)
OBJECTS := $(patsubst $(SRC_DIR)/%.cpp,$(BUILD_DIR)/%.o,$(SOURCES))

# Default rule
all: $(BUILD_DIR) $(BIN_DIR) $(TARGET)
	@echo Build complete.

# Link the executable
$(TARGET): $(OBJECTS)
	$(CXX) -o $@ $^ $(LDFLAGS)
	@copy "$(SDL3_PATH)\bin\SDL3.dll" "$(BIN_DIR)\" >NUL

# Compile source files
$(BUILD_DIR)/%.o: $(SRC_DIR)/%.cpp
	$(CXX) $(CXXFLAGS) $(INCLUDES) -c $< -o $@

# Create directories
$(BIN_DIR) $(BUILD_DIR):
	@if not exist "$@" mkdir "$@"

# Clean up
clean:
	@if exist "$(BUILD_DIR)" rmdir /S /Q "$(BUILD_DIR)"
	@if exist "$(BIN_DIR)\Game.exe" del /Q "$(BIN_DIR)\Game.exe"
	@if exist "$(BIN_DIR)\SDL3.dll" del /Q "$(BIN_DIR)\SDL3.dll"

.PHONY: all clean