++time;

if (time == 1)
{
	op.textCC=["* "+name_from+" cast HEAL PRAYER!"];
	
	start_cutscene("cc_anything",10,true);
}

if (time == 20)
{
	party_heal(numb_to,[op.magic[numb_from]*5]);
	instance_destroy();
}