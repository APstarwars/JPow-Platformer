// scText("Text",speed,x,y)

txt = instance_create_layer(argument2, argument3, "Text", oText);
with(txt) {
	padding = 16;
	maxLength = 500;
	text = argument0;
	spd = argument1;
	font = fText;
	
	textLength = string_length(text);
	fontSize = font_get_size(font);
}