// this function happens for every pixel!
void mainImage(out vec4 fragColor, in vec2 fragCoord) {
    vec2 right_coord = vec2(fragCoord.x + 1, fragCoord.y) / iResolution.xy;
    vec4 right_color = texture(iChannel0, right_coord);

    // sample a pixel from ghostty's pixel buffer
    vec4 pixel_color = texture(iChannel0, fragCoord.xy / iResolution.xy);
    // without this, behavior is unpredictable
    // sometimes nothing happens, something the whole window changes to a solid color
    fragColor = pixel_color;

   vec4 magenta = vec4(0.0, 1.0, 0.0, 1.0);

    if (fragCoord.y > 400 && fragCoord.y < 401 && (fragCoord.x / iResolution.x < ((iFrame % 800) / 800.))) {
        // check for collision with the cursor to the right
        if (length(right_color - magenta) < 0.1) {
            fragColor = vec4(0.0, 0.0, 1.0, 1.0);
        } else {
            fragColor = vec4(1.0, 1.0, 0.0, 1.0);
        }
    }

    if (fragCoord.x < 20. && fragCoord.y < 20.) {
        fragColor = vec4(0.0, 0.0, 1.0, 1.0);
    }
}
