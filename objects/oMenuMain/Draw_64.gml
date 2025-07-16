if (page == "start")
{
	res_i();
	repeat (3)
	{
		print("存档 "+string(i+1),50,50+i*20,,,,,,,,,,,,["menu_yellow","soul1","start",i]);
		++i;
	}
	
	print("新游戏",50,50+i*20,,,,,,,,,,,,["menu_yellow","soul1","start",3]);
	
	print("=\n=\n=\n=\n=\n=\n=\n=\n=\n=\n=\n=\n=\n=\n=\n=\n=\n=\n=\n=\n=\n=\n=\n=\n=\n=\n=\n=\n=\n=\n=\n=\n=\n=\n=\n=\n=\n=\n=\n=\n=\n=\n=\n=\n=\n=\n=\n=\n=\n=\n=\n=\n=\n=",150,0,,,,,,-90);
	
	if (cursor != 3)
	{
		file_stats(op.fileOn);
	
		var fileName="save"+string(op.fileOn);
	
		if file_exists(fileName)
		{
			print(stat_name,160,50);
			print(stat_locationText,160,50+16*1);
			print("Time: "+string(stat_minutes)+":"+string(stat_seconds),160,50+16*2);
			print("LV"+string(stat_level),160,50+16*3);
		}
	}
}