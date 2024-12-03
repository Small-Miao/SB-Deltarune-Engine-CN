res_i();

func=function()
{
	sound(snd_impact);
	
	char_animate("n",30,1,,,irandom_range(30,290),irandom_range(150,220),,,["override"]);
	char_animate("q",15,2,,,irandom_range(30,290),irandom_range(150,220),,,[]);
	
	++i;
	if (i == 4) { i=1; }
	if (i == 1) { char_animate("t",1,0,sToriel_Facepalm,0,,,,,["jump###"]); }
	if (i == 2) { char_animate("t",1,1,sToriel_Piano,0,,,,,["jump###"]); }
	if (i == 3) { char_animate("t",1,0,sToriel_Chair,0,,,,,["jump###"]); }
}