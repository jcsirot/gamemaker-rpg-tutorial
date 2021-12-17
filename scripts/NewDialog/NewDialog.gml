// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function NewDialog(dialogFileName, bg = 1){
	
	if (file_exists(working_directory + dialogFileName)) {
		var json = "";
	
		var file = file_text_open_read(working_directory + dialogFileName);
	
		while (!file_text_eof(file)) {
			json += file_text_readln(file);
		}
	
		file_text_close(file);
	
		with (instance_create_layer(0,0,"Instances", oDialog)) {
			dialog = json_parse(json);
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