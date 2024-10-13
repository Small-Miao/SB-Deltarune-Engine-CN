func=function()
{
	if (array_length(op.partyFollow) == 1)
	{
		op.partyFollow=[0,1,2];
		party_lerp();
	}
}