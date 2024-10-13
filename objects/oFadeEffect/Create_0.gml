seed=[];
bright=0;

time=0;

res_all();

step=function()
{
	++time;
	if (time == 1)
	{
		if (startFunc != -1) { startFunc(); }
		
		if array_contains(seed,"speed1") { image_speed=1; }
		if array_contains(seed,"walkDirection") { direction=image_angle; image_angle=0; speed=6; friction=0.5; }
		
		if array_contains(seed,"half") { image_alpha=0.5; }
		if array_contains(seed,"fallUp") { res_i(); i=irandom_range(-2,2)/(2+array_contains(seed,"half")*2); }
		
		if array_contains(seed,"moveRandom") { res_i(); i1=irandom_range(2,6); }
		
		if array_contains(seed,"rudeEnd") { direction=image_angle; speed=4; friction=0.25; }
	}
	
	
	draw_ext(sprite_index,image_index,x,y,image_xscale,image_yscale,image_angle,image_blend,image_alpha,bright);
	
	//
	//
	//

	image_alpha-=0.1-array_contains(seed,"half")*0.05;
	if array_contains(seed,"fade0.5") { image_alpha+=0.05; }
	if array_contains(seed,"fade2") { image_alpha+=0.05; }

	if array_contains(seed,"expand1") { image_xscale+=startScale[0]/4; image_yscale+=startScale[1]/4; }
	if array_contains(seed,"expand2") { image_xscale+=0.1; image_yscale+=0.1; }
	
	if array_contains(seed,"rudeEnd") { image_xscale+=(0-image_xscale)/10; }
	if array_contains(seed,"contractY") { image_yscale-=0.1; }
	
	if array_contains(seed,"moveRandom") { x+=i1; }
	if array_contains(seed,"move1") { x+=1.5; } if array_contains(seed,"move2") { x+=3; }
	
	if array_contains(seed,"stick") { x-=(3/30)*startScale[0]; y-=(19/160)*startScale[1]; }
	
	if array_contains(seed,"fallUp") { x+=i; y-=2-array_contains(seed,"half")*1; }
	
	//
	//
	//

	if (image_alpha <= 0) { instance_destroy(); }
}