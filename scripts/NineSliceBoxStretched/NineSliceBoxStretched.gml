// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function NineSliceBoxStretched(sprite, x1, y1, x2, y2, index) {
	/// @func NineSliceBoxStretched(sprite, x1, y1, x2, y2, index)
	var size = sprite_get_width(sprite) / 3;
	var width = x2 - x1;
	var height = y2 - y1;
	
	//MIDDLE
	draw_sprite_part_ext(sprite, index, size, size, 1, 1, x1 + size, y1 + size, width - (size * 2), height - (size * 2), c_white, 1);
	//TOP LEFT CORNER
	draw_sprite_part(sprite, index, 0, 0, size, size, x1, y1);
	//TOP RIGHT CORNER
	draw_sprite_part(sprite, index, size * 2, 0, size, size, x1 + width - size, y1);
	//BOTTOM LEFT CORNER
	draw_sprite_part(sprite, index, 0, size * 2, size, size, x1, y1 + height - size);
	//BOTTOM RIGHT CORNER
	draw_sprite_part(sprite, index, size * 2, size * 2, size, size, x1 + width - size, y1 + height - size);
	//LEFT EDGE
	draw_sprite_part_ext(sprite, index, 0, size, size, 1, x1, y1 + size, 1, height - (size * 2), c_white, 1);
	//RIGHT EDGE
	draw_sprite_part_ext(sprite, index, size * 2, size, size, 1, x1 + width - size, y1 + size, 1, height - (size * 2), c_white, 1);
	//TOP EDGE
	draw_sprite_part_ext(sprite, index, size, 0, 1, size, x1 + size, y1, width - (size * 2), 1, c_white, 1);
	//BOTTOM EDGE
	draw_sprite_part_ext(sprite, index, size, size * 2, 1, size, x1 + size, y1 + height - size, width - (size * 2), 1, c_white,1);
}