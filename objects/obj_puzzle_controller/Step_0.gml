 /// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

if pull_count >= 5 and puzzle_active {
    check_sequence();
}

function check_sequence() {
    var correct = true;

    for (var i = 0; i < 5; i++) {
        if lever_order[i] != correct_order[i] {
            correct = false;
            break;
        }
    }

    if correct {
        puzzle_solved = true;
        puzzle_active = false;
        // with (obj_door) { open_door(); }
        show_message_async("A porta se abre!");
    } else {
        reset_puzzle();
    }
}

function reset_puzzle() {
    pull_count  = 0;
    lever_order = array_create(5, 0);
    puzzle_active = true;

    with (obj_lever) {
        activated = false;
		sprite_index = spr_alavanca_up;

    }

}


