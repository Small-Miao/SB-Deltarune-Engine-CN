step=function()
{
	if (op.dodge and !(op.time mod 10))
	{
		spawn_bullet(,,x,y,[0,-0.1,0,0.1,10],1);
	}
}