if(hit == false) {
	hit = true;
	hp -= 1;
	audio_play_sound(sndBossHurt, 30, false);
}