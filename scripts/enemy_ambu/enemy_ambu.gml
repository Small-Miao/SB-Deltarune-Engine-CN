function enemy_ambu() : enemy_base() constructor
{
	_spriteWalk=sAmbyuLance_Run;
	_spriteTouch=sAmbyuLance_Hurt;
	_spriteGlide=sAmbyuLance_Hurt;
	
	_spriteIdle=sAmbyuLance_Idle;
	_spriteHappy=sAmbyuLance_Happy;
	_spriteDamage=sAmbyuLance_Hurt;
	
	_name="Ambyu-Lance";
	
	_hp=100;
	_attack=50;
	
	// Recruit Stuff
	_recRequiredAmount=7;
	_recChapter=2;
	_recLV=5;
	_recSprite=sAmbyuLance_Idle;
}