# SHADERS PACK Vol 1

A collection of procedural WebGL shaders created by Bartosz Makos featuring organic, flowing visual effects.

## Overview

This pack contains 6 different shader configurations that create mesmerizing animated visuals using ray marching and distance field techniques. Each configuration produces unique visual effects through different parameter combinations.

## Files

- **shader.glsl** - Main shader code implementing the distance field and ray marching algorithm
- **config-1.glsl to config-6.glsl** - Different parameter configurations for varied visual effects
- **index.html** - Example implementation that renders the shaders using shadertoy-renderer

## Usage

1. Open `index.html` in a web server (required for CORS when loading shader files)
  `python -m http.server`
  `php -S localhost:8000`
  `node -e "require('http').createServer((req, res) => res.end('')).listen(8000)"`
2. The page will automatically load and render the shader effect
3. Current configuration is set to `config-6.glsl` (can be changed in index.html line 22)

## Author

Created by Bartosz Makos