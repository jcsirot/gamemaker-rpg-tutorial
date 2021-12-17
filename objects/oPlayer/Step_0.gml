/// @description Insert description here
keyLeft = keyboard_check(vk_left) || keyboard_check(ord("Q")) || (gamepad_axis_value(global.gamepadId, gp_axislh) < 0);
keyRight = keyboard_check(vk_right) || keyboard_check(ord("D")) || (gamepad_axis_value(global.gamepadId, gp_axislh) > 0);
keyUp = keyboard_check(vk_up) || keyboard_check(ord("Z")) || (gamepad_axis_value(global.gamepadId, gp_axislv) < 0);
keyDown = keyboard_check(vk_down) || keyboard_check(ord("S")) || (gamepad_axis_value(global.gamepadId, gp_axislv) > 0);
keyActivate = keyboard_check_pressed(vk_space) || gamepad_button_check_pressed(global.gamepadId, GP_CROSS);
keyAttack = keyboard_check_pressed(vk_shift);
keyItem = keyboard_check_pressed(ord("E"));

inputAngle = point_direction(0, 0, keyRight - keyLeft, keyDown - keyUp);
inputMagnitude = (keyRight - keyLeft != 0) || (keyDown - keyUp != 0);

if (! global.gamePaused) {
	script_execute(state);
}

depth = -bbox_bottom;