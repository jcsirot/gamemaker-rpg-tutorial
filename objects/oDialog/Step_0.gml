/// @description Insert description here
// You can write your code in this editor

#macro COMMON_ATTRIBUTES "[scale,0.25]"
#macro OPTION_COUNT ChatterboxGetOptionCount(global.chatterbox)
#macro BALLOON_WIDTH 250

function formatText(text, withTypewriter, page=0) {
	if (OPTION_COUNT) {
		for (var i = 0; i < OPTION_COUNT; i++) {
			var optLine = ChatterboxGetOption(global.chatterbox, i);
			if (i == selectedOption) {
				optLine = "[#f4fc03]" + optLine + "[/c]";
			}
			if (text == "") {
				text = optLine;
			} else {
				text = text + "\n" + optLine;
			}
		}	
	}
	msgElement = scribble(COMMON_ATTRIBUTES + text).wrap(BALLOON_WIDTH - 16).page(page);
	if (withTypewriter) {
		msgElement = msgElement.typewriter_in(1, 0.3);
	}
	return msgElement;
}

/*
 * Continues the current dialog and updates the variables.
 *
 * @return false if the dialog is finished, otherwise true.
 */
function UpdateDialog() {
	if (initialized) {
		if (OPTION_COUNT) {
			ChatterboxSelect(global.chatterbox, selectedOption);
		} else {
			ChatterboxContinue(global.chatterbox);
			if (ChatterboxIsStopped(global.chatterbox)) {
				return false;	
			}
		}
		remainingPause = 15;
	} else {
		initialized = true;
	}
	showOptions = false;
	selectedOption = 0;
	var line = ChatterboxGetContent(global.chatterbox,0);
	var split = string_pos(":", line);
	var character = string_copy(line, 0, split-1);
	currentSpeaker = asset_get_index(character);
	message = string_copy(line, split+2, string_length(line)-(split+1));
	msgElement = formatText(message, true);
	return true;

}

function NextPage() {
	msgElement.page(msgElement.get_page() + 1).typewriter_in(1, 0.3);
}

function cycleOptions(order) {
	selectedOption = (selectedOption + order) % OPTION_COUNT;
	msgElement = formatText(message, false, msgElement.get_page());
}

if (!initialized) {
	ChatterboxJump(global.chatterbox, startNode);
	UpdateDialog();
}

if (--remainingPause > 0) {
	return;
}

x1 = currentSpeaker.x - 32;
x1 = clamp(x1, 8, RESOLUTION_W - BALLOON_WIDTH - 8);
y1 = currentSpeaker.y - 142;
x2 = x1 + BALLOON_WIDTH;
y2 = currentSpeaker.y - 32;
xv = currentSpeaker.x;
yv = currentSpeaker.y - 40;

showNextTextArrow = !msgElement.on_last_page();

if (msgElement.on_last_page() && OPTION_COUNT) {
	showOptions = true;
}

if (keyboard_check_pressed(vk_down) && showOptions) {
	cycleOptions(1);
} else if (keyboard_check_pressed(vk_up) && showOptions) {
	cycleOptions(-1);
} else if (keyboard_check_pressed(vk_space) || gamepad_button_check_pressed(global.gamepadId, GP_TRIANGLE)) {
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
	} else if (msgElement.get_typewriter_state() < 1) { // Text is fading in
		msgElement.typewriter_off();
	}
}
