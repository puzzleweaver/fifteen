#include <flutter/runtime_effect.glsl>

out vec4 fragColor;

uniform vec2 uSize;
uniform vec2 H0, H1, H2, H3; // from
uniform vec2 X0, X1, X2, X3; // to
uniform sampler2D image;

vec2 normal(vec2 z) { return vec2(z.y, -z.x) / length(z); } 

float alpha(vec2 p, vec2 p0, vec2 p1, vec2 p2, vec2 p3) {
    vec2 n0 = normal(p0-p3), n2 = normal(p2-p1);
    return dot(p-p0, n0) / (dot(p-p0, n0) + dot(p-p2, n2));
}

vec2 quadTransform(vec2 p, vec2 p0, vec2 p1, vec2 p2, vec2 p3, vec2 q0, vec2 q1, vec2 q2, vec2 q3) {
    // coordinates from p_i:
    vec2 n0 = normal(p1-p0), n1 = normal(p2-p1), n2 = normal(p3-p2), n3 = normal(p0-p3);
    float u = dot(p-p3, n3) / (dot(p-p3, n3) + dot(p-p1, n1));
    float v = dot(p-p0, n0) / (dot(p-p0, n0) + dot(p-p2, n2));
    
    // reconstruct from q_i:
    n0 = normal(q1-q0);
    n1 = normal(q2-q1);
    n2 = normal(q3-q2);
    n3 = normal(q0-q3);
    vec2 A = (u-1)*n3 + u*n1;
    vec2 B = (v-1)*n0 + v*n2;
    float k = (u-1)*dot(q3, n3) + u*dot(q1, n1);
    float l = (v-1)*dot(q0, n0) + v*dot(q2, n2);
    float invdet = 1.0/(A.x*B.y - A.y*B.x);
    return invdet * vec2(B.y*k - A.y*l, -B.x*k + A.x*l);
}

void main() {
    
    vec2 fragCoord = FlutterFragCoord();
    vec2 uv = fragCoord / uSize.xy;

    vec2 np = quadTransform(uv, H0, H1, H2, H3, X0, X1, X2, X3);

    vec3 col = texture(image, np).xyz;

    // Output to screen
    fragColor = vec4(col, 1.0);

}