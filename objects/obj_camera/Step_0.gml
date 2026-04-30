/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

var cam_w = camera_get_view_width(cam);
var cam_h = camera_get_view_height(cam);

// posição alvo
var target_x = obj_player.x - cam_w / 2 + 80;
var target_y = obj_player.y - cam_h / 2 - 100;

// posição atual
var current_x = camera_get_view_x(cam);
var current_y = camera_get_view_y(cam);

// suavização
var smooth_x = lerp(current_x, target_x, 0.3);
var smooth_y = lerp(current_y, target_y, 0.18);

// aplica
camera_set_view_pos(cam, smooth_x, smooth_y);




