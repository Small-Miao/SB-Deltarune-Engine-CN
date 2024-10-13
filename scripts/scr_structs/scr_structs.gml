function struct(_struct_text)
{
	str=asset_get_index(_struct_text); str=new str();
}

function has_struct(_array,_struct_text)
{
	op.structAt=-1;
	var i=0;
	repeat(array_length(_array))
	{
		if (_array[i] == -1)
		{
			if (_struct_text == -1)
			{
				op.structAt=i;
				return(true);
			}
		}else if (instanceof(_array[i]) == _struct_text)
		{
			op.structAt=i;
			return(true);
		}
		++i;
	}
	
	return(false);
}

//
//
//

function add_party(_struct_text)
{
	update_allData();
	
	if (array_length(op.party) != 3)
	{
		struct(_struct_text);
		array_push(op.party,str);
	
		op.overworldMenuSaveCursor=[0,0,0,0,0,0,0,0,0];
	} 
	
	reset_party_position(true);
	
	update_stats();
}

function remove_party(__numberExistence)
{
	update_allData();
	
	var numb=-1;
	var i=0;
	
	repeat(array_length(op.party))
	{
		if (op.party[i]._numberExistence == __numberExistence) { numb=i; }
		++i;
	}
	
	if (numb != -1) { array_delete(op.party,numb,1); }
	reset_party_position(true);
	
	op.overworldMenuSaveCursor=[0,0,0,0,0,0,0,0,0];
	
	update_stats();
}

//
//
//

function add_item(_struct_text,_key=false,_cc=false)
{
	struct(_struct_text);
	if (_key) { array_push(op.itemKey,str); }
	else
	{
		if (array_length(op.item) != 12) { array_push(op.item,str); }
		else
		{
			if array_contains(op.storage,-1)
			{
				var i=0;
				while (op.storage[i] != -1) { ++i; }
				op.storage[i]=str;
			}
		}
	}
	op.overworldMenuSaveCursor=[0,0,0,0,0,0,0,0,0];
	
	if (_cc)
	{
		op.textCC=[];
		
		if (_key)
		{
			op.textCC[0]="* (You put {color:yellow} "+str._infoText[0]+" {color:white} in your {color:yellow} KEY ITEMs.)";
		}
		else
		{
			if (op.fullItem)
			{
				op.textCC[0]="* (You have too many {color:yellow} ITEMs {color:white} to take {color:yellow} "+str._infoText[0]+".)";
			}
			else
			{
				if (!op.fullJustItem and !op.fullItem)
				{
					op.textCC[0]="* {color:yellow} ("+str._infoText[0]+" {color:white} was added to your {color:yellow} ITEMs.)";
				}
				else
				{
					op.textCC[0]="* {color:yellow} ("+str._infoText[0]+" {color:white} was added to your {color:yellow} STORAGE.)";
				}
			}
		}
		
		start_cutscene("cc_anything");
	}
}

function add_weapon(_struct_text,_cc=false)
{
	struct(_struct_text);
	
	var i=0, check=true;
	while (check) { if (op.weapon[i] == -1) { op.weapon[i]=str; check=false; } ++i; if (i == 48) { check=false; } }
	
	if (_cc)
	{
		op.textCC=[];
		
		if (op.fullWeapon)
		{
			op.textCC[0]="* (But you were carrying too many {color:yellow} WEAPONs.)";
		}
		else
		{
			op.textCC[0]="* ("+str._infoText[0]+" was added to your {color:yellow} WEAPONs.)";
		}
		
		start_cutscene("cc_anything");
	}
}

function add_armor(_struct_text,_cc=false)
{
	struct(_struct_text);
	
	var i=0, check=true;
	while (check) { if (op.armor[i] == -1) { op.armor[i]=str; check=false; } ++i; if (i == 48) { check=false; } }
	
	if (_cc)
	{
		op.textCC=[];
		
		if (op.fullArmor)
		{
			op.textCC[0]="* (But you were carrying too many {color:yellow} ARMORs.)";
		}
		else
		{
			op.textCC[0]="* ("+str._infoText[0]+" was added to your {color:yellow} ARMORs.)";
		}
		
		start_cutscene("cc_anything");
	}
}

function add_money(_money=1,_cc=false)
{
	op.money+=_money;
	
	if (_cc)
	{
		op.textCC=[];
		
		op.textCC[0]="* {color:yellow} ("+string(_money)+" Dark Dollars {color:white} was added to your {color:yellow} MONEY HOLE.)";
		//op.textCC[1]=[3,11+string_length(_money),28+string_length(_money),9];
		
		start_cutscene("cc_anything");
	}
}

function add_spell(_pep,_struct_text)
{
	struct(_struct_text);
	
	array_push(op.spells[_pep],str);
}

//
//
//

function equip_item(_pep=0,_spot=0,_grab=0)
{
	sound(snd_equip);
	
	var store1=op.equipped[_pep][_spot];
	var store2=0;
	if (_spot == 0) { store2=op.weapon[_grab]; }else{ store2=op.armor[_grab]; }
	
	op.equipped[_pep][_spot]=store2;
	if (_spot == 0) { op.weapon[_grab]=store1; }else{ op.armor[_grab]=store1; }
	
	//
	
	if (store1 != -1) { op.attack[_pep]-=store1._attack; op.defense[_pep]-=store1._defense; op.magic[_pep]-=store1._magic; }
	if (store2 != -1) { op.attack[_pep]+=store2._attack; op.defense[_pep]+=store2._defense; op.magic[_pep]+=store2._magic; op.ability[_pep][_spot]=store2._ability; }
}

//
//
//

function add_itemlight(_struct_text)
{
	struct(_struct_text);
	if (array_length(op.itemLight) != 8) { array_push(op.itemLight,str); }
	op.overworldMenuSaveCursor=[0,0,0,0,0,0,0,0,0];
}

function add_cell(_struct_text)
{
	struct(_struct_text);
	array_push(op.cell,str);
	op.overworldMenuSaveCursor=[0,0,0,0,0,0,0,0,0];
}

//
//
//

function create_shop(_struct_text="shop_base")
{
	with (instance_create_depth(0,0,-9999,oMenuShop))
	{
		struct(_struct_text);
		sstr=str;
		strText=_struct_text;
	}
}

//
//
//

//
//
//

function auto_kris_reaction(_array=["(Susie item Text)","(Ralsei item Text)"])
{
	var array=[""], i=0;
	repeat(array_length(_array))
	{
		array_push(array,_array[i]);
		++i;
	}
	
	return(array);
}