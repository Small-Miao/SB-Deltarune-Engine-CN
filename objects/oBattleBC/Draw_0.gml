if (op.battle_background[0])
{
	//draw purple box background

	draw_sprite_tiled_ext(sBattleBC,1,-4+op.time/4,op.time/4,0.5,0.5,c_white,image_alpha);
	draw_sprite_tiled_ext(sBattleBC,0,4-op.time/2,-op.time/2,0.5,0.5,c_white,image_alpha);
}

//make the background darker at when the enemy talks or you are dodging
if (op.battleTime > 60)
{
	if (oMenuBattle.mode == "talk" or oMenuBattle.mode == "dodge")
	{
		if (alpha < 1) { alpha+=0.1; }
	}
	else
	{
		if (alpha > 0) { alpha-=0.1; }
	}
}

draw_ext(sPixel,0,op.x-160-30,op.y-120-30,320+60,240+60,0,0,alpha*(0.5+0.25/2));



if array_contains(op.battle_seed,"mySpecialBackground")
{
	//draw your own background
}