// Check if the pixel at 0,0 is a sentinel color, and turn red if so.
// This shader runs last.
void mainImage(out vec4 fragColor, in vec2 fragCoord) {
    vec4 sentinelColor = vec4(0.1, 0.3, 0.3, 0.7);

    vec2 coord = fragCoord / iResolution.xy;

    // sample a pixel from ghostty's pixel buffer
    vec4 color = texture(iChannel0, coord);

    fragColor = color;

    vec4 sampleColor = texture(iChannel0, vec2(0., 0.));

    // turn the whole screen red if the color at 0,0 is the sentinel color
    if (distance(sentinelColor, sampleColor) < 0.1) {
        fragColor = vec4(1.0, 0.0, 0.0, 1.0);
    }

    if (fragCoord.x > 60. && fragCoord.x < 80. && fragCoord.y < 20.) {
        fragColor = vec4(0.0, 0.0, 1.0, 1.0);
    }
}
