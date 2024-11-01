if (time < 45) { if surface_exists(op.dieSprite) { draw_surface_ext(op.dieSprite,0,0,0.5,0.5,0,c_white,1); } }

if (time > 145)
{
	if (alpha[0] < 1) { alpha[0]+=1/20; }
	draw_ext(sPixel,0,0,0,9999,9999,,0,alpha[0]);
	draw_ext(sGameOver,0,0,20,,,,,alpha[0]);
}

if (time == 180) { start_cutscene("cc_gameOver"); }

if (page == "sel")
{
	if (alpha[1] < 1) { alpha[1]+=1/10; }
	
	if (cursor == 1) { moveSoul(160-52,190); }
	if (cursor == 2) { moveSoul(160+52,190); }
	if (cursor == 3) { moveSoul(160,190+20); }
	
	draw_ext(sSoulVoid,0,round(soulXY[0]),round(soulXY[1]),,,,,0.5+0.25/2);
	
	print(drText[0],160-52,184,,,,,,,,,,,alpha[1],["fa_center","menu_yellow","sel",1]);
	print(drText[1],160+52,184,,,,,,,,,,,alpha[1],["fa_center","menu_yellow","sel",2]);
	
	if (op.isBoss) { print(drText[2],160,184+20,,,,,,,,,,,alpha[1],["fa_center","menu_yellow","sel",3]); }
}



draw_ext(sPixel,0,0,0,9999,9999,,0,stopAlpha);
if (stopAlpha < 1 and stopAlpha > 0) { stopAlpha+=0.1; }