draw_ext(sSoulVoid,0,op.soul4XY[0]+8.5,op.soul4XY[1]+4.5,,,,,0.5*alpha);

res_i();
repeat(string_length(bet))
{
	++i;
	print(string_char_at(bet,i),68+i2*20,74+i3*20,,,,,,,,,,,alpha,["menu_yellow","soul4","start",i-1]);
	
	++i2;
	if (i2 >= 10) { i2=0; ++i3; }
}

print(drText[0],188,114,,,,,,,,,,,alpha,["menu_yellow","start","back"]);
print(drText[1],228,114,,,,,,,,,,,alpha,["menu_yellow","start","end"]);

if (cursor == "back")
{
	op.soul4XY[0]+=((198-5)-op.soul4XY[0])/2;
	op.soul4XY[1]+=((114-4+3.5)-op.soul4XY[1])/2;
}

if (cursor == "end")
{
	op.soul4XY[0]+=((229.5)-op.soul4XY[0])/2;
	op.soul4XY[1]+=((114-4+3.5)-op.soul4XY[1])/2;
}

res_i(); i1=c_white; if (string_length(type) == typeLength) { i1=c_yellow; }
print(type,160,44,,,,,,,i1,,,,alpha,["fa_center"]);

print(topText,160,24,,,,,,,,,,,alpha,["fa_center","blur"]);

//

if (draw != -1) { draw(); }