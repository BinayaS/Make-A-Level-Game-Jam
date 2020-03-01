timer = max(0, timer-1);

if(timer == 0) {
	if(distance_to_object(objPlayer) < 1080/2 && !audio_is_playing(sndShootyBlockShot)) {
		audio_play_sound(sndShootyBlockShot, 50, false);
	}
	timer = timerDelay;
	with(instance_create_layer(x + sprite_width/2, y, "Solids_and_controllers", objShootyBlockShot)) {
		hspd = other.bulletSpd * other.image_xscale;
	}
	xScale = image_xscale*0.6;
	yScale = image_yscale*1.6;
}

//Reset scale
xScale = lerp(xScale, xScaleSign, 0.1);
yScale = lerp(yScale, yScaleSign, 0.1);