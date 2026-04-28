  /// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

switch(state) {
	case "delay":
        timer--;
        if (timer <= 0) {
            estado = "em_cima";
            timer = room_speed * tempo_cima;
        }
    break;
	
	case "em_cima":
		timer--;
		if (timer<=0) {
			state = "descendo";
		}
		break;
   
	case "descendo":
		y += velocidade;
  
		if (y>=y_final) {
			state = "em_baixo";
			timer = room_speed * tempo_baixo;
		} 
		break;
	
	case "em_baixo":
		timer--;
		
		if	(timer<=0) {
			state = "subindo";
		}
		break;
	
	case "subindo":
		y -= velocidade;
		
		if (y <= y_inicial) {
			y = y_inicial;
			state = "em_cima";
			timer = room_speed * tempo_cima ;
		}
		break;
 	
}

if (place_meeting(x, y, obj_player)) {
		with (obj_player) {
		    state_player = "death";
		}
	}



