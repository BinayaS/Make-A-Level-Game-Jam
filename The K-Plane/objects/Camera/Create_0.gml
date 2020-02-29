window_set_fullscreen(true);

camera = camera_create();

view_width = 1280;
view_height = 720;

var vm = matrix_build_lookat(x, y, -10, x, y, 0, 0, 1, 0);
var pm = matrix_build_projection_ortho(view_width, view_height, 1, 10000);

camera_set_view_mat(camera, vm);
camera_set_proj_mat(camera, pm);

view_camera[0] = camera;

toFollow = objPlayer;
gotoX = x;
gotoY = y;