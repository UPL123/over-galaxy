_alpha++
image_angle++
if (x < _destroy_x) {
	for (var i = 0; i < 3*obj_player._level; i++) {
		var _bomb = instance_create_depth(x, y, 0, obj_little_bomb)
		_bomb.direction = 360/(3*obj_player._level)*i
		_bomb.speed = 2*obj_player._level/2
	}
	instance_destroy()
	var effect = instance_create_depth(x, y, depth, obj_effect)
	effect.sprite_index = sprite_index
	effect._duration = 2
}

if (place_meeting(x, y, obj_bullet)) {
	_lives--
}

if (_lives = 0) {
	for (var i = 0; i < 3*obj_player._level; i++) {
		var _bomb = instance_create_depth(x, y, 0, obj_little_bomb)
		_bomb.direction = 360/(3*obj_player._level)*i
		_bomb.speed = 2*obj_player._level/2
	}
	instance_destroy()
	var effect = instance_create_depth(x, y, depth, obj_effect)
	effect.sprite_index = sprite_index
	effect._duration = 2
	var _effect = instance_create_depth(_destroy_x, y, depth, obj_effect)
	_effect.sprite_index = sprite_index
	_effect.image_alpha = sin(_alpha * 25)
	_effect._duration = 2
}