if (obj_player.visible) {
	obj_player._level++
	var effect = instance_create_depth(x, y, depth, obj_effect)
	effect.sprite_index = sprite_index
	effect._duration = 2
	instance_destroy()
}