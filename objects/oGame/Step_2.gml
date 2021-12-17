/// @description Insert description here
// You can write your code in this editor

if (keyboard_check_pressed(vk_escape) || gamepad_button_check_pressed(global.gamepadId, gp_start)) {
	global.gamePaused = !global.gamePaused;
	
	if (global.gamePaused) {
		with (all) {
			gamePausedImageSpeed = image_speed;
			imageSpeed = 0;
		} 
	} else {
		with (all) {
			image_speed = gamePausedImageSpeed;	
		}
	}
}