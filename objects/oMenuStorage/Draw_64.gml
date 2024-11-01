draw_ext(sPixel,0,20,60.5,561/2,310/2);
draw_ext(sPixel,0,22,62,(561-8)/2,(310-7)/2,,0);

draw_ext(sPixel,0,20,137.5,561/2,2);



//draw pocket
itemText="---";
res_i();

if (page == "start") { i1=c_gray; }else{ i1=c_dkgray; }
print(drText[0],30.5,70.5,fDotum,,,0.5,0.5,,i1);

res_i();
repeat (12)
{
	i1=77.5; i2=72.5+floor(i/2)*10;
	if (i mod 2) { i1+=110; }
	
	if (i >= array_length(op.item)) { i3="---"; }else{ i3=op.item[i]._infoText[0]; if (cursor == i and page == "start") { itemText=op.item[i]._infoText[1]; } }
	if (page == "start") { i4=c_white; }else{ i4=c_gray; }
	if (page == "storage" and i == saveCur[0]) { i4=c_yellow; }
	
	print(i3,i1,i2,fDotum,,,0.5,0.5,,i4,,,,,["menu_yellow","soul4","start",i]);
	++i;
}



//draw storage
res_i();

if (page == "storage") { i1=c_gray; }else{ i1=c_dkgray; }
print(drText[1],30.5,70.5+75,fDotum,,,0.5,0.5,,i1);
print(drText[2],30.5,70.5+110,fDotum,,,0.5,0.5,,i1);
print(string(storagePage+1)+"/2",30.5,70.5+120,fDotum,,,0.5,0.5,,i1);

res_i();
repeat (12)
{
	i1=77.5; i2=72.5+75+floor(i/2)*10;
	if (i mod 2) { i1+=110; }
	
	if (op.storage[i+storagePage*12] == -1) { i3="---"; }else{ i3=op.storage[i+storagePage*12]._infoText[0]; if (cursor == i and page == "storage") { itemText=op.storage[i+storagePage*12]._infoText[1]; } }
	if (page == "storage") { i4=c_white; }else{ i4=c_gray; }
	
	print(i3,i1,i2,fDotum,,,0.5,0.5,,i4,,,,,["menu_yellow","soul4","storage",i]);
	++i;
}

if (page == "storage")
{
	draw_ext(sMenu,18,16+round(dsin(op.time*10)),170);
	draw_ext(sMenu,18,304-round(dsin(op.time*10)),170,-1);
}

draw_ext(sPixel,,0,0,320,40,,0);
print(itemText,10,9,,16);



//darw soul cursor
draw_ext(sSoul2,0,op.soul4XY[0],op.soul4XY[1],0.25,0.25);