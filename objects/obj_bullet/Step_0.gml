hspeed=15
if (place_meeting(x, y, obj_enemy_bullet)) {
	alarm[0]=1
}
if (x > room_width+12) {
	instance_destroy()
}