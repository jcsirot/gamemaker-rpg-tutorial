/// @description Insert description here
// You can write your code in this editor

if (remainingPause <= 0 && msgElement) {
	NineSliceBoxStretched(sTextBoxBg, x1, y1, x2, y2, background);
	draw_sprite_part(sVirgule, 0, 0, 0, 8, 16, xv, yv);
	if (showNextTextArrow) {
		draw_sprite_part(sNextTextArrow, 0, 0, 0, 16, 16, x2-24, y2-24);
	}
	msgElement.draw(x1+16, y1+8);
}