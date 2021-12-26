/// @description Insert description here
// You can write your code in this editor

#macro COMMON_ATTRIBUTES "[scale,0.5]"

/*
 * Continues the current dialog and updates the variables.
 *
 * @return false if the dialog is finished, otherwise true.
 */
function UpdateDialog() {
	if (initialized) {
		ChatterboxContinue(global.chatterbox);
		if (ChatterboxIsStopped(global.chatterbox)) {
			return false;	
		}
		remainingPause = 15;
	} else {
		initialized = true;
	}
	var line = ChatterboxGetContent(global.chatterbox,0);
	var split = string_pos(":", line);
	var character = string_copy(line, 0, split-1);
	currentSpeaker = asset_get_index(character);
	var text = string_copy(line, split+2, string_length(line)-(split+1));
	msgElement = scribble(COMMON_ATTRIBUTES + text).wrap(200 - 32).page(0).typewriter_in(1, 0.3);
	return true;
}

function NextPage() {
	msgElement.page(msgElement.get_page() + 1).typewriter_in(1, 0.3);
}


if (!initialized) {
	ChatterboxJump(global.chatterbox, startNode);
	UpdateDialog();
}


if (--remainingPause > 0) {
	return;
}

x1 = currentSpeaker.x - 32;
x1 = clamp(x1, 8, RESOLUTION_W - 200 - 8);
y1 = currentSpeaker.y - 102;
x2 = x1 + 200;
y2 = currentSpeaker.y - 32;
xv = currentSpeaker.x;
yv = currentSpeaker.y - 40;

showNextTextArrow = !msgElement.on_last_page();

if (keyboard_check_pressed(vk_space) || gamepad_button_check_pressed(global.gamepadId, GP_TRIANGLE)) {
	if (msgElement.get_typewriter_state() == 1) { // Text has been printed	
		if (msgElement.on_last_page()) {
			if (! UpdateDialog()) {
				instance_destroy();
				with (oPlayer) {
					state = lastState;
				}
			}
		} else {
			NextPage();
		}
	} else if (msgElement.get_typewriter_state() < 1) {
		msgElement.typewriter_off();
	}
}
