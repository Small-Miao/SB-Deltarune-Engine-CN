func=function()
{
	add_party("pep_susie");
}

draw=function()
{
	draw_ext(sSusie_Down,op.time/10,x+10,y+20);
	draw_ext(sCross,1,x,y,,,,,0.5);
}