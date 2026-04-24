  /// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

var _colx, _coly;

_colx = instance_place(x + vel_h, y, obj_bloco);
_coly = instance_place(x, y + vel_v, obj_bloco);

if (_colx) {
	if (vel_h>0) {
		x = _colx.bbox_left+(x-bbox_right);
	}
	if (vel_h<0) {
		x = _colx.bbox_right+(x-bbox_left);
	}	 
	vel_h = 0;
}
 
if (_coly) {
	if (vel_v>0) {
		y = _coly.bbox_top+(y-bbox_bottom);
	}
	if (vel_v<0) {
		y = _coly.bbox_bottom+(y-bbox_top);
	}
	 
	vel_v = 0;
}

x += vel_h;
y += vel_v