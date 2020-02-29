objPlayer.jumpPower += 7;
objPlayer.wallJumpPower += 7;
audio_play_sound(sndPlayerPowerup, 50, false);
instance_destroy(self);