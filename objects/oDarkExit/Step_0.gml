++time;
if (time == 1 and !isFloor and op.darkEntranceRoom == -1) { with(instance_create_depth(x,y,0,oDarkExit)) { isFloor=true; } }
if (isFloor) { depth=-(y-18); }

if (place_meeting(x,y,oPlayerCol) and check and !isFloor and time > 5)
{
	music_fade(,0,1000,true);
	
	check=false; op.mode="cutscene"; depth=-(y+18);
	if (func != -1) { func(); }
	
	res_i(); res_j(); j1=[];
	repeat(array_length(op.party)) { if (!op.party[i]._isDarkner) { ++j; array_push(j1,i) } ++i; }
	
	res_i();
	repeat(j-1) { ++i; i1+=40/i; }
	
	
	
	if (j == 1)
	{
		char_animate(j1[0],20,1,,0,x,y);
		char_animate(j1[0],1,1,op.party[j1[0]]._spriteDEfallDark,0);
	}
	else
	{
		i=0;
		repeat(j)
		{
			char_animate(j1[j-i-1],20,1,,0,x-round(i1/2)+round( (i1/(j-1))*i ),y);
			char_animate(j1[j-i-1],1,1,op.party[j1[j-i-1]]._spriteDEfallDark,0);
			++i;
		}
	}
}

if (!check and !isFloor)
{
	++timer;
	if (timer == 20)
	{
		audio_sound_pitch(snd_dtranslw,1);
		audio_sound_gain(snd_dtranslw,1,0);
		sound(snd_dtranslw);
		
		transition("darkExit"
		,function()
		{
			op.locationText="Skip";
			
			res_u(); u1=[oDarkExit.targetXY[0],oDarkExit.targetXY[1]];
			room_goto(oDarkExit.r); master_reset();
		}
		,function()
		{
			op.mode="overworld"; op.cameraMode="overworld"; op.locationCCcheck=false;
			op.playerX=u1[0]; op.playerY=u1[1];
			op.playerDirection="down";
			
			op.world="light";
			if (!has_struct(op.itemLight,"item_ballOfJunk")) { add_itemlight("item_ballOfJunk"); }
			
			reset_party_position();
		});
	}
	
	if (timer > 20)
	{
		res_i();
		repeat(j)
		{
			char(j1[i]).y+=grav;
			++i;
		}
		grav-=0.1;
	}
}



if (op.darkEntranceRoom != -1)
{ instance_destroy(); }
else
{
	if !(time mod 5) { effect_fade(sPixel,0,x+irandom_range(-40,40),y-20+irandom_range(-190,0),1,1,,,,-9999,["drawEnd","fallUp","half"]); }
}