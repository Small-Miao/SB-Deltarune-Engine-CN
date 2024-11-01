//use cellphone in darkworld scene
function cc_cellPhone() : cc_base() constructor
{
	_dialogue=["* (You tried to call on the Cell Phone.) {func}"];
	
	_seed=["noConfirm"];
	
	
	
	_funcAny[0]=function()
	{
		audio_pause_sound(op.currentMusic);
		
		sound(snd_smile);
		
		
		
		with (instance_create_depth(0,0,0,oRun))
		{
			step=function()
			{
				if (time == 200)
				{
					instance_destroy(oDialogue)
					audio_resume_sound(op.currentMusic);
					
					op.textCC=["* It's nothing but garbage noise."];
					start_cutscene("cc_anything");
				}
			}
		}
	}
}