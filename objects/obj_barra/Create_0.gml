
state = "em_cima";

y_inicial = y;
y_final = 2272;

if (!variable_instance_exists(id, "velocidade")) velocidade = 8;
if (!variable_instance_exists(id, "tempo_cima")) tempo_cima = 1.5;
if (!variable_instance_exists(id, "tempo_baixo")) tempo_baixo = 0.5;
if (!variable_instance_exists(id, "delay_inicial")) delay_inicial = 0;

timer = room_speed * delay_inicial;
estado = delay_inicial > 0 ? "delay" : "espera_cima";