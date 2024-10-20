function cc_giveUp() : cc_base() constructor
{
	_dialogue=["THEN THE WORLD {delay:10} {jump} WAS COVERED {delay:10} {jump} IN DARKNESS."];
	
	_x=[72]; _y=[84];
	_xScale=[230];
	_boxOffsetXY=[0,0];
	_box=[-1];
	_printSeed=[["blur"]];
	_xOffset=4; _yOffset=20;
	_voice=[-1];
	_textSpeed=[3];
	_moveAfter=false;
	
	_func=function()
	{
		//instance_destroy(oMenuGameOver);
		music(mus_darkness);
		
		with (instance_create_depth(0,0,0,oRun))
		{
			reset_keys();
			step=function(){ use_keys(); if (time >= 69.77*30 or tap_confirm()) { instance_destroy(oMenuGameOver); music_stop(); room_goto(rMainMenu); } }
		}
	}
}