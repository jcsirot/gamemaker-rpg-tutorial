// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function PlayerStateRoll(){
	hSpeed = lengthdir_x(speedRoll, direction);
	vSpeed = lengthdir_y(speedRoll, direction);

	moveDistanceRemaining = max(0, moveDistanceRemaining - speedRoll);

	var collided = PlayerCollision();

	sprite_index = spriteRoll;
	var totalFrames = sprite_get_number(sprite_index) / 4;
	image_index = (CARDINAL_ANGLE * totalFrames) + min(totalFrames - 1, (1 - (moveDistanceRemaining / distanceRoll)) * totalFrames);
	
	if (moveDistanceRemaining <= 0) {
		state = PlayerStateFree;	
	}
	
	if (collided) {
		state = PlayerStateFree;
		ScreenShake(4, 15);
	}
}