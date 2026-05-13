if (knockback_timer > 0)
{
    x += knockback_power;

    knockback_power *= 0.85;

    knockback_timer--;
}


// ─── FUNÇÕES DO PLAYER ─────────────────────────────────────────────────────
function input_player() {
    var _left  = keyboard_check(ord("A"));
    var _right = keyboard_check(ord("D"));
    var _jump  = keyboard_check_pressed(vk_space);
    var _dash  = keyboard_check_pressed(vk_shift);
    
    var _is_ground = place_meeting_any(x, y + 1, GROUND_OBJECTS);
    
    if (_right) _direction =  1;
    if (_left)  _direction = -1;

    // ATAQUE
	if (keyboard_check_pressed(ord("J")) && can_attack) {
		state_player = "attack";
		attack_timer = 15;
		can_attack = false;
	}
	
	// PULO
	
	if (!_is_ground) {
        vel_v += gravidade;
    }
	

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
    }
	
	// DASH

    if (_dash && dash_cd_timer <= 0 && knockback_timer <= 0) {
        dash_timer     = dash_duration;
        dash_cd_timer  = dash_cooldown;
        dash_direction = _direction;
    }
    if (dash_timer > 0) {
        vel_h = dash_speed * dash_direction; 
        vel_v = 0;
        dash_timer--;
    } else {
		if (knockback_timer <= 0) {
			 move = _right - _left;
			 vel_h = move * velocidade_max;
		}
       
    }

    if (dash_cd_timer > 0) dash_cd_timer--;

    // SPRITES
    if (dash_timer > 0) {
        // sprite do dash
    } else if (!_is_ground && vel_v < 0) {
        sprite_index = spr_jump;
    } else if (!_is_ground && vel_v >= 0) {
        sprite_index = spr_fall;
    } else if (vel_h != 0) {
        sprite_index = spr_run;
    } else {
        sprite_index = spr_idle;
    }

    if (vel_h > 0) x_scale_visual = -1.5;
    if (vel_h < 0) x_scale_visual =  1.5;
}

function colisions_kill() {
    if (place_meeting_any(x, y, KILL_OBJECTS)) {
        state_player = "death";
    }
}

function colisions_solid() {
    var _vel_h_sign = sign(vel_h);
    var _vel_v_sign = sign(vel_v);
	
    
    // Horizontal
    if (place_meeting_any(x + vel_h, y, BLOCK_H_OBJECTS)) {
        var _limit = 100;
        while (!place_meeting_any(x + _vel_h_sign, y, BLOCK_H_OBJECTS) && _limit-- > 0) {
            x += _vel_h_sign;
        }
        vel_h = 0;
    }
    x += vel_h;
    
    // Vertical
    if (place_meeting_any(x, y + vel_v, BLOCK_V_OBJECTS)) {
        var _limit = 100;
        while (!place_meeting_any(x, y + _vel_v_sign, BLOCK_V_OBJECTS) && _limit-- > 0) {
            y += _vel_v_sign;
        }
        vel_v = 0;
    }
    y += vel_v;
    
     
    
}

// ─── STATES PLAYER ─────────────────────────────────────────────────────────

switch (state_player) {
    case "normal":
        input_player();
        colisions_kill();
        colisions_solid();
        break;
		
	case "attack":

	    sprite_index = spr_attack;
	    image_speed = 1;
		
		var _is_ground = place_meeting_any(x, y + 1, GROUND_OBJECTS);

		vel_h = 0;
		
		if (!_is_ground) {
		    vel_v += gravidade;
		}

		colisions_solid();

	    if (attack_timer == 15) {
	        image_index = 0;
	    }

	    attack_timer--;
		
	    if (attack_timer == 10) {
	        var hit = instance_create_layer(
	            x + (50 * _direction),
	            y,
	            "hitbox",
	            obj_attack
	        );

	        hit.image_xscale = _direction;
	        hit.damage = damage;
	    }
		
	    if (attack_timer <= 0) {
	        state_player = "normal";
	        can_attack = true;
	    }
	    break;
		
	case "hit":
		can_attack = true;
		input_player();
		colisions_kill();
        colisions_solid();
		if (hit_timer <= 0) {
			dash_timer = 0;
			vel_h = 0
			life_player -= 1;
		}
		
		if (obj_boss.x > x) {
			knockback_power = -8;
		} else {
			knockback_power = 8;
		}
		
		knockback_timer = 10;
		
		hit_timer++;
		
		if (life_player <= 0) {
			state_player = "death"
		}
		if (hit_timer >= 20) {
			hit_timer = 0;
			state_player = "normal"
		}
		break
    
    case "death":
        vel_h = 0;
        vel_v = 0;
		life_player = 5;
        if (--death_timer <= 0) {
            x = checkpoint_x;
            y = checkpoint_y;
            state_player = "normal";
            death_timer = 2;
        }
        break;
}