float distanceField(vec3 pos, float time) {
    vec3 p = pos;
    
    // Apply rotations using rotation matrices
    // First rotation around one axis
    mat2 rotation1 = mat2(cos(ROTATION_OFFSET + time * ROTATION_SPEED_1));
    p.xz *= rotation1;
    
    // Second rotation around another axis  
    mat2 rotation2 = mat2(cos(ROTATION_OFFSET + time * ROTATION_SPEED_2));
    p.xy *= rotation2;
    
    // Complex distance field calculation
    // This creates some kind of organic, flowing shape
    float dist = length(p + sin(time * WAVE_TIME_SCALE) * SIN_AMPLITUDE) * log(length(p) + 1.0) * FIELD_BASE_SCALE;
    
    // Add more complexity with nested sin functions
    vec3 offset = p * POSITION_MULTIPLIER + time * TIME_MULTIPLIER;
    float wave1 = sin(offset.y + offset.z);
    float wave2 = sin(wave1 + offset.x);
    
    dist += wave2 * WAVE_AMPLITUDE + FIELD_OFFSET;
    
    return dist;
}

void mainImage(out vec4 fragColor, vec2 fragCoord) {
  vec3 rayOrigin, rayPos, colorAccumulator;
  vec3 resolution = iResolution;
  float time = iTime * TIME_MULTIPLIER;
  
  // Initialize ray marching loop
  for (float marchDistance = MARCH_START_DISTANCE, rayDistance; 
    resolution.z++ < MAX_ITERATIONS; // Loop MAX_ITERATIONS times (using resolution.z as counter)
    
    // Color accumulation and output
    fragColor.xyz = colorAccumulator = max(colorAccumulator + COLOR_INTENSITY - rayDistance * COLOR_DISTANCE_SCALE, colorAccumulator)
                  * (COLOR_BASE - COLOR_CONTRAST * (distanceField(rayPos, time) - rayDistance) / COLOR_BLEND_FACTOR)
    ) {
    
    // Set up ray origin and position
    rayPos = rayOrigin = vec3((fragCoord - 0.8 * resolution.xy) / resolution.y * marchDistance, 
                              CAMERA_DISTANCE - marchDistance);
    
    // March the ray forward
    marchDistance += min(rayDistance = distanceField(rayPos, time), RAY_STEP_SIZE);
    
    // Slight offset for next iteration
    rayPos = rayOrigin + RAY_OFFSET;
  }
}

