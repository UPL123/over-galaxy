draw_sprite_ext(spr_logo, 0, room_width/2, _y, 1, 1, 0, c_white, 1)
draw_set_font(global.mainfont)
draw_set_alpha(sin(_alpha * 25))
draw_set_halign(fa_center)
draw_text(room_width / 2, __y, "press enter to start")
draw_set_alpha(1)
draw_set_halign(fa_left)

if (_y == room_height/2-180) {
	__alpha = lerp(__alpha, 0, 0.1)
	draw_set_alpha(__alpha)
	draw_rectangle(0, 0, room_width, room_height, false);
	draw_set_alpha(1)
	_stage = 2
}

if (_stage = 2) {
	draw_set_halign(fa_center)
	if (_menu = 0) {
		draw_text(room_width/2, room_height/2, "play")
		draw_text(room_width/2, room_height/2+40, "settings")
		draw_text(room_width/2, room_height/2+80, "exit")
	}
	if (_menu = 1) {
		draw_text(room_width/2, room_height/2, "arcade")
		draw_text(room_width/2+ 180, room_height/2, "< " + string(global.current_level) + " >")
		draw_text(room_width/2, room_height/2+40, "endless")
		draw_text(room_width/2, room_height/2+80, "back")
	}
	if (_menu = 2) {
		draw_text(room_width/2, room_height/2, "volume")
		draw_sprite(spr_slider, global._volume_slider, room_width/2 + 64, room_height/2)
		draw_text(room_width/2, room_height/2+40, "auto shoot")
		draw_text(room_width/2, room_height/2+80, "back")
	}
	draw_text(room_width/2-100, room_height/2+40*_option, ">")
}