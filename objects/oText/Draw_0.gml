// Add letters over time

if (time < textLength) {
	time += spd;
	print = string_copy(text, 0, time);
}

// Render text
draw_set_font(font);

draw_sprite(sTextbox, image_index, x, y);
draw_set_color(c_green);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_text_ext (
	x + padding,
	y + padding,
	print,
	fontSize*1.5,
	maxLength
);