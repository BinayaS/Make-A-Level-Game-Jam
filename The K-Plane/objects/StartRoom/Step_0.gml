if(angle == 15) {
	angleFlip = true;
}
if(angle == -15) {
	angleFlip = false;	
}

if(!angleFlip) {
	angle = min(15, angle+1);
	xScale = min(3, xScale+0.1);
	yScale = max(0.5, yScale-0.1);
} else {
	angle = max(-15, angle-1);
	xScale = max(1, xScale-0.1);
	yScale = min(1, yScale+0.1);
}