++time;
if (time == 1)
{
	//animate party member
	char_animate(numb_from,1,1,op.party[numb_from]._spriteMagic[array_length(op.party[numb_from]._spriteMagic)-1],0,,,,,["subnumber"]);
	char_animate(numb_from,1,1,op.party[numb_from]._spriteIdle,0);
	
	
	
	enemy=op.battle_enemy[numb_to];
	
	enemy_spare(numb_to);
	
	//adds text of who tried to spare the enemy
	op.textCC=["* "+name_from+" spared "+enemy._name+"!"];
	
	
	
	if (op.battle_enemySpare[numb_to] < 100)
	{
		if (!op.isBoss) { enemy_mercy(numb_to,20,false); }
		
		//adds to the line text if the enemy does not have 100% spare
		op.textCC[0]+=(" {delay:9} {jump} * But its name wasn't {color:yellow} YELLOW...");
		
		if (oMenuBattle.canTired and !oMenuBattle.canSpare)
		{
			//adds a new line if the enemy is tired when you try to spare it
			array_push(op.textCC,"* (Try using "+oMenuBattle.pacify[1]+"'s {color:blue} PACIFY!)");
		}
	}
	
	start_cutscene("cc_anything",10,true);
}



if (time == 20)
{
	instance_destroy();
}