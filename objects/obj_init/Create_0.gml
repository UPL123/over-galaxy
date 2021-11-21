gml_pragma("PNGCrush")
audio_group_set_gain(audiogroup_default, 2, 0)
global._volume_slider = 4
global.ch_hs = "f6fa887c-79c2-48ea-8f1a-bfe37592430a"
global.username = "loading"
gxc_profile_get_info( function(_status, _result)
{
    if (_status == 200)
    {
        global.username = string_lower(_result.data.username)
    } else {
		global.username = "anonimous"
	}
});

ini_open(working_directory + "/save.ini")
if (!ini_section_exists("save")) {
	ini_write_real("save", "auto_shoot", true)
	global.auto_shoot = true
	ini_write_real("save", "max_score", 0)
	global.max_score = 0
	ini_write_real("save", "level", 1)
	global.level = 0
	ini_write_real("save", "xp", 0)
	global.xp = 0
	ini_write_real("save", "levels", 1)
	global.levels = 1
} else {
	global.auto_shoot = ini_read_real("save", "auto_shoot", true)
	global.max_score = ini_read_real("save", "max_score", 0)
	global.level = ini_read_real("save", "level", 1)
	global.xp = ini_read_real("save", "xp", 0)
	global.levels = ini_read_real("save", "levels", 1)
}
ini_close();
global.current_level = global.levels
global.max_level = 5
global._draw_xp = global.xp
global.mainfont = font_add_sprite_ext(spr_font, "abcdefghijklmnopqrstuvwxyz1234567890<>?", true, 2)
if (gxc_get_query_param("challenge") != global.ch_hs) {
	global.on_challenge = false
	room_goto_next()
} else {
	global.on_challenge = true
	global.max_level = undefined
	global.current_level = 1
	room_goto(room_play)
}