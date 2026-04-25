var _tid = layer_tilemap_get_id("tile_ground");

if (tilemap_get_at_pixel(_tid, x + vel_h, y) > 0) {
    while (!tilemap_get_at_pixel(_tid, x + sign(vel_h), y) > 0) {
        x += sign(vel_h); 
    }
    vel_h = 0;
}

x += vel_h;

if (tilemap_get_at_pixel(_tid, x, y + vel_v) > 0) {
    while (!tilemap_get_at_pixel(_tid, x, y + sign(vel_v)) > 0) {
        y += sign(vel_v);
    }
    vel_v = 0;
}
y += vel_v;