// The pixel at 0,0 looks at the corners of a 100 pixel grid for a sentinel color.
void mainImage(out vec4 fragColor, in vec2 fragCoord) {
    vec4 sentinelColor = vec4(0.1, 0.3, 0.3, 0.7);

    vec2 coord = fragCoord / iResolution.xy;

    // sample a pixel from ghostty's pixel buffer
    vec4 color = texture(iChannel0, coord);

    fragColor = color;
    if (fragCoord.x > 40. && fragCoord.x < 60. && fragCoord.y < 20.) {
        fragColor = vec4(0.0, 1.0, 0.0, 1.0);
    }

    if (fragColor.x == 0 && fragColor.y == 0) {
        for (float i = 0; i < iResolution.x; i += 100.) {
            for (float j = 0; j < iResolution.y; j += 100.) {
                vec2 sampleCoord = vec2(i, j) / iResolution.xy;
                vec4 sampleColor = texture(iChannel0, sampleCoord);
                if (distance(sampleColor, sentinelColor) < 0.1) {
                    fragColor = sentinelColor;
                    return;
                }
            }
        }
    }
}

