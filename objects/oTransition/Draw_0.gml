// Draw fade

if (mode != TRANS_MODE.OFF) {
	draw_set_color(c_black);
	draw_set_alpha(percent);
	draw_rectangle(0,0,w,h,false);	
	//draw_rectangle(0,0,w,percent*h_half,false);
	//draw_rectangle(0,h,w,h - (percent*h_half),false);
	draw_set_alpha(1);
}

// for testing purposes
// draw_set_color(c_white);
// draw_set_alpha(1);
// draw_text(50, 50, string(percent));