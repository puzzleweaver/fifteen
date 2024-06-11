#include <flutter/runtime_effect.glsl>

out vec4 fragColor;

uniform vec2 uSize; // size of the screen
uniform float iTime;

uniform sampler2D image;

void main() {
    
    vec2 fragCoord = FlutterFragCoord();
    
    vec2 uv = (fragCoord) / uSize.xy;

    uv = uv - vec2(0.5, 0.5);
    uv = uv * cos(iTime) + vec2(-uv.y, uv.x) * sin(iTime);
    uv = uv + vec2(0.5, 0.5);

    vec3 col = texture(image, uv).xyz;

    // Output to screen
    fragColor = vec4(col, 1.0);

}