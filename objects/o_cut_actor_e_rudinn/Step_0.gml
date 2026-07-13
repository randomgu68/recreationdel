// Inherit the parent event
event_inherited();
timer ++

if instance_exists(o_enc) {
    if timer > 1 {
        var ai = afterimage(0.05,id)
        ai.speed = 1
        ai.y += cosine(5,-5)
        
        timer = 0
    }
}