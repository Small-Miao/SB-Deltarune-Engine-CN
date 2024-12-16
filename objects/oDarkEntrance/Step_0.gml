//spawn oInteract in place of this object
with(instance_create_depth(x,y,-y,oInteract))
{
	image_xscale=2; image_yscale=1;

	_id="darkEntrance";

	r=oDarkEntrance.r;
	fast=oDarkEntrance.fast;
	sprite=oDarkEntrance.sprite;

	image=0;

	func=function()
	{
		cutscene_darkEntrance(x+image_xscale*10,y,r,fast);
	}

	draw=function()
	{
		if (op.showHitboxes) { draw_ext(sDarkEntrance,0,x,y,image_xscale/2,image_yscale); }
	
		draw_ext(sprite,image,x+20,y+20);
	}
}

instance_destroy();