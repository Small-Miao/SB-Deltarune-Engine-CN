draw_sprite_tiled_ext(sBattleBC,1,-4+op.time/4,op.time/4,0.5,0.5,c_white,image_alpha);
draw_sprite_tiled_ext(sBattleBC,0,4-op.time/2,-op.time/2,0.5,0.5,c_white,image_alpha);

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

draw_ext(sPixel,0,op.x-160,op.y-120,320,240,0,0,alpha*(0.5+0.25/2));