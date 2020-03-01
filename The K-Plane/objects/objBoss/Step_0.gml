if(start) {
	switch(state) {
		case bossStates.chase:
			hit = false;
			x = lerp(x, objPlayer.x, 0.1);
			if(abs(x - objPlayer.x) <= 32) {
				state = bossStates.wait;
				timer = timerDelay;
			}
		break;
		
		case bossStates.wait:
			timer = max(0, timer-1);
			if(timer == 0) {
				timer = 30;
				vspd = fall;
				state = bossStates.drop;
			}
		break;
		
		case bossStates.drop:
			vspd += 4;
		
			//Vertical
			if(place_meeting(x, y + vspd, objSolid)) {
				while(!place_meeting(x, y + sign(vspd), objSolid)) {
					y += sign(vspd);	
				}
				if(!impact) {
					audio_play_sound(sndBossDrop, 30, false);
					impact = true;
				}
				vspd = 0;
			}
			
			y += vspd;
			
			if(vspd == 0) {
				timer = max(0, timer-1);
				if(timer == 0) {
					state = bossStates.rise;
					vspd = rise;
				}	
			}
		break;
		
		case bossStates.rise:
			impact = false;
		
			//Vertical
			if(place_meeting(x, y + vspd, objSolid)) {
				while(!place_meeting(x, y + sign(vspd), objSolid)) {
					y += sign(vspd);	
				}
				vspd = 0;
			}
			
			y += vspd;
			
			if(vspd == 0) {
				timer = max(0, timer-1);
				if(timer == 0) {
					state = bossStates.chase;
					timer = waitDelay;
				}	
			}
		break;
		
		case bossStates.reset:
			
			hp = maxHp;
			
			x = lerp(x, startX, 0.05);
			y = lerp(y, startY, 0.05);
			
			if(abs(x-startX) < 5 && abs(y-startY) < 5) {
				start = false;
				state = bossStates.chase;
			}
		break;
		
		case bossStates.dead:
			if(!instance_exists(objEnd)) {
				instance_create_layer(3104, 640, "Solids_and_controllers", objEnd);
				audio_play_sound(sndBossDead, 30, false);
			}
			image_angle += 10;
			image_xscale = lerp(image_xscale, 0, 0.1);
			image_yscale = lerp(image_yscale, 0, 0.1);
		break;
	}
}

if(hp <= 0) {
	state = bossStates.dead;	
}

if(hit) {
	sprite_index = sprBossHit;
} else {
	sprite_index = sprBoss;	
}