// =====================================
// TEXTO VIDA
// =====================================

draw_text(x, y + 5, string(life_player));


// =====================================
// EFEITO HIT
// =====================================

var alpha_player = 1;
var color_player = c_white;

if (state_player == "hit")
{
    if (hit_timer mod 4 < 2)
    {
        alpha_player = 0.3;
    }

    color_player = c_red;
}


// =====================================
// DASH
// =====================================

if (dash_timer > 0)
{
    // Rastro
    var offset = -40 * dash_direction;

    draw_sprite_ext(
        sprite_index, image_index,
        x + offset, y,
        x_scale_visual, 1.5,
        0,
        make_color_rgb(255, 240, 80),
        0.4
    );

    // Brilho
    gpu_set_blendmode(bm_add);

    draw_sprite_ext(
        sprite_index, image_index,
        x, y,
        x_scale_visual, 1.5,
        0,
        c_white,
        1
    );

    gpu_set_blendmode(bm_normal);
}


// =====================================
// PLAYER PRINCIPAL
// =====================================

draw_sprite_ext(
    sprite_index,
    image_index,
    x,
    y,
    x_scale_visual,
    1.5,
    0,
    color_player,
    alpha_player
);


// =====================================
// RESET
// =====================================

draw_set_alpha(1);
draw_set_color(c_white);
gpu_set_blendmode(bm_normal);