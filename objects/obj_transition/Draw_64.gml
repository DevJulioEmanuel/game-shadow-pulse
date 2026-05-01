/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

// === DRAW GUI EVENT (não Draw normal!) ===
if (estado != "none") {
    var w = display_get_width();
    var h = display_get_height();
    
    if (!surface_exists(global.trans_surface)) {
        global.trans_surface = surface_create(w, h);
    }
    
    surface_set_target(global.trans_surface);
        draw_clear_alpha(c_black, 1);
        
        // Buraco no centro da tela (GUI space, não world space)
        // O alvo precisa ser convertido de world para GUI
        var cam = view_camera[0];
        var cam_x = camera_get_view_x(cam);
        var cam_y = camera_get_view_y(cam);
        var gui_x = (alvo_x - cam_x);
        var gui_y = (alvo_y - cam_y);
        
        // Escala para GUI se resolução de GUI diferir da câmera
        var scale_x = display_get_gui_width() / camera_get_view_width(cam);
        var scale_y = display_get_gui_height() / camera_get_view_height(cam);
        gui_x *= scale_x;
        gui_y *= scale_y;
        
        gpu_set_blendmode_ext(bm_zero, bm_inv_src_alpha);
        draw_circle(gui_x, gui_y, raio, false);
        gpu_set_blendmode(bm_normal);
    surface_reset_target();
    
    draw_surface(global.trans_surface, 0, 0);
}




