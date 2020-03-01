if(backgroundMusic) {
	audio_stop_sound(sndBossMusic);
	if(!audio_is_playing(sndMusic)) {
		audio_play_sound(sndMusic, 10, true);	
	}
} else {
	audio_stop_sound(sndMusic);
	if(!audio_is_playing(sndBossMusic)) {
		audio_play_sound(sndBossMusic, 10, true);	
	}
}