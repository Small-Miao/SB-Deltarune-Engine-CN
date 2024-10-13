if (op.noclip)  { extra[0]=" (ON)"; }else{ extra[0]=" (OFF)"; }

//
//
//

if (page == "start")
{
	draw_box(2,2,100,150,["light"]);
	print("- Debug menu -",2+50,15,fDotum,,,0.5,0.5,,c_red,,,,,["fa_center"]);
	
	res_i();
	repeat(array_length(options))
	{
		print(options[i]+extra[i],20,30+i*10,fDotum,,,0.5,0.5,,,,,,,["menu_yellow","soul4","start",i]);
		++i;
	}
}

//

if (page == "room")
{
	draw_box(2,-4,150,250,["light"]);
	
	res_i();
	while (room_exists(i))
	{
		print(room_get_name(i),20,120+i*10-cursor*10,fDotum,,,0.5,0.5,,,,,,,["menu_yellow","soul4","room",i]);
		++i;
	}
}

//
//
//

draw_ext(sSoul2,0,op.soul4XY[0],op.soul4XY[1],0.25,0.25);