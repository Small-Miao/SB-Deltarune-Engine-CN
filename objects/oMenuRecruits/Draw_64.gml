if (page == "start")
{
	draw_ext(sPixel,0,15,5,591/2,431/2);
	draw_ext(sPixel,0,17,7,(591-8)/2,(431-8)/2,,0);
	
	print(drText[0],40,19);
	print(drText[1],135,19,,,,0.5,,,c_lime);
	
	res_i(); i1=c_dkgray;
	
	draw_boxColor(184.5,37);

	print(rec[cursor]._name,236.5,124,,,,,,,,,,,,["fa_center"]);
	print(drText[2]+" "+string(rec[cursor]._recChapter),184,144);
	print(drText[3]+" "+string(rec[cursor]._recLV),264,144);

	print("["+get_keybind(4)+"]: "+drText[4],190,164);
	print("["+get_keybind(5)+"]: "+drText[5],190,180);
	
	
	res_i();
	repeat (array_length(rec))
	{
		if (i > -1+offset and i < 9+offset)
		{
			print(rec[i]._name,40,50+(i-offset)*17.5,,,,,,,,,,,,["menu_yellow","soul4","start",i]);
		
			if (op.recruits[i][2] < op.recruits[i][1])
			{
				print(string(op.recruits[i][2])+" / "+string(op.recruits[i][1]),137.5,50+(i-offset)*17.5,,,,,,,c_gray);
			}
			else
			{
				print(drText[6],137.5,50+(i-offset)*17.5,,,,0.5,,,c_lime);
			}
		}
		
		++i;
	}
}



if (page == "more")
{
	draw_ext(sPixel,0,15,5,581/2,441/2);
	draw_ext(sPixel,0,17,7,(581-8)/2,(441-8)/2,,0);
	
	draw_ext(sMenu,18,11+round(dsin(op.time*10)),109);
	draw_ext(sMenu,18,309-round(dsin(op.time*10)),109,-1);
	
	print(drText[7]+" ["+get_keybind(5)+"] "+drText[8],40,204,,,,,,,,,,,,["menu","soul4","more",cursor]);
	
	
	
	draw_boxColor(39.5,34.5);
	
	print(string(cursor+1)+"/"+string(array_length(rec)),294.5,19,,,,0.5,,,,,,,,["fa_right"]);
	
	print(drText[2]+" "+string(rec[cursor]._recChapter),150,19,,,,0.5);
	print(rec[cursor]._name,150,39);
	res_i(); if (op.recruits[cursor][2] < op.recruits[cursor][1]) { i1=drText[9]; }else{ i1=rec[cursor]._infoText[0]; }
	print(i1,150.5,60.5,fDotum,20,270,0.5,0.5);
	
	print(drText[10],40,124); res_i(); if (op.recruits[cursor][2] < op.recruits[cursor][1]) { i1="?"; }else{ i1=rec[cursor]._infoText[1]; } print(i1,90,124);
	print(drText[11],40,144,,,,0.8); res_i(); if (op.recruits[cursor][2] < op.recruits[cursor][1]) { i1="?"; }else{ i1=rec[cursor]._infoText[2]; } print(i1,90,144);
	print("?????",40,164,,,,1+0.25/2); print("?????????",90,164);
	print("?????",40,184,,,,1+0.25/2); print("?????????",90,184);
	
	print(rec[cursor]._recLV,295,124,,,,0.5,,,,,,,,["fa_right"]);
	print(rec[cursor]._attack,295,144,,,,0.5,,,,,,,,["fa_right"]);
	print(rec[cursor]._defense,295,164,,,,0.5,,,,,,,,["fa_right"]);
	print(drText[12]+" "+rec[cursor]._recElement,295,184,,,,0.5,,,,,,,,["fa_right"]);
	
	print(drText[13],280,124,,,,0.5,,,,,,,,["fa_right"]);
	print(drText[14],280,144,,,,0.5,,,,,,,,["fa_right"]);
	print(drText[15],280,164,,,,0.5,,,,,,,,["fa_right"]);
}



//darw soul cursor
draw_ext(sSoul,0,op.soul4XY[0]-6,op.soul4XY[1]+5,0.5,0.5);
//print(op.soul4XY);