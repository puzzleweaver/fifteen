#include <flutter/runtime_effect.glsl>

uniform vec2 uSize;
uniform float hue;
uniform float angle;

out vec4 fragColor;

vec3 func(vec3 c) {
    c = vec3(c.x - float(int(c.x)), c.y - float(int(c.y)), c.z - float(int(c.z)));
    return 1.5-abs(4.0*c - 2.5);
}
void main(void) {
    vec2 uv = FlutterFragCoord() / uSize;
    float angles = angle * 0.000001;
    float d = cos(100.0*dot(vec2(cos(angles), sin(angles)), uv-vec2(0.5, 0.5))) < 0.0 ? 0.8 : 1.2;
    vec3 col = func(hue + vec3(0, 0.33333, 0.666666))*d;
    fragColor = vec4(col, 1.0);
}