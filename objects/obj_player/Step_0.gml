var _h = sprite_get_height(sprite_index)

if (visible) {
	if (keyboard_check(vk_down)) {
		vspeed = 6+_level/2
	} else if (keyboard_check(vk_up)) {
		vspeed = -6-_level-1/2
	} else vspeed = 0

	if (keyboard_check(vk_right)) {
		hspeed = 6+_level/2
	} else if (keyboard_check(vk_left)) {
		hspeed = -6-_level-1/2
	} else hspeed = 0
}

if (y > room_height+_h*2) {
	y = 0-_h
}

if (y < 0-_h*2) {
	y = room_height+_h
}

if (x > room_width+_h*2) {
	x = 0-_h
}

if (x < 0-_h*2) {
	x = room_width+_h
}

if (_lives = 0) {
	_inmunity = false
	visible = false
	_cool_down = true
}

if (!visible) {
	_lives = 0
}


if (_inmunity) {
	image_blend = c_gray
} else {
	image_blend = c_white
}

if (keyboard_check_pressed(vk_enter) && !_cool_down && !global.auto_shoot) {
	_cool_down = true
	alarm[0] = 15/_level
	audio_play_sound(snd_shoot, 0, false)
	instance_create_depth(x+(sprite_get_width(sprite_index)/2+sprite_get_width(spr_bullet)/2), y-(sprite_get_width(spr_bullet)/2)+4, depth-50, obj_bullet)
}

if (!_cool_down && global.auto_shoot) {
	_cool_down = true
	alarm[0] = 15/_level*2
	audio_play_sound(snd_shoot, 0, false)
	instance_create_depth(x+(sprite_get_width(sprite_index)/2+sprite_get_width(spr_bullet)/2), y-(sprite_get_width(spr_bullet)/2)+4, depth-50, obj_bullet)
}