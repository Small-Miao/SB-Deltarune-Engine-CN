if (page == "start")
{
	draw_box(46,49,227,109);
	
	print(drText[0],85,114,,,,,,,,,,,,["menu","soul1","start",0]);
	print(drText[1],175,114,,,,,,,,,,,,["menu","soul1","start",1]);
	print(drText[2],85,134,,,,,,,,,,,,["menu","soul1","start",2]);
	res_i(); if (array_length(op.recruits) == 0) { i1=c_gray; }else{ i1=c_white; }
	print(drText[3],175,134,,,,,,,i1,,,,,["menu","soul1","start",3]);
	
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
	
	draw_ext(sMenu,17,37,108,493/2);
	draw_ext(sMenu,17,37,150,493/2);
	draw_ext(sMenu,17,37,192,493/2);
	
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
	
	draw_ext(sMenu,17,37,108,493/2);
	draw_ext(sMenu,17,37,150,493/2);
	
	res_i();
	repeat (4)
	{
		i2=c_dkgray; if (i == 0) { i2=c_yellow; }
		if (i-1 == op.fileOn) { print(drText[7],160,28+i1,,,,,,,c_yellow,,,,,["fa_center"]); }else{ drawFile(0,i1,i2,12*(i > 0),i-1); }
		
		i1+=42+14*(i == 0);
		++i;
	}
}