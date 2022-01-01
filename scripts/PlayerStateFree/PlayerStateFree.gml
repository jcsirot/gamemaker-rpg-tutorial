// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function PlayerStateFree(){
	hSpeed = lengthdir_x(inputMagnitude * speedWalk, inputAngle);
	vSpeed = lengthdir_y(inputMagnitude * speedWalk, inputAngle);

	PlayerCollision();

	var oldSprite = sprite_index;
	if (inputMagnitude != 0) {
		direction = inputAngle;
		sprite_index = spriteRun;
	} else {
		sprite_index = spriteIdle;	
	}
	if (oldSprite != sprite_index) {
		localFrame = 0;
	}

	AnimatePlayerSprite();
	
	if (keyAttack) {
		state = stateAttack;
		stateAttack = AttackSlash;
	}
	
	if (keyActivate) {
		var activatedX = lengthdir_x(20, direction);
		var activatedY = lengthdir_y(20, direction);
		activate = instance_position(x + activatedX, y + activatedY, pEntity);
		
		if (activate == noone || activate.entityActivateScript == -1) {
			moveDistanceRemaining = distanceRoll;
			state = PlayerStateRoll;
		} else {
			ScriptExecuteArray(activate.entityActivateScript, activate.entityActivateArgs);
			
			if (activate.entityNPC) {
				with (activate) {
					direction = point_direction(x, y, other.x, other.y);
					image_index = CARDINAL_ANGLE;
				}
			}
		}
	}
}