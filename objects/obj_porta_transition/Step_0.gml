// === STEP EVENT DA PORTA ===
if (place_meeting(x, y, obj_player)) {
    var t = instance_find(obj_transition, 0);
    if (t != noone && t.estado == "none") {
        t.estado = "fechando";
        t.alvo_x = obj_player.x;
        t.alvo_y = obj_player.y;
        t.proxima_room = Room2;
    }
}