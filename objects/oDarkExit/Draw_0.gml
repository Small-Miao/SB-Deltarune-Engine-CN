if (isFloor)
{
	draw_ext(sLightpillar,1,x,y+18,(1-0.15*0+dsin(op.time*5) * 0.05),1,0,c_white,0.25);
	draw_ext(sLightpillar,1,x,y+18,(1-0.15*1+dsin(op.time*5) * 0.05),1,0,c_white,0.25);
	draw_ext(sLightpillar,1,x,y+18,(1-0.15*2+dsin(op.time*5) * 0.05),1,0,c_white,0.25);
}
else
{
	draw_ext(sLightpillar,0,x,y+18,(1-0.15*0+dsin(op.time*5) * 0.05),1,0,c_white,0.25/2);
	draw_ext(sLightpillar,0,x,y+18,(1-0.15*1+dsin(op.time*5) * 0.05),1,0,c_white,0.25/2);

	gpu_set_blendmode(bm_add);
	draw_ext(sLightpillar,0,x,y+18,(1-0.15*2+dsin(op.time*5) * 0.05),1,0,c_white,0.25/4);
	gpu_set_blendmode(bm_normal);
}