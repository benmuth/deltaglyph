
void mainImage(out vec4 fragColor, in vec2 fragCoord) {
    vec4 sentinelColor = vec4(0.1, 0.3, 0.3, 0.7);
    if (fragColor.x == 0 && fragColor.y == 0) {
        for (int i = 0; i < iResolution.x; i += 100) {
            for (int j = 0; j < iResolution.y; j += 100) {
                vec4 sample_color = texture(iChannel0, vec2(i, j));
                if (distance(sample_color, sentinelColor) < 0.1) {
                    fragColor = sentinelColor;
                    return;
                }
            }
        }
    }
}

