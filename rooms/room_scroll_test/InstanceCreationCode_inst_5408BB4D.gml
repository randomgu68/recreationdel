count = 0

trigger_code = function () {
    cutscene_create()
    if count == 0 {
        cutscene_dialogue(["* You were going to walk towards the next room but...","* There aren't any rooms."])
    } else {
        cutscene_dialogue(["* There's nothing here."])
    }
    cutscene_actor_move(party_get_inst("kris"),
    new actor_movement(
            party_get_inst("kris").x - 20,
            party_get_inst("kris").y,
            20
        )
    )
    cutscene_play()
    
    count++
}