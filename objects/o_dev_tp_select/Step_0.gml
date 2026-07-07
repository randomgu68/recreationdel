if keyboard_check(vk_escape) {
    instance_destroy()
}

if keyboard_check(vk_up) {
    current_tp ++
}

if keyboard_check(vk_down) {
    current_tp --
}

if keyboard_check(vk_enter) {
    o_enc.tp = current_tp
    instance_destroy()
}

current_tp = clamp(current_tp,0,100)