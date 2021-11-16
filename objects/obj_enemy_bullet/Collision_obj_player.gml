with (obj_player) {
	if (!_inmunity && _lives != 0) {
		_lives--
		alarm[1]=30
		_inmunity = true
		var effect = instance_create_depth(x, y, depth, obj_effect)
		effect.sprite_index = sprite_index
		effect._duration = 2
	}
}
instance_destroy()