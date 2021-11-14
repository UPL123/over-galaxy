var _h = sprite_get_height(sprite_index)

image_angle++

if (y > room_height+_h*2 || y < 0-_h*2) {
	instance_destroy()
}

if (x > room_width+_h*2 || x < 0-_h*2) {
	instance_destroy()
}

if (place_meeting(x, y, obj_bullet)) {
	instance_destroy()
}