_x++

layer_x("Stars", _x)
layer_x("Stars_2", _x/2)

layer_y("Stars", _x/2)
layer_y("Stars_2", _x/4)

if (_stage = 0) {
	_alpha++
	if (keyboard_check_pressed(vk_enter)) {
		_stage = 1
	}
}

if (_stage = 1) {
	_alpha++
	__y = lerp(__y, 780, 0.1)
	_y = lerp(_y,  room_height/2-180, 0.1)
}

if (_stage = 2) {
	if (keyboard_check_pressed(vk_down)) {
		audio_play_sound(snd_move, 0, false)
		if (_option != 2) {
			_option++
		} else {
			_option = 0
		}
	}
	if (keyboard_check_pressed(vk_up)) {
		audio_play_sound(snd_move, 0, false)
		if (_option != 0) {
			_option--
		} else {
			_option = 2
		}
	}
	if (_menu = 0) {
		if (keyboard_check_pressed(vk_enter)) {
			audio_play_sound(snd_move, 0, false)
			switch _option {
				case 0: 
					_menu = 1
					_option = 0
				break;
				case 1: 
					_menu = 2
					_option = 0
				break;
				case 2: 
					game_end()
				break;
			}
		}
	}
	if (_menu = 1) {
		switch _option {
			case 0:
				if (keyboard_check_pressed(vk_right) && global.current_level != global.levels) {
					audio_play_sound(snd_move, 0, false)
					global.current_level++
				}
				if (keyboard_check_pressed(vk_left) && global.current_level != 0) {
					audio_play_sound(snd_move, 0, false)
					global.current_level--
				}
			break;	
		}
		if (keyboard_check_pressed(vk_enter)) {
			audio_play_sound(snd_move, 0, false)
			switch _option {
				case 0:
					global.max_level = 5
					if (_confirm) {
						room_goto_next()
					} else {
						_confirm = true;
					}
					break;
				
				case 1:
					global.max_level = undefined
					global.current_level = 1
					if (_confirm) {
						room_goto_next()
					} else {
						_confirm = true;
					}
					break;
				
				case 2:
					_menu = 0
					_option = 0
					_confirm = false
					break;
			}
		}
	}
	if (_menu = 2) {
		switch _option {
			case 0:
				if (keyboard_check_pressed(vk_right) && global._volume_slider != 4) {
					audio_play_sound(snd_move, 0, false)
					global._volume_slider++
				}
				if (keyboard_check_pressed(vk_left) && global._volume_slider != 0) {
					audio_play_sound(snd_move, 0, false)
					global._volume_slider--
				}
			break;
		}
		if (keyboard_check_pressed(vk_enter)) {
			audio_play_sound(snd_move, 0, false)
			switch _option {
				case 1:
					ini_open(working_directory + "/save.ini")
					global.auto_shoot = !global.auto_shoot
					ini_write_real("save", "auto_shoot", global.auto_shoot)
					ini_close()
				break;
				case 2: 
					_menu = 0
					_option = 1
				break;
			}
		}
	}
}