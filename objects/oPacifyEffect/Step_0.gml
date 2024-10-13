++time;

if !(time mod 2)
{
	effect_fade(sPacifyZ,0,x,y-30,0.5,0.5,direction,,,-9999,["walkDirection","expand2"]);
	direction+=40;

	if (time >= (delay+1)*2) { instance_destroy(); }
}