with (obj_player) {
	if (!_inmunity && visible) {
		_lives--
		alarm[1]=30
		_inmunity = true
		var effect = instance_create_depth(x, y, depth, obj_effect)
		effect.sprite_index = sprite_index
		effect._duration = 2
	}
}
instance_destroy()