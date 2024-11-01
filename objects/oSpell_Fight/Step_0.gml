use_keys();

if (bright > 0) { bright-=0.1; }
if (tapConfirm) { bright=1; }



if (done)
{
	++doneTime;
	if (doneTime > 50) { image_alpha-=0.1; }
	if (doneTime == 60) { continue_orders(); }
}



canPress=false; forceNext=false;
res_i();
repeat(array_length(op.party))
{
	i1=true;
	if (stickOffset[i] >= 0)
	{
		i1=false; done=false; doneTime=0;
		
		if !(time mod 2) and (go[i]) { effect_fade(sPixel,0,stickX[i],(365/2)+19*i,3,19,,,,-9999,["gui","half"]); }
	
		stickX[i]-=4;
		if (stickX[i] <= 98) { canPress=true; }
		if (stickX[i] < limit) { forceNext=true; }
	}
	if (i1 and !done) { done=true; }
	++i;
}



if (tap_confirm() and canPress) or (forceNext)
{
	res_i(); 
	repeat(3)
	{
		numb_from=i; numb_to=oMenuBattle.sel_person[i];
		
		if (stickOffset[i] != -1) {
			--stickOffset[i];
			if (stickOffset[i] == -1)
			{
				// Make accuracy
				if (stickX[i] >= 42) { accuracy=42/stickX[i]; }else{ accuracy=stickX[i]/(42*2); }
				if (stickX[i] == 42 or stickX[i] == 42-4) { accuracy=1.5; stickX[i]=42; }
				if (stickX[i] == 42-4*2 or stickX[i] == 42+4*1) { accuracy=1.2; }
				if (stickX[i] == 42+4*2) { accuracy=1.1; }
				if (stickX[i] == 42+4*3) { accuracy=1; }
				if (stickX[i] < limit) { accuracy=0; }
				
				oMenuBattle.tp+=round(accuracy*4);
				
				sound(snd_slash);
				if (accuracy == 1.5) { sound(snd_criticalswing); repeat(3) { effect_fade(sStars,1,char(i).x+20+irandom_range(-10,10),char(i).y-15+irandom_range(-12,12),,,,,,-9999,["moveRandom"]); } }
				
				with (instance_create_depth(0,0,0,oRun)) { i1=[other.numb_from,other.numb_to,other.accuracy]; step=function(){ if (time == 15) { enemy_damage(i1[0],i1[1],i1[2]); instance_destroy(); } } }
				
				char_animate(i,1,1,op.party[i]._spriteFight,0,,,,,["subnumber"]);
				if (stickX[i] >= limit)
				{
					i2=c_white; if (stickX[i] == 42) { i2=c_yellow; } effect_fade(sPixel,0,stickX[i],(365/2)+19*i,3,19,,i2,,-9999,["gui","expand1","stick"]);
					i2="ene"+string(numb_to);
					effect_subnumber(op.party[i]._spriteSlash,,char(i2).x+op.battle_enemy[numb_to]._slashOffsetXY[0],char(i2).y+op.battle_enemy[numb_to]._slashOffsetXY[1],,,,,,-9999);
				}
			}
		}
	++i;
	}
	
	if !(stickOffset[0] == -1 and stickOffset[1] == -1 and stickOffset[2] == -1)
	{
		while (!array_contains(stickOffset,0)) { res_i(); repeat(3) { if (stickOffset[i] != -1) { --stickOffset[i]; } ++i; } }
	}
}



++time;