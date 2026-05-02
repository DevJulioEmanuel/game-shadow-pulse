// === ROOM START EVENT ===
show_debug_message("ROOM START | room=" + string(room) + " | room_name=" + string(room_get_name(room)) + " | estado=" + string(estado) + " | proxima_room=" + string(proxima_room));
show_debug_message("ROOM START | proxima_room antes=" + string(proxima_room));

if (estado == "trocando") {
    estado = "abrindo";
    raio = 0;
    // Atualiza o alvo para a posição do player na nova room
    if (instance_exists(obj_player)) {
        alvo_x = obj_player.x;
        alvo_y = obj_player.y - 16;
    }
}

if (surface_exists(global.trans_surface)) {
    surface_free(global.trans_surface);
}
global.trans_surface = -1;