func = function()
{
	set_mode(0);
	camera_move(15,op.playerX,y-70);
	effect_puzzleText();
}

draw = function()
{
	draw_ext(sSign,0,x,y,,,,c_aqua);
}