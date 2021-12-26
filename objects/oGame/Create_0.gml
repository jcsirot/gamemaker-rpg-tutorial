/// @description Insert description here
// You can write your code in this editor

randomize();

global.gamePaused = false;
global.gamepadId = -1;
global.iCamera = instance_create_layer(0, 0, layer, oCamera);
global.testSpeed = 0.75

scribble_font_add("fText");
scribble_font_set_default("fText");


surface_resize(application_surface, RESOLUTION_W, RESOLUTION_H);
room_goto(ROOM_START);
