// Inherit the parent event
event_inherited();

if timer == 0 {
    cutscene_create()
    
    cutscene_animate(0,1,5,anime_curve.linear,id,"image_alpha")
    
    cutscene_sleep(15)
    
    cutscene_set_variable(id,"must_move",true)
    
    cutscene_sleep(30)
    
    cutscene_animate(1,0,5,anime_curve.linear,id,"image_alpha")
    
    cutscene_sleep(5)
    
    cutscene_func(function () {
        instance_destroy()
    })
    
    cutscene_play()
}

if must_move {
    x += lengthdir_x(bullet_speed,image_angle)
    y += lengthdir_y(bullet_speed,image_angle)
}

timer ++