// Camera Data
cam_x = camera_get_view_border_x(0);
cam_y = camera_get_view_border_y(0);

// Get player input
key_left = keyboard_check(vk_left) || keyboard_check(ord("A"));
key_right = keyboard_check(vk_right) || keyboard_check(ord("D"));
key_jump = keyboard_check(vk_up) || keyboard_check(ord("W"));
key_interact = keyboard_check(vk_space);

// Calculate Movement
hsp = (key_right - key_left) * walksp;
vsp += grv;
if (hsp != 0) {
	runflag = sign(hsp) * walksp;
}

// Jumping and Animation
if (!place_meeting(x,y+1,oPlatform)) {
	hsp = runflag;
	sprite_index = player[3];
}
else if (key_jump) {
	vsp = 0 - jmphght;
}
else {
	image_speed = 1;
	if (hsp != 0) {
		sprite_index = player[1];
	}
	else {
		hsp = runflag;
		if (runflag) sprite_index = player[2];
		else sprite_index = player[0];
	}
}

runflag -= sign(runflag);

if (hsp != 0) image_xscale = sign(hsp);

// Horizontal Collision
if (place_meeting(x+hsp,y,oPlatform)) 
{
	// Slope Functionality
	for (i = 1; i <= 3; i++) {
		if (!place_meeting(x+hsp,y-i,oPlatform)) {
			y -= i;
			hsp -= i;
			break;
		}
	}
	if (place_meeting(x+hsp,y,oPlatform)) {
		while (!place_meeting(x+sign(hsp),y,oPlatform)) 
		{
			x += sign(hsp);
		}
		hsp = 0;
	}
}
x += hsp;

// Vertical Collision
if (place_meeting(x,y+vsp,oPlatform)) 
{
	while (!place_meeting(x,y+sign(vsp),oPlatform)) 
	{
		y += sign(vsp);
	}
	vsp = 0;
}
y += vsp;

// Interaction with Dean
if (place_meeting(x,y,oDeanNPC) && key_interact) {
	scFreeze();
	scText("What is up Jenecuh?", 0.5, x+130, y+100);
}
// placeholder till I find more energy
	if (keyboard_check(vk_enter)) {
		scThaw();
		instance_destroy(oText);
	}