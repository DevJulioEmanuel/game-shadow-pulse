
var t = instance_find(obj_transition, 0);


if (t.travado) exit;


if (place_meeting(x, y, obj_player)) {

    t.travado = true; 
    
    t.estado = "fechando";
    t.alvo_x = obj_player.x;
    t.alvo_y = obj_player.y;
    t.proxima_room = proxima_room; 
} 