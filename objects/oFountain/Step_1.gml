time+=anSpeed;
upY+=anSpeed;
if (upY >= 140) { upY-=140; }

color=make_color_rgb(clamp(_r,128,255),clamp(_g,128,255),clamp(_b,128,255));



//animate colors
if (anMode == 0)
{
	if (mode == 5) { _b-=cspeed; if (_b <= 128) { mode=0; } }

	if (mode == 4) { _r+=cspeed; if (_r >= 255) { mode=5; } }

	if (mode == 3) { _g-=cspeed; if (_g <= 128) { mode=4; } }

	if (mode == 2) { _b+=cspeed; if (_b >= 255) { mode=3; } }

	if (mode == 1) { _r-=cspeed; if (_r <= 128) { mode=2; } }

	if (mode == 0) { _g+=cspeed; if (_g >= 255) { mode=1; } }
}



//animate closing
if (anMode == 1)
{
	++anModeTime;
	
	showColor+=1/120;
	if (showFountain < 1) { showFountain+=1/120; }
	if (_r < 255) { _r+=2; }
	if (_g < 255) { _g+=2; }
	if (_b < 255) { _b+=2; }
	
	if (anModeTime > 160)
	{
		if (anSpeed > 0) { anSpeed-=1/30; anSpeed=clamp(anSpeed,0,1); }
		if (showWhite < 1) { showWhite+=1/90; }
	}
}