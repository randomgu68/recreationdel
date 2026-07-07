// Inherit the parent event
event_inherited();

moveanim = false
movetimer = 0

stop_moving = false

interaction_code = function () {
    audio_play_sound(snd_noise,50,false)
    moveanim = true
}

collision_check = function () {
    if place_meeting(x,y,o_ow_block_collision) {
        x = xprevious
        y = yprevious
        
        moveanim = false
        movetimer = 0
    }
    
    if place_meeting(x,y,o_ow_puzzle_glowtile) {
        stop_moving = true
    }
}