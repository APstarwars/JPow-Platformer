// If start is pressed

if (keyboard_check_pressed(vk_anykey)) {
	flash++;
}

if (flash > 0) {
	if(cooldown == 10) {
		flash++;
	}
	cooldown--;
	if(cooldown <= 0) {
		cooldown = 10;
	}
}

if (flash > 11) {
	sTransition(TRANS_MODE.NEXT);
}