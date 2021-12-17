// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function NewTextBox(msg, bg = 1){
	var objType
	if (instance_exists(oText)) {
		objType = oTextQueued;
	} else {
		objType = oText;
	}
	
	with (instance_create_layer(0,0,"Instances", objType)) {
		message = msg;
		if (instance_exists(other)) {
			originInstance = other.id
		} else {
			originInstance = noone;
		}
		background = bg;
	}
	
	with (oPlayer) {
		if (state != PlayerStateLocked) {
			lastState = state;
			state = PlayerStateLocked;
		}
	}
}