image_alpha -= 0.1  / _duration
image_xscale += 1 / _duration
image_yscale += 1 / _duration

if (image_alpha == 0) {
	instance_destroy()
}