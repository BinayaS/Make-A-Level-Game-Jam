//Input
left = keyboard_check(ord("A"));
right = keyboard_check(ord("D"));
jump = keyboard_check_pressed(ord("K")) || keyboard_check_pressed(vk_space);
//shoot = keyboard_check(ord("J"));
var horizontal = right - left;

if(!dead) {
	#region movement & collision
	//Feather jumping
	if(jump) {
		featherJump = true;
		jumpFeatheringTimer = jumpFeatheringAmount;
	}
	jumpFeatheringTimer = max(jumpFeatheringTimer-1, 0)
	if(jumpFeatheringTimer == 0) {
		featherJump = false;	
	}

	//Set hspd
	if(horizontal > 0) {
		hspd = min(hspd+accel, spd);
	} else if(horizontal < 0) {
		hspd = max(hspd-accel, -spd);
	} else {
		if(!onGround) {
			if(hspd > 0) {
				hspd = max(hspd-deaccelInAir, 0);
			} else {
				hspd = min(hspd+deaccelInAir, 0);
			}
		} else {
			if(hspd > 0) {
				hspd = max(hspd-deaccel, 0);
			} else {
				hspd = min(hspd+deaccel, 0);
			}
		}
	}

	//Set onGround
	if(place_meeting(x, y + 1, objSolid)) {
		if(!onGround) {
			audio_play_sound(sndPlayerLand, 50, false);
			xScale = image_xscale*1.4;
			yScale = image_yscale*0.8;	
		}
		onGround = true;
		canJump = true;
	} else {
		onGround = false;
	}

	//Set onWall
	if(!onGround) {
		onWall = (place_meeting(x + 1, y, objSolid) - place_meeting(x - 1, y, objSolid));
	} else {
		onWall = 0;
	}

	//Set grav
	var actualGrav = grav;
	var vspdMax = maxVspd;
	if(onWall != 0 && vspd > 0) {
		actualGrav = wallSlidegrav;
		vspdMax = wallSlideMaxVspd;
		xScale = lerp(xScale, image_xscale*0.8, 0.1);
		yScale = lerp(yScale, image_yscale*0.8, 0.1);
	}

	//Set vspd
	vspd += actualGrav;
	vspd = clamp(vspd, -vspdMax, vspdMax);

	//If jump input
	if(featherJump) {
		if(!onGround && onWall != 0) {
			audio_play_sound(sndPlayerJump, 50, false);
			vspd = -wallJumpPower;
			hspd += -onWall * wallJumpHspd;
			canJump = false;
			featherJump = false;
			xScale = image_xscale*0.8;
			yScale = image_yscale*1.2;
		} else if(canJump) {
			audio_play_sound(sndPlayerJump, 50, false);
			vspd = -jumpPower;
			canJump = false;
			featherJump = false;
			xScale = image_xscale*0.8;
			yScale = image_yscale*1.2;
		}
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

	if(onWall == 0) {
		if(hspd > 0) {
			targetAngle = lerp(targetAngle, -15, 0.2);
		} else if(hspd < 0) {
			targetAngle = lerp(targetAngle, 15, 0.2);
		} else {
			targetAngle = lerp(targetAngle, 0, 0.2);
		}
	} else {
		targetAngle = lerp(targetAngle, 0, 0.2);
	}

	//Reset scale
	xScale = lerp(xScale, 1, 0.1);
	yScale = lerp(yScale, 1, 0.1);
	angle = lerp(targetAngle, 0, 0.01);
	#endregion
}

audio_listener_position(x, y, 0);

if(dead && !audio_is_playing(sndPlayerDeath)) {
	dead = false;
	objMusic.backgroundMusic = true;
	x = spawnX;
	y = spawnY;
}