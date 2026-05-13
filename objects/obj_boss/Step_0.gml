/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

distancia = point_distance(x, y, obj_player.x, obj_player.y);

switch(state_boss) {
	case "idle":
		state_boss = "move";
		break;
		
	
	case "move":
		if (obj_player.x > x) {
			x += speed_boss
		} else {
			x += -speed_boss
		}
		distancia = point_distance(x, y, obj_player.x, obj_player.y);

		if (place_meeting(x, y, obj_player)) {
			state_boss = "attack"
		}
		
		break;
	
	case "hit":
		state_boss = "move"
		break;
	
	case "attack":
		with (obj_player) {
			state_player = "hit";
		}	
		state_boss = "idle";
		break;

}





