if(!dead) {
	dead = true;
	audio_play_sound(sndPlayerDeath, 50, false);
	objBoss.state = bossStates.reset;
}