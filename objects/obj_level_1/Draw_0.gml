draw_set_font(global.mainfont)
draw_set_halign(fa_center)
draw_text(room_width/2, room_height/2-320, string(_actual_score))
draw_text(room_width/2, room_height/2-260, global.max_score)

if (!obj_player.visible) {
	draw_text(room_width/2, room_height/2, "game over")
	draw_text(room_width/2, room_height/2+60, "press enter to restart")
	if (!global.on_challenge) {
		draw_text(room_width/2, room_height/2+120, "press esc to go back to menu")
	} else {
		draw_text(room_width/2, room_height/2+180, "press esc to go back to gxc")
	}
}
draw_set_halign(fa_left)
draw_sprite(spr_player, 0, 32, 32)
draw_text(90, 10, string(obj_player._lives) + " lives")
draw_text(90, 40, "game lv " + string(obj_player._level))
draw_text(330, 20, global.username)