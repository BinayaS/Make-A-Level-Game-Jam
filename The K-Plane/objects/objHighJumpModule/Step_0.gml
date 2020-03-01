if(flip) {
	xScale = max(-1, xScale-0.02);
	x = lerp(x, targetX+random_range(-randomness, randomness), 0.1);
	y = lerp(y, targetY+random_range(-randomness, randomness), 0.1);
} else {
	xScale = min(1, xScale+0.02);
}

if(xScale == -1) {
	flip = false;
} else if(xScale == 1) {
	flip = true;
}