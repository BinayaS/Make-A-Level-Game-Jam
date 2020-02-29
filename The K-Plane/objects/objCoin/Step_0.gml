if(flip) {
	xScale = max(-1, xScale-0.04);
	yScale = max(-1, yScale-0.01);
} else {
	xScale = min(1, xScale+0.04);
	yScale = min(1, yScale+0.01);
}

if(xScale == -1) {
	flip = false;
} else if(xScale == 1) {
	flip = true;
}