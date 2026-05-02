// === STEP EVENT ===

if (estado != "none") {
    travado = true;
}


switch (estado) {
    case "fechando":
        raio -= velocidade_fechar;
        if (raio <= 0) {
            raio = 0;
            estado = "trocando";
        }
    break;
    
    case "trocando":
        // Executa a troca de room em um frame separado, com raio já zerado
		show_debug_message("STEP trocando | proxima_room=" + string(proxima_room));
room_goto(proxima_room);
        if (proxima_room != noone) {
            room_goto(proxima_room);
        }
        // estado vira "abrindo" no Room Start do próximo room
    break;
    
    case "abrindo":
	    if (instance_exists(obj_player)) {
	        alvo_x = obj_player.x;
	        alvo_y = obj_player.y - 16;;
	    }
	    raio += velocidade_abrir;
	    if (raio >= 1500) {
	        estado = "none";
			travado = false; 
	        if (surface_exists(global.trans_surface)) {
	            surface_free(global.trans_surface);
	            global.trans_surface = -1;
	        }
	    }
	break;
}