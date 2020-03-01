timer = max(0, timer-1);

if(timer == 0) {
	timer = timerDelay;
	hspd = jumpHspd;
	vspd = jumpVspd;
	xScale = image_xscale*0.8;
	yScale = image_yscale*1.2;
}

if(hspd > 0) {
	hspd = max(hspd-deaccel, 0);
} else {
	hspd = min(hspd+deaccel, 0);
}

//Set onGround
if(place_meeting(x, y + 1, objSolid)) {
	if(!onGround) {
		xScale = image_xscale*1.4;
		yScale = image_yscale*0.8;
		if(distance_to_object(objPlayer) < 1080/2) {
			audio_play_sound(sndBlobLand, 50, false);
		}
	}
	onGround = true;
} else {
	onGround = false;
}

vspd += grav;

if(place_meeting(x + 1, y, objSolidBlock) || place_meeting(x - 1, y, objSolidBlock)) {
	if(!flipping) {
		jumpHspd *= -1;
	}
	flipping = true;
} else {
	flipping = false;	
}

//Vertical
repeat(abs(vspd)) {
	if (!place_meeting(x, y + sign(vspd), objSolid))
	    y += sign(vspd);
	else {
	    vspd = 0;
	    break;
	}
}

//Horizontal
repeat(abs(hspd)) {
	
	//Move up slope
	if (place_meeting(x + sign(hspd), y, objSolid) && 
		place_meeting(x + sign(hspd), y - 1, objSolid) && 
		!place_meeting(x + sign(hspd), y - 2, objSolid)) {
	    y -= 2;
	} else if (place_meeting(x + sign(hspd), y, objSolid) && 
		!place_meeting(x + sign(hspd), y - 1, objSolid)) {
	    --y;
	}
    
	//Move down slope
	if (!place_meeting(x + sign(hspd), y, objSolid) && 
		!place_meeting(x + sign(hspd), y + 1, objSolid) && 
		!place_meeting(x + sign(hspd), y + 2, objSolid) && 
		place_meeting(x + sign(hspd), y + 3, objSolid)) {
	    y += 2; 
	} else if (!place_meeting(x + sign(hspd), y, objSolid) && 
		!place_meeting(x + sign(hspd), y + 1, objSolid) && 
		place_meeting(x + sign(hspd), y + 2, objSolid)) {
	    ++y; 
	}
	
	if (!place_meeting(x + sign(hspd), y, objSolid))
	    x += sign(hspd); 
	else {
	    hspd = 0;
	    break;
	}
}

//Reset scale
xScale = lerp(xScale, 1, 0.1);
yScale = lerp(yScale, 1, 0.1);