var _dx = velocidade * direcao;

x += _dx;
if (x >= x_inicial + distancia) direcao = -1;
if (x <= x_inicial)             direcao =  1;

// Empurra o player se estiver em cima
var _player = instance_place(x, y - 1, obj_player);
if (_player != noone) {
    _player.x += _dx;
    
    // Se empurrou o player pra dentro de uma parede, reverte
    if (place_meeting_any(_player.x, _player.y, BLOCK_H_OBJECTS)) {
        _player.x -= _dx;
    }
}