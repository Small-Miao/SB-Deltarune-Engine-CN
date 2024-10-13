if (sstr._draw != -1) { sstr._draw(); }

draw_ext(sPixel,0,0,120,320,120,,0);

if (page == "buy" or page == "buy2")
{
	draw_box(200,120+boxY,120,8-boxY);
}

//
//
//

if (page == "buy" or page == "buy2") and (saveCur[0] != 4)
{
	res_i(); i1=drText[4]; i2="";
	
	if (itemType == "a") { i1=drText[5]; }
	if (itemType == "w") { i1=drText[6]; }
	if (itemType == "k") { i1=drText[7]; }
	
	if (array_length(items[saveCur[0]]._heal) == 1 and itemType == "i") { i2=" +"+string(items[saveCur[0]]._heal[0])+"HP"; }
	
	if (!array_contains(items[saveCur[0]]._seed,"noShopTitle")) { print(i1,220,138+boxY,,16,80); }
	print(items[saveCur[0]]._shopDescription+i2,220,154+boxY-array_contains(items[saveCur[0]]._seed,"noShopTitle")*16,,16,80);
	
	
	
	if (itemType == "a" or itemType == "w")
	{
		res_i();
		repeat(array_length(op.party))
		{
			if (i == 0) { i2=[0,0]; }
			if (i == 1) { i2=[50,0]; }
			if (i == 2) { i2=[0,22.5]; }
			i1=1;
			if (itemType == "a") { if (array_contains(items[saveCur[0]]._cantHave,op.party[i]._numberExistence)) { i1=0; } }
			if (itemType == "w") { if (items[saveCur[0]]._numberExistence != op.party[i]._numberExistence) { i1=0; } }
			
			draw_ext(op.party[i]._UIface,i1,213+i2[0],190+i2[1]+boxY,0.5,0.5);
			if (i1 == 1)
			{
				if (itemType == "a")
				{
					i3=[items[saveCur[0]]._defense,items[saveCur[0]]._defense];
					
					if (op.equipped[i][1] != -1) { i3[0]-=op.equipped[i][1]._defense; }
					if (op.equipped[i][2] != -1) { i3[1]-=op.equipped[i][2]._defense; }
					
					i4=["",""];
					if (i3[0] > 0) { i4[0]="+"; } if (i3[1] > 0) { i4[1]="+"; }
					
					draw_ext(sMenu,19,235.5+i2[0],188.5+i2[1]+boxY,0.5,0.5);
					
					print(i4[0]+string(i3[0]),245.5+i2[0],188+i2[1]+boxY,fDotum,,,0.5,0.5,,(i3[0] == 0)*c_white+(i3[0] > 0)*c_yellow+(i3[0] < 0)*c_aqua);
					print(i4[1]+string(i3[1]),245.5+i2[0],198+i2[1]+boxY,fDotum,,,0.5,0.5,,(i3[1] == 0)*c_white+(i3[1] > 0)*c_yellow+(i3[1] < 0)*c_aqua);
				}
				if (itemType == "w")
				{
					i3=[items[saveCur[0]]._attack];
					
					if (op.equipped[i][0] != -1) { i3[0]-=op.equipped[i][0]._attack; }
					
					i4=[""];
					if (i3[0] > 0) { i4[0]="+"; }
					
					draw_ext(sMenu,20,236+i2[0],187.5+i2[1]+boxY,0.5,0.5);
					
					print(i4[0]+string(i3[0]),245.5+i2[0],188+i2[1]+boxY,fDotum,,,0.5,0.5,,(i3[0] == 0)*c_white+(i3[0] > 0)*c_yellow+(i3[0] < 0)*c_aqua);
					print(0,245.5+i2[0],198+i2[1]+boxY,fDotum,,,0.5,0.5);
				}
			}
			++i;
		}
	}
}

//
//
//

if (page != 0)
{
	draw_box(0,120,208,120);
	draw_box(200,120,120,120);
}
else
{
	draw_box(0,120,320,120);
}

print("$"+string(op.money),220,214);

//
//
//

if (page == "buy" or page == "buy2")
{
	res_i();
	repeat(4)
	{
		i1=items[i]._infoText[0]; i2=c_white;
		if has_progress(string(i)+"="+string(room)+"sold") { i1=drText[13]; i2=c_gray; }
		
		print(i1,30,134+i*20,,,,,,,i2,,,,,["menu","soul1","buy",i]);
		if (i2 == c_white) { print("$"+string(items[i]._price),150,134+i*20); }
		++i;
	}
	print(sstr._textExit[0],30,134+i*20,,,,,,,,,,,,["menu","soul1","buy",i]);
	
	res_i(); i2=false;
	if (itemType == "i") { i2=true; i1=12-array_length(op.item); i=0; repeat(array_length(op.storage)) { if (op.storage[i] == -1) { ++i1; } ++i; } }
	if (itemType == "a") { i2=true; i1=0; i=0; repeat(array_length(op.armor)) { if (op.armor[i] == -1) { ++i1; } ++i; } }
	if (itemType == "w") { i2=true; i1=0; i=0; repeat(array_length(op.weapon)) { if (op.weapon[i] == -1) { ++i1; } ++i; } }
	if (cursor == 4) { i2=false; }
	
	if (i2 and !has_progress(string(cursor)+"="+string(room)+"sold")) { print(drText[8]+string(i1),260.5,215.5,fDotum,,,0.5,0.5); }
}

if (page == "buy2")
{
	print(drText[11]+"\n$"+string(items[saveCur[0]]._price)+" ?",230,134,,15);
	
	print(drText[9],240,174,,,,,,,,,,,,["menu","soul1","buy2",0]);
	print(drText[10],240,174+15,,,,,,,,,,,,["menu","soul1","buy2",1]);
}

//

if (page == "start")
{
	res_i();
	repeat(4)
	{
		print(sstr._textMain[i],240,134+i*20,,,,,,,,,,,,["menu","soul1","start",i]);
		++i;
	}
}

//

if (page == "sell")
{
	res_i();
	repeat(4)
	{
		print(drText[i],40,134+i*20,,,,,,,,,,,,["menu","soul1","sell",i]);
		++i;
	}
	print(sstr._textExit[1],40,134+i*20,,,,,,,,,,,,["menu","soul1","sell",i]);
}

if (page == "sellItem" or page == "sellWeapon" or page == "sellArmor" or page == "sellStorage" or page == "sellYN")
{
	res_i();
	if (array_length(sellArray) > 5)
	{
		if (sellType != "i" and sellType != "s") { draw_ext(sPixel,0,186,146,4.5,69.5,,c_dkgray); }
		draw_ext(sPixel,0,186,146+(65/(array_length(sellArray)-1))*saveCur[2],4.5,4.5);
	}
	
	if (offset > 0) { draw_ext(sMenu,13,185,133+round(dsin(op.time*8)*3)/2,0.5,0.5); }
	if (offset < array_length(sellArray)-5) { draw_ext(sMenu,13,185,228-round(dsin(op.time*8)*3)/2,0.5,-0.5); }
	
	offSetFill=[-1,-1,-1,-1,-1];
	repeat(array_length(sellArray))
	{
		if (i >= offset and i < offset+5)
		{
			offSetFill[i-offset]=0;
			
			if (sellArray[i] == -1) { i2="--------"; i3=c_dkgray; }else{ i2=sellArray[i]._infoText[0]; i3=c_white; }
			print(i2,30,134+(i-offset)*20,,,,,,,i3,,,,,["menu","soul1","sellItem","sellWeapon","sellArmor","sellStorage",i]);
			if (sellArray[i] != -1) { if (sellArray[i]._canSell) { print("$"+string(round(sellArray[i]._price/2)),150,134+(i-offset)*20); } }
		}
		
		if (sellType == "i" or sellType == "s") and (array_length(sellArray) > 5) { draw_ext(sPixel,0,187.5,147.5+(65/(array_length(sellArray)-1))*i,1.5,1.5); }
		
		++i;
	}
	
	if (sellType == "i")
	{
		i=0; repeat(5) { if (offSetFill[i] == -1) { print("--------",30,134+i*20,,,,,,,c_dkgray); } ++i; }
	}
}

if (page == "sellYN")
{
	print(drText[12]+"\n$"+string(round(sellArray[saveCur[2]]._price/2))+" ?",230,134,,15);
	
	print(drText[9],240,174,,,,,,,,,,,,["menu","soul1","sellYN",0]);
	print(drText[10],240,174+15,,,,,,,,,,,,["menu","soul1","sellYN",1]);
}

//

if (page == "talk")
{
	res_i();
	repeat(4)
	{
		i1=c_white; if (talkChecks[i] > 0) { i1=c_yellow; }
		print(sstr._textTalkOptions[i][talkChecks[i]],40,134+i*20,,,,,,,i1,,,,,["menu","soul1","talk",i]);
		++i;
	}
	print(sstr._textExit[2],40,134+i*20,,,,,,,,,,,,["menu","soul1","talk",i]);
}

//
//
//

/*
//Vissual help for stupid sell "regular items" menu
if (page == "sellItem" or page == "sellYN")
{
	res_i();
	repeat(array_length(op.item))
	{
		i1=c_white; if (i == saveCur[2]) { i1=c_red; }
		i2=0; if (i >= offset and i < offset+5) { i2=8; }
	
		print(op.item[i]._infoText[0],2+i2,2+i*8,fDotum,,,0.5,0.5,,i1);
		++i;
	}
	
	print("cursor     :"+string(cursor),160,2+8*0,fDotum,,,0.5,0.5);
	print("offsetPress:"+string(offsetPress),160,2+8*1,fDotum,,,0.5,0.5);
	print("offset     :"+string(offset),160,2+8*2,fDotum,,,0.5,0.5);
}
*/