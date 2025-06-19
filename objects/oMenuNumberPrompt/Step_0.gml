use_keys();

if (state != 0) { reset_keys(); }

if (state > 0)
{
	state++;
	
	if (state == 30)
	{
		i = 0;
		check = true;
		
		repeat (length)
		{
			if (numbersKey[i] != numbers[i])
				check = false;
			
			i++;
		}
		
		if (check)
		{
			sound(snd_bell);
			
			textColor = c_yellow;
		}
		else
		{
			sound(snd_error);
			
			textColor = c_red;
		}
	}
	
	if (state == 60)
	{
		audio_sound_pitch(snd_menumove,1);
		
		instance_destroy();
		
		if (check)
		{
			if (func != -1) { func(); }else{ op.mode = "overworld"; }
		}
		else
		{
			anything_cutscene(["* (... wrong combination!)"]);
		}
	}
}



//keys
if tap_left()
{
	audio_sound_pitch(snd_menumove,1);
	sound(snd_menumove,,true);
	
	cursor--;
	
	if (cursor == -1)
		cursor = length-1;
}

if tap_right()
{
	audio_sound_pitch(snd_menumove,1);
	sound(snd_menumove,,true);
	
	cursor++;
	
	if (cursor == length)
		cursor = 0;
}


if tap_up()
{
	audio_sound_pitch(snd_menumove,1);
	sound(snd_menumove,,true);
	
	numbers[cursor]++;
	
	if (numbers[cursor] == maxNumber+1)
		numbers[cursor] = 0;
}

if tap_down()
{
	audio_sound_pitch(snd_menumove,0.9);
	sound(snd_menumove,,true);
	
	numbers[cursor]--;
	
	if (numbers[cursor] == -1)
		numbers[cursor] = maxNumber;
}

if tap_confirm()
{
	audio_sound_pitch(snd_menumove,1.1);
	sound(snd_menumove,,true);
	
	state = 1;
}