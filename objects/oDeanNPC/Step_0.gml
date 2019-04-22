// Interaction with Dean

key_interact = keyboard_check(vk_space);

if (place_meeting(x,y,oPlayer) && key_interact) {
	instance_create_layer(x,y,"Transition",oDeanintro);
}