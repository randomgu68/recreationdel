function cut_enemy_rudinn() : enemy() constructor {
    name = "Rudinn"
    obj = o_cut_actor_e_rudinn
    turn_object = o_cut_turn_rudinn
    
    max_hp = 120
    hp = 120
    attack = 5
    defense = 0
    
    mercy = 0
    
    s_idle = spr_cut_enc_diaguy_idle
    s_hurt = spr_cut_enc_diaguy_hurt
    s_spare = spr_cut_enc_diaguy_spared
    
    acts = [
        {
            name :"Check",
            party : [],
            desc : "Useless analysis",
            exec : function () {
                encounter_scene_dialogue("* waashaaa")
            }
        },
        {
            name: "Pull",
            party: ["susie"],
            desc: "Pull it",
            exec : function (slot,user) {
                cutscene_create()
                
                cutscene_enc_wait(true)
                
				cutscene_func(function(user) {
					var o = party_get_inst(user)
					
					var inst = afterimage(.03,o)
					inst.speed = 1
					inst = afterimage(.04, o)
					inst.speed = 2
                    
                    var a = animate(.5, 1, 4, anime_curve.linear, o, "flash")
                        a._add(0, 6, anime_curve.linear)
                        a._start()
				}, user)
                
                cutscene_func(enc_enemy_add_spare, [slot, 25])
                
                cutscene_dialogue("* You and Susie pulled it.")
                
                cutscene_enc_wait(false)
                
                cutscene_play()
            },
            enabled : function() {
                if self.mercy < 75 {
                    return true
                } else {
                    return false
                }
            }
        }
    ]
    
    dialogue = function (slot) {
        if self.mercy >= 100 {
            return array_shuffle(["queso","reso","pareso"])
        } else {
            return array_shuffle(["ripo","depo","paro"])
        }
    }
}