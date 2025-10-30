# DeltaGlyph

A bullet hell game that runs as a shader overlay on top of your text editor.

## Overview

This is an experiment to see if we can make a game just out of shaders and the uniforms that Ghostty provides us. The game renders on top of any text editor running in the terminal.

## How It Works

The game uses a multi-pass shader pipeline that reads from Ghostty's pixel buffer to detect collisions between game elements and editor content.

## Plans

- render projectiles on semi-random paths parametrized by time
- try to store state using iTimeDelta (time since last frame)
- use fork of Ghostty that adds access to the previous pixel buffer

## Getting Started

### Prerequisites

- Zig compiler (0.15.2 or compatible)
- Text editor that renders a magenta (#FF00FF) cursor (tested with Helix)

### Building Ghostty

```bash
cd ghostty
zig build -Doptimize=ReleaseFast
```

### Running the Game

1. Configure Ghostty to use the shader files in sequence
2. Launch your text editor
3. The game will render overtop of your editor
4. Move your cursor to dodge the projectiles

## Current Status

This is a work in progress. Right now I'm working on:
- Basic projectile rendering and animation
- Cursor collision detection
- Visual feedback system

