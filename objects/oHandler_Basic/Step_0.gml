use_keys();


//sets which attack pattern should be used & displays the enemys dialouge
if (execute)
{
	execute=false; handlerTime=90;
	if (array_length(op.battle_enemy[numb_from]._textRandom) > 0)
	{
		//sets dialouge at random from enemy struct (_textRandom) pool
		op.textCC=op.battle_enemy[numb_from]._textRandom[irandom_range(0,array_length(op.battle_enemy[numb_from]._textRandom)-1)];
		op.textCC[2]=op.battle_enemyXY[numb_from][0]+op.battle_enemy[numb_from]._boubleOffsetXY[0];
		op.textCC[3]=op.battle_enemyXY[numb_from][1]+op.battle_enemy[numb_from]._boubleOffsetXY[1];
		
		if (oMenuBattle.forceSpeak[numb_from] != -1)
		{
			op.textCC[0]=oMenuBattle.forceSpeak[numb_from][0];
			op.textCC[1]=oMenuBattle.forceSpeak[numb_from][1];
		}
		
		start_cutscene("cc_bouble_basic");
	}
	else
	{
		handlerTime=0;
	}
	
	//sets attack pattern at random from enemy struct (_patterns) pool
	set_pattern(op.battle_enemy[numb_from]._patterns[irandom_range(0,array_length(op.battle_enemy[numb_from]._patterns)-1)]);
}


//automaticaly remove the dialouge after 75 frames
if (handlerTime != 0)
{
	--handlerTime;
	if (handlerTime == 0) or (handlerTime <= 75 and tap_confirm())
	{
		--oMenuBattle.handlerCounter;
	}
}