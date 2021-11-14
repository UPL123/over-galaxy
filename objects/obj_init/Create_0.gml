gml_pragma("PNGCrush")
audio_group_set_gain(audiogroup_default, 2, 0)
global._volume_slider = 2
global.ch_hs = "f6fa887c-79c2-48ea-8f1a-bfe37592430a"
ini_open(working_directory + "/save.ini")
if (!ini_section_exists("save")) {
	ini_write_real("save", "max_score", 0)
	global.max_score = 0
} else {
	global.max_score = ini_read_real("save", "max_score", 0)
}
ini_close();
global.mainfont = font_add_sprite_ext(spr_font, "abcdefghijklmnopqrstuvwxyz1234567890<>?", true, 2)
if (gxc_get_query_param("challenge") != global.ch_hs) {
	global.on_challenge = false
	room_goto_next()
} else {
	global.on_challenge = true
	room_goto(room_play)
}