if moveanim {
    var partyLeader = party_get_inst(global.party_names[0])
    
    if partyLeader.dir == DIR.LEFT {
        x -= 4
        collision_check()
    }
    
    if partyLeader.dir == DIR.RIGHT {
        x += 4
        collision_check()
    }
    
    if partyLeader.dir == DIR.UP {
        y -= 4
        collision_check()
    }
    
    if partyLeader.dir == DIR.DOWN {
        y += 4
        collision_check()
    }
    
    movetimer ++
    
    if movetimer >= 5 {
        movetimer = 0
        moveanim = false
    }
    
    if movetimer >= 5 and stop_moving = true {
        movetimer = 0
        moveanim = false
    }
}