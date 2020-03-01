if(selected == false) {
	audio_play_sound(sndCheckpointGet, 50, false);
}
objCheckpoint.selected = false;
selected = true;
other.spawnX = x;
other.spawnY = y+sprite_height/2;