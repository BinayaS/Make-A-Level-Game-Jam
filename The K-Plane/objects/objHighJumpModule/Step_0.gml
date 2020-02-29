if(flip) {
	image_xscale = max(-1, image_xscale-0.02);
	x = lerp(x, targetX+random_range(-randomness, randomness), 0.1);
	y = lerp(y, targetY+random_range(-randomness, randomness), 0.1);
} else {
	image_xscale = min(1, image_xscale+0.02);
}

if(image_xscale == -1) {
	flip = false;
} else if(image_xscale == 1) {
	flip = true;
}