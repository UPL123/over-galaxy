with (obj_player) {
	if (!_inmunity) {
		_lives--
		alarm[1]=30
		_inmunity = true
	}
}
instance_destroy()