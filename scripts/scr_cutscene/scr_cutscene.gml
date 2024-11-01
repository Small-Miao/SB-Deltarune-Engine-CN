//this triggers the dark entrance cutscene
//don't touch this code it is horible
function cutscene_darkEntrance(_x,_y,_room,_fast=false)
{
	music_fade(,0,1000,true);
	
	op.mode="cutscene"; op.darkEntranceRoom=_room;
	op.darkEntranceX=[0,0,0]; op.darkEntrancFast=_fast;
	
	camera_move(45-op.darkEntrancFast*25,_x,_y);
	
	//
	
	res_i(); res_j(); j1=[];
	repeat(array_length(op.party)) { if (!op.party[i]._isDarkner) { ++j; array_push(j1,i) } ++i; }
	
	res_i(); i=1;
	repeat(j-1) { i1+=30+i; i+=10; }
	
	if (j == 1)
	{
		j2=op.party[j1[0]]._spriteWalk[0+4];
		if (op.darkEntrancFast) { j2=op.party[j1[0]]._spriteDEjump; }
		
		char_animate(j1[0],45-op.darkEntrancFast*25,1-op.darkEntrancFast,j2,0,_x,_y+50);
	}
	else
	{
		i=0;
		repeat(j)
		{
			j2=op.party[j1[i]]._spriteWalk[0+4];
			if (op.darkEntrancFast) { j2=op.party[j1[i]]._spriteDEjump; }
			
			char_animate(j1[i],45-op.darkEntrancFast*25,1-op.darkEntrancFast,j2,0,_x-round(i1/2)+round( (i1/(j-1))*i ),_y+50,,function(){ if (other.numb == 0) { sound(snd_locker); with (oInteract) { if (_id == "darkEntrance") { image=1; } } } });
			++i;
		}
	}
	
	i=0;
	repeat(j)
	{
		char_animate(j1[i],30,0,op.party[j1[i]]._spriteDEjump,0);
		++i;
	}
	
	with (instance_create_depth(_x,_y,0,oRun))
	{
	//
	x=_x; y=_y; persistent=true;
	res_all(); u1=0; u2=0; u3=false; u4=0; u5=true;
	j=other.j; j1=other.j1; i1=other.i1; i=0;
	//
	
	//
	if (op.darkEntrancFast) { u1=1; time=30; }
	//
	
	step=function()
	{
		if (u3)
		{
			if (u5) { u5=false; sound(snd_dtransdrone); music_fade(snd_dtransdrone,0,0); music_fade(snd_dtransdrone,1,100); }
			
			if !(time mod 2)
			{
				instance_create_depth(x-160+4+irandom_range(0,50),y+150,-9999,oDarkEntranceLineEffect);
				instance_create_depth(x+160-4-irandom_range(0,50),y+150,-9999,oDarkEntranceLineEffect);
				
				sidenoise=audio_play_sound(snd_dtranstwinkle, 50, 0);
		        audio_sound_gain(sidenoise, 0.3, 1);
		        audio_sound_pitch(sidenoise, (0.6 + random(0.6)));
			}
		}
		
		if (u1 < 2)
		{
		//
		
		if (time == 75) { op.mode="darkEntrance"; }
		if (time >= 75 and time <= 77)
		{
			i=0; repeat(j) { char(j1[i]).y-=5; ++i; }
		}
		if (time == 78) { i=0; repeat(j) { char(j1[i]).image_index=1; ++i; } }
		if (time >= 78 and time <= 80)
		{
			i=0; repeat(j) { char(j1[i]).y-=5; ++i; }
		}
		if (time == 81)
		{
			i=0;
			repeat(j)
			{
				char_animate(j1[i],24,1,op.party[j1[i]]._spriteDEfallBack,0,,y-40+op.darkEntrancFast*15,,,["autooff"]);
				char_animate(j1[i],3,,,,,y-47+op.darkEntrancFast*15,,,["autooff"]);
				char_animate(j1[i],3,,,,,y-50+op.darkEntrancFast*15,,,["autooff"]);
				++i;
			}
		}
		
		if ((time == 81 or time == 81+6*1 or time == 81+6*2 or time == 81+6*3 or time == 81+6*4 or time == 81+6*5) and !op.darkEntrancFast) or ((time == 81 or time == 81+3*1 or time == 81+3*2) and op.darkEntrancFast)
		{
			instance_create_depth(x,y-30,200-(room_height+u2*10),oDarkEntranceSquareEffect);
			++u2;
		}
		
		if (time > 101 and !op.darkEntrancFast)
		{
			i=0; repeat(j) { char(j1[i]).y+=1/(4-u4); ++i; }
			u4+=1/150;
		}
		
		if (time == 160-op.darkEntrancFast*50)
		{
			if (op.darkEntrancFast) { k=25; }else{ k=50; }
			u3=true;
			
			i=0;
			repeat(j)
			{
				char_animate(j1[i],1,1+op.darkEntrancFast,op.party[j1[i]]._spriteDEfallRotate,0,,,,,["subnumber"]);
				char_animate(j1[i],1,1,op.party[j1[i]]._spriteDEfall,0,,,,,["autooff"]);
				++i;
			}
		}
		
		if (time >= 160-op.darkEntrancFast*50 and time < 315-op.darkEntrancFast*160)
		{
			if (j == 1)
			{
				char(j1[0]).x+=(x-char(j1[0]).x)/(k/2);
			}
			if (j == 2)
			{
				char(j1[0]).x+=((x+40)-char(j1[0]).x)/(k/2);
				char(j1[1]).x+=((x-40)-char(j1[1]).x)/(k/2);
			}
			if (j == 3)
			{
				char(j1[0]).x+=((x+40)-char(j1[0]).x)/(k/2);
				char(j1[1]).x+=(x-char(j1[1]).x)/(k/2);
				char(j1[2]).x+=((x-40)-char(j1[2]).x)/(k/2);
			}
			
			if (k > 1) { --k; }
		}
		
		if (time == 210-op.darkEntrancFast*75)
		{
			i=0; repeat(j) { effect_darkentrance(j1[i]); ++i; }
		}
		
		if (time == 340-op.darkEntrancFast*160)
		{
			i=0; k=-4; u3=false;
			repeat(j)
			{
				op.darkEntranceX[j1[i]]=char(j1[i]).x-op.x+160;
				
				char(j1[i]).persistent=true;
				char_animate(j1[i],1,1,op.party[j1[i]]._spriteDEcurl,0,,,,function(){ other.effect="fadeEffect"; },["subnumber"]);
				char_animate(j1[i],1,1,op.party[j1[i]]._spriteBall,0,,,function(){ other.y-=20; },,["autooff"]);
				++i;
			}
		}
		
		if (time >= 340-op.darkEntrancFast*160)
		{
			i=0;
			repeat(j)
			{
				char(j1[i]).y+=k;
				++i;
			}
			if (k < 15) { k+=0.75+op.darkEntrancFast*0.5; }
			
			if (char(j1[0]).y > y+50 and u1 == 1)
			{
				i=0; u1=2; op.world="dark"; sound(snd_dtransflip); music_stop(snd_dtransdrone);
				repeat(j)
				{
					char(j1[i]).y=y+50;
					char(j1[i]).time=0;
					char(j1[i]).front=true;
					char(j1[i]).effect=-1;
					char_animate(j1[i],1,0,op.party[j1[i]]._spriteRise,0,,,function(){ other.x-=4; other.y+=20; });
					char_animate(j1[i],1,,,,,,function(){ other.x+=8; });
					char_animate(j1[i],1,,,,,,function(){ other.x-=8; });
					char_animate(j1[i],30,,,,,,function(){ other.x+=4; if (other.numb == 0) {   with (instance_create_depth(0,0,0,oRun)) { persistent=true; draw=function(){ depth=-7777; draw_ext(sPixel,0,-1000,-1000,9999,9999,,0,image_alpha); if (op.cameraMode == "overworld" and image_alpha > 0) { image_alpha-=0.1; }  } }   } },function(){  });
					char_animate(j1[i],1,1,,,,,function(){ other.x=op.darkEntranceX[other.numb]; other.y=190; /**/ if (other.numb == 0) { sound(snd_himquick); room_goto(op.darkEntranceRoom); master_reset(); op.darkEntranceRoom=1; } },,["subnumber"]);
					char_animate(j1[i],1,0,op.party[j1[i]]._spriteWalk[1],0);
					++i;
				}
				char_animate(j1[0],5,,,,,,function(){ party_lerp(); oRun.persistent=false; instance_destroy(oRun); },function(){ op.mode="overworld"; op.cameraMode="overworld"; oChar.front=false; oChar.persistent=false; });
			}
		}
		
		if (time == 390 and u1 == 0) { i=0; repeat(j) { char(j1[i]).effect=-1; char(j1[i]).y=y-140; ++i; } u1=1; }
		
		//
		}
	}
	
	//
	}
}