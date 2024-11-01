++time;

if (time == 1)
{
	op.partyOn=numb_to;
	
	item=oMenuBattle.sel_item[numb_from][0];
	
	op.textCC=["* "+name_from+" used the "+string_upper(item._infoText[0])+"!"];
	
	if (item._customBattleText != -1) { op.textCC=[item._customBattleText]; }
	
	start_cutscene("cc_anything",10,true);
	
	char_animate(numb_from,1,1,op.party[numb_from]._spriteIdle,0);
	
	if (item._func != -1) { item._func(); }
}



if (time == 20)
{
	if (item._heal != 0) { party_heal(numb_to,item._heal,array_contains(item._seed,"everyone")); }
	instance_destroy();
}