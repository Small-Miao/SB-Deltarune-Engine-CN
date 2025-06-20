func = function()
{
	set_mode(0);
	camera_move(15,op.playerX,y-70);
	effect_puzzleText(["AAA","AAAAAAAAAAAA"],[0,0,160,100],,[0,0,160,130],["BBBBBBBBBBBBBBBBBB","BBB"],[0,0,160,160],,,["fa_center"]);
}

draw = function()
{
	draw_ext(sSign,0,x,y,,,,c_aqua);
}