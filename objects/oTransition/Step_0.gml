if (mode == "fade")
{
	if (counter == 1) { counter=2; if (func2 != -1) { func2(); }  }
	if (counter == 0) { if (image_alpha >= 1) { counter=1; if (func != -1) { func(); } }else{ image_alpha+=0.1; } }
	if (counter == 2) { image_alpha-=0.1; if (image_alpha <= 0) { instance_destroy(); } }
}



if (mode == "darkExit")
{
	if (counter > 0 and counter != 30) { ++counter; }
	if (counter == 0)
	{
		if (i != 255) { i+=255/75; }
		if (i == 255) { counter=1; }
	}
	if (counter == 28) { if (func != -1) { func(); } }
	if (counter == 29) { if (func2 != -1) { func2(); } }
	if (counter == 30)
	{
		i-=255/10;
		if (i <= 0) { instance_destroy(); }
	}
}



if (mode == "shortcut")
{
	if (counter >= 2 and counter < 40) { ++counter; }
	
	if (counter == 1) { counter=2; }
	if (counter == 0) { image_alpha=1; counter=1; }
	
	if (counter == 38) { if (func != -1) { func(); } }
	if (counter == 39) { if (func2 != -1) { func2(); } }
	if (counter == 40)
	{
		image_alpha-=0.1;
		if (image_alpha <= 0) { instance_destroy(); }
	}
}