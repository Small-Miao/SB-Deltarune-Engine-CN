++time;

if (time > 15) { image_alpha-=0.05; }
if (image_alpha <= 0) { instance_destroy(); }

//
//
//

if (array_contains(seed,"heal") or array_contains(seed,"tp"))
{
	if (time == 1)
	{
		image_blend=c_lime; image_angle+=irandom_range(-90,90) res_i(); i1=irandom_range(1,4)/4; i2=irandom_range(4,16)/4;
		if array_contains(seed,"tp") { image_blend=c_orange; }
	}
	
	x+=i1;
	y-=i2;
	image_angle+=3;
	
	i1*=0.9;
	i2*=0.9;
}

if array_contains(seed,"spare")
{
	if (time == 1) { res_i(); i=-1; }
	
	x+=i; if (i < 3) { i+=0.15; }
	image_angle+=6;
}