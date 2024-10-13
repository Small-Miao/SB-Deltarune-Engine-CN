func=function()
{
	if (array_length(op.partyFollow) != 1)
	{
		op.partyFollow=[0];
		
		char_animate(1,12,1,,,250-20,40);
		char_animate(1,,0,sSusie_Down);
		
		char_animate(2,12,1,,,250+20,40);
		char_animate(2,,0,sRalsei_Down);
	}
}