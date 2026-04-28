if (dash_timer > 0) {
    // 1. O rastro do dash lá atrás
    var offset = -40 * dash_direction;
    draw_sprite_ext(
        sprite_index, image_index,
        x + offset, y,
        x_scale_visual, 1.5, // Trocado image_xscale/yscale
        0, make_color_rgb(255, 240, 80), 0.4
    );
 
    // 2. O boneco principal durante o dash (substitui o draw_self)
    draw_sprite_ext(
        sprite_index, image_index,
        x, y,
        x_scale_visual, 1.5, // Trocado
        0, c_white, 1.0
    );
 
    // 3. O brilho por cima (blendmode)
    gpu_set_blendmode(bm_add);
    draw_sprite_ext(
        sprite_index, image_index,
        x, y,
        x_scale_visual, 1.5, // Trocado
        0, c_white, 1.0  
    );
    gpu_set_blendmode(bm_normal);

} else {
    // 4. O boneco normal quando não está no dash (substitui o draw_self do else)
    draw_sprite_ext(
        sprite_index, image_index, 
        x, y, 
        x_scale_visual, 1.5, 
        0, c_white, 1
    );
}