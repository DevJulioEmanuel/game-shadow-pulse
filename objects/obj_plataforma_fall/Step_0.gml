
var em_cima = place_meeting(x, y - 1, obj_player);

if (!ativou) {
    if (em_cima) {
        timer_plataforma--;

       var intensidade = 5 ;
	   shake_offset_x = random_range(-intensidade, intensidade);
       shake_offset_y = random_range(-intensidade, intensidade);
	   if (timer_plataforma <= 0) {
            ativou = true;
        }
    } else {	
		shake_offset_x = 0;
		shake_offset_y = 0;
        timer_plataforma = timer_plataforma_reset;
    }
}


if (ativou) {
	  
    y += velocidade_plataforma;
	

    if (timer_plataforma <= -10) {
        instance_destroy();
    }
}