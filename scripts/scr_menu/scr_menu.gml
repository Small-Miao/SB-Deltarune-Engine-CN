//declare menu cursor variables
function reset_cursor()
{
	page=0;
	cursor=0;
	
	saveCur=[0,0,0,0,0,0];
	fix=false; grab=0;
	
	offset=0; offsetPress=0;
	
	undo=[];
	
	frame=false;
}

//run auto curaor and undo controls
function use_cursor()
{
	fix=false;
	
	if (tapConfirm) { array_insert(undo,0,[page,cursor]); }
	
	if (array_length(undo) > 0) { if tap_cancel() { page=undo[0][0]; cursor=undo[0][1]; array_delete(undo,0,1); } }
}

//force the run undo function (0 = stay in place) (1 == move back one step) (2 == move back two steps)
function force_undo(_amount=1)
{
	audio_stop_sound(snd_select);
	repeat(_amount+1) { page=undo[0][0]; cursor=undo[0][1]; array_delete(undo,0,1); }
}



//auto make vertical cursor movement
function vertical_cursor(_length=1)
{
	if !(tapConfirm or tapCancel)
	{
		if tap_up() { if (menuSound) { sound(snd_menumove); } --cursor; if (cursor == -1) { cursor=_length-1; } }
		if tap_down() { if (menuSound) { sound(snd_menumove); } ++cursor; if (cursor == _length) { cursor=0; } }
	}
}

//auto make horizontal cursor movement
function horizontal_cursor(_length=1)
{
	if !(tapConfirm or tapCancel)
	{
		if tap_left() { if (menuSound) { sound(snd_menumove); } --cursor; if (cursor == -1) { cursor=_length-1; } }
		if tap_right() { if (menuSound) { sound(snd_menumove); } ++cursor; if (cursor == _length) { cursor=0; } }
	}
}

//auto make 2 wide menu vertical cursor movement
function wide_cursor(_length=1)
{
	var pastCursor=cursor;
	
	if !(tapConfirm or tapCancel)
	{
		if tap_up() { if (menuSound) { sound(snd_menumove); } cursor-=2; }
		if tap_down() { if (menuSound) { sound(snd_menumove); } cursor+=2; }
		if tap_left() { if (menuSound) { sound(snd_menumove); } if (cursor mod 2) { --cursor; }else{ ++cursor; } }
		if tap_right() { if (menuSound) { sound(snd_menumove); } if (cursor mod 2) { --cursor; }else{ ++cursor; } }
	}
	
	if (cursor >= _length) { if (_length mod 2) { cursor=_length-1; }else{ cursor=pastCursor; } }
	if (cursor < 0) { cursor=pastCursor; }
}



//spawn the soul prompt menu & add options and the results of each option
function prompt(_func=[-1],_text=["Skip"],_xy=-1,_width=-1,_fa=["L"],_autoDimensions=-1)
{
	if (_autoDimensions == "u")
	{
		op.menuPrompt = [12,1,296.5,83.5];
		set_mode(0);
	}
	
	if (_autoDimensions == "d")
	{
		op.menuPrompt = [12,156,296.5,83.5];
		set_mode(0);
	}
	
	
	
	with (instance_create_depth(0,0,-9999,oMenuPrompt))
	{
		func=_func;
		text=_text;
		
		xy=_xy; fa=_fa;
		
		if (_xy == -1)
		{
			if (array_length(func) == 1) { xy=[[op.menuPrompt[2]/2,36]]; fa=["C"]; cursor=0; }
			if (array_length(func) == 2) { xy=[[27,36],[op.menuPrompt[2]-27,36]]; fa=["L","R"]; }
			if (array_length(func) == 3) { xy=[[op.menuPrompt[2]/2,18],[27,36],[op.menuPrompt[2]-27,36]]; fa=["C","L","R"]; }
			if (array_length(func) == 4) { xy=[[op.menuPrompt[2]/2,18],[27,36],[op.menuPrompt[2]-27,36],[op.menuPrompt[2]/2,18*3]]; fa=["C","L","R","C"]; }
			
			var i=0;
			if (op.mode == "battle") { repeat(array_length(xy)) { xy[i][0]+=15; xy[i][1]-=3; ++i; } }
		}
		
		if (_width == -1) { width=[999,999,999,999]; }else{ width=_width; }
	}
}

//spawn a box that you can input a number on
function numberPrompt(_numberArray=[1,2,3,4],_maxNumber=9,_func=-1)
{
	with (instance_create_depth(0,0,-9999,oMenuNumberPrompt))
	{
		numbersKey = _numberArray;
		length = array_length(_numberArray);
		
		maxNumber = _maxNumber;
		
		func = _func;
	}
}