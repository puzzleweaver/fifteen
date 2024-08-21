#include <flutter/runtime_effect.glsl>

out vec4 fragColor;

uniform vec2 uSize;
uniform float bgIndex;
uniform vec2 H0, H1, H2, H3; // from
uniform vec2 X0, X1, X2, X3; // to
uniform sampler2D image;

float radius = 0.015;

vec3 background(vec2 c, int which) {
    float dim = 0.087979798;
    vec3 col1 = vec3(0.9, 0.9, 0.9), col2 = vec3(1.0, 1.0, 1.0);
    if(which == 0) { // vertical stripes
        if(mod(dot(c, vec2(0.95, 0.05)), dim*1.5) < dim*0.75)
            return col1;
        else return col2;
    } else if(which == 1) { // zig zags
        float dimp = dim*2.0;
        float x = c.x * (mod(c.x, dimp*2.0) < dimp ? -1.0 : 1.0);
        if(mod(c.y + x*0.5, dimp) < dimp/2.0)
            return col1;
        else return col2;
    } else if(which == 2) { // tesselated squares
        if(max(mod(c.x, dim*1.25), mod(c.y, dim*1.25)) < dim*0.75)
            return col1;
        else return col2;
    } else if(which == 3) { // checkers
        if((mod(c.x, dim*2.0) < dim) == (mod(c.y, dim*2.0) < dim)) return col1;
        else return col2;
    } else if(which == 4) { // squiggles
        if(mod(c.x + cos(c.y*20.0)/40.0, dim*1.5) < dim*0.75) return col1;
        else return col2;
    } else if(which == 5) { // circles
        float y22 = c.y - floor((c.x)/(dim*2.0))*dim*1.0;
        float xxx = mod(c.x, dim*2.0) - dim*1.0,
              yyy = mod(y22, dim*2.0) - dim*1.0;
        float ddd = sqrt(xxx*xxx + yyy*yyy);
        if(ddd > dim*0.25 && ddd < dim*0.9) return col1;
        else return col2;
    }
    return vec3(1.0, 0.0, 0.0);
}

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

// rounded tile
vec2 innerQuadPt(vec2 A, vec2 B, vec2 C, float r) {
    vec2 D = B-A, E = C-B,
         N = vec2(D.y, -D.x) / sqrt(dot(D, D)),
         M = vec2(E.y, -E.x) / sqrt(dot(E, E)),
         K = A - r*N,
         L = B - r*M;
    float s = (D.x*K.y + D.y*L.x - D.y*K.x - D.x*L.y) / (D.x*E.y - D.y*E.x);
    if(D.x*E.y == D.y*E.x) return B + r*N;
    else return L + E*s;
}
float sdPolygon(vec2 p, vec2 v0, vec2 v1, vec2 v2, vec2 v3) {
    // from Inigo Quilez. Love him <3
    vec2[] v = vec2[](v0, v1, v2, v3);
    float d = dot(p-v[0], p-v[0]);
    float s = 1.0;
    for(int i = 0, j = 3; i < 4; j = i, i++) {
        vec2 e = v[j] - v[i];
        vec2 w = p - v[i];
        vec2 b = w - e * clamp(dot(w, e) / dot(e, e), 0.0, 1.0);
        d = min(d, dot(b, b));
        bvec3 cond = bvec3(p.y >= v[i].y, p.y < v[j].y, e.x*w.y > e.y*w.x);
        if(all(cond) || all(not(cond))) s = -s;
    }
    return s*sqrt(d);
}
float roundedSDF(vec2 x, vec2 p0, vec2 p1, vec2 p2, vec2 p3) {
    vec2 np0 = innerQuadPt(p0, p1, p2, radius),
         np1 = innerQuadPt(p1, p2, p3, radius),
         np2 = innerQuadPt(p2, p3, p0, radius),
         np3 = innerQuadPt(p3, p0, p1, radius);
    return sdPolygon(x, np0, np1, np2, np3)-radius;
}
float smoothstep(float x) {
    if(x <= 0.0) return 0.0;
    if(x >= 1.0) return 1.0;
    return 3.0*x*x - 2.0*x*x*x;
}

void main() {
    
    vec2 fragCoord = FlutterFragCoord();
    vec2 uv = fragCoord / uSize.xy;

    vec2 np = quadTransform(uv, H0, H1, H2, H3, X0, X1, X2, X3);

    vec4 col = texture(image, np).xyzw;
    col.xyz = col.w*col.xyz + (1.0-col.w)*background(np, int(bgIndex));

    // float distFromShape = roundedSDF(uv, H0, H1, H2, H3);
    // if(distFromShape > 0.0) {
    //     col.xyz = vec3(0.0, 0.0, 0.0);
    // } 
    // // else { col *= smoothstep(0.1-distFromShape*256.0); }
    // else if(distFromShape > -0.00125) {
    //     col.xyz *= 0.0;
    // }

    // Output to screen
    fragColor = vec4(col.xyz, 1.0);

}