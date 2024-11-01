++time;

if (time > 0)
{
	if (time == 1) { sound(snd_sparklegem); }
	if (time >= 50) { image_alpha-=0.1; grav-=0.25; y+=grav; scale-=grav/20; if (image_alpha <= 0) { instance_destroy(); } }
	
	
	
	print(text,x+introX,y-30,op.fontGold,,,,1+scale,,,,,,image_alpha,["fa_center"]);
	draw_ext(sMessageSprite,5,x+image_xscale*21,y-50,image_xscale,image_yscale+scale,,,image_alpha);
	
	
	
	if (time <= 50)
	{
		if (time < 10) { image_xscale-=0.2; }
		if (time >= 10 and image_xscale != 1) { image_xscale+=0.2; }

		if (time < 10) { image_yscale+=0.2; }
		if (time >= 10 and image_yscale != 1) { image_yscale-=0.2; }
		
		if (time < 10) { introX-=7; }
		if (time >= 10 and introX != 0) { introX+=7/1; if (introX > 0) { introX=0; } }
	}
}