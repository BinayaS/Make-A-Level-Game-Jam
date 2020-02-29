right = false;
left = false;
top = false;
bottom = false;

if(place_meeting(bbox_right + 1, y, objSolid)) {
	right = true;	
}

if(place_meeting(x - 1, y, objSolid)) {
	left = true;	
}

if(place_meeting(x, y - 1, objSolid)) {
	top = true;	
}

if(place_meeting(x, bbox_bottom + 1, objSolid)) {
	bottom = true;	
}

if(!top && !right) {
	sprite_index = sprSolidSlopeBottomLeft;	
} else if(!top && !left) {
	sprite_index = sprSolidSlopeBottomRight;
} else if(!bottom && !right) {
	sprite_index = sprSolidSlopeTopLeft;	
} else if(!bottom && !left) {
	sprite_index = sprSolidSlopeTopRight;
}