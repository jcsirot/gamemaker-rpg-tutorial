// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function NewDialog(dialogFileName, bg = 1){
	
	if (file_exists(working_directory + dialogFileName)) {
		
		ChatterboxLoadFromFile("dialog.yarn"); //or whatever you called yours
		// Create Chatterbox
		global.chatterbox = ChatterboxCreate("dialog.yarn"); 

	
		with (instance_create_layer(0, 0, "Instances", oDialog)) {
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
}