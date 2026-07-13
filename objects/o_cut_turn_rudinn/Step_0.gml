// Inherit the parent event
event_inherited();

if pattern == "CircleBullet" {
    if timer == 5 {
        cutscene_create()
    
        var target_x = o_enc_box.x
        var target_y = o_enc_box.y
        
        for (var i = 0; i < bullet_count; i++) {
            var dir = i/bullet_count * 360;
            
            var initx = target_x + lengthdir_x(bullet_distance,dir)
            
            var inity = target_y + lengthdir_y(bullet_distance,dir)
            
            cutscene_instance_create(o_cut_bullet_diamondcut, initx, inity,DEPTH_ENCOUNTER.BULLETS_OUTSIDE,
            {
                image_angle : point_direction(initx,inity,target_x,target_y)
            })
            
            cutscene_sleep(2)
        }
        
        cutscene_play()
    }
} else if pattern = "BulletMovementLeft" {
    if timer == 5 {
        cutscene_create()
        
        var initx = o_enc_box.x + 90
        
        var randomYinit = o_enc_box.y - (o_enc_box.width / 2)
        var randomYend = o_enc_box.y + (o_enc_box.width / 2)
        
        var amountofbullet = 32
        
        for (var i = 0; i < amountofbullet; i++) {
        	cutscene_instance_create(o_cut_bullet_diamondcut,initx,irandom_range(randomYinit,randomYend),DEPTH_ENCOUNTER.BULLETS_OUTSIDE,
            {
                image_angle : 180
            })
            
            cutscene_sleep(1)
        }
        
        cutscene_play()
    }
}
