/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor


if place_meeting(x, y, obj_player) and keyboard_check_pressed(ord("E")) {
    if not activated {
        activated = true;
        with (obj_puzzle_controller) {
            lever_order[pull_count] = other.lever_id;
            pull_count++;
        }
    } else {
        with (obj_puzzle_controller) {
            reset_puzzle();
        }
    }
}

if (!activated) {
	sprite_index = spr_alavanca_up;
} else {
	sprite_index = spr_alavanca_down;
}



