/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

timer--;

if (timer <= 0) {
    with (instance_create_layer(x, y-105 , "maquinas", obj_flecha)) {
	    direction_arrow = other.direcao;
	}

    timer = tempo_disparo; 
}


