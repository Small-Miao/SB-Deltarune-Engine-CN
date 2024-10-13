step=function()
{
	if (op.dodge and !(op.time mod 20))
	{
		spawn_bullet(,,x,y,[0,0,1,0.5,10],500);
	}
}