/// @description Insert description here
// You can write your code in this editor

#macro IS_DIALOG_FINISHED (array_length(dialog) - 1 == currentIndex)
#macro IS_LAST_LINE (array_length(variable_struct_get(dialog[currentIndex], "text")) - 1 == currentLineIndex)


function GetTalker(dialog, index) {
	return asset_get_index(variable_struct_get(dialog[index], "character"));
}

function GetLine(dialog, index, line) {
	return variable_struct_get(dialog[index], "text")[line];
}

if (currentIndex == -1) {
	currentIndex = 0;
	currentLineIndex = 0;
	currentTalker = GetTalker(dialog, currentIndex);
	message = GetLine(dialog, currentIndex, currentLineIndex);
}


if (--remainingPause > 0) {
	return;
}

x1 = currentTalker.x;
y1 = currentTalker.y - 102;
x2 = currentTalker.x;
y2 = currentTalker.y - 32;
xv = currentTalker.x;
yv = currentTalker.y - 40;

x1Target = currentTalker.x - 40;

x1Target = clamp(x1Target, 0, RESOLUTION_W-200);
x2Target = x1Target + string_width(message) + 32;

// lerpProgress += (1 - lerpProgress) / 15;
textProgress += global.testSpeed;


x1 = lerp(x1, x1Target, lerpProgress);
x2 = lerp(x2, x2Target, lerpProgress);

showNextTextArrow = !IS_LAST_LINE;

if (keyboard_check_pressed(vk_space) || gamepad_button_check_pressed(global.gamepadId, GP_TRIANGLE)) {
	var msgLength = string_length(message);
	if (textProgress >= msgLength) {
		if (IS_DIALOG_FINISHED) {
			instance_destroy();
			with (oPlayer) {
				state = lastState;
			}
		} else {		
			if (IS_LAST_LINE) {
				currentIndex++;
				currentLineIndex = 0;
				currentTalker = GetTalker(dialog, currentIndex);
				remainingPause = 15;
			} else {
				currentLineIndex++;
				textProgress = 0;
			}
			message = GetLine(dialog, currentIndex, currentLineIndex);
			textProgress = 0;
		}
	} else if (textProgress >= 2) {
		textProgress = msgLength;
	}
}
