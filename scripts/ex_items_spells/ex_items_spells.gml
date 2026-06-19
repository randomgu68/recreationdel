function ex_items_hyper_heal() : item_spell() constructor {
    name = "HyperHeal"
    desc = "Better heal"
    
    
    use_type = ITEM_USE.INDIVIDUAL
    
    use = function (spell_user, target, caller, _name) {
        cutscene_enc_wait(true)
        cutscene_dialogue(string(party_getname(spell_user)) + " casted " + "HyperHeal" + "!")
        cutscene_sleep(10)
        
        cutscene_func(function(spell_user, target, _name) {
            party_heal(global.party_names[target], party_getdata(spell_user, "magic") * 7)
        }, [spell_user, target, _name])
        
        cutscene_sleep(30)
        cutscene_func(instance_destroy, [o_ui_dialogue])
		cutscene_enc_wait(false)
    }
    
    use_arg = name
    tp_cost = 75
}