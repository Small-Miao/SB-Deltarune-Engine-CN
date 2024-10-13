if (place_meeting(x,y,oSoul) and oSoul.counter == 0)
{
	if (oSoul.iframes == 0)
	{
		oSoul.iframes=oSoul.iframesMax;
		oSoul.damage=damage;
		if (op.mode == "battle") { oSoul.damage+=oMenuBattle.enemyAttackExtra[numb]; }
		oSoul.enemyNumb=numb;
	}
	instance_destroy();
}

if (place_meeting(x,y,oGraze) and !grazed and oSoul.iframes == 0)
{
	grazed=true; oSoul.graze=1;
	oMenuBattle.tp=clamp(oMenuBattle.tp+tp,0,100);
	
	sound(snd_graze);
}