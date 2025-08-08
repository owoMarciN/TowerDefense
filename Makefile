# Makefile for SDL3 Project on Windows (MinGW)

# Compiler settings
CXX := g++
CXXFLAGS := -std=c++20 -Wall -g
INCLUDES := -ID:/Aplikacje/SDL3/x86_64-w64-mingw32/include -I./include

# Linker settings
LDFLAGS := -LD:/Aplikacje/SDL3/x86_64-w64-mingw32/lib -lSDL3

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
	copy "D:\Aplikacje\SDL3\x86_64-w64-mingw32\bin\SDL3.dll" "$(BIN_DIR)\"

# Compile source files
$(BUILD_DIR)/%.o: $(SRC_DIR)/%.cpp
	$(CXX) $(CXXFLAGS) $(INCLUDES) -c $< -o $@

# Create directories
$(BIN_DIR):
	@if not exist "$(BIN_DIR)" mkdir "$(BIN_DIR)"

$(BUILD_DIR):
	@if not exist "$(BUILD_DIR)" mkdir "$(BUILD_DIR)"

# Clean up
clean:
	@if exist "$(BUILD_DIR)\*.o" del /Q "$(BUILD_DIR)\*.o"
	@if exist "$(BIN_DIR)\*.exe" del /Q "$(BIN_DIR)\*.exe"
	@if exist "$(BIN_DIR)\SDL3.dll" del /Q "$(BIN_DIR)\SDL3.dll"

.PHONY: all clean