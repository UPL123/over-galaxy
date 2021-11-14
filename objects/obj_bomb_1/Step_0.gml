image_angle++
if (x < _destroy_x) {
	for (var i = 0; i < 3*obj_player._level; i++) {
		var _bomb = instance_create_depth(x, y, 0, obj_little_bomb)
		_bomb.direction = 360/(3*obj_player._level)*i
		_bomb.speed = 2*obj_player._level/2
	}
	instance_destroy()
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
}