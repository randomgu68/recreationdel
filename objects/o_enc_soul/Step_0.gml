if color == SOUL_COLOR.RED {
    sprite_index = spr_soul;
    image_blend = c_red;
    
	if is_transitioning == false {
		// Movement
		if InputCheck(INPUT_VERB.CANCEL) 
			real_spd = spd/2;
		else
			real_spd = spd;
		
        var xx = 0
        var yy = 0
        
		if InputCheck(INPUT_VERB.LEFT) 
			xx -= real_spd
		else if InputCheck(INPUT_VERB.RIGHT) 
			xx += real_spd
		if InputCheck(INPUT_VERB.UP) 
			yy -= real_spd
		else if InputCheck(INPUT_VERB.DOWN) 
			yy += real_spd
        
        var xstep = .25 * sign(xx)
        for (var i = 0; i < abs(xx); i ++) { // horizontal collisions
            if !place_meeting(x + xstep + sign(xstep)*1.5, y, o_enc_box_solid)
                x += xstep
        }
        var ystep = .25 * sign(yy)
        for (var i = 0; i < abs(yy); i ++) { // vertical collisions
            if !place_meeting(x, y + ystep + sign(ystep)*1.5, o_enc_box_solid)
                y += ystep
        }
		
		if (InputCheck(INPUT_VERB.LEFT) 
            || InputCheck(INPUT_VERB.UP) 
            || InputCheck(INPUT_VERB.RIGHT) 
            || InputCheck(INPUT_VERB.DOWN)) 
		&& (x != xprevious || y != yprevious) {
			moving = true
		}
		else 
			moving = false
        
		if place_meeting(x, y, o_enc_bullet) {
			with instance_place(x, y, o_enc_bullet){
				event_user(0);
			}
		}
		
		if i_frames > 0 {
			i_frames --;
			image_speed = .25;
		} 
		else {
			image_speed = 0;
			image_index = 0;
			i_frames = 0;
		}
	}

	inst_graze.x = self.x;
	inst_graze.y = self.y;
	inst_graze.can_graze = (i_frames == 0 && !instance_exists(inst_aura));
}
else if color == SOUL_COLOR.BLUE {
    sprite_index = spr_soul_blue;
    image_blend = c_blue;
    image_angle = -blue_gravity_dir + 180;
    
    var mask_w = 18;
    var mask_h = 18;
    
	if !is_transitioning {
		if InputCheck(INPUT_VERB.CANCEL) 
			real_spd = spd/2;
		else
			real_spd = spd;
		
        var xx = 0;
        var yy = 0;
        var grounded = false;
        
		if InputCheck(INPUT_VERB.LEFT) 
			xx -= real_spd;
		else if InputCheck(INPUT_VERB.RIGHT) 
			xx += real_spd;
        
        var ground = instance_place(x, y + 2, o_enc_box_solid); // check if grounded
        var slope = 0;
        
        if instance_exists(ground) {
            grounded = true;
            
            // calculate distance from the ground
            var range = 40;
            var d_pos = 0;
            var d_neg = 0;
            
            var gripping = true;
            var check_dir = 90 - blue_gravity_dir;
            
            // positive side
            for (var i = 0; i < range; i ++) {
                d_pos = i+2;
                if place_meeting(x + mask_w/2 + lengthdir_x(i, check_dir), y + lengthdir_y(i, check_dir), o_enc_box_solid)
                    break;
            }
            if d_pos == 0
                gripping = false;
            
            // neagative side
            for (var i = 0; i < range; i ++) {
                d_neg = i+2;
                if place_meeting(x - mask_w/2 + lengthdir_x(i, check_dir), y + lengthdir_y(i, check_dir), o_enc_box_solid)
                    break;
            }
            if d_neg == 0
                gripping = false;
            
            slope = (d_pos - d_neg) / mask_w;
            
            var slope_xx = (!gripping ? sign(slope) : 0);
            var slope_yy = (!gripping ? abs(slope) : 0);
            
            if abs(slope) > 0.5 {
                slope_xx = sign(slope);
                slope_yy = abs(slope);
            }
            
            var xstep = .25 * sign(slope_xx);
            for (var i = 0; i < abs(slope_xx); i ++) { // horizontal collisions
                if !place_meeting(x + xstep + sign(xstep)*1.5, y, o_enc_box_solid)
                    x += xstep;
            }
            var ystep = .25 * sign(slope_yy);
            for (var i = 0; i < abs(slope_yy); i ++) { // vertical collisions
                if !place_meeting(x, y + ystep + sign(ystep)*1.5, o_enc_box_solid)
                    y += ystep;
            }
        }
        
        if grounded {
            blue_jumptimer = blue_jumptimer_max;
            blue_z_used = false;
        }
        
        if InputCheck(INPUT_VERB.UP) && (grounded || blue_jumptimer > 0) {
            blue_y_momentum = -blue_jump_height;
            blue_z_buffer = 5;
        }
        yy = (grounded ? min(blue_y_momentum, 0) : blue_y_momentum);
        
        var xstep = .25 * sign(xx)
        for (var i = 0; i < abs(xx); i ++) { // horizontal collisions
            if !place_meeting(x + xstep + sign(xstep)*1.5, y, o_enc_box_solid)
                x += xstep;
        }
        var ystep = .25 * sign(yy)
        for (var i = 0; i < abs(yy); i ++) { // vertical collisions
            if !place_meeting(x, y + ystep + sign(ystep)*1.5, o_enc_box_solid)
                y += ystep;
        }
		
        if grounded
            blue_y_momentum = 0;
        
		if (InputCheck(INPUT_VERB.LEFT) 
            || InputCheck(INPUT_VERB.UP) 
            || InputCheck(INPUT_VERB.RIGHT) 
            || InputCheck(INPUT_VERB.DOWN)) 
		&& (x != xprevious || y != yprevious) {
			moving = true;
		}
		else 
			moving = false;
        
		if place_meeting(x, y, o_enc_bullet) {
			with instance_place(x, y, o_enc_bullet){
				event_user(0);
			}
		}
		
		if i_frames > 0 {
			i_frames --;
			image_speed = .25;
		} 
		else {
			image_speed = 0;
			image_index = 0;
			i_frames = 0;
		}
        
        blue_y_momentum += 1.6;
        blue_y_momentum = clamp(blue_y_momentum, -30, 20);
        
        blue_jumptimer --;
        
        if blue_trail > 0 && blue_trail % 2 == 0
            afterimage(.05);
        if blue_z_buffer > 0
            blue_z_buffer --;
        if abs(blue_x_momentum) > 0 
            blue_x_momentum -= sign(blue_x_momentum);
	}
    
    if blue_trail > 0
        blue_trail --;

	inst_graze.x = self.x;
	inst_graze.y = self.y;
	inst_graze.can_graze = (i_frames == 0 && !instance_exists(inst_aura));
}

if instance_exists(inst_aura) {
    inst_aura.x = self.x;
    inst_aura.y = self.y;
}