spawnX = x;
spawnY = y;

hspd = 0;
vspd = 0;

maxVspd = 20;
grav = 0.8;
accel = 2;
deaccel = 1.6;
deaccelInAir = 1.4;
spd = 8;
jumpPower = 14;

wallJumpPower = 14;
wallJumpHspd = 14;
wallSlidegrav = 0.4;
wallSlideMaxVspd = 1.5;

onGround = false;
canJump = false;
featherJump = false;
onWall = 0;

jumpFeatheringAmount = 6;
jumpFeatheringTimer = 0;

xScale = image_xscale;
yScale = image_yscale;
angle = image_angle;
targetAngle = 0;

dead = false;

audio_falloff_set_model(audio_falloff_linear_distance);