  /// @description Inserir descrição aqui
// Você pode escrever seu código neste editor


// Inherit the parent event
event_inherited();

velocidade = 8;
gravidade = .5;
forca_pulo = -10;
is_double_pulo = 0;

dash_speed = 3;
dash_cooldown = 40;
dash_timer = 0; 
dash_cd_timer = 0;
dash_duration = 8;


function input_player() {
	var _left, _right, _jump, _dash;
	
	_left = keyboard_check(ord("A"));
	_right = keyboard_check(ord("D"));
	_jump = keyboard_check_pressed(vk_space);
	_dash = keyboard_check_pressed(vk_shift);
	
	var _is_ground = place_meeting(x, y+1, obj_bloco)
	
	if (_right) _direction = 1;
	if (_left) _direction = -1;
	
	// PULO
	
	if (_is_ground) {
		if (_jump) {
			vel_v = forca_pulo;
			instance_create_layer(x, y, "Instances", obj_dust);
			is_double_pulo = 1;
		}
	} else {
		if (_jump && is_double_pulo) {
			vel_v = forca_pulo;
			is_double_pulo = 0;
		}
		vel_v += gravidade; 
	}
	
	// DASH
	
	if (_dash && dash_cd_timer <= 0) {
		dash_timer = dash_duration;
		dash_cd_timer = dash_cooldown;
	}
	
	if (dash_timer > 0) {
		vel_h += dash_speed * _direction;
		vel_v = 0;
		dash_timer--;
	} else {
		vel_h = (_right - _left) * velocidade
	}
	
	if (dash_cd_timer > 0) {
		dash_cd_timer--;
	}
	
	
	// SPRITES
	
		 
	if (dash_timer > 0) {
		//sprite_index = spr_dash;
	}
	else if (!_is_ground && vel_v < 0) {
		sprite_index = spr_jump;
	}
	else if (!_is_ground && vel_v >= 0) {
		sprite_index = spr_fall;
	}
	else if (vel_h != 0) {
		sprite_index = spr_run;
	}
	else {
		sprite_index = spr_idle;
	}
	
	// DIREÇÃO DO SPRITE
	if (vel_h > 0) image_xscale = -1.5;
	if (vel_h < 0) image_xscale = 1.5;
	
}