use_keys();

if (target == 0)
{
	reset_keys();
	exitTime = 0;
	
	endTime--
	if (endTime == 0)
		instance_destroy();
}
else
{
	if key_cancel()
	{
		exitTime++;
	}
	else
	{
		exitTime = 0;
	}
	
	if (exitTime == 15)
	{
		target = 0;
		
		if (exitFunc != -1)
			exitFunc();
	}
}



if (delay > 0)
	delay--;
	
if (delay == 0)
{
	pos[0] += (confirmPos[0+target*2] - pos[0]) / 3;
	pos[1] += (confirmPos[1+target*2] - pos[1]) / 3;
	
	pos[2] += (cancelPos[0+target*2] - pos[2]) / 3;
	pos[3] += (cancelPos[1+target*2] - pos[3]) / 3;
	
	pos[4] += (menuPos[0+target*2] - pos[4]) / 3;
	pos[5] += (menuPos[1+target*2] - pos[5]) / 3;
}