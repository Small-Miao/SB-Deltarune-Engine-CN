if (time == 0) { x_=x; y_=y; }

repeat (1)
{
	++time;

	x=startXY[0];
	y=startXY[1];

	x+=((targetXY[0]-x)/delay)*time;
	y+=((targetXY[1]-y)/delay)*time;
	
	y+=dsin((180/delay)*time)*20;
	
	effect_fade(sRudeBusterEffect,0,x,y,1,1,point_direction(x_,y_,x,y),,,-9999,["speed1","contractY"]);
	
	x_=x;
	y_=y;
}

if (time >= delay)
{
	res_i();
	repeat(4)
	{
		i1=45+90*i;
		effect_fade(sRudeBusterEffect,0,x+dcos(i1)*20,y-dsin(i1)*20,1,1,i1,,,-9999,["speed1","rudeEnd","fade0.5"]);
		effect_fade(sRudeBusterEffect,0,x+dcos(i1)*25,y-dsin(i1)*25,1,1,i1,,,-9999,["speed1","rudeEnd","fade0.5"]);
		++i;
	}
	
	instance_destroy();
}