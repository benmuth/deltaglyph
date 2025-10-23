// runs last
void mainImage(out vec4 fragColor, in vec2 fragCoord) {
    vec4 sentinelColor = vec4(0.1, 0.3, 0.3, 0.7);

    vec4 sample_color = texture(iChannel0, vec2(0, 0))

    if (distance(sentinelColor, sample_color) < 0.1) {
        fragColor = vec4(1.0, 0.0, 0.0, 1.0);
    }
}
