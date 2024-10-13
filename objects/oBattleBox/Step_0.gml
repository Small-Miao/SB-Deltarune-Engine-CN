if (counter > 0)
{
	if (counter == delay)
	{
		saveScale=[image_xscale,image_yscale]; mult=8;
		if (oMenuBattle.timer <= 0) { oMenuBattle.boxScaleXY=[0,0]; mult=1; }
	}
	
	if (counter != delay)
	{
		if (oMenuBattle.boxScaleXY[0] > saveScale[0])
		{
			effect_fade(sprite_index,1,x,y,image_xscale-(oMenuBattle.boxScaleXY[0]-saveScale[0])/(delay*6),image_yscale-(oMenuBattle.boxScaleXY[1]-saveScale[1])/(delay*6),image_angle,,,depth-100);
		}
		else
		{
			effect_fade(sprite_index,1,x,y,image_xscale,image_yscale,image_angle,,,depth-100+counter*5);
		}
	}
	
	image_xscale+=(oMenuBattle.boxScaleXY[0]-saveScale[0])/(delay*mult);
	image_yscale+=(oMenuBattle.boxScaleXY[1]-saveScale[1])/(delay*mult);
	image_angle+=180/delay;
	
	--counter;
	
	if (oMenuBattle.timer <= 0) { instance_destroy(oBullet); with (oRun) { if (type == "pattern") { instance_destroy(); } } }
	if (counter == 0)
	{
		if (oMenuBattle.timer <= 0) { instance_destroy(); }
	}
}