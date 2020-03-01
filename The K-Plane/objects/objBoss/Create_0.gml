start = false;
state = bossStates.chase;

startX = x;
startY = y;

timerDelay = 30;
waitDelay = 60*3;
timer = waitDelay;

fall = 10;
rise = -15;
vspd = fall;

enum bossStates {
	chase,
	wait,
	drop,
	rise,
	reset,
	dead
}

impact = false;

hit = false;
maxHp = 5;
hp = maxHp;