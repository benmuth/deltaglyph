// this function happens for every pixel!
void mainImage(out vec4 fragColor, in vec2 fragCoord) {
    vec2 top_coord = vec2(fragCoord.x, fragCoord.y) / iResolution.xy;
    vec4 top_color = texture(iChannel0, top_coord);

    // sample a pixel from ghostty's pixel buffer
    vec4 pixel_color = texture(iChannel0, fragCoord.xy / iResolution.xy);
    // without this, behavior is unpredictable
    // sometimes nothing happens, something the whole window changes to a solid color
    fragColor = pixel_color;

    // helix's cursor isn't rendering as pure #FF00FFFF, so we try to match the actual shade here
    vec4 magenta = vec4(0.917, 0.2, 0.968, 1.0);
    if (fragCoord.y > 400 && fragCoord.y < 410 && (fragCoord.x / iResolution.x < ((iFrame % 800) / 800.))) {
        if (distance(top_color, magenta) < 0.1) {
            fragColor = vec4(0.0, 0.0, 0.0, 1.0);
        } else {
            fragColor = vec4(1.0, 1.0, 0.0, 1.0);
        }
    }
    if (fragCoord.x < 20. && fragCoord.y < 20.) {
        fragColor = vec4(1.0, 0.0, 0.0, 1.0);
    }
}
