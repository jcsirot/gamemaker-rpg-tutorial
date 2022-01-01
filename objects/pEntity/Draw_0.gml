/// @description Insert description here
// You can write your code in this editor
if (entityShadow) {
	draw_sprite(sShadow, 0, floor(x), floor(y));
}

if (flash != 0) {
	shader_set(shWhiteFlash);
	shader_set_uniform_f(uFlash, flash);
}

draw_self();

if (shader_current() != -1) {
	shader_reset();
}