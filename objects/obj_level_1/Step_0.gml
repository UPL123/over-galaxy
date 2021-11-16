if (obj_player.visible) {
	_layer_x++
}

layer_x("Stars", lerp(layer_get_x("Stars"), -_layer_x*obj_player._level, 0.1))
layer_x("Stars_2", lerp(layer_get_x("Stars_2"), -_layer_x/2*obj_player._level, 0.1))
if (obj_player.visible) {
	randomize()
	if (_level_step == _local_time) {
		var _probability = irandom_range(10, 30)
		var _spawns = irandom_range(0, 2)
		if (_probability == 10) {
			instance_create_depth(room_width+(sprite_get_width(spr_level_up)*2), irandom_range(0, room_height), depth, obj_level_up)
		} else {
			repeat(_spawns) {
				instance_create_depth(room_width+(sprite_get_width(spr_bomb)*2), irandom_range(0, room_height), depth, obj_bomb_1)
			}
		}
		_level_step = 0
		_local_time = irandom_range(10, 60)
	} else {
		_level_step++
	}
	if (_actual_score > real(global.max_score)) { 
		global.max_score = _actual_score
	}
} else {
	if (_actual_score >= global.max_score) { 
		ini_open(working_directory + "/save.ini")
		ini_write_real("save", "max_score", global.max_score)
		ini_close()
	}
	if (_actual_score > global.max_score) {
		if (global.on_challenge) {
			if (gxc_get_query_param("challenge") == global.ch_hs) {
				gxc_challenge_submit_score(global.max_score);
			}
		}
	}
	if (keyboard_check_pressed(vk_enter)) {
		_layer_x = 0
		obj_player._lives = 3
		obj_player.visible = true
		obj_player._cool_down = false
		obj_player._level = 1
		obj_player.x = 256
		obj_player.y = 352
		_actual_score = 0
		_local_time = irandom_range(10, 60)
		_level_step = 0
		alarm[0] = 10
		instance_destroy(obj_level_up)
		instance_destroy(obj_enemy_bullet)
	} else if (keyboard_check_pressed(vk_escape)) {
		if (global.on_challenge) game_end() else room_goto(room_menu)
	}
}