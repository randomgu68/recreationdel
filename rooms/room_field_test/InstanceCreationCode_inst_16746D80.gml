trigger_code = function () {
    dodge_on()
    
    var markers = [marker_get("bulletpos",0) , marker_get("bulletpos",1) , marker_get("bulletpos",2)]
    
    
    for (var i = 0; i < array_length(markers); i++) {
    	instance_create_layer(markers[i].x,markers[i].y,"Instances",o_cutscene_ow_bulletgen, {
            timedelay : 60
        })
    }
}

trigger_exit_code = function () {
    var can_turn_off = true;
    with o_trigger_dodge {
        if id != other.id && triggered {
            can_turn_off = false;
            break;
        }
    }
    triggered = false;
    
    if can_turn_off {
   	    dodge_off()
    }
}
