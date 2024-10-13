func=function()
{
	if (op.partyPosOffset[2] == 1)
	{
		op.partyPosOffset=[0,0,0];
		remove_follower(0);
		party_lerp();
	}
}