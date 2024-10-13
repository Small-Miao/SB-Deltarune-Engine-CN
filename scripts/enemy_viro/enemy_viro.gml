function enemy_viro() : enemy_base() constructor
{
	_spriteWalk=sVirovirokun_Idle;
	_spriteTouch=sVirovirokun_Hurt;
	_spriteGlide=sVirovirokun_Idle;
	
	_spriteIdle=sVirovirokun_Idle;
	_spriteHappy=sVirovirokun_Happy;
	_spriteDamage=sVirovirokun_Hurt;
	
	_drawFunc="draw_ene_test";
	
	_name="Virovirokun";
	
	//
	
	_hp=75;
	_attack=20;
	_defense=5;
	
	// Recruit Stuff
	_recRequiredAmount=3;
	_recChapter=1;
	_recLV=7;
	_recSprite=sVirovirokun_Idle;
}