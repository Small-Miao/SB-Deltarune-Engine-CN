if (execute)
{
	execute=false; op.textCC=["Nothing"];
	
	
	
	++counter;
	if (counter > 3) { counter=1; }
	
	
	
	if (counter == 1)
	{
		set_pattern(pattern1);
		op.textCC=["JEVIL 1"];
		op.battle_flavourText="Where will 1 show up?";
	}
	
	if (counter == 2)
	{
		set_pattern(pattern2);
		op.textCC=["JEVIL 2"];
		op.battle_flavourText="Where will 2 show up?";
	}
	
	if (counter == 3)
	{
		set_pattern(pattern3);
		op.textCC=["JEVIL 3"];
		op.battle_flavourText="Where will 3 show up?";
	}
	
	
	
	op.funcCC=function(){ oMenuBattle.handlerCounter=0; }
	start_cutscene("cc_anything");
}