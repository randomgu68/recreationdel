draw_sprite_ext(spr_pixel, 0, 0, 0, GAME_W_GUI, GAME_H_GUI, 0, c_black, .85)
draw_set_font(loc_font("main"))

draw_text_highlighted("Current tension points: " + string(current_tp), GAME_W_GUI / 2-60, GAME_H_GUI / 2, true)