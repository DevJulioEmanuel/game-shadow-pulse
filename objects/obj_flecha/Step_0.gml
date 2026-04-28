/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor


x += velocidade * direction_arrow;

if (place_meeting(x, y, obj_player)) {
    with (obj_player) {
        state_player = "death";
    } 
    instance_destroy();
}

if (x < -100 || x > room_width + 100) {
    instance_destroy();
}

trail_timer++;

if (trail_timer >= 3) {
    trail_timer = 0;

    var t = instance_create_layer(x, y, "maquinas", obj_trail_flecha);
    t.image_xscale = image_xscale;
    t.image_yscale = image_yscale;
}

y += sin(current_time * 0.02) * 0.5;


