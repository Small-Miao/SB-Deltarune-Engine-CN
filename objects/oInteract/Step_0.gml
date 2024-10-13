++time;
if (time == 1) { with (instance_create_depth(x,y,0,oWall)) { image_alpha=0; image_xscale=other.image_xscale; image_yscale=other.image_yscale; forceHide=true; if (false) { sticky=true; } } }

if (op.mode == "overworld" and check) { check=false; }

if (step != -1)
{
	step();
}