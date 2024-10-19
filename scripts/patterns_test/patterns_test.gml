function pattern1()
{
	if (time == 1)
	{
		pattern_objects();
		spawn_bullet_ext(,,boxX-30*(1+numb/10),boxY);
		spawn_bullet_ext(,,boxX+30*(1+numb/10),boxY);
		spawn_bullet_ext(,,boxX,boxY-30*(1+numb/10));
		spawn_bullet_ext(,,boxX,boxY+30*(1+numb/10));
	}
}

//

function pattern2()
{
	if (time == 1)
	{
		pattern_objects(,,,110,100);
	}
	
	if !(time mod 10)
	{
		spawn_bullet_ext(,,boxX+irandom_range(-30,30),boxY-60,0.5,0.5,,,,,[0,0,0,0.1,10],,,["mask"]);
		spawn_bullet_ext(,,boxX+irandom_range(-30,30),boxY+60,0.5,0.5,,,,,[0,0,0,-0.1,10],,,["mask"]);
	}
}

//

function pattern3()
{
	if (time == 1)
	{
		pattern_objects(,,,,,,,false);
	}
	
	if !(time mod 3)
	{
		spawn_bullet_ext(,,irandom_range(0,320),0,0.5,0.5,,,,,[0,0,0,0.1,10]);
	}
	
	//force_partyTurn();
	//instance_destroy();
}