++time;
if (time == 1)
{
	char_animate(numb_from,1,1,op.party[numb_from]._spriteMagic[array_length(op.party[numb_from]._spriteMagic)-1],0,,,,,["subnumber"]);
	char_animate(numb_from,1,1,op.party[numb_from]._spriteIdle,0);
	
	res_i(); i1=op.battle_enemy[numb_to];
	
	op.textCC=["* "+name_from+" spared "+i1._name+"!"];
	
	enemy_spare(numb_to);
	
	if (op.battle_enemySpare[numb_to] < 100)
	{
		if (!op.isBoss) { enemy_mercy(numb_to,20,false); }
		
		op.textCC[0]+=(" {delay:9} {jump} * But its name wasn't {color:yellow} YELLOW...");
		if (oMenuBattle.canTired and !oMenuBattle.canSpare)
		{
			//battle_enemyTired
			array_push(op.textCC,"* (Try using "+oMenuBattle.pacify[1]+"'s {color:blue} PACIFY!)");
		}
	}
	
	start_cutscene("cc_anything",10,true);
}

if (time == 20)
{
	instance_destroy();
}