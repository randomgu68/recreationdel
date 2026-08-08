function scr_shadow(_image_alpha,_image_blend,_leftX_diff,_topY_diff,_x_diff,_y_diff,inst = id,_drawer = undefined){
    var _shadow = instance_create_depth(inst.x,inst.y,inst.depth,o_shadow)
    
    _shadow.sprite_index = sprite_index
    _shadow.x_pos_difference = _x_diff
    _shadow.y_pos_difference = _y_diff
    _shadow.left_Difference = _leftX_diff
    _shadow.top_Difference = _topY_diff
    _shadow.image_alpha = _image_alpha
    _shadow.image_blend = _image_blend
    
    if !is_undefined(_drawer) {
        _shadow.shadow_drawer = _drawer
    }
    
    return _shadow
}