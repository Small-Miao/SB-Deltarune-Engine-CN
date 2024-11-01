++time;
use_keys(true);

pastTP=tp; tpShow[2]=0;
lockedPast=[]; res_i(); repeat (3) { array_push(lockedPast,locked[i]); ++i; }
res_i(); repeat (array_length(op.party)) { if (knockX[i] > 0) { --knockX[i]; char(i).extraX=-knockX[i]; } ++i; }

canSpare=false; canTired=false;
if (enemyHere[0] and op.battle_enemySpare[0] >= 100) or (enemyHere[1] and op.battle_enemySpare[1] >= 100) or (enemyHere[2] and op.battle_enemySpare[2] >= 100) { canSpare=true; }
if (enemyHere[0] and op.battle_enemyTired[0]) or (enemyHere[1] and op.battle_enemyTired[1]) or (enemyHere[2] and op.battle_enemyTired[2]) { canTired=true; }

if (page != "done")
{
	oChar.brightMode=0; op.stackFix=0;
	
	waitDelay=2;
	if (array_length(undo) == 0 and array_length(partyUndo) != 0)
	{
		if tap_cancel()
		{
			op.menuPep=partyUndo[0][0];
			locked=[partyUndo[0][1][0],partyUndo[0][1][1],partyUndo[0][1][2]];
			lockedPast=[partyUndo[0][1][0],partyUndo[0][1][1],partyUndo[0][1][2]];
			tp=partyUndo[0][2];
			
			cursor=faimd[op.menuPep];
			if (sel_item[op.menuPep][0] != -1) { if (sel_item[op.menuPep][0]._removeItem) { array_insert(op.item,sel_item[op.menuPep][1],sel_item[op.menuPep][0]); sel_item[op.menuPep]=[]; } }
			
			
			
			res_i();
			repeat (array_length(op.party))
			{
				if (!locked[i] and i >= op.menuPep)
				{
					faceImage[i]=1;
					if (op.hp[i] > 0 and char(i).sprite_index != op.party[i]._spriteIdle) { char_animate(i,1,1,op.party[i]._spriteIdle,0,,,,,["override"]); }
				}
				++i;
			}
			
			array_delete(partyUndo,0,1);
		}
	}
	
	use_cursor();
}
else
{
	reset_keys();
}

if (op.mode == "battle") { op.hudY+=(0-op.hudY)/2; }else{ op.hudY+=(125-op.hudY)/2; }



//buttons
if (page == 0)
{
	grab=[]; grab2=[]; tpUse=0; alongside[op.menuPep]=[];
	sel_item[op.menuPep]=[-1,0]; sel_priority[op.menuPep]=-2; sel_object[op.menuPep]=-1; sel_magicAction[op.menuPep]=-1; sel_toType[op.menuPep]=-1;
	
	horizontal_cursor(array_length(op.party[op.menuPep]._buttons)); faimd[op.menuPep]=cursor;
	
	res_i(); i1=op.party[op.menuPep]._buttons[cursor]; sel_button[op.menuPep]=i1;
	if tap_confirm()
	{ 
		/*fight */ if (i1 == 0) { page="enemy_select"; sel_priority[op.menuPep]=4; cursor=0; }
		/*act   */ if (i1 == 1) { page="enemy_select"; sel_priority[op.menuPep]=0; cursor=0; }
		/*item  */ if (i1 == 2) { if (array_length(op.item) == 0) { force_undo(0); }else{ page="item_select"; sel_priority[op.menuPep]=1; cursor=0; } }
		/*spare */ if (i1 == 3) { page="enemy_select"; sel_priority[op.menuPep]=2; cursor=0; }
		/*defend*/ if (i1 == 4) { sel_priority[op.menuPep]=5; char_animate(op.menuPep,1,1,op.party[op.menuPep]._spriteDefend,0,,,,,["subnumber"]); next_party(); tp+=16; }
		/*magic */ if (i1 == 5) { page="magic_select"; sel_priority[op.menuPep]=3; cursor=0; fix=true; }
	}
}

// Enemy Select
if (page == "enemy_select")
{
	if (frame) { frame=false; cursor=saveCur[op.menuPep][0]; while (!enemyHere[cursor]) { ++cursor; if (cursor == 3) { cursor=0; } } }
	
	res_i();
	while (!enemyHere[cursor]) { ++cursor; }
	if tap_up() { i1=1; while (i1 == 1 or !enemyHere[cursor]) { i1=0; --cursor; if (cursor == -1) { cursor=2; } } }
	if tap_down() { i1=1; while (i1 == 1 or !enemyHere[cursor]) { i1=0; ++cursor; if (cursor == 3) { cursor=0; } } }
	
	sel_person[op.menuPep]=cursor; saveCur[op.menuPep][0]=cursor;
	sel_toType[op.menuPep]=0;
	
	char("ene"+string(cursor)).brightMode="flash";
	
	if tap_confirm(,!array_contains(op.battle_seed,"grayspare"+string(cursor)))
	{
		if (!array_contains(op.battle_seed,"grayspare"+string(cursor)))
		{
			res_i(); i=true;
		
			/*fight */
			if (sel_button[op.menuPep] == 0 and i)
			{
				i=false;
				sel_object[op.menuPep]=oSpell_Fight; char_animate(op.menuPep,1,0,op.party[op.menuPep]._spriteFight,0);
				next_party();
			}
			/*act   */
			if (sel_button[op.menuPep] == 1 and i) { i=false; page="act_select"; cursor=0; fix=true; }

			/*spare */
			if (sel_button[op.menuPep] == 3 and i) { i=false; sel_object[op.menuPep]=oSpell_Spare; next_party(); }

			/*magic */
			if (sel_button[op.menuPep] == 5 and i)
			{
				i=false;
				if (sel_magicAction[op.menuPep] == 1)
				{
					char_animate(op.menuPep,1,0+(array_length(op.party[op.menuPep]._spriteAct) > 1),op.party[op.menuPep]._spriteAct[0],0);
				}
				else
				{
					char_animate(op.menuPep,1,1,op.party[op.menuPep]._spriteMagic[0],0);
				}
				next_party();
			}
		}
		else
		{
			force_undo(0);
		}
	}
}

// People Select
if (page == "people_select")
{
	if (frame) { frame=false; cursor=saveCur[op.menuPep][1]; }
	
	vertical_cursor(array_length(op.party)); op.partyOn=cursor; sel_person[op.menuPep]=cursor; saveCur[op.menuPep][1]=cursor;
	sel_toType[op.menuPep]=1;
	
	char(cursor).brightMode="flash";
	
	if tap_confirm()
	{
		res_i(); i=true;
		
		/*item  */
		if (sel_button[op.menuPep] == 2 and i) { i=false; char_animate(op.menuPep,1,0+(array_length(op.party[op.menuPep]._spriteItem) > 1),op.party[op.menuPep]._spriteItem[0],0); if (sel_item[op.menuPep][0]._removeItem) { array_delete(op.item,sel_item[op.menuPep][1],1); } }
		
		/*magic */
		if (sel_button[op.menuPep] == 5 and i) { i=false; char_animate(op.menuPep,1,1,op.party[op.menuPep]._spriteMagic[0],0); }
		
		next_party();
	}
}

// Act Select
if (page == "act_select")
{
	if (fix)
	{
		fix=false; grab=[]; grab2=[];
		
		res_i(); repeat (array_length(op.spells[op.menuPep])) { array_push(grab,op.spells[op.menuPep][i]); ++i; }
		res_i();
		repeat (array_length(op.battle_enemy[sel_person[op.menuPep]]._spells))
		{
			struct(op.battle_enemy[sel_person[op.menuPep]]._spells[i]);
			i2=true; i3=0;
			repeat (array_length(str._partyHelp)) { if (existence_to_numb(str._partyHelp[i3]) == -1) { i2=false; } ++i3; }
			if (i2) { array_push(grab,str); }
			++i;
		}
		
		res_i();
		repeat (array_length(grab))
		{
			res_j(); repeat (array_length(grab[i]._partyHelp)) { j1=existence_to_numb(grab[i]._partyHelp[j]); if (op.hp[j1] < 1) { array_push(grab2,i); } ++j; }
			++i;
		}
	}
	
	wide_cursor(array_length(grab)); tpUse=grab[cursor]._tp; sel_priority[op.menuPep]=0;
	
	if tap_confirm()
	{
		if (!array_contains(grab2,cursor) and tp >= grab[cursor]._tp)
		{
			if (cursor >= array_length(op.spells[op.menuPep]) and array_length(grab[cursor]._partyHelp) == 0) { sel_priority[op.menuPep]=-1; }
			
			res_i(); repeat (array_length(grab[cursor]._partyHelp)) { locked[existence_to_numb(grab[cursor]._partyHelp[i])]=true; ++i; }
			sel_object[op.menuPep]=grab[cursor]._object;
			alongside[op.menuPep]=grab[cursor]._partyHelp;
		
			char_animate(op.menuPep,1,0+(array_length(op.party[op.menuPep]._spriteAct) > 1),op.party[op.menuPep]._spriteAct[0],0);
		
			res_i(); repeat (array_length(alongside[op.menuPep])) { i1=existence_to_numb(alongside[op.menuPep][i]); faceImage[i1]=4+sel_priority[op.menuPep]; char_animate(i1,1,0+(array_length(op.party[i1]._spriteAct) > 1),op.party[i1]._spriteAct[0],0); ++i; }
			next_party();
		}
		else
		{
			force_undo(0);
		}
	}
}

// Magic Select
if (page == "magic_select")
{
	if (frame) { frame=false; cursor=saveCur[op.menuPep][2]; }
	
	if (fix)
	{
		fix=false; grab=[];
		
		res_i(); i1=clamp(op.party[op.menuPep]._numberExistence,0,array_length(op.battle_magicActions)-1);
		repeat (array_length(op.battle_magicActions[i1]))
		{
			struct(op.battle_magicActions[i1][i]);
			array_push(grab,str);
			++i;
		}
		
		res_i(); repeat (array_length(op.spells[op.menuPep])) { array_push(grab,op.spells[op.menuPep][i]); ++i; }
	}
	
	sel_magicAction[op.menuPep]=-1;
	wide_cursor(array_length(grab)); tpUse=grab[cursor]._tp; sel_priority[op.menuPep]=3; saveCur[op.menuPep][2]=cursor;
	
	if tap_confirm()
	{
		if (tp >= grab[cursor]._tp)
		{
			if (cursor < array_length(op.battle_magicActions[clamp(op.party[op.menuPep]._numberExistence,0,array_length(op.battle_magicActions)-1)])) { sel_priority[op.menuPep]=-1; sel_magicAction[op.menuPep]=1; magicActionText=grab[cursor]._infoText[1]; }
			
			sel_object[op.menuPep]=grab[cursor]._object;
			
			res_j(); j1=true;
			if (j1) { if (grab[cursor]._selectType == 0 and sel_magicAction[op.menuPep] == -1) { j1=false; char_animate(op.menuPep,1,1,op.party[op.menuPep]._spriteMagic[0],0); next_party(); } }
			if (j1) { if (grab[cursor]._selectType == 1 or sel_magicAction[op.menuPep] == 1) { j1=false; page="enemy_select"; cursor=0; } }
			if (j1) { if (grab[cursor]._selectType == 2 and sel_magicAction[op.menuPep] == -1) { j1=false; page="people_select"; cursor=0; } }
		}
		else
		{
			force_undo(0);
		}
	}
}

// Item Select
if (page == "item_select")
{
	if (frame) { frame=false; cursor=saveCur[op.menuPep][3]; while(cursor >= array_length(op.item)) { --cursor; } }
	
	wide_cursor(array_length(op.item)); sel_object[op.menuPep]=oSpell_Item; saveCur[op.menuPep][3]=cursor;
	
	if tap_confirm()
	{
		sel_item[op.menuPep]=[op.item[cursor],cursor];
		if (array_contains(op.item[cursor]._seed,"everyone") or op.item[cursor]._tp > 0)
		{
			if (op.item[cursor]._tp > 0)
			{
				sel_object[op.menuPep]=-1; res_i(); i=op.item[cursor]._tp;
				char(op.menuPep).brightMode="fade"; char(op.menuPep).bright=1; repeat (10) { effect_star(char(op.menuPep).x+irandom_range(-8,8),char(op.menuPep).y-irandom_range(0,24),["tp"]); }
				if (sel_item[op.menuPep][0]._removeItem) { array_delete(op.item,cursor,1); }
				next_party(); tp+=i;
			}
			else
			{
				char_animate(op.menuPep,1,0+(array_length(op.party[op.menuPep]._spriteItem) > 1),op.party[op.menuPep]._spriteItem[0],0);
				if (sel_item[op.menuPep][0]._removeItem) { array_delete(op.item,cursor,1); }
				next_party();
			}
		}
		else
		{
			page="people_select"; cursor=0;
		}
	}
}






//execute orders
if (priority != -2 and waitDelay == 0)
{
	res_i(); singleStack=false;
	repeat (array_length(op.party)) { if (sel_priority[i] == -1) { ++i1; } ++i; }
	if (i1 == 1) { singleStack=true; }else{ singleStack=false; }
	
	with (oDialogue) { if array_contains(info._seed,"flavour") { instance_destroy(); } }
	
	//act == 0
	//item == 1
	//spare == 2
	//magic == 3 (if it's a S orR-ACTION then it's 0) 
	//fight == 4
	//defend == 5
	
	while (!wait)
	{
		oChar.brightMode=0;
		if (array_contains(enemyHere,true) and priority < 6)
		{
			// Force Locked Spell
			if (priority == 5 and op.party[priority_counter]._lockSpell != -1 and op.hp[priority_counter] > 0)
			{
				sel_object[priority_counter]=op.party[priority_counter]._lockSpell;
				sel_priority[priority_counter]=priority;
				sel_person[priority_counter]=0;
				
				sel_toType[priority_counter]=op.party[priority_counter]._lockToType;
			}
			
			// Spawn Spell
			if (sel_priority[priority_counter] == priority and sel_object[priority_counter] != -1)
			{
				if (priority != -1) { wait=true; stackJump=0; op.stackFix=0; }else{ priorityNegative=true; ++stackJump; }
				with (instance_create_depth(0,0,-9999,sel_object[priority_counter])) { declare_spell(); }
				if (priority == 4) { priority_counter=2; } /*FIGHT*/
			}
			
			// Increase priority
			++priority_counter;
			if (priority_counter >= array_length(op.party)) { priority_counter=0; ++priority; if (priorityNegative) { priorityNegative=false; wait=true; } }
		}
		else
		{
			priority=6; waitDelay=0;
		}
		
		//
		
		if (priority >= 6 and !wait)
		{
			wait=true; priority=-2;
			
			if (array_contains(enemyHere,true))
			{
				res_i();
				repeat (array_length(op.party))
				{
					if (op.hp[i] > 0)
					{
						if (char(i).sprite_index == op.party[i]._spriteAct[array_length(op.party[i]._spriteAct)-1]) { char_animate(i,15,1,op.party[i]._spriteUnAct,0,,,,,["subnumber"]); }
						if (char(i).sprite_index != op.party[i]._spriteDefend) { char_animate(i,1,1,op.party[i]._spriteIdle); }
					}
					++i;
				}
			}
			
			force_enemyTurn();
		}
	}
}
if (waitDelay > 0) { --waitDelay; }



//start patterns
if (handler and handlerCounter <= 0)
{
	handler=false;
	instance_destroy(oDialogue);
	
	res_i();
	repeat (array_length(op.battle_enemy))
	{
		if (patterns[i] != -1) { with (instance_create_depth(0,0,-9999,oRun)) { type="pattern"; numb=other.i; step=oMenuBattle.patterns[other.i]; } }
		++i;
	}
}



if (exists_timer)
{
	--timer;
	if (timer <= 0)
	{
		if (loop) { exists_timer=false; }
		
		if (timer == 0)
		{
			if (exists_soul) { exists_soul=false; with (oSoul) { counter=delay; } }
			if (exists_box) { exists_box=false; with (oBattleBox) { counter=delay; } }
			
			instance_destroy(oBullet); with (oRun) { if (type == "pattern") { instance_destroy(); } }
			
			if (!loop) { ob.loopSignal=true; }
		}
		
		if (loop)
		{
			res_i();
			repeat (array_length(op.party))
			{
				char_animate(i,15,,,,op.battle_partyXY[i][0],op.battle_partyXY[i][1],,,["autooff"]);
				if (op.hp[i] > 0 and char(i).sprite_index != op.party[i]._spriteIdle) { char_animate(i,1,1,op.party[i]._spriteIdle,0); }
				if (i == 0) { char_animate(i,1,,,,,,function(){ force_partyTurn(); }); }
				++i;
			}
		
			res_i();
			repeat (array_length(op.battle_enemy))
			{
				char_animate("ene"+string(i),15,,,,op.battle_enemyXY[i][0],op.battle_enemyXY[i][1],,,["autooff"]);
				if (char("ene"+string(i)).sprite_index != op.battle_enemy[i]._spriteIdle) { char_animate("ene"+string(i),1,,op.battle_enemy[i]._spriteIdle,1); }
				++i;
			}
			
			//get new flavour text
			res_i(); i1=true; while (!enemyHere[i] or i1) { i1=false; i=irandom_range(0,array_length(op.battle_enemy)-1); }
			if (!op.isBoss) { op.battle_flavourText=op.battle_enemy[i]._flavourRandom[irandom_range(0,array_length(op.battle_enemy[i]._flavourRandom)-1)]; }
		
			if (canTired)
			{
				res_i();
				repeat (array_length(op.battle_enemy))
				{
					if (enemyHere[i] and op.battle_enemyTired[i]) { op.battle_flavourText=op.battle_enemy[i]._flavourTired; }
					++i;
				}
			}
			
			if (canSpare)
			{
				res_i();
				repeat (array_length(op.battle_enemy))
				{
					if (enemyHere[i] and op.battle_enemySpare[i] == 100) { op.battle_flavourText=op.battle_enemy[i]._flavourSpare; }
					++i;
				}
			}
		}
	}
}






tp=clamp(tp,0,100);
if (time > 1) { with (oDialogue) { if array_contains(info._seed,"flavour") { if (other.page == 0) { visible=true; }else{ visible=false; } } } }