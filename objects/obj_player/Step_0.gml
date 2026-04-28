/// @description Movimentação e Colisão



function input_player() {
    var _left  = keyboard_check(ord("A"));
    var _right = keyboard_check(ord("D"));
    var _jump  = keyboard_check_pressed(vk_space);
    var _dash  = keyboard_check_pressed(vk_shift);
    
    var _is_ground = place_meeting(x, y + 1, obj_colisao_solida);

    if (_right) _direction =  1;
    if (_left)  _direction = -1;

    if (_is_ground) {
        if (_jump) {
            vel_v = forca_pulo;
            instance_create_layer(x, y, "player", obj_dust);
            is_double_pulo = 1;
        }
    } else {
        if (_jump && is_double_pulo) {
            vel_v = forca_pulo;
            instance_create_layer(x, y, "player", obj_dust);
            is_double_pulo = 0;
        }
        vel_v += gravidade;
    }

    if (_dash && dash_cd_timer <= 0) {
        dash_timer     = dash_duration;
        dash_cd_timer  = dash_cooldown;
        dash_direction = _direction;
    }

    if (dash_timer > 0) {
        vel_h = dash_speed * dash_direction; 
        vel_v = 0;
        dash_timer--;
    } else {
        move = _right - _left
		if (move != 0) {
			vel_h += move * aceleracao;
			vel_h = clamp(vel_h, -velocidade_max, velocidade_max)
		} else {
			vel_h *= freio
			
			if (abs(vel_h)<0.1) {
				vel_h = 0
			}
		}
    }

    if (dash_cd_timer > 0) dash_cd_timer--;

    if (dash_timer > 0) {
   
    } else if (!_is_ground && vel_v < 0) {
        sprite_index = spr_jump;
    } else if (!_is_ground && vel_v >= 0) {
        sprite_index = spr_fall;
    } else if (vel_h != 0) {
        sprite_index = spr_run;
    } else {
        sprite_index = spr_idle;
    }

    if (vel_h > 0) image_xscale = -1.5;
    if (vel_h < 0) image_xscale =  1.5;
}

function colisions_kill() {
	if (place_meeting(x, y, obj_espinho)) {
		state_player = "death";
	}
}

switch (state_player) {
	case "normal":
		input_player();
		colisions_kill();
		
		if (place_meeting(x + vel_h, y, obj_colisao_solida)) {
			while (!place_meeting(x + sign(vel_h), y, obj_colisao_solida)) {
			    x += sign(vel_h); 
			}
			vel_h = 0;
		}
		x += vel_h;

		if (place_meeting(x, y + vel_v, obj_colisao_solida)) {
			while (!place_meeting(x, y + sign(vel_v), obj_colisao_solida)) {
			    y += sign(vel_v);
			}
			vel_v = 0;
		}
		y += vel_v;
		break;
	
	case "death":
		vel_h = 0;
		vel_v = 0;
		death_timer--;
		if (death_timer<=0) {
			x = checkpoint_x;
			y = checkpoint_y;
			state_player = "normal";
		}
		break;
		
};