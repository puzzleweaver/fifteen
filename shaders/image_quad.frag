#include <flutter/runtime_effect.glsl>

out vec4 fragColor;

uniform vec2 uSize;
// uniform vec4 hs;
// uniform vec4 ks;
// uniform vec4 xs;
// uniform vec4 ys;

// quadrilateral inputs
uniform vec2 H0, H1, H2, H3; // from
uniform vec2 X0, X1, X2, X3; // to

uniform sampler2D image;

float dot(vec2 a, vec2 b) {
    return a.x*b.x + a.y*b.y;
}
float wedge(vec2 a, vec2 b) {
    return a.x*b.y - a.y*b.x;
}

float alpha(vec2 x, vec2 p0, vec2 p1, vec2 p2, vec2 p3) {
    x = x - p0;
    p1 = p1 - p0;
    p2 = p2 - p0;
    p3 = p3 - p0;
    float r2r3 = wedge(p2, p1) - wedge(p3, p1),
          dXd3 = dot(x, p1) - dot(p3, p1),
          d2d3 = dot(p2, p1) - dot(p3, p1);
    float den = r2r3 * dXd3 / d2d3 + wedge(p3, p1);
    return wedge(x, p1) / den;
}

void main() {
    
    vec2 fragCoord = FlutterFragCoord();
    
    vec2 uv = (fragCoord) / uSize.xy;

    // vec2 H0 = vec2(hs.x, ks.x);
    // vec2 H1 = vec2(hs.y, ks.y);
    // vec2 H2 = vec2(hs.z, ks.z);
    // vec2 H3 = vec2(hs.w, ks.w);

    // vec2 X0 = vec2(xs.x, ys.x);
    // vec2 X1 = vec2(xs.y, ys.y);
    // vec2 X2 = vec2(xs.z, ys.z);
    // vec2 X3 = vec2(xs.w, ys.w);

    float alpha01 = alpha(uv, H0, H1, H2, H3),
          alpha12 = alpha(uv, H1, H2, H3, H0),
          alpha23 = 1.0 - alpha01,
          alpha30 = 1.0 - alpha12;

    vec2 np = alpha23*alpha12*X0 +
              alpha23*alpha30*X1 +
              alpha01*alpha30*X2 +
              alpha01*alpha12*X3;

    vec3 col = texture(image, np).xyz;

    // Output to screen
    fragColor = vec4(col, 1.0);

}