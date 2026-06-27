if (!surface_exists(surf)){
    surf=surface_create(320,240)
}
surface_set_target(surf)
draw_clear_alpha(c_black,0)
draw_set_color(c_black)
draw_rectangle(0,0,320,240,false)
gpu_set_blendmode(bm_subtract)
for (var i = 0; i<array_length(targets); i++){
    if instance_exists(targets[i].target){
        var draw_x=targets[i].target.x-guipos_x()
        var draw_y=(targets[i].target.y-guipos_y())-sprite_get_height(targets[i].target.sprite_index)/2
        draw_circle(draw_x,draw_y,targets[i].radius, false)
    }
}
gpu_set_blendmode(bm_normal)
surface_reset_target()
draw_surface(surf,guipos_x(),guipos_y())
draw_set_color(c_white)