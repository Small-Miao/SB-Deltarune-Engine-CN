touch=false;
noise=true;

with(instance_create_depth(x,y+(image_yscale-0.5)*20,0,oWall))
{
	image_xscale=other.image_xscale;
	
	func=function()
	{
		if (op.playerY < y+22) { image_yscale=0; }else{ image_yscale=0.5; }
	}
}