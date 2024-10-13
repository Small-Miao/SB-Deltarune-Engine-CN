draw_box(16,84,142/2,148/2,["light"]);

res_i();
i1=[drText[0],drText[1],drText[2]];
repeat(3)
{
	i2=c_white;
	if (i == 0 and array_length(op.itemLight) == 0) { i2=c_gray; }
	if (i == 2 and array_length(op.cell) == 0) { i2=c_gray; }
	
	print(i1[i],42,98+i*18,,,,,,,i2,,,,,["menu","soul3","start",i]);
	++i;
}

res_i();
if (op.y < op.playerY-20) { i1=161-26; }else{ i1=0; }

draw_box(16,26+i1,142/2,110/2,["light"]);
print(op.party[0]._infoText[0],23,34+i1);
print(drText[6],23,50+i1,fCrypt); print(op.level[0],41,50+i1,fCrypt);
print(drText[7],23,59+i1,fCrypt); print("20/20",41,59+i1,fCrypt);
print("$",23,68+i1,fCrypt); print(string(op.moneyLight),41,68+i1,fCrypt);

//
//
//

if (page == "item" or page == "item2")
{
	draw_box(94,26,346/2,362/2,["light"]);
	
	res_i();
	repeat(array_length(op.itemLight))
	{
		print(op.itemLight[i]._infoText[0],116,44+i*16,,,,,,,,,,,,["menu","soul3","item",i]);
		++i;
	}
	
	res_i(); i1=[drText[3],drText[4],drText[5]];
	repeat(3)
	{
		print(i1[i],116*(i == 0)+164*(i == 1)+221*(i == 2),184,,,,,,,,,,,,["menu","soul3","item2",i]);
		++i;
	}
}

//

if (page == "stat")
{
	draw_box(94,26,346/2,418/2,["light"]);
	
	print("\""+op.party[0]._infoText[0]+"\"",108,46);
	
	print(drText[6]+"  "+string(op.level[0]),108,76);
	print(drText[7]+"  20 / 20",108,92);
	
	print(drText[8]+"  10 (1)",108,124);
	print(drText[9]+"  10 (0)",108,140);
	print(drText[10]+" 0",192,124);
	print(drText[11]+" 10",192,140);
	
	res_i(); i1=[]; repeat(2) { array_push(i1,"Nothing"); }
	if (op.equipped[0][0] != -1) { i1[0]=op.equipped[0][0]._lightName; }
	if (op.equipped[0][1] != -1) { i1[1]=op.equipped[0][1]._lightName; }
	
	print(drText[12]+" "+i1[0],108,170);
	print(drText[13]+" "+i1[1],108,186);
	
	print(drText[14]+" "+string(op.moneyLight),108,206);
}

//

if (page == "cell")
{
	draw_box(94,26,346/2,270/2,["light"]);
	
	res_i();
	repeat(array_length(op.cell))
	{
		print(op.cell[i]._infoText[0],116,44+i*16,,,,,,,,,,,,["menu","soul3","cell",i]);
		++i;
	}
}