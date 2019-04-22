/// Jeneca is here to save the day!
player[0] = sJeneca;   // 0 = neutral sprite
player[1] = sJenecaW;  // 1 = walk sprite
player[2] = sJenecaS;  // 2 = slide sprite
player[3] = sJenecaA;  // 3 = jump sprite
sprite_index = player[0];

vsp = 0;
hsp = 0;
// When changing these, change in scThaw as well
grv = 0.3;
walksp = 4;
jmphght = 6;

runflag = 0;

// Camera Data
cam_x = camera_get_view_x(0);
cam_y = camera_get_view_y(0);