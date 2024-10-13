++time;
if (time == 1)
{
	op.textCC=op.battle_enemy[numb_to]._checkText;
	start_cutscene("cc_anything",10,true);
	instance_destroy();
}