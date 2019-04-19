// Get player input
key_left = keyboard_check(vk_left) || keyboard_check(ord("A"));
key_right = keyboard_check(vk_right) || keyboard_check(ord("D"));
key_jump = keyboard_check(vk_up) || keyboard_check(ord("W"));

// Calculate Movement
hsp = (key_right - key_left) * walksp;
vsp += grv;
if (hsp != 0) {
	runflag = sign(hsp) * walksp;
}

// Jumping and Animation
if (!place_meeting(x,y+1,oWall)) {
	hsp = runflag;
	image_speed = 1;
	sprite_index = sJenecaW;
}
else if (key_jump) {
	vsp = 0 - jmphght;
}
else {
	image_speed = 1;
	if (hsp != 0) {
		sprite_index = sJenecaW;
	}
	else {
		hsp = runflag;
		if (runflag) sprite_index = sJenecaS;
		else sprite_index = sJeneca;
	}
}

runflag -= sign(runflag);

if (hsp != 0) image_xscale = sign(hsp);

// Horizontal Collision
if (place_meeting(x+hsp,y,oWall)) 
{
	while (!place_meeting(x+sign(hsp),y,oWall)) 
	{
		x += sign(hsp);
	}
	hsp = 0;
}
x += hsp;

// Vertical Collision
if (place_meeting(x,y+vsp,oWall)) 
{
	while (!place_meeting(x,y+sign(vsp),oWall)) 
	{
		y += sign(vsp);
	}
	vsp = 0;
}
y += vsp;