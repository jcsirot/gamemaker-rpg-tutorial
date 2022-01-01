// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function AttackSlash(){
	if (sprite_index != sPlayerSlash) {
		sprite_index = sPlayerSlash;
		localFrame = 0;
		image_index = 0;
		
		if (!ds_exists(hitByAttack, ds_type_list)) {
			hitByAttack = ds_list_create();
		}
		ds_list_clear(hitByAttack);
	}
	
	CalcAttack(sPlayerSlashHB);
	
	AnimatePlayerSprite();
	
	if (animationEnd) {
		animationEnd = false;
		state = PlayerStateFree;
	}
}