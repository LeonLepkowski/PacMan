# Pac-Man Game Documentation

This document provides an overview of the Pac-Man game implementation written in OCaml using the Raylib library. The code is structured to handle game logic, rendering, and user input for a simplified version of the classic Pac-Man game.

---

## Table of Contents
1. [Overview](#1-overview)
2. [Game Components](#2-game-components)
   - [Map](#map)
   - [Pac-Man](#pac-man)
   - [Ghosts](#ghosts)
   - [Game State](#game-state)
3. [Game Logic](#3-game-logic)
   - [Movement](#movement)
   - [Collision Detection](#collision-detection)
   - [Ghost Behavior](#ghost-behavior)
4. [Rendering](#4-rendering)
   - [Map and Sweets](#map-and-sweets)
   - [Pac-Man and Ghosts](#pac-man-and-ghosts)
5. [Game Loop](#5-game-loop)
6. [Dependencies](#6-dependencies)
7. [How to Run](#7-how-to-run)

---

## 1. Overview

The game is a grid-based implementation of Pac-Man, where the player controls Pac-Man to collect sweets (dots and power pellets) while avoiding ghosts. The game includes:
- A predefined map with walls, dots, and power pellets.
- Pac-Man movement controlled by arrow keys.
- Four ghosts with different behaviors (random movement, chasing Pac-Man, or running away).
- Score tracking and game-over conditions.

---

## 2. Game Components

### Map
The game map is represented as a 2D array of integers:
- `0`: Empty space.
- `1`: Wall (non-walkable).
- `2`: Dot (collectible for points).
- `3`: Power pellet (activates boost mode).

The map is defined in the `map` variable, and its dimensions are used to calculate the screen size.

### Pac-Man
Pac-Man is represented by:
- Position (`pacman_x`, `pacman_y`).
- Current and next direction (`direction`, `next_direction`).
- Target cell for movement (`target_cell`).

Pac-Man's movement is grid-based, and it wraps around the screen when reaching the edges.

### Ghosts
Ghosts are represented by:
- Position (`x`, `y`).
- Direction (`direction`).
- Color and texture.

There are four ghosts, each with a unique starting position and color. Ghosts alternate between random movement and chasing Pac-Man based on a timer.

### Game State
The game state is managed by the `game_state` record, which includes:
- Pac-Man's position and direction.
- Ghosts' positions and behaviors.
- Score, boost status, and timers.
- Game-over flag.

---

## 3. Game Logic

### Movement
- **Pac-Man**: Moves based on user input (arrow keys). The direction is updated only when Pac-Man is aligned with the grid.
- **Ghosts**: Move randomly or chase Pac-Man based on the `ghost_behavior_timer`. In boost mode, ghosts run away from Pac-Man.

### Collision Detection
- Collisions are checked between Pac-Man and ghosts.
- If Pac-Man collides with a ghost:
  - In normal mode, the game ends.
  - In boost mode, the ghost is reset to its starting position.

### Ghost Behavior
- Ghosts alternate between two behaviors every 7 seconds:
  1. Random movement.
  2. Chasing Pac-Man.
- In boost mode, ghosts run away from Pac-Man.

---

## 4. Rendering

### Map and Sweets
- The map is drawn using rectangles for walls and circles for dots and power pellets.
- Dots are small white circles, and power pellets are larger yellow circles.

### Pac-Man and Ghosts
- Pac-Man is animated using four textures representing different mouth positions.
- Ghosts are drawn using their respective textures. In boost mode, a special "afraid" texture is used.

---

## 5. Game Loop

The game loop handles:
- User input for Pac-Man movement.
- Updating game state (Pac-Man and ghost positions, collisions, score, etc.).
- Rendering the map, Pac-Man, ghosts, and UI elements (score, game-over message).
- Frame rate control (60 FPS).

---

## 6. Dependencies

- **Raylib**: A simple and easy-to-use library for game development. Used for rendering, input handling, and window management.
- **OCaml**: The programming language used to implement the game.

---

## 7. How to Run

1. Install OCaml and Raylib bindings for OCaml.
2. Compile the code using:
```
ocamlfind ocamlopt -package raylib -linkpkg main.ml -o pacman
```
3. Run the executable:
```
./pacman
```
4. Use arrow keys to control Pac-Man.

---

## Code Structure

### Key Functions
- `draw_map`: Renders the game map.
- `draw_sweets`: Renders dots and power pellets.
- `move_pacman`: Updates Pac-Man's position based on input and grid alignment.
- `move_ghost`: Updates a ghost's position and direction.
- `check_collisions`: Detects collisions between Pac-Man and ghosts.
- `update_game_state`: Manages the overall game state.
- `game_loop`: Main loop handling rendering and updates.

### Variables
- `map`: The game map.
- `tile_size`: Size of each grid cell in pixels.
- `screen_width`, `screen_height`: Dimensions of the game window.
- `speed`: Movement speed of Pac-Man and ghosts.
- `time`: Duration of boost mode.

---
