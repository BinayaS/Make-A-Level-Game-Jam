if(distance_to_object(objPlayer) < 64) {
	if(!collision_line(x, y, objPlayer.x, objPlayer.y, objSolid, false, true)) {
		if(objResourceController.keys > 0) {
			objResourceController.keys -= 1;
			audio_play_sound(sndDoorOpen, 50, false);
			instance_destroy(self);
		}
	}
}