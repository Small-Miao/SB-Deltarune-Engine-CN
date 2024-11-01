if (op.showHitboxes) { image_alpha=1; }else{ image_alpha=0; }

//step on
if (place_meeting(x,y,oPlayerCol) and check)
{
	check=false;
	if (func != -1) { func(); }
	if (destroy) { instance_destroy(); }
}

//step off
if (!place_meeting(x,y,oPlayerCol) and !check)
{
	check=true;
	if (func2 != -1) { func2(); }
}