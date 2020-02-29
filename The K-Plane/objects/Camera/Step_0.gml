x = clamp(lerp(x, gotoX, 0.15), view_width/2, room_width-view_width/2);
y = clamp(lerp(y, gotoY, 0.15), view_height/2, room_height-view_height/2);

if(toFollow != noone) {
	gotoX = toFollow.x;
	gotoY = toFollow.y;
}

var vm = matrix_build_lookat(x, y, -10, x, y, 0, 0, 1, 0);
camera_set_view_mat(camera, vm);