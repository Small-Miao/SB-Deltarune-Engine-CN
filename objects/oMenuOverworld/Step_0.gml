use_keys(true); if (endMenu) { reset_keys(); introY+=(1-introY)/2; if (introY >= 0.9) { instance_destroy(); } }else{ introY+=(0-introY)/2; }
if (page == "mainMenuRoom") { reset_keys(); }
if (page != "bind") { use_cursor(); }
++time;



top=true;
if (keybindGlow > 0) { keybindGlow-=0.1; }
op.hudY+=(46-op.hudY)/2;



if (page == 0)
{
	if (tap_cancel(,false) or tap_menu(,false)) { endMenu=true; op.mode="overworld"; }
	
	horizontal_cursor(4); op.overworldMenuSaveCursor[0]=cursor; op.menuPep=-1;
	saveCur=[0,0,0,0,0,0,0,0,0];
	
	if tap_confirm(0) { page="item1"; cursor=0; }
	if tap_confirm(1) { if (array_length(op.party) > 0) { page="equip1"; cursor=op.overworldMenuSaveCursor[2]; }else{ force_undo(0); } }
	if tap_confirm(2) { if (array_length(op.party) > 0) { page="power1"; cursor=op.overworldMenuSaveCursor[2]; }else{ force_undo(0); } }
	if tap_confirm(3) { page="config1"; cursor=0; }
}



if (page == "item1")
{
	horizontal_cursor(3); saveCur[0]=cursor; op.menuPep=-1;
	
	if tap_confirm(0) { if (array_length(op.item) > 0) { page="itemUSE"; cursor=saveCur[1]; }else{ force_undo(0); } }
	if tap_confirm(1) { if (array_length(op.item) > 0) { page="itemTOSS"; cursor=saveCur[1]; }else{ force_undo(0); } }
	if tap_confirm(2) { if (array_length(op.itemKey) > 0) { page="itemKEY"; cursor=saveCur[2]; }else{ force_undo(0); } }
}

if (page == "itemUSE" or page == "itemTOSS")
{
	top=false; op.menuPep=-1;
	wide_cursor(array_length(op.item)); saveCur[1]=cursor;
	
	if (page == "itemUSE") { if tap_confirm() { if (op.item[cursor]._canSelect) { page="itemUSEUSE"; cursor=op.overworldMenuSaveCursor[1]; }else{ force_undo(0); } } }
	if (page == "itemTOSS") { if tap_confirm() { page="itemTOSSUSE"; cursor=0; } }
}
if (page == "itemKEY")
{
	top=false; op.menuPep=-1;
	wide_cursor(array_length(op.itemKey)); saveCur[2]=cursor;
	
	if tap_confirm()
	{
		if (op.itemKey[cursor]._func != -1) { if (op.itemKey[cursor]._sound != -1) { sound(op.itemKey[cursor]._sound); } op.itemKey[cursor]._func(); endMenu=true; }
		force_undo(0);
	}
}

if (page == "itemUSEUSE" or page == "itemTOSSUSE")
{
	top=false;
	horizontal_cursor(array_length(op.party)); op.menuPep=cursor; op.partyOn=cursor; op.overworldMenuSaveCursor[2]=cursor;
	op.overworldMenuSaveCursor[1]=cursor;
	if (array_contains(op.item[saveCur[1]]._seed,"everyone") or page == "itemTOSSUSE") { op.overworldMenuSaveCursor[1]=0; cursor=0; op.menuPep="all"; }
	
	if tap_confirm()
	{
		if (page == "itemUSEUSE")
		{
			if (op.item[saveCur[1]]._sound != -1) { sound(op.item[saveCur[1]]._sound); }
			
			if (op.item[saveCur[1]]._func != -1)
			{
				op.item[saveCur[1]]._func();
			}
			else
			{
				party_heal(op.overworldMenuSaveCursor[1],op.item[saveCur[1]]._heal,array_contains(op.item[saveCur[1]]._seed,"everyone"));
				
				res_i();
				if array_contains(op.item[saveCur[1]]._seed,"everyone")
				{
					repeat (array_length(op.party))
					{
						op.overworldMenuSaveCursor[2]=i; reactionSet(op.item[saveCur[1]]._reactionText[op.party[i]._numberExistence]);
						++i;
					}
					op.overworldMenuSaveCursor[2]=0;
				}
				else
				{
					reactionSet(op.item[saveCur[1]]._reactionText[op.party[op.menuPep]._numberExistence]);
				}
				
				//extra reactions (_forceReact)
				res_i();
				repeat (array_length(op.item[saveCur[1]]._forceReact))
				{
					op.overworldMenuSaveCursor[2]=existence_to_numb(op.item[saveCur[1]]._forceReact[i][0]);
					if (op.overworldMenuSaveCursor[2] != op.menuPep and op.overworldMenuSaveCursor[2] != -1)
					{
						reactionSet(op.item[saveCur[1]]._forceReact[i][1]);
					}
					++i;
				}
			}
		}
		
		if (op.item[saveCur[1]]._removeItem) { array_delete(op.item,saveCur[1],1); }
		force_undo(); if (array_length(op.item) == 0) { force_undo(0); }else{ if (cursor == array_length(op.item)) { --cursor; --saveCur[1]; } }
	}
}



if (page == "equip1" or page == "power1")
{
	if (page == "power1") and (tapLeft or tapRight) { op.dogRandom=ceil(random(100)); }
	horizontal_cursor(array_length(op.party)); op.menuPep=cursor; op.partyOn=cursor; op.overworldMenuSaveCursor[2]=cursor;
	
	if tap_confirm()
	{
		if (page == "equip1") { page="equipped"; }
		if (page == "power1") { page="spells"; }
		cursor=0;
	}
}

if (page == "equipped")
{
	top=false;
	vertical_cursor(3); saveCur[0]=cursor;
	
	if tap_confirm() { page="weaarm"; if (saveCur[0] == 0) { cursor=saveCur[1]; }else{ cursor=saveCur[2]; } }
}

if (page == "weaarm")
{
	top=false;
	if (tapUp) { if (saveCur[0] == 0) { --saveCur[3]; }else{ --saveCur[4]; } }
	if (tapDown) { if (saveCur[0] == 0) { ++saveCur[3]; }else{ ++saveCur[4]; } }
	
	if (saveCur[3] == -1) { --saveCur[5]; } if (saveCur[3] == 6) { ++saveCur[5]; } /**/ if (saveCur[5] == -1) { saveCur[5]=42; saveCur[3]=5; } if (saveCur[5] == 43) { saveCur[5]=0; saveCur[3]=0; }
	if (saveCur[4] == -1) { --saveCur[6]; } if (saveCur[4] == 6) { ++saveCur[6]; } /**/ if (saveCur[6] == -1) { saveCur[6]=42; saveCur[4]=5; } if (saveCur[6] == 43) { saveCur[6]=0; saveCur[4]=0; }
	
	saveCur[3]=clamp(saveCur[3],0,5); saveCur[4]=clamp(saveCur[4],0,5);
	
	
	
	vertical_cursor(48); if (saveCur[0] == 0) { saveCur[1]=cursor; }else{ saveCur[2]=cursor; }
	
	if tap_confirm()
	{
		res_i(); i=true; if (saveCur[0] == 0) { i1=op.weapon; }else{ i1=op.armor; } i2=op.party[op.overworldMenuSaveCursor[2]]._numberExistence;
		
		if (saveCur[0] == 0)
		{
			if (i) { if (i1[cursor] == -1) { i=false; } }
			if (i) { if (i2 != i1[cursor]._numberExistence) { i=false; reactionSet(i1[cursor]._reactionText[i2]); } }
		}
		
		if (i and i1[cursor] != -1) { if (array_contains(i1[cursor]._cantHave,i2)) { i=false; reactionSet(i1[cursor]._reactionText[i2]); } }
		
		if array_contains(op.party[op.overworldMenuSaveCursor[2]]._seed,"greed")
		{
			if (saveCur[0] == 0 and i1[cursor] != -1 and i) { if (i1[cursor]._attack < op.equipped[op.overworldMenuSaveCursor[2]][0]._attack) { sound(snd_cantselect); i=false; reactionSet(op.party[op.overworldMenuSaveCursor[2]]._greedText[0]); } }
			if (saveCur[0] > 0 and i1[cursor] == -1 and i) { sound(snd_cantselect); i=false; reactionSet(op.party[op.overworldMenuSaveCursor[2]]._greedText[1]); }
		}
		
		if (i) { if (i1[cursor] != -1) { reactionSet(i1[cursor]._reactionText[i2]); } equip_item(op.overworldMenuSaveCursor[2],saveCur[0],cursor); force_undo(); }else{ sound(snd_cantselect); force_undo(0); }
	}
}



if (page == "spells")
{
	top=false;
	vertical_cursor(array_length(op.spells[op.overworldMenuSaveCursor[2]]));
	if tap_confirm() { force_undo(0); }
}



if (page == "config1")
{
	vertical_cursor(7);
	
	if tap_confirm(0) { page="volume"; cursor=0; }
	if tap_confirm(1) { page="controls"; cursor=0; }
	
	if tap_confirm(2) { force_undo(0); if (op.option_simplifyVFX) { op.option_simplifyVFX=false; }else{ op.option_simplifyVFX=true; } config_save(); }
	if tap_confirm(3) { force_undo(0); if (window_get_fullscreen()) { window_set_fullscreen(false); window_set_size(320*4,240*4); window_center(); }else{ window_set_fullscreen(true); } }
	if tap_confirm(4) { force_undo(0); if (op.option_autoRun) { op.option_autoRun=false; }else{ op.option_autoRun=true; } config_save(); }
	
	if tap_confirm(5) { page="mainMenuRoom"; cursor=0; music_stop(); transition(,function(){ room_goto(op.mainMenuRoom); }); }
	if tap_confirm(6) { force_undo(1); }
}

if (page == "volume")
{
	if (key_left() and op.option_volume != 0)    { if !(op.time mod 2) and (key_left()-key_right() != 0) { sound(snd_noise); } op.option_volume-=2; audio_group_set_gain(audiogroup_default,op.option_volume/100,0); config_save(); }
	if (key_right() and op.option_volume != 100) { if !(op.time mod 2) and (key_left()-key_right() != 0) { sound(snd_noise); } op.option_volume+=2; audio_group_set_gain(audiogroup_default,op.option_volume/100,0); config_save(); }
	if tap_confirm() { force_undo(0); }
}

if (page == "controls")
{
	vertical_cursor(9);
	
	if (cursor < 7) { if tap_confirm() { page="bind"; keybindWait=true; } }
	
	if tap_confirm(7) { force_undo(0); reset_keys(); sound(snd_levelup); keybindGlow=1; op.keybinds=[[0,vk_down],[0,vk_right],[0,vk_up],[0,vk_left],[1,"Z"],[1,"X"],[1,"C"]]; }
	if tap_confirm(8) { force_undo(1); }
	
	config_save();
}

if (keybindWait and !key_confirm()) { keybindWait=false; }
if (page == "bind" and !keybindWait)
{
	res_i();
	i1="ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890"; i2=-1; i3=-1;
	repeat (string_length(i1))
	{
		++i;
		if (i2 == -1) { if keyboard_check(ord(string_char_at(i1,i))) { i3=1; i2=string_char_at(i1,i); } }
	}
	
	if (i2 == -1)
	{
		if keyboard_check(vk_up) { i3=0; i2=vk_up; }
		if keyboard_check(vk_down) { i3=0; i2=vk_down; }
		if keyboard_check(vk_left) { i3=0; i2=vk_left; }
		if keyboard_check(vk_right) { i3=0; i2=vk_right; }
	}
	
	if (i2 != -1)
	{
		res_j();
		repeat (7) { if (op.keybinds[j][1] == i2) { op.keybinds[j]=[op.keybinds[cursor][0],op.keybinds[cursor][1]]; } ++j; }
		
		reset_keys();
		op.keybinds[cursor]=[i3,i2];
		force_undo(0);
		
		sound(snd_select);
	}
}