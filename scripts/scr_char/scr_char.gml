//creates a (oChar) object
//party members, cutscene people & enemys are all the (oChar) object
function create_char(_type=0,_numb=-1,_x=x,_y=y,_walkSprites=-1,_seed=[],_func=-1)
{
	with (instance_create_depth(_x,_y,-9999,oChar))
	{
		type=_type;
		numb=_numb;
		seed=_seed;
		if (_walkSprites != -1) { walkSprites=_walkSprites; }
		
		if (type == "follower") { followerNumb=op.setFollowerNumb; op.setFollowerNumb=-1; }
		
		func=_func;
	}
}

//create a (oChar) object that has the stats of an enemy struct
function create_char_enemy(_numb=-1,_x=0,_y=0,_enemyStruct=-1,_path=-1,_pathSpeed=2,_seed=[])
{
	if (array_contains(op.killRooms,room) and op.mode != "battle") { return; }
	
	with (instance_create_depth(_x,_y,-9999,oChar))
	{
		struct(_enemyStruct); strString=_enemyStruct;
		
		walkSprites=[str._spriteWalk];
		
		type="enemy"; numb=_numb; seed=_seed;
		path=_path; pathSpeed=_pathSpeed;
		
		if (op.mode == "battle")
		{
			reaction=[false,999,999,true,true,999];
			image_speed=1;
		}
	}
}



//checks if an (oChar) object exists and if it does returns it's instance
function char(_numb=0)
{
	var _self=-1;
	with (oChar) { if (numb == _numb) { _self=self; } }
	return (_self);
}

//returns true if the designated (oChar) object exists and is on screen
function char_exists(_numb=0,_destroyOffscreen)
{
	offscreen=false;
	var exists=false;
	with (oChar) { if (numb == _numb) { exists=true; if (x < op.x-160 or x > op.x+160 or y < op.y-120 or y > op.y+120) { other.offscreen=true; if (_destroyOffscreen) { instance_destroy(); } } } }
	
	if (_destroyOffscreen and offscreen) { exists=false; }
	
	return(exists);
}

//this function is used to animate (ochar) objects for any occasion (most used for creating cutscenes)
function char_animate(_numb=0,_delay=1,_image_speed=-1,_sprite=-1,_subimg=-1,_x=-1,_y=-1,_funcBegin=-1,_funcEnd=-1,_seed=[])
{
	if (_numb == 0 and op.mode == "overworld") { op.mode="cutscene"; }
	
	if (_numb == 0 or _numb == 1 or _numb == 2)
	{
		with (oChar) { if (type == "pep" and numb == _numb) or (type == "follower") { cutsceneHappened=true; } }
	}
	
	if (op.battleTime > 40) { if (_x != -1) { _x+=(op.x-160); } if (_y != -1) { _y+=(op.y-120); } }
	
	var findChar=-1;
	
	with (oChar) { if (numb == _numb) {
		findChar=self;
		
		if array_contains(_seed,"override") { animate=[]; animateCheck=true; subnumber=false; }
		
		array_push(animate,[_delay,_delay,_image_speed,_sprite,_subimg,_x,_y,-1,-1,_funcBegin,_funcEnd,_seed]);
	} }
	
	if (findChar != -1)
	{
		if (_funcBegin != -1) { findChar.animate[array_length(findChar.animate)-1][9]=method(findChar,_funcBegin); }
		if (_funcEnd != -1) { findChar.animate[array_length(findChar.animate)-1][10]=method(findChar,_funcEnd); }
	}
}



//adds a person who is follows the party but isn't actualy in the party 
function add_follower(_numbOffset=1,_numb="a",_walkSprites,_slideSprite=sSusie_Slide,_x=0,_y=0)
{
	array_push(op.followers,[_numbOffset,_walkSprites,_numb,_slideSprite]);
	op.setFollowerNumb=array_length(op.followers)-1;
	
	create_char("follower",_numb,_x,_y,_walkSprites);
}

//adds a person who  follows the party but isn't actualy in the party
function remove_follower(_arrayNumb=0)
{
	with (oChar) { if (type == "follower" and followerNumb == _arrayNumb) { instance_destroy(); } }
	array_delete(op.followers,_arrayNumb,1);
}