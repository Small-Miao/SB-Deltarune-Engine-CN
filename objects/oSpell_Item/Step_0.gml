++time;

if (time == 1)
{
	op.partyOn=numb_to;
	
	res_i() i1=oMenuBattle.sel_item[numb_from][0];
	
	op.textCC=["* "+name_from+" used the "+string_upper(i1._infoText[0])+"!"];
	
	if (i1._customBattleText != -1) { op.textCC=[i1._customBattleText]; }
	
	start_cutscene("cc_anything",10,true);
	
	char_animate(numb_from,1,1,op.party[numb_from]._spriteIdle,0);
	
	if (i1._func != -1) { i1._func(); }
}

if (time == 20)
{
	if (i1._heal != 0) { party_heal(numb_to,i1._heal,array_contains(i1._seed,"everyone")); }
	instance_destroy();
}