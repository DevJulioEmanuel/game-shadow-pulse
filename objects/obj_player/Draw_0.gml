if (dash_timer > 0) {

    var offset = -40 * dash_direction;
    draw_sprite_ext(
        sprite_index, image_index,
        x + offset, y,
        image_xscale, image_yscale,
        0, make_color_rgb(0, 200, 255), 0.4

    );

  
    draw_self();

 
    gpu_set_blendmode(bm_add);
    draw_sprite_ext(
        sprite_index, image_index,
        x, y,
        image_xscale, image_yscale,
        0, c_white, 1.0  
    );
    gpu_set_blendmode(bm_normal);

} else {
    draw_self();
}