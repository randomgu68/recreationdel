global.party_names = ["kris","susie","ralsei"]


trigger_code = function () {
    var krisxpos = party_get_inst("kris").x
    var krisypos = party_get_inst("kris").y
    
    var susiexpos = party_get_inst("susie").x
    var susieypos = party_get_inst("susie").y
    
    var ralseixpos = party_get_inst("ralsei").x
    var ralseiypos = party_get_inst("ralsei").y
    
    cutscene_create()
    cutscene_player_canmove(false)
    
    cutscene_set_variable(o_camera, "target", noone)
    
    cutscene_dialogue("{char(susie,0)}* What's this?")
    
    cutscene_party_follow(false)
    
    cutscene_actor_move(party_get_inst("kris"), [new actor_movement(180,190,10)],false)
    
    cutscene_actor_move(party_get_inst("susie"), [new actor_movement(160,170,20)],false)
    
    cutscene_actor_move(party_get_inst("ralsei"), [new actor_movement(160,210,30)],true)
    
    cutscene_actor_move(party_get_inst("kris"), [new actor_movement(180,190,10)],false)
    
    cutscene_set_variable(party_get_inst("kris"), "dir", DIR.RIGHT)
    cutscene_set_variable(party_get_inst("susie"), "dir", DIR.RIGHT)
    cutscene_set_variable(party_get_inst("noelle"), "dir", DIR.RIGHT)
    
    cutscene_sleep(10)
    
    cutscene_func(function () {screen_shake(4)})
    
    cutscene_set_variable(party_get_inst("susie"), "sprite_index", spr_susie_shock)
    cutscene_actor_override(party_get_inst("susie"), true);
    
    cutscene_set_variable(party_get_inst("ralsei"), "sprite_index", spr_ralsei_shock)
    cutscene_actor_override(party_get_inst("ralsei"), true);
    
    cutscene_sleep(5)
    
    cutscene_func(function () {screen_shake(4)})
    
    cutscene_audio_play(snd_exclamation)
    
    cutscene_sleep(10)
    
    cutscene_camera_pan(440,undefined,45,true,anime_curve.sine_in_out)
    
    cutscene_sleep(30)
    
    cutscene_func(function (){
        camera_unpan(get_leader(),45,anime_curve.sine_in_out)
    })
    
    cutscene_sleep(45)
    
    cutscene_actor_override(party_get_inst("ralsei"), false);
    cutscene_actor_override(party_get_inst("susie"), false);
    
    cutscene_sleep(10)
    cutscene_set_variable(party_get_inst("susie"), "dir", DIR.DOWN)
    cutscene_sleep(2)
    cutscene_set_variable(party_get_inst("kris"), "dir", DIR.UP)
    cutscene_sleep(2)
    cutscene_set_variable(party_get_inst("ralsei"), "dir", DIR.UP)
    
    cutscene_dialogue([
        "{char(susie,3)}* Uhh...{sleep(10)} guys?",
        "{char(susie,4)}* We will have to {color(c_blue)}sneak{color(c_white)} over.",
        "{char(susie,15)}* Wait",
        "{char(susie,17)}* What the hell?!",
        "{char(susie,10)}* .{s(5)}.{s(5)}.{s(5)} {clear} {resetx}* Well let's get over this."
    ])
    
    cutscene_actor_move(party_get_inst("kris"), [new actor_movement(krisxpos,krisypos,10)],false)
    cutscene_actor_move(party_get_inst("susie"), [new actor_movement(susiexpos,susieypos,10)],false)
    cutscene_actor_move(party_get_inst("ralsei"), [new actor_movement(ralseixpos,ralseiypos,10)],false)
    
    cutscene_player_canmove(true)
    
    cutscene_party_follow(true)
    
    cutscene_play()
}