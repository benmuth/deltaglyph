// this function happens for every pixel!
void mainImage(out vec4 fragColor, in vec2 fragCoord) {
    // sample from ghostty's pixel buffer
    vec4 pixel_buffer = texture(iChannel0, fragCoord.xy / iResolution.xy);

    if (fragCoord.x < 20. && fragCoord.y < 20.) {
        fragColor = vec4(1.0, 0.0, 0.0, 1.0);
    } else {
        // without this, behavior is unpredictable
        // sometimes nothing happens, something the whole screen turns red
        fragColor = pixel_buffer;
    }

}
