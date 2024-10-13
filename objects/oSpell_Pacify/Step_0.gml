++time;

if (time == 1)
{
	op.textCC=["* "+name_from+" cast PACIFY!"];
	if (!op.battle_enemyTired[numb_to]) { op.textCC[0]+=(" {delay:9} {jump} * But the enemy wasn't {color:blue} TIRED..."); }
	
	effect_pacify(numb_to);
	enemy_spare(numb_to,true);
	
	start_cutscene("cc_anything",10,true);
}

if (time == 20)
{
	instance_destroy();
}