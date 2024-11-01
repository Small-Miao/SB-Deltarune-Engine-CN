++time;

if (time == 1)
{
	char_animate(numb_from,1,1,sSusie_Swing,0,,,,,["subnumber"]);
	
	op.textCC=["* "+name_from+" cast RUDEBUSTER!"];
	
	start_cutscene("cc_anything",30+12,true);
}



if (time == 30)
{
	sound(snd_rudebusterswing);
	effect_rudebuster(char(numb_from).x+10,char(numb_from).y-20,char("ene"+string(numb_to)).x,char("ene"+string(numb_to)).y-20);
}



if (time >= 30)
{
	use_keys();
	if tap_confirm() { damageExtra=30; }
}



if (time == 30+12)
{
	sound(snd_rudebusterhit);
	enemy_damage(numb_from,numb_to,0,(op.attack[numb_from]*11)+(op.magic[numb_from]*5)-(op.defense[numb_from]*3)+damageExtra,false);
	instance_destroy();
}