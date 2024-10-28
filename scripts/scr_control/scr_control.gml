function master_reset()
{
	op.overworldMenuSaveCursor=[0,0,0,0,0,0,0,0,0];
	op.partyFollow=[0,1,2];
	op.cameraMode="overworld";
	op.camOffsetX=0; op.camOffsetY=0;
	op.une=0;
	
	op.battle_enemyTouchInfo=[];
	
	op.dodge_applyShaders=true;
	op.dodge_hit=0;
	op.dodge=false; op.dodge_alpha=0; op.dodgeTimer=0;
	
	op.darkEntranceRoom=-1;
	
	op.forceNotMove=false;
	
	update_allData();
}

//

function update_allData()
{
	var numb=-1;
	var i=0, j=0;
	
	repeat(array_length(op.party))
	{
		numb=op.party[i]._numberExistence;
		while (numb >= array_length(op.allData)) { array_push(op.allData,-1); }
		
		//
		var equipped_=[];
		j=0; repeat(array_length(op.equipped[i])) { if (op.equipped[i][j] != -1) { array_push(equipped_,instanceof(op.equipped[i][j])); }else{ array_push(equipped_,-1); } ++j; }
		var spells_=[];
		j=0; repeat(array_length(op.spells[i])) { array_push(spells_,instanceof(op.spells[i][j]));++j; }
		//
		op.allData[numb]=[op.hp[i],op.hpMax[i],op.attack[i],op.defense[i],op.magic[i],op.guts[i],op.level[i],op.ability[i],equipped_,spells_];
		//
		
		++i;
	}
}

function update_stats()
{
	var numb=-1, data=-1;
	var i=0, j=0;
	
	repeat(array_length(op.party))
	{
		numb=op.party[i]._numberExistence;
		if (array_length(op.allData) > numb)
		{
			data=op.allData[numb];
		
			op.hp[i]=data[0];
			op.hpMax[i]=data[1];
			op.attack[i]=data[2];
			op.defense[i]=data[3];
			op.magic[i]=data[4];
			op.guts[i]=data[5];
			op.level[i]=data[6];
			op.ability[i]=data[7];
			
			op.equipped[i]=[]; j=0; repeat(array_length(data[8])) { if (data[8][j] == -1) { array_push(op.equipped[i],-1); }else{ struct(data[8][j]); array_push(op.equipped[i],str); } ++j; }
			op.spells[i]=[]; j=0; repeat(array_length(data[9])) { struct(data[9][j]); array_push(op.spells[i],str); ++j; }
		}
		
		++i;
	}
}

//
//
//

function add_progress(_value)
{
	if (!has_progress(_value)) { array_push(op.progress,_value); }
}

function has_progress(_value)
{
	if array_contains(op.progress,_value) { return(true); }else{ return(false); }
}

//
//
//

function menu_room()
{
	op.menuRoomTime=3;
	
	op.mode=0;
	instance_destroy(oChar);
}

function set_mode(_mode="overworld")
{
	op.mode=_mode;
}

//
//
//

function regular_room_transition(_room,_canMoveAfter=true)
{
	with(instance_create_depth(op.playerX,op.playerY,9999,oDoor))
	{
		r=_room;
	}
	op.forceNotMove=true;
	set_mode("overworld");
	
	op.canMoveAfter=_canMoveAfter;
}