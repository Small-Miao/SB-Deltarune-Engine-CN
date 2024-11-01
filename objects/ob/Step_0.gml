if array_contains(op.battle_seed,"something")
{
	if (loopSignal)
	{
		loopSignal=false;
	}
	
	if (endSignal)
	{
		endSignal=false;
		
		add_enemy("enemy_ambu",0,100,,["jump2"]);
		add_enemy("enemy_viro",1,100,,["jump2"]);
		add_enemy("enemy_ambu",2,100,,["jump2"]);
	
		//force_partyTurn();
		force_enemyTurn();
	}
}