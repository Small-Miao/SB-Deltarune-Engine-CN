//save file stuff I don't understand
function save_string(_string,_filename)
{
	var _buffer = buffer_create(string_byte_length(_string)+1,buffer_fixed,1);
	buffer_write(_buffer,buffer_string,_string);
	buffer_save(_buffer,_filename);
	buffer_delete(_buffer);
}

function load_string(_filename)
{
	var _buffer = buffer_load(_filename);
	var _string = buffer_read(_buffer,buffer_string);
	
	buffer_delete(_buffer);
	return _string;
}



//run this to save your current file
//overides the file that the variable op.fileOn is currently on
function file_save(_fileName=-1)
{
	update_allData();
	
	var fileName=-1;
	if (_fileName == -1) { fileName="save"+string(op.fileOn); }else{ fileName=_fileName; }
	
	if file_exists(fileName) { file_delete(fileName); }
	
	var i=0;
	var sParty=[]; i=0; repeat (array_length(op.party)) { array_push(sParty,instanceof(op.party[i])); ++i; }
	var sItem=[]; i=0; repeat (array_length(op.item)) { array_push(sItem,instanceof(op.item[i])); ++i; }
	var sStorage=[]; i=0; repeat (array_length(op.storage)) { if (op.storage[i] == -1) { array_push(sStorage,-1); }else{ array_push(sStorage,instanceof(op.storage[i])); } ++i; }
	var sItemKey=[]; i=0; repeat (array_length(op.itemKey)) { array_push(sItemKey,instanceof(op.itemKey[i])); ++i; }
	var sWeapon=[]; i=0; repeat (array_length(op.weapon)) { if (op.weapon[i] == -1) { array_push(sWeapon,-1); }else{ array_push(sWeapon,instanceof(op.weapon[i])); } ++i; }
	var sArmor=[]; i=0; repeat (array_length(op.armor)) { if (op.armor[i] == -1) { array_push(sArmor,-1); }else{ array_push(sArmor,instanceof(op.armor[i])); } ++i; }
	
	var sItemLight=[]; i=0; repeat (array_length(op.itemLight)) { array_push(sItemLight,instanceof(op.itemLight[i])); ++i; }
	var sCell=[]; i=0; repeat (array_length(op.cell)) { array_push(sCell,instanceof(op.cell[i])); ++i; }
	
	//instanceof
	var _rootStruct = {
		_x : op.playerX,
		_y : op.playerY,
		_room : room,
		
		_name : op.name_,
		_locationText : op.locationText,
		_minutes : op.minutes,
		_seconds : op.seconds,
		_money : op.money,
		_moneyLight : op.moneyLight,
		_encounterKills : op.encounterKills,
		
		_partyPosOffset : op.partyPosOffset,
		_followers : op.followers,
		
		_party : sParty,
		_item : sItem,
		_storage : sStorage,
		_itemKey : sItemKey,
		_weapon : sWeapon,
		_armor : sArmor,
		
		_recruits : op.recruits,
		_lost : op.lost,
		
		_itemLight : sItemLight,
		_cell : sCell,
		
		_progress : op.progress,
		_winRooms : op.winRooms,
		_killRooms : op.killRooms,
		
		_world : op.world,
		
		_allData : op.allData,
		
		_fileVer : op.fileVer
	};
	
	var json=json_stringify(_rootStruct);
	
	save_string(json,fileName);
	
	if (_fileName == -1) { op.checkpointProgress=[]; }
	if (_fileName == "overworld" and array_length(op.checkpointProgress) == 0) { array_push(op.checkpointProgress,-1); }
}



//load save file
function file_load(_fileName=-1)
{
	if (!op.load)
		return;
	
	var fileName=-1;
	if (_fileName == -1) { fileName="save"+string(op.fileOn); op.checkpointProgress=[]; }else{ fileName=_fileName; }
	
	if (!file_exists(fileName)) return;
	
	var _json=load_string(fileName);
	var _rootStruct=json_parse(_json);
	
	
	
	var i=0;
	
	op.fileVer=_rootStruct._fileVer;
	
	if (_fileName == -1 or _fileName != "battle")
	{
		op.x=_rootStruct._x; op.playerX=_rootStruct._x;
		op.y=_rootStruct._y; op.playerY=_rootStruct._y;
		op.playerDirection="down";
	}
	
	op.name_=_rootStruct._name;
	op.locationText=_rootStruct._locationText;
	op.minutes=_rootStruct._minutes;
	op.seconds=_rootStruct._seconds;
	op.money=_rootStruct._money;
	op.moneyLight=_rootStruct._moneyLight;
	op.encounterKills=_rootStruct._encounterKills;
	
	op.partyPosOffset=_rootStruct._partyPosOffset;
	op.followers=_rootStruct._followers;
	
	i=0; op.party=[]; repeat (array_length(_rootStruct._party)) { struct(_rootStruct._party[i]); array_push(op.party,str); ++i; }
	i=0; op.item=[]; repeat (array_length(_rootStruct._item)) { struct(_rootStruct._item[i]); array_push(op.item,str); ++i; }
	i=0; op.storage=[]; repeat (array_length(_rootStruct._storage)) { if (_rootStruct._storage[i] == -1) { array_push(op.storage,-1); }else{ struct(_rootStruct._storage[i]); array_push(op.storage,str); } ++i; }
	i=0; op.itemKey=[]; repeat (array_length(_rootStruct._itemKey)) { struct(_rootStruct._itemKey[i]); array_push(op.itemKey,str); ++i; }
	i=0; op.weapon=[]; repeat (array_length(_rootStruct._weapon)) { if (_rootStruct._weapon[i] == -1) { array_push(op.weapon,-1); }else{ struct(_rootStruct._weapon[i]); array_push(op.weapon,str); } ++i; }
	i=0; op.armor=[]; repeat (array_length(_rootStruct._armor)) { if (_rootStruct._armor[i] == -1) { array_push(op.armor,-1); }else{ struct(_rootStruct._armor[i]); array_push(op.armor,str); } ++i; }
	
	op.recruits=_rootStruct._recruits;
	op.lost=_rootStruct._lost;
	
	i=0; op.itemLight=[]; repeat (array_length(_rootStruct._itemLight)) { struct(_rootStruct._itemLight[i]); array_push(op.itemLight,str); ++i; }
	i=0; op.cell=[]; repeat (array_length(_rootStruct._cell)) { struct(_rootStruct._cell[i]); array_push(op.cell,str); ++i; }
	
	op.world=_rootStruct._world;
	
	if (_fileName != "overworld")
	{
		op.winRooms=_rootStruct._winRooms;
		op.killRooms=_rootStruct._killRooms;
		op.progress=_rootStruct._progress;
	}
	
	op.allData=_rootStruct._allData;
	
	
	
	//send you to the room you saved in
	update_stats();
	
	if (_fileName == -1 or _fileName != "battle")
	{
		with (instance_create_depth(0,0,0,oRun)) { persistent=true; step=function(){ if (time == 1) { master_reset(); reset_party_position(); persistent=false; instance_destroy(); } } }
		
		op.mode="overworld"; op.isBoss=false; op.battle_background=[false,false];
		room_goto(_rootStruct._room);
	}
	
	op.dead=false;
}



//gets certian stats from a save file that can be drawn on screen
function file_stats(_numb=op.fileOn)
{
	var fileName="save"+string(_numb);
	
	if file_exists(fileName)
	{
		var _json = load_string(fileName);
		var _rootStruct = json_parse(_json);
		
		stat_name=_rootStruct._name;
		stat_locationText=_rootStruct._locationText;
		stat_minutes=_rootStruct._minutes;
		stat_seconds=_rootStruct._seconds;
		stat_level=_rootStruct._allData[0][6];
	}
}



//saves your settings to it's own save file
function config_save()
{
	var fileName="config";
	
	if file_exists(fileName) { file_delete(fileName); }
	
	var _rootStruct = {
		_option_volume : op.option_volume,
		_option_simplifyVFX : op.option_simplifyVFX,
		_option_autoRun : op.option_autoRun,
		_keybinds : op.keybinds,
		_gamepadBinds : op.gamepadBinds,
		
		_fileVer : op.fileVer
	};
	
	var json=json_stringify(_rootStruct);
	
	save_string(json,fileName);
}

//load saved settings 
function config_load(_fileName=-1)
{
	if (!op.load)
		return;
	
	var fileName="config";
	
	if (!file_exists(fileName)) return;
	
	var _json=load_string(fileName);
	var _rootStruct=json_parse(_json);
	
	
	
	op.option_volume=_rootStruct._option_volume;
	op.option_simplifyVFX=_rootStruct._option_simplifyVFX;
	op.option_autoRun=_rootStruct._option_autoRun;
	op.keybinds=_rootStruct._keybinds;
	op.gamepadBinds = _rootStruct._gamepadBinds;
	
	audio_group_set_gain(audiogroup_default,op.option_volume/100,0);
}