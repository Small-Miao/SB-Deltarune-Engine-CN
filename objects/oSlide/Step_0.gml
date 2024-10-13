if (op.showHitboxes) { image_alpha=1; }else{ image_alpha=0; }

if (op.mode == "overworld" and op.movement == "overworld" and place_meeting(x,y,oPlayerCol))
{
	op.movement="slide";
	touch=true;
	
	if (noise)
	{
		sound(snd_noise);
		audio_sound_pitch(snd_rumble,3);
		sound(snd_rumble,true);
	}
}

if (touch and !place_meeting(x,y,oPlayerCol))
{
	op.movement="overworld";
	op.partyPos[0][4]="overworld";
	touch=false;
	
	if (noise)
	{
		audio_sound_pitch(snd_rumble,1);
		audio_stop_sound(snd_rumble);
	}
}