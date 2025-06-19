//damages the enemy and makes them run away if they run out of HP
function enemy_damage(_from,_to=0,_accuracy=1,_pickDamage=-1,_sound=true)
{
	if array_contains(oMenuBattle.enemyHere,true)
	{
	//
	
	while (!oMenuBattle.enemyHere[_to]) { ++_to; if (_to == 3) { _to=0; } }
	
	var damage=round( (((op.attack[_from]+oMenuBattle.partyAttackExtra[_from])*_accuracy*100)/20)-(0) );
	var _numb="ene"+string(_to);
	var image=-1;
	
	if (_pickDamage != -1) { damage=_pickDamage; }
	
	damage-=(op.battle_enemy[_to]._defense+oMenuBattle.enemyDefenseExtra[_to])*3;
	
	if (damage <= 0) { image=0; }
	
	effect_number(damage,op.battle_enemyXY[_to][0]-15,op.battle_enemyXY[_to][1]-15-oMenuBattle.eneUp[_to]*10,op.party[_from]._damageColor,,image);
	++oMenuBattle.eneUp[_to];
	
	if (damage > 0)
	{
		audio_stop_sound(snd_damage);
		if (_sound) { sound(snd_damage); }
		
		op.battle_enemyHP[_to]-=damage;
		if (!op.isBoss) { if (op.battle_enemyHP[_to] < round(op.battle_enemy[_to]._hp/2) and op.battle_enemyHP[_to] > 0 and !op.battle_enemyTired[_to]) { enemy_tired(_to); } }
		
		if (op.battle_enemyHP[_to] < 1)
		{
			// LOST
			if (!op.isBoss and !array_contains(op.lost,op.battle_enemyString[_to]))
			{
				effect_number(damage,op.battle_enemyXY[_to][0]-20,op.battle_enemyXY[_to][1]-25-oMenuBattle.eneUp[_to]*10,,,6);
				
				array_push(op.lost,op.battle_enemyString[_to]);
				var i=0;
				while (i < array_length(op.recruits))
				{
					if (op.recruits[i][0] == op.battle_enemyString[_to]) { array_delete(op.recruits,i,1); i=array_length(op.recruits); }
					++i;
				}
			}
			
			op.killedAny=true;
			oMenuBattle.enemyHere[_to]=false; op.gainMoney+=op.battle_enemy[_to]._money;
			with(op.battle_enemy[_to]._handler) { if (numb_from == _to) { instance_destroy(); } }
			
			camera_shake(3,3);
			
			char_animate(_numb,1,0,op.battle_enemy[_to]._spriteDamage,0,,,,,["override"]);
			if (!op.isBoss)
			{
				sound(snd_defeatrun);
				
				char_animate(_numb,10);
				repeat(5) { char_animate(_numb,1,,,,,,,function(){ repeat(10) { effect_fade(other.sprite_index,other.image_index,other.x,other.y,,,,,,other.depth-50,["half"]); other.x+=2; } }); }
				char_animate(_numb,1,,,,,,,function(){ instance_destroy(other); });
			}
		}
		else
		{
			char_animate(_numb,2,0,op.battle_enemy[_to]._spriteDamage,0,,,function(){ other.x-=2; },,["override"]);
			repeat(2)
			{
				char_animate(_numb,2,0,,,,,function(){ other.x+=4; });
				char_animate(_numb,2,0,,,,,function(){ other.x-=4; });
			}
			char_animate(_numb,20,0,,,,,function(){ other.x+=2; });
			char_animate(_numb,1,1,op.battle_enemy[_to]._spriteIdle,0);
		}
	}
	
	//
	}
}



//adds mercy percent to an enemy
function enemy_mercy(_numb=0,_amount=1,_sound=true)
{
	var image=-1, color=c_white;
	
	if (_sound) { sound(snd_mercyadd); }
	
	op.battle_enemySpare[_numb]=clamp(op.battle_enemySpare[_numb]+_amount,0,100);
	if (_amount == 100) { image=4; color=c_lime; }
	
	effect_number(_amount,op.battle_enemyXY[_numb][0]-15,op.battle_enemyXY[_numb][1]-15-oMenuBattle.eneUp[_numb]*10,color,op.fontGold,image);
	++oMenuBattle.eneUp[_numb];
}

//sets an enemy to be tired
function enemy_tired(_numb=0,_status=true)
{
	op.battle_enemyTired[_numb]=_status;
	effect_number(,op.battle_enemyXY[_numb][0]-15,op.battle_enemyXY[_numb][1]-15-oMenuBattle.eneUp[_numb]*10,c_white,,9+(_status == false));
	++oMenuBattle.eneUp[_numb];
}

//this function will force the enemy to say something when it's their turn to speak
//You can run this in custom spell objects to make the enemy have a reaction to what you just did
function force_speak(_numb=0,_text="Skip",_xscale=100)
{
	oMenuBattle.forceSpeak[_numb]=[_text,_xscale];
}



//will remove the enemy from battle if it has 100% spare (and sparing it of course)
//this also adds random encounter enemys to the recruits
function enemy_spare(_numb,_tiredSpare=false)
{
	var _char="ene"+string(_numb);
	
	if (oMenuBattle.enemyHere[_numb])
	{
	//
	
	if (op.battle_enemySpare[_numb] == 100 or op.battle_enemyTired[_numb])
	{
		// Recruit
		if (!op.isBoss and !array_contains(op.lost,op.battle_enemyString[_numb]) and !array_contains(op.battle_seed,"purify"))
		{
			var i=0, i1=0, i2=-1;
			while(i < array_length(op.recruits))
			{
				if (op.recruits[i][0] == op.battle_enemyString[_numb]) { i1=1; i2=i; ++op.recruits[i][2]; i=array_length(op.recruits); }
				++i;
			}
			if (i1 == 0)
			{
				array_push(op.recruits,[op.battle_enemyString[_numb],op.battle_enemy[_numb]._recRequiredAmount,1]);
				i2=array_length(op.recruits)-1;
			}
			
			if (i2 != -1) { if (op.recruits[i2][2] <= op.recruits[i2][1]) { effect_recruit(_numb,i2); } }
		}
		
		//purify text
		if (array_contains(op.battle_seed,"purify"))
			effect_recruit(_numb,,12);
		
		oMenuBattle.enemyHere[_numb]=false;
		if (!array_contains(op.battle_seed,"purify")) { op.gainMoney+=op.battle_enemy[_numb]._money; }
		with(op.battle_enemy[_numb]._handler) { if (numb_from == _numb) { instance_destroy(); } }
		
		char_animate(_char,20);
		char_animate(_char,10,,,,,,function(){ other.brightMode="glowUp"; repeat(10) { effect_star(other.x+irandom_range(-20,20),other.y-irandom_range(0,35)-5,["spare"]); } },
		function()
		{
			sound(snd_spare);
			effect_fade(other.sprite_index,other.image_index,other.x,other.y,,,,,1,other.depth-1000,["move1","fade0.5"]);
			effect_fade(other.sprite_index,other.image_index,other.x,other.y,,,,,1,other.depth-1000,["move2"]);
			
			if (!op.isBoss) { instance_destroy(other); }else{ other.brightMode=0; }
		});
	}
	else
	{
		if (!_tiredSpare)
		{
			char_animate(_char,1,,,,,,,function(){ other.colorFlash=[1,1,-1]; });
		}
		else
		{
			char_animate(_char,1,,,,,,,function(){ other.colorFlash=[-1,-1,1]; });
		}
	}
	
	//
	}
}



//increase stats for an enemy temporarily
function enemy_extraStats(_numb,_attack,_defense,_time)
{
	oMenuBattle.enemyAttackExtra[_numb]+=_attack;
	oMenuBattle.enemyDefenseExtra[_numb]+=_defense;
	oMenuBattle.extraStatsTimer[_numb]+=_time;
}



//adds a new enemy into battle during a battle
function add_enemy(_struct_text,_numb=0,_xOffset=0,_yOffset=0,_animateSeed=[])
{
	op.battle_enemyString[_numb]="enemy_ambu"; struct(op.battle_enemyString[_numb]);
	op.battle_enemy[_numb]=str;
	op.battle_enemySpare[_numb]=0;
	op.battle_enemyTired[_numb]=false;
	
	oMenuBattle.enemyHere[_numb]=true;
	
	op.battle_enemyHP[_numb]=op.battle_enemy[_numb]._hp;
	
	with (instance_create_depth(0,0,0,op.battle_enemy[_numb]._handler)) { declare_handler(_numb); }
	
	create_char_enemy("ene"+string(_numb),op.battle_enemyString[_numb],,,,op.battle_enemyXY[_numb][0]+(op.x-160)+_xOffset,op.battle_enemyXY[_numb][1]+(op.y-120)+_yOffset);
	
	//
	char_animate("ene"+string(_numb),15,1,op.battle_enemy[_numb]._spriteIdle,0,op.battle_enemyXY[_numb][0],op.battle_enemyXY[_numb][1],,,_animateSeed);
	//
	
	char_animate("ene"+string(_numb),1,1,op.battle_enemy[_numb]._spriteIdle,0);
}