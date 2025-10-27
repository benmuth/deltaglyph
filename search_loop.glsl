// Every corner pixel of an n-pixel grid checks its cell for a sentinel color, and sets itself to a
// sentinel color if found. This shader runs second.
void mainImage(out vec4 fragColor, in vec2 fragCoord) {
    vec4 sentinelColor = vec4(0.1, 0.3, 0.3, 0.7);

    vec2 coord = fragCoord / iResolution.xy;

    // sample a pixel from ghostty's pixel buffer
    vec4 color = texture(iChannel0, coord);

    fragColor = color;
    if (fragCoord.x > 20. && fragCoord.x < 40. && fragCoord.y < 20.) {
        fragColor = vec4(1.0, 1.0, 0.0, 1.0);
    }

    float gridStride = 10.0;

    // check for sentinel color value in a grid
    if (mod(fragCoord.x, gridStride) == 0.0 && mod(fragCoord.y, gridStride) == 0.0) {
        for (float i = 0.; i < gridStride; i += 1.0) {
            for (float j = 0.; j < gridStride; j += 1.0) {
                vec2 sampleCoord = vec2(fragCoord.x + i, fragCoord.y + j) / iResolution.xy;
                vec4 sampleColor = texture(iChannel0, sampleCoord);
                if (distance(sampleColor, sentinelColor) < 0.1) {
                    fragColor = sentinelColor;
                    return;
                }
            }
        }
    }
}
