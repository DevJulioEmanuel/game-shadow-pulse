/// @description Movimentação e Colisão

// ─── COLISORES CENTRALIZADOS ───────────────────────────────────────────────
#macro SOLID_OBJECTS   [obj_colisao_solida]
#macro FALL_OBJECTS    [obj_plataforma_fall]
#macro MOVING_OBJECTS  [obj_plataforma_movel]

// Todos que bloqueiam movimento (sólidos + fall)
#macro BLOCK_H_OBJECTS [obj_colisao_solida, obj_plataforma_movel, obj_plataforma_fall]
#macro BLOCK_V_OBJECTS [obj_colisao_solida, obj_plataforma_movel, obj_plataforma_fall]
#macro GROUND_OBJECTS  [obj_colisao_solida, obj_plataforma_movel, obj_plataforma_fall]
#macro KILL_OBJECTS    [obj_espinho]


function place_meeting_any(_x, _y, _list) {
    for (var i = 0; i < array_length(_list); i++) {
        if (place_meeting(_x, _y, _list[i])) return true;
    }
    return false;
}

function instance_place_any(_x, _y, _list) {
    for (var i = 0; i < array_length(_list); i++) {
        var _inst = instance_place(_x, _y, _list[i]);
        if (_inst != noone) return _inst;
    }
    return noone;
}