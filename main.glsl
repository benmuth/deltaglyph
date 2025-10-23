float rand(float val, float seed) {
    return cos(val * sin(val * seed) * seed);
}

// this function happens for every pixel!
// this shader happens first
void mainImage(out vec4 fragColor, in vec2 fragCoord) {
    vec2 coord = vec2(fragCoord.x, fragCoord.y) / iResolution.xy;

    // sample a pixel from ghostty's pixel buffer
    vec4 color = texture(iChannel0, coord);

    // without this, behavior is unpredictable
    // sometimes nothing happens, something the whole window changes to a solid color
    fragColor = color;

    // helix's cursor isn't rendering as pure #FF00FFFF, so we try to match the actual shade here
    vec4 magenta = vec4(0.917, 0.2, 0.968, 1.0);

    float thickness = 10.;
    // periodicity frames
    int p_fs = 800;
    float length = 0.1;
    for (int i = 0; i < 10; ++i) {
        float vert_offset = 400 + i * 100;
        float hor_offset = (iFrame % p_fs) / float(p_fs) + (rand(i, i+3) - 0.5)*0.3;
        if (fragCoord.y > vert_offset && fragCoord.y < vert_offset + thickness && (coord.x < hor_offset && coord.x > hor_offset - length)) {
            if (distance(color, magenta) < 0.1) {
                fragColor = vec4(0.0, 0.0, 0.0, 1.0);
            } else {
                fragColor = vec4(1.0, 1.0, 0.0, 1.0);
            }
        }
    }

    if (fragCoord.x < 20. && fragCoord.y < 20.) {
        fragColor = vec4(1.0, 0.0, 0.0, 1.0);
    }
}
