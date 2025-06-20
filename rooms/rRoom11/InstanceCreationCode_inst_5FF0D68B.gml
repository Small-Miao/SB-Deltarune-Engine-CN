func = function()
{
	anything_cutscene(
	[
	"* {color:blue} New features added just because:"
	,"* {color:yellow} anything_cutscene(); {color:white} makes it easy to create one-of scenes without making a new struct."
	,"* The slopes we're improved and can now be placed however you want without crashing the game."
	,"* Removed enum faces because they always break."
	,"* {color:yellow} _autoDimensions {color:white} was added to the {color:yellow} prompt(); {color:white} function."
	,"* {color:yellow} Controler support."
	]);
}

draw = function()
{
	draw_ext(sSign,0,x,y,,,,c_ltgray);
}