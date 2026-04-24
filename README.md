# NES Raycaster

A real-time raycasting-style renderer implemented in 6502 assembly for the Nintendo Entertainment System (NES).

[![Watch Demo](https://img.youtube.com/vi/KcOneF-dLfc/0.jpg)](https://www.youtube.com/watch?v=KcOneF-dLfc)

## Overview

This project explores rendering 3D-like environments on NES hardware using a raycasting approach adapted to the platform’s constraints.

The renderer computes wall slice geometry per column and reconstructs textured output using a transition-based fill method (XOR filling) instead of traditional per-pixel sampling.

---

## Features

* Real-time raycasting-style wall rendering
* ~80×88 software resolution (rendered as ~160×88 using double-width pixels)
* ~12 FPS on hardware
* Single 4-color palette
* Fixed-point math using lookup tables (including reciprocals)
* Jump-table-based dispatch for performance-critical routines
* Offline-generated rendering code for wall textures

---

## Raycasting Pipeline

Each screen column corresponds to a ray cast into the scene.

- **Angle specialization** -
  All ray angles (0–359°) are represented by pre-generated, angle-specific routines.
  A jump table is used to dispatch directly to the correct implementation for a given ray.
- **Grid traversal (DDA)** -
  Rays use a Digital Differential Analyzer (DDA) approach to efficiently step through the world grid and detect wall intersections.
- **Distance calculation + correction** -
  The raw ray length is computed in fixed-point and then fisheye-corrected to produce a perpendicular distance to the wall.
- **Projection** -
  The corrected distance determines the height of the wall slice for that column.
- **Texture rendering** -
  The appropriate texture slice is selected and scaled based on distance, then rendered using the transition/XOR-based fill approach.

This pipeline trades code size and preprocessing for reduced per-frame computation.

## Graphics / CHR-RAM Approach

This engine uses CHR RAM and performs all rendering by dynamically updating tile data.

- The background (nametable) is fixed to a 22×11 grid centered on the screen
- Tiles $00–$E6 are reserved for rendering output
- Each frame, CHR data for these tiles is updated directly to represent the current view

Rather than modifying the nametable or reusing generic tiles, the renderer:

- Treats tiles as a framebuffer-like output surface
- Writes pixel data directly into CHR RAM
- Keeps the nametable static

This differs from many other NES raycasting demos, which:

- Reuse a small set of tiles
- Update the background via nametable changes

Here, all visual changes occur through **dynamic CHR updates**, enabling higher apparent resolution and more flexible per-column rendering.

## Rendering Approach

Wall slices are not stored or processed as full pixel columns. Instead:

Texture slices are not stored as full pixel columns. Instead:

* Each slice encodes the **Y positions where color changes occur**
* These transitions are written as boundary values
* A **cumulative XOR fill pass** reconstructs the final column

This avoids per-pixel texture sampling and reduces runtime work at the cost of preprocessing and code size.

---

## Tooling

The `tools/` directory includes **wall_creator**, a VB.NET utility used to generate wall rendering code.

Typical workflow:

1. Create a 16×16 texture using a `.chr` editor (edit `wall_textures.chr` for simplicity)
2. Load the `.chr` file in `wall_creator` and click "Extract Walls" 
3. Navigate to the given texture with the `>` button.
4. Copy/paste the assembly output into the corresponding texture file under `code/mode0/textures` (e.g. Texture ID 2 code goes into `texture2.asm`)
5. Note that adding textures beyond `texture8` requires creating a new file and importing it within `code/mode0/textures.asm`
6. Open `data/levels/test_level.asm` and edit the `TestRoom` definition to edit the scene. Each byte represents the texture ID of a wall.
7. Note that the room must be surrounded by non `$00` walls. If you would like a wall representing empty space on the outer perimeter, a new featureless wall must be created for it.
8. Build the ROM using `build.bat`

---

## Tradeoffs

This implementation prioritizes **spatial resolution over frame rate and color complexity**:

* Higher horizontal resolution than typical NES raycasting demos
* Lower frame rate (~12 FPS)
* Limited palette usage

Other implementations often reduce resolution to improve performance or expand color usage.

---

## Project Structure

```text id="v4xk1r"
code/   - Core renderer logic and generated drawing routines
data/   - Lookup tables and supporting data
tools/  - Development utilities (e.g., wall_creator)
```

Some texture data resides in `code/` because it is compiled into executable drawing routines rather than stored as raw data.

---

## Notes

* Parts of the renderer are generated and intentionally dense
* Includes experimental object rendering code that is currently disabled
* Code structure reflects the original development workflow with minimal refactoring

---

## Build

This project uses **WLA-DX v9.3** as the assembler.

The required Windows binaries are included in the repository.

### Windows

Run:

```bat
build.bat
```

### Notes

* Newer versions of WLA-DX are not syntax-compatible
* The build script assumes the included toolchain and relative paths

---
