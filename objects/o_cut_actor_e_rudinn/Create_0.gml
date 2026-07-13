// Inherit the parent event
event_inherited();

timer = 0
s_intro = spr_cut_enc_diaguy_hurt

s_drawer = function(_sprite, _index, _xx, _yy, _xscale, _yscale, _angle, _blend, _alpha) {
    draw_sprite_ext(_sprite, _index, 
        _xx + sine(10, 2), _yy, 
        _xscale, _yscale, 
        _angle, _blend, _alpha
    )
}
