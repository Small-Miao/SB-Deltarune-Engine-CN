r=rRoom6;

func=function()
{
	if (array_length(op.party) > 2)
	{
		if (op.party[2]._isDarkner)
		{
			char_animate(2,20,1,,,160,60);
			char_animate(2,1,1,sRalsei_WaveWind,,,,,,["subnumber"]);
			char_animate(2,1,1,sRalsei_Wave,,,,,,["autooff"]);
		}
	}
}