++time;

if (time == 30) { sprite_index=sSoulBreak; sound(snd_break1); }

if (time < 70)
{
	draw_self();
}
else
{
	if (time == 70) { sound(snd_break2); repeat(6) { array_push(XY,[irandom_range(-20,20)/4,irandom_range(-24,-4)/4,x,y,irandom_range(0,3)]); } }
	
	res_i();
	repeat(array_length(XY))
	{
		draw_ext(sSoulShard,XY[i][4]+time*0.2,XY[i][2],XY[i][3],0.5,0.5);
		XY[i][2]+=XY[i][0];
		XY[i][3]+=XY[i][1];
		XY[i][1]+=0.25;
		++i;
	}
}