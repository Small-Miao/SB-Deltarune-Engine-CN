//you won scene
function cc_youWon() : cc_base() constructor
{
	if (!array_contains(oMenuBattle.enemyHere,true))
	{
		//change and add money stats
		op.gainMoney+=round(oMenuBattle.tp*2.5);
		op.money+=op.gainMoney;
		
		//win if you have spared all enemys
		_dialogue=["* You WON! {jump} * Got 0 EXP and "+string(op.gainMoney)+" D$"];
		
		if (op.killedAny and !op.isBoss)
		{
			//win overide if you have killed any enemy
			_dialogue=["* You WON! {jump} * Got "+string(op.gainMoney)+" D$ {jump} * You became stronger."];
			
			audio_sound_pitch(snd_dtranslw,2);
			audio_sound_gain(snd_dtranslw,1,0);
			sound(snd_dtranslw);
		}
	}
	else
	{
		_dialogue=[];
	}
	
	
	
	//move players back to where they stood before & other things related
	_func=function()
	{
		if (op.isBoss) { audio_stop_all(); }
		
		op.battle_enemyTouchInfo=[0,0,0];
		
		with (oMenuBattle) { enemyHere=[false,false,false]; handlerCounter=0; priority=-2; }
		if (!op.isBoss) { with (oChar) { if (type == "enemy") { instance_destroy(); } } }
		op.mode="battleOver"; op.battleTime=0;
		
		var i=0, i1=0;
		repeat (array_length(op.party))
		{
			op.partyPos[clamp(i*12,0,array_length(op.partyPos)-1)][2]=op.save_partyXY[i][3];
			char(i).direction_=op.save_partyXY[i][3];
			
			char_animate(i,15,0,op.save_partyXY[i][2],0,op.save_partyXY[i][0],op.save_partyXY[i][1],,function(){ other.sprite_index=op.save_partyXY[other.numb][2]; },["override","autooff"]);
			char(i).cutsceneStarted=false; char(i).cutsceneHappened=false;
			++i;
		}
		
		if array_contains(op.battle_seed,"enemyGlide")
		{
			i=0;
			repeat (array_length(op.battle_enemy))
			{
				i1="ene"+string(i);
				char_animate(i1,15,,,,op.oldEnemyXY[i][0],op.oldEnemyXY[i][1],,,["override"]);
				++i;
			}
		}
		
		op.playerDirection=op.save_partyXY[0][3];
		char_animate(0,1,0,op.save_partyXY[0][2],0,,,,function(){ op.battle_background[1]=false; instance_destroy(oMenuBattle); if (op.endCC != -1) { start_cutscene(op.endCC); }else{ op.mode="overworld"; op.cameraMode="overworld"; } },["autooff"]);
		char(0).cutsceneStarted=false; char(0).cutsceneHappened=false;
		
		op.isBoss=false;
		if (op.battle_music != -1) { music_fade(,0,100); op.currentMusic=op.pastMusic; audio_resume_sound(op.pastMusic); music_fade(,0,0); music_fade(,1,1000); }
		
		if (!array_contains(op.winRooms,room)) { array_push(op.winRooms,room); }
		if (op.killedAny) { if (!array_contains(op.killRooms,room)) { array_push(op.killRooms,room); } }
		
		instance_destroy(ob);
		update_allData();
	}
}