++time;
if (time == 1) { op.mode="dead"; }

if (time == 45) { instance_create_depth(op.x+XY[0],op.y+XY[1],-9999,oSoulBreakEffect); }
if (time == 150) { music(mus_defeat); }

//op.isBoss=true;

//

use_keys();

if (page == "sel" and !stop)
{
	if (cursor == 0)
	{
		res_i(); i=true;
		if (tap_left() and i) { i=false; cursor=1; }
		if (tap_right() and i) { i=false; cursor=2; }
		if (op.isBoss) { if (tap_down() and i) { i=false; cursor=3; } }
	}
	
	if (cursor == 1)
	{
		res_i(); i=true;
		if (tap_right() and i) { i=false; cursor=2; }
		if (op.isBoss) { if (tap_down() and i) { i=false; cursor=3; } }
		
		if tap_confirm()
		{
			music_stop(); 
			
			audio_sound_pitch(snd_dtranslw,1);
			audio_sound_gain(snd_dtranslw,1,0);
			sound(snd_dtranslw);
			
			stop=true;
			transition("darkExit",function() { op.isBoss=false; instance_destroy(oMenuGameOver); if (array_length(op.checkpointProgress) == 0) { file_load(); }else{ file_load("overworld"); } });
		}
	}
	
	if (cursor == 2)
	{
		res_i(); i=true;
		if (tap_left() and i) { i=false; cursor=1; }
		if (op.isBoss) { if (tap_down() and i) { i=false; cursor=3; } }
		
		if tap_confirm() { music_stop(); stop=true; op.isBoss=false; stopAlpha=0.1; start_cutscene("cc_giveUp"); }
	}
	
	if (cursor == 3)
	{
		res_i(); i=true;
		if ((tap_left() or tap_up()) and i) { i=false; cursor=1; }
		if (tap_right() and i) { i=false; cursor=2; }
		
		if tap_confirm()
		{
			music_stop();
			stop=true;
			op.retryBattleTimer=10;
			reset_party_position();
			file_load("battle");
			//
			
			//
			start_battle();
			instance_destroy();
		}
	}
}