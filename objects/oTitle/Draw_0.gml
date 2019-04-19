// Draws the title screen

var cx = camera_get_view_x(view_camera[0]);
var cy = camera_get_view_y(view_camera[0]);
var cw = camera_get_view_width(view_camera[0]);

draw_set_font(fTitle);
draw_set_colour(c_black);
draw_set_alpha(1);
draw_text(cx + (cw / 2) - 300, cy + 100, string("What's Up Homie?"));

if (flash % 2 == 0) {
	draw_set_colour(c_white);
	draw_text(cx + (cw / 2) - 300, cy + 500, string("Press Start Bitch"));
}