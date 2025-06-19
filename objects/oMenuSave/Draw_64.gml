if (page == "start" or page == "start_wait")
{
	draw_box(46,49,227,109);
	
	print(drText[0],85,114,,,,,,,,,,,,["menu","soul1","start",0]);
	print(drText[1],175,114,,,,,,,,,,,,["menu","soul1","start",1]);
	
	if (op.world == "dark")
	{
		print(drText[2],85,134,,,,,,,,,,,,["menu","soul1","start",2]);
		res_i(); if (array_length(op.recruits) == 0) { i1=c_gray; }else{ i1=c_white; }
		print(drText[3],175,134,,,,,,,i1,,,,,["menu","soul1","start",3]);
	}
	else
	{
		print(drTextLight[5],85,134,,,,,,,,,,,,["menu","soul1","start","start_wait",2]);
	}
	
	res_i(); i1=""; if (op.seconds < 10) { i1="0"; }
	print(op.name_,60,64);
	print(drText[4]+" "+string(op.allData[0][6]),176,64);
	print(string(op.minutes)+":"+i1+string(op.seconds),261,64,,,,,,,,,,,,["fa_right"]);
	
	print(op.locationText,160,89,,,,,,,,,,,,["fa_center"]);
}



if (page == "save" or page == "ask")
{
	draw_box(30,6,520/2,106/2);
	draw_box(30,62,520/2,322/2);
	
	draw_ext(sMenu,17,37,108,493/2,,,,,(op.world == "light"));
	draw_ext(sMenu,17,37,150,493/2,,,,,(op.world == "light"));
	draw_ext(sMenu,17,37,192,493/2,,,,,(op.world == "light"));
	
	res_i();
	repeat (4)
	{
		i2=c_white; if (i == cursor+1) { i2=c_yellow; }
		drawFile(0,i1,i2,12*(i > 0),i-1);
		
		i1+=42+14*(i == 0);
		++i;
	}
	
	print(drText[1],139,201,,,,,,,,,,,,["menu_yellow","soul1","save",3]);
}



if (page == "ask")
{
	draw_ext(sPixel,0,0,0,320,240,,0,0.75);
	draw_box(5,50,620/2,280/2);
	
	drawFile(0,66,c_white,-10,saveCur[0]);
	drawFile(0,101,c_yellow,-10,-1);
	
	print(drText[5]+" "+string(saveCur[0]+1)+"?",160,65.5,,,,,,,,,,,,["fa_center"]);
	
	print(drText[0],85,166,,,,,,,,,,,,["menu_yellow","soul1","ask",0]);
	print(drText[1],175,166,,,,,,,,,,,,["menu_yellow","soul1","ask",1]);
}



if (page == "filesaved")
{
	draw_box(30,6,520/2,106/2);
	draw_box(30,62,520/2,274/2);
	
	draw_ext(sMenu,17,37,108,493/2,,,,,(op.world == "light"));
	draw_ext(sMenu,17,37,150,493/2,,,,,(op.world == "light"));
	
	res_i();
	repeat (4)
	{
		i2=c_dkgray; if (i == 0) { i2=c_yellow; }
		if (i-1 == op.fileOn) { print(drText[7],160,28+i1,,,,,,,c_yellow,,,,,["fa_center"]); }else{ drawFile(0,i1,i2,12*(i > 0),i-1); }
		
		i1+=42+14*(i == 0);
		++i;
	}
}



//chapter 1 styled menu (draw)
if (page == "startC1" or page == "savedC1")
{
	draw_box(54,49,423/2,172/2);
	
	res_i();
	i1=op.party[0]._infoText[0];
	i2="";
	i3=1;
	i4="0:00";
	
	i5=c_white;
	if (page == "savedC1") { i5=c_yellow; }
	
	if file_exists("save"+string(op.fileOn))
	{
		file_stats();
		i1=stat_name;
		i2=stat_locationText;
		i3=stat_level;
		
		res_j();
		j1=""; if (stat_seconds < 10) { j1="0"; }
		i4=string(stat_minutes)+":"+j1+string(stat_seconds);
	}
	
	
	//draw name
	print(i1,70,64,,,,,,,i5);
	
	//draw room title
	print(i2,70,84,,,,,,,i5);
	
	//draw LV
	print(drText[4]+" "+string(i3),175,64,,,,,,,i5);
	
	//draw time
	print(i4,210,64,,,,,,,i5);
	
	
	
	if (page == "startC1")
	{
		//draw cursor options
		print(drText[0],85,114,,,,,,,i5,,,,,["menu","startC1","soul1",0]);
		print(drText[1],175,114,,,,,,,i5,,,,,["menu","startC1","soul1",1]);
	}
	else
	{
		//draw file saved text
		print(drText[7],85,114,,,,,,,i5);
	}
}