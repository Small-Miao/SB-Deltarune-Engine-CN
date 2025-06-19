func = function()
{
	anything_cutscene(["* The code is {color:yellow} \"1 2 3 4\"."],function(){ numberPrompt(,,function(){ anything_cutscene(["* Good job"]); }); });
}

draw = function()
{
	draw_ext(sSign,0,x,y,,,,c_yellow);
}