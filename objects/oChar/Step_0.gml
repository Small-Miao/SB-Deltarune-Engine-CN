++time;
pastXY=[x,y];

var _numb=-1;

// Start
var _i=0;

if (walkOffsetMode == 2 and op.moving) { ++walkOffset; /*cutsceneStarted=true; cutsceneHappened=true;*/ }
if (walkOffset == 0 and walkOffsetMode != 0) { walkOffsetMode=0; }

if (time == 1)
{
	if (type == "pep")
	{
		if (op.world == "light") { _i=4; }
		
		_numb=numb;
		
		walkSprites=[op.party[_numb]._spriteWalk[0+_i],op.party[_numb]._spriteWalk[1+_i],op.party[_numb]._spriteWalk[2+_i],op.party[_numb]._spriteWalk[3+_i]];
		
		with (oCharCol) { if (type == other.type and numb == other.numb) { instance_destroy(); } }
		with (instance_create_depth(x,y,-9999,oCharCol)) { type=other.type; numb=other.numb; }
	}
	else
	{
		if is_array(walkSprites)
		{
			if (array_length(walkSprites) == 1) { sprite_index=walkSprites[0]; }else{ sprite_index=walkSprites[1]; }
		}
		else
		{
			sprite_index=walkSprites;
		}
	}
	
	if (type == 0) { image_index=0; image_speed=0; }
}

//
//
// Party visuals

if (type == "pep" or type == "follower") and (op.mode == "overworld" and array_length(animate) == 0)
{
	if (numb != 0)
	{
		if (type == "pep") { _numb=numb+op.partyPosOffset[numb]; }
		if (type == "follower") { _numb=op.followers[followerNumb][0]; }
		number=_numb;
		numbClamp=clamp(walkOffset+_numb*12,0,array_length(op.partyPos)-1);
	}
	
	//
	
	extraX=0; extraY=0;
	
	if (cutsceneStarted and cutsceneHappened)
	{
		image_index=0; image_speed=0;
		walkOffset=0;
		
		if (numb != 0)
		{
			if (type == "pep") { _numb=numb+op.partyPosOffset[numb]; }
			if (type == "follower") { _numb=op.followers[followerNumb][0]; }
			
			res_u(); u3=0; with (oChar) { if (number == other.number-1) and (type == "pep" or type == "follower") { other.u3=numb; } }
			
			u1=[x,y,char(u3).x,char(u3).y];
			u2=pos_to_ang(u1[0],u1[1],u1[2],u1[3]);
			repeat(12)
			{
				op.partyPos[-u+_numb*12][0]=lerp(u1[0],u1[2],(1/12)*u);
				op.partyPos[-u+_numb*12][1]=lerp(u1[1],u1[3],(1/12)*u);
				op.partyPos[-u+_numb*12][2]=u2;
				op.partyPos[-u+_numb*12][3]=0;
				++u;
			}
		}
	}
	
	cutsceneStarted=false;
	
	if (array_contains(op.partyFollow,numb)) or (type == "follower")
	{
		if (type == "pep") { _numb=numb+op.partyPosOffset[numb]; }
		if (type == "follower") { _numb=op.followers[followerNumb][0]; }
		number=_numb;
		numbClamp=clamp(walkOffset+_numb*12,0,array_length(op.partyPos)-1);
		
		if (op.partyPos[numbClamp][4] == "overworld" and walkOffsetMode == 1) { walkOffsetMode=2; }
		
		//
		if (walkOffsetMode != 2)
		{
			x=op.partyPos[numbClamp][0];
			y=op.partyPos[numbClamp][1];
		}

		if (op.inputWait)
		{
			direction_=op.partyPos[numbClamp][2];
			if (direction_ == "up") { sprite=walkSprites[0]; }
			if (direction_ == "down") { sprite=walkSprites[1]; }
			if (direction_ == "left") { sprite=walkSprites[2]; }
			if (direction_ == "right") { sprite=walkSprites[3]; }

			_subimg=op.partyPos[numbClamp][3]; _subimg=op.partyPos[0][3];
			if (op.pastXY[0] == op.playerX and op.pastXY[1] == op.playerY)
			or (op.partyPos[numbClamp][0] == op.partyPos[clamp(walkOffset+1+_numb*12,0,array_length(op.partyPos)-1)][0] and op.partyPos[numbClamp][1] == op.partyPos[clamp(walkOffset+1+_numb*12,0,array_length(op.partyPos)-1)][1])
			{ _subimg=0; }
			
			if (op.partyPos[numbClamp][4] == "overworld")
			{
				sprite_index=sprite;
				image_index=_subimg;
			}
			
			if (op.partyPos[numbClamp][4] == "slide")
			{
				if (type == "pep") { sprite_index=op.party[numb]._spriteSlide; }
				if (type == "follower") { sprite_index=op.followers[followerNumb][3]; }
				
				image_index=op.time/5;
				
				if (numb != 0 and op.movement == "overworld" and !op.moving) { --walkOffset; if (walkOffsetMode == 0) { walkOffsetMode=1; } }
			}
		}
	}
	else
	{
		if (array_length(animate) == 0) { image_index=0; image_speed=0; }
	}
}
//
if (!cutsceneStarted and op.mode != "overworld" and op.mode != "battleOver")
{
	cutsceneStarted=true; image_index=0; image_speed=0;
	if (numb == 0 or numb == 1 or numb == 2) or (type == "follower")
	{
		if (type == "pep") { _numb=numb+op.partyPosOffset[numb]; }
		if (type == "follower") { _numb=op.followers[followerNumb][0]; }
		number=_numb;
		numbClamp=clamp(walkOffset+_numb*12,0,array_length(op.partyPos)-1);
		
		x=op.partyPos[numbClamp][0];
		y=op.partyPos[numbClamp][1];
	}
}

//
//
//

//
//
//

//
//
// Animate / Cutscene

if (array_length(animate) > 0)
{
	if (animateCheck)
	{
		animateCheck=false;
		animate[0][7]=x; animate[0][8]=y;
		
		if (animate[0][2] != -1) { image_speed=animate[0][2]; }
		if (animate[0][3] != -1) { sprite_index=animate[0][3]; }
		if (animate[0][4] != -1) { image_index=animate[0][4]; }
		
		if (animate[0][9] != -1) { animate[0][9](); }
		
		// Special
		
		subnumber=false;
		if (array_contains(animate[0][11],"subnumber") and !subnumber) { subnumber=true; }
		
		// Auto pick animation
		if (animate[0][3] == -1 and array_length(walkSprites) > 1) and (animate[0][5] != -1 or animate[0][6] != -1) and (!array_contains(animate[0][11],"autooff"))
		{
			findAngle=pos_to_ang(animate[0][7],animate[0][8],animate[0][5],animate[0][6],true);
			sprite_index=walkSprites[findAngle]; image_index=1;
		}
	}
	
	if (animate[0][5] != -1) { x+=(animate[0][5]-animate[0][7])/animate[0][1]; }
	if (animate[0][6] != -1) { y+=(animate[0][6]-animate[0][8])/animate[0][1]; }
	
	//
	--animate[0][0];
	//
	
	if (numb == 0) { op.playerX=x; op.playerY=y; }
	
	if array_contains(animate[0][11],"jump") { extraY=sin((animate[0][0]/animate[0][1])*pi)*-80; }
	if array_contains(animate[0][11],"jump2") { extraY=sin((animate[0][0]/animate[0][1])*pi)*-30; }
	if array_contains(animate[0][11],"jumpOffset") { extraY-=20 }
	
	if array_contains(animate[0][11],"fadeEffect") { if !(op.time mod 2) or array_contains(animate[0][11],"fadeFast") { effect_fade(sprite_index,image_index,x+extraX,y+extraY,,,,,,depth+50); } }
	
	//
	
	if (animate[0][0] <= 0 and !subnumber)
	{
		if (type == 0) { extraX=0; extraY=0; }
		
		if (animate[0][10] != -1) { animate[0][10](); }
		
		if (animate[0][5] != -1 or animate[0][6] != -1) { if (!array_contains(animate[0][11],"autooff")) { image_speed=0; image_index=0; } }
		
		if (array_contains(animate[0][11],"faceUp")) { sprite_index=walkSprites[0]; extraX=0; extraY=0; }
		if (array_contains(animate[0][11],"faceDown")) { sprite_index=walkSprites[1]; extraX=0; extraY=0; }
		if (array_contains(animate[0][11],"faceLeft")) { sprite_index=walkSprites[2]; extraX=0; extraY=0; }
		if (array_contains(animate[0][11],"faceRight")) { sprite_index=walkSprites[3]; extraX=0; extraY=0; }
		
		//
		
		_numb=-1;
		if (type == "pep") { _numb=numb+op.partyPosOffset[numb]; }
		if (type == "follower") { _numb=op.followers[followerNumb][0]; }
		
		if (_numb != -1) { if array_contains(op.partyFollow,_numb) or (type == "follower") { op.partyPos[_numb*12][0]=x; op.partyPos[_numb*12][1]=y; } if (_numb == 0) { op.playerX=x; op.playerY=y; op.playerDirection=pos_to_ang(animate[0][7],animate[0][8],animate[0][5],animate[0][6]); op.playerSubimg=0; } }
		
		array_delete(animate,0,1); animateCheck=true;
	}
}

//
//
// Manual Effects

if (effect == "fadeEffect" or effect == "fadeFast") { if !(op.time mod 4) or (effect == "fadeFast") { effect_fade(sprite_index,image_index,x,y,,,,,,depth+50); } }

//
//
//

//
//
//

//
//
// Enemy

if (type == "enemy")
{
//

if (op.mode != "battle")
{
	if (op.mode == "overworld") { image_speed=1; path_speed=pathSpeed; }else{ image_speed=0; path_speed=0; }
	
	if (reaction[1] != 0)
	{
		if (time == 1)
		{
			path_start(path,pathSpeed,true,false);
			reaction[1]=clamp(str._reactionTime,1,999);
		}
		if (time > 10 and distance_to_object(oPlayerCol) <= 40 and array_length(animate) == 0 and !reaction[0] and op.mode == "overworld" and !array_contains(seed,"oblivious") and !array_contains(op.winRooms,room)) { if (str._reactionTime != 0) { sound(snd_exclamation); } path_end(); reaction[0]=true; }
		if (reaction[0]) { --reaction[1]; image_speed=0; if (reaction[1] == 0) { pastXY=[x,y]; } }
		
		if (path_get_x(path,path_position)-path_get_x(path,path_position-0.01) > 0) { xscale=-1; }
		if (path_get_x(path,path_position)-path_get_x(path,path_position-0.01) < 0) { xscale=1; }
	}
	
	if (reaction[0] and reaction[1] == 0 and op.mode == "overworld")
	{
		if (reaction[2] < 3) { reaction[2]+=0.5; }
		dWalkXY=[dcos(point_direction(x,y,op.playerX,op.playerY))*reaction[2],dsin(point_direction(x,y,op.playerX,op.playerY))*reaction[2]];
		reaction[3]=true;
		x+=dWalkXY[0];
		while (place_meeting(x,y,oWall) or place_meeting(x,y,oEnemyWall)) { x=round(x); x-=sign(dWalkXY[0]); reaction[3]=false; if (sign(dWalkXY[0]) < 0) { xscale=1; } if (sign(dWalkXY[0]) > 0) { xscale=-1; } }
		y-=dWalkXY[1];
		while (place_meeting(x,y,oWall) or place_meeting(x,y,oEnemyWall)) { y=round(y); y+=sign(dWalkXY[1]); }
		
		if (reaction[3])
		{
			if (x-pastXY[0] < -0.1) { xscale=1; }
			if (x-pastXY[0] > 0.1) { xscale=-1; }
		}
	}
	
	if (place_meeting(x,y,oPlayerCol))
	{
		with (oChar)
		{
			reaction[0]=false; reaction[1]=0; path_end();
			if (strString == other.strString and une != other.une) { numb=-1; }
		}
		
		reaction[4]=true; xscale=1; op.mode=0; sprite_index=str._spriteTouch;
	}
	if (reaction[4])
	{
		++reaction[5];
		if (reaction[5] == 1) { audio_sound_pitch(snd_tensionhorn,1); sound(snd_tensionhorn); }
		if (reaction[5] == 10) { audio_sound_pitch(snd_tensionhorn,1.1); sound(snd_tensionhorn); }
		
		if (reaction[5] == 30) { op.battle_enemyTouchInfo=[strString,numb,x,y]; start_battle(); }
	}
	//reaction
}

if (op.mode == "battle") and (numb == "ene0" or numb == "ene1" or numb == "ene2")
{
	number=real(string_char_at(numb,4));
	if (op.battle_enemySpare[number] == 100 and sprite_index == op.battle_enemy[number]._spriteIdle and op.battle_enemy[number]._spriteIdle != op.battle_enemy[number]._spriteHappy)
	{ sprite_index=op.battle_enemy[number]._spriteHappy; }
}

//
}

//
//
//

if (subnumber and image_index > image_number-1) { subnumber=false; image_speed=0; }

if (!front)
{
	depth=-y;
	if (op.battle_background[1] or op.mode == "darkEntrance")
	and ( (type == "pep") or (type == "enemy" and (numb == "ene0" or numb == "ene1" or numb == "ene2")) )
	{
		depth-=(room_height+100);
		if (op.mode == "darkEntrance") and (numb == 0 or numb == 1 or numb == 2) { depth-=numb*100; }
	}
}

if (front) { depth=-9999; }

with (oCharCol) { if (type == other.type and numb == other.numb) { x=other.x; y=other.y; } }