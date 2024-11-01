draw_self();

//draw bullet mask surface
if (counter == 0 and array_length(bulletInfo) > 0)
{
	if !(surface_exists(bulletMask)) { bulletMask=surface_create(640,480); }

	surface_set_target(bulletMask);

	draw_clear_alpha(c_white,0);

	draw_ext(sBattleBox,2,(x-(op.x-160))*2,(y-(op.y-120))*2,(image_xscale-0.25)*2,(image_yscale-0.25)*2,image_angle,0);
	
	

	gpu_set_colorwriteenable(1,1,1,0);

	bc=0;
	repeat(array_length(bulletInfo))
	{
		draw_ext(bulletInfo[bc][0],bulletInfo[bc][1],(bulletInfo[bc][2]-(op.x-160))*2,(bulletInfo[bc][3]-(op.y-120))*2,bulletInfo[bc][4]*2,bulletInfo[bc][5]*2,bulletInfo[bc][6],bulletInfo[bc][7],bulletInfo[bc][8],0);
		++bc;
	}

	gpu_set_colorwriteenable(1,1,1,1);
	
	
	
	surface_reset_target();

	draw_surface_ext(bulletMask,op.x-160,op.y-120,0.5,0.5,0,c_white,1);
}