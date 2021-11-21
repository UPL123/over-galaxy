if (obj_player.visible && !_finished) {
	_layer_x++
}

layer_x("Stars", lerp(layer_get_x("Stars"), -_layer_x*obj_player._level, 0.1))
layer_x("Stars_2", lerp(layer_get_x("Stars_2"), -_layer_x/2*obj_player._level, 0.1))
if (obj_player.visible && !_finished) {
	if (_max_level != undefined) {
		if (obj_player._level == _max_level) {
			_finished = true
			instance_destroy(obj_level_up)
			instance_destroy(obj_enemy_bullet)
			var result = round(_destroyed_meteors*obj_player._level/(global.level+1))
			global._draw_xp = global.xp
			global.xp += result
			ini_open(working_directory + "/save.ini")
			ini_write_real("save", "xp", global.xp)
			ini_write_real("save", "level", global.level)
			ini_close()
		}
	}
	randomize()
	if (_level_step > 30*_difficulty) {
		_level_step = _local_time
	}
	if (_level_step == _local_time) {
		var _probability = irandom_range(_difficulty, 30*_difficulty)
		var _spawns = irandom_range(-1, 3)
		if (_probability <= 3*_difficulty) {
			instance_create_depth(room_width+(sprite_get_width(spr_level_up)*2), irandom_range(0, room_height), depth, obj_level_up)
		} else {
			repeat(_spawns) {
				instance_create_depth(room_width+(sprite_get_width(spr_bomb)*2), irandom_range(0, room_height), depth, obj_bomb_1)
			}
		}
		_level_step = 0
		_local_time = irandom_range(10, 60)
	} else {
		_level_step+=_difficulty
	}
	if (_actual_score > real(global.max_score)) { 
		global.max_score = _actual_score
	}
} else if (!obj_player.visible) {
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
		if (!global.auto_shoot) {
			alarm[0]=15/obj_player._level
		} else {
			alarm[0]=15/obj_player._level*2
		}
		instance_destroy(obj_level_up)
		instance_destroy(obj_enemy_bullet)
	} else if (keyboard_check_pressed(vk_escape)) {
		if (global.on_challenge) game_end() else room_goto(room_menu)
	}
} else if (_finished) {
	if (global.current_level = global.levels) {
		global.levels++
		ini_open(working_directory + "/save.ini")
		ini_write_real("save", "levels", global.levels)
		ini_close()
	}
	if (_actual_score >= global.max_score) { 
		ini_open(working_directory + "/save.ini")
		ini_write_real("save", "max_score", global.max_score)
		ini_close()
	}
	obj_player._cool_down = true
	if (global._draw_xp != global.xp) {
		global._draw_xp ++
	}
	if (global._draw_xp >= 360) {
		global._draw_xp = 0
		global.level++
		global.xp -= 360
		global.xp = global.xp / global.level+1
		ini_open(working_directory + "/save.ini")
		ini_write_real("save", "xp", global.xp)
		ini_write_real("save", "level", global.level)
		ini_close()
	}
	if (keyboard_check_pressed(vk_enter)) {
		if (global._draw_xp != global.xp) {
			global._draw_xp = global.xp
			repeat (global.xp/360) {
				if (global.xp >= 360) {
					global.level++
					global.xp -= 360
					global.xp = global.xp / global.level+1
					global._draw_xp = global.xp
					ini_open(working_directory + "/save.ini")
					ini_write_real("save", "xp", global.xp)
					ini_write_real("save", "level", global.level)
					ini_close()
				}
			}
		}
		_destroyed_meteors = 0
		_finished = false
		_layer_x = 0
		obj_player._lives = 3
		obj_player._cool_down = false
		obj_player._level = 1
		obj_player.x = 256
		obj_player.y = 352
		global.current_level++
		_difficulty++
		_local_time = irandom_range(10, 60)
		_level_step = 0
		if (!global.auto_shoot) {
			alarm[0]=15/obj_player._level
		} else {
			alarm[0]=15/obj_player._level*2
		}
		instance_destroy(obj_level_up)
		instance_destroy(obj_enemy_bullet)
	} else if (keyboard_check_pressed(vk_escape)) {
		if (global.on_challenge) game_end() else room_goto(room_menu)
	}
}