/// @description Insert description here
// You can write your code in this editor

NineSliceBoxStretched(sTextBoxBg, x1, y1, x2, y2, background);
draw_sprite_part(sVirgule, 0, 0, 0, 8, 16, xv, yv);
if (showNextTextArrow) {
	draw_sprite_part(sNextTextArrow, 0, 0, 0, 16, 16, x2-24, y2-24);
}
draw_set_font(fText);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(c_black);

print = string_copy(message, 1, textProgress);
//draw_text((x1+x2)/2, y1+8, print);
draw_text(x1+16, y1+8, print);
draw_set_color(c_white);
//draw_text((x1+x2)/2, y1+7, print);
draw_text(x1+16, y1+7, print);