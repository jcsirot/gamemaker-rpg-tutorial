/// @description Insert description here
state = PlayerStateFree;
stateAttack = AttackSlash;
lastState = state;

collisionMap = layer_tilemap_get_id(layer_get_id("Col"));

image_speed = 0;
hSpeed = 0;
vSpeed = 0;
speedWalk = 4.0;
speedRoll = 6.0;
distanceRoll = 96;
distanceBonk = 80;
distanceBonkHeight = 12;
speedBonk = 1.5;
z = 0;

hitByAttack = -1;

spriteRoll = sPlayerRoll;
spriteRun = sPlayerRun;
spriteIdle = sPlayer;
localFrame = 0;
