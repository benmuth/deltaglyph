// Check a 100 pixel grid 
// This shader runs second
void mainImage(out vec4 fragColor, in vec2 fragCoord) {
    vec4 sentinelColor = vec4(0.1, 0.3, 0.3, 0.7);

    // check for sentinel color value
    if (fragCoord.x % 100 == 0 && fragCoord.y % 100 == 0) {
        for (int i = 0; i < 100; ++i) {
            for (int j = 0; j < 100; ++j) {
                vec4 sample_color = texture(iChannel0, vec2(fragCoord.x + i, fragCoord.y + j))
                if (distance(sample_color, sentinelColor) < 0.1) {
                    fragColor = sentinelColor;
                }
            }
        }
    }
}
