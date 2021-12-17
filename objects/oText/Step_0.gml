/// @description Insert description here
// You can write your code in this editor

x1 = oPlayer.x;
y1 = oPlayer.y - 102;
x2 = oPlayer.x;
y2 = oPlayer.y - 32;
xv = oPlayer.x;
yv = oPlayer.y - 40;

x1Target = oPlayer.x - 40;

x1Target = clamp(x1Target, 0, RESOLUTION_W-200);
x2Target = x1Target + 200;

// lerpProgress += (1 - lerpProgress) / 15;
textProgress += global.testSpeed;


x1 = lerp(x1, x1Target, lerpProgress);
x2 = lerp(x2, x2Target, lerpProgress);

showNextTextArrow = instance_exists(oTextQueued);

if (keyboard_check_pressed(vk_space) || gamepad_button_check_pressed(global.gamepadId, GP_CROSS)) {
	var msgLength = string_length(message);
	if (textProgress >= msgLength) {
		instance_destroy();
		if (instance_exists(oTextQueued)) {
			with(oTextQueued) {
				ticket--;
			}
		} else {
			with (oPlayer) {
				state = lastState;
			}
		}
	} else if (textProgress >= 2) {
		textProgress = msgLength;
	}
}

