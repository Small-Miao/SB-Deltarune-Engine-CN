func=function()
{
	if (op.partyPosOffset[2] == 0)
	{
		op.partyPosOffset=[0,0,1];
		add_follower(2,"followerN",an_noelle_walk());
	}
}