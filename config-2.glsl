// Configuration parameters based on manual tweaks
// Slower rotation with enhanced waves and adjusted colors

// === ANIMATION PARAMETERS ===
#define ROTATION_SPEED_1 0.4
#define ROTATION_SPEED_2 0.3
#define TIME_MULTIPLIER 0.5
#define WAVE_TIME_SCALE 0.4

// === DISTANCE FIELD PARAMETERS ===
#define FIELD_BASE_SCALE 1.0        
#define SIN_AMPLITUDE 1.0          
#define WAVE_AMPLITUDE 0.7
#define FIELD_OFFSET -2.0

// === RAY MARCHING PARAMETERS ===
#define MARCH_START_DISTANCE 1.5    
#define MAX_ITERATIONS 10.0         
#define RAY_STEP_SIZE 1.0           
#define RAY_OFFSET 0.1              
#define CAMERA_DISTANCE 7.0

// === COLOR PARAMETERS ===
#define COLOR_INTENSITY 0.7
#define COLOR_DISTANCE_SCALE 0.2
#define COLOR_BASE vec3(0.3, 0.4, 0.5)
#define COLOR_CONTRAST vec3(8, 5, 7)
#define COLOR_BLEND_FACTOR 6.0      

// === GEOMETRIC PARAMETERS ===
#define ROTATION_OFFSET vec4(0, 33, 55, 0)
#define POSITION_MULTIPLIER 2.0     