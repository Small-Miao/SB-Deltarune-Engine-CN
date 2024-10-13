function music(_soundid,_force=false,_loops=true)
{
	if (op.currentMusic != _soundid or _force)
	{
		if (op.currentMusic != -1) { audio_stop_sound(op.currentMusic); }
		
		op.currentMusic=_soundid;
		
		audio_stop_sound(_soundid);
		audio_play_sound(_soundid,999,_loops);
		music_fade(,1,1);
	}
}

function music_fade(_soundid=op.currentMusic,_level=0,_time=1000,_stop=false)
{
	audio_sound_gain(_soundid,_level,_time);
	
	stuff=[_soundid,_time];
	if (_stop)
	{
		with (instance_create_depth(0,0,0,oRun))
		{
			i1=[other.stuff[0],other.stuff[1]];
			step=function(){ if (time >= (i1[1]/1000)*30) { op.currentMusic=-1; audio_sound_gain(i1[0],1,1); audio_stop_sound(i1[0]); instance_destroy(); } }
		}
	}
}

function music_stop(_soundid=op.currentMusic)
{
	audio_stop_sound(_soundid);
	if (_soundid == op.currentMusic) { op.currentMusic=-1; }
}

//
//
//

function sound(_soundid=-1,_loops=false)
{
	if (_soundid != -1) { audio_play_sound(_soundid,999,_loops); }
}