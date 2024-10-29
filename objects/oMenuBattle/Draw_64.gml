draw_party_hud();
sideText=["",""];

//
//
//

// Enemy Select (Draw)
if (page == "enemy_select")
{
	if (sel_priority[op.menuPep] != -1) { print("HP",212,186,,,,,0.5); } print("MERCY",262,186,,,,,0.5);
	
	res_i();
	repeat(3)
	{
		if (enemyHere[i])
		{
			i1=[c_white,c_white]; i2=make_color_rgb(0,178,255);
			
			//op.battle_enemySpare[i]=100;
			//op.battle_enemyTired[i]=true;
			
			if (op.battle_enemySpare[i] >= 100) { i1=[c_yellow,c_yellow]; }
			if (op.battle_enemyTired[i]) { i1=[i2,i2]; }
			if (op.battle_enemySpare[i] >= 100 and op.battle_enemyTired[i]) { i1=[c_yellow,i2]; }
			
			// Name
			print(op.battle_enemy[i]._name,40,191.5+15*i,,,,,,,i1[0],i1[1],i1[1],i1[0],,["menu","soul1","enemy_select",i]);
			
			// HP %
			if (sel_priority[op.menuPep] != -1)
			{
				draw_ext(sPixel,0,210,190+15*i,40.5,8,,c_maroon);
				draw_ext(sPixel,0,210,190+15*i,40.5*(op.battle_enemyHP[i]/op.battle_enemy[i]._hp),8,,c_lime);
				print(string( ceil((op.battle_enemyHP[i]/op.battle_enemy[i]._hp)*100) )+"%",212,194+15*i,,,,,0.5);
			}
			
			// Spare %
			draw_ext(sPixel,0,260,190+15*i,40.5,8,,make_color_rgb(255,80,32));
			draw_ext(sPixel,0,260,190+15*i,40.5*(op.battle_enemySpare[i]/100),8,,c_yellow);
			
			print(string(op.battle_enemySpare[i])+"%",262,194+15*i,,,,,0.5,,c_maroon);
			
			if array_contains(op.battle_seed,"grayspare"+string(i)) { draw_ext(sBattleCov,0,260,190+15*i,0.5,0.5); }
			if array_contains(op.battle_seed,"xspare"+string(i)) { draw_ext(sBattleCov,1,260,190+15*i,0.5,0.5); }
			
			// Symbols
			i1=string_width(op.battle_enemy[i]._name);
			if (op.battle_enemySpare[i] >= 100) { draw_ext(sBattleSymbols,0,50+i1,192.5+15*i,0.5,0.5); }
			if (op.battle_enemyTired[i])
			{
				draw_ext(sBattleSymbols,1,60+i1,192.5+15*i,0.5,0.5);
				if (sel_priority[op.menuPep] != -1) { print(drText[0],70+i1,191.5+15*i,,,,,,,c_gray); }
			}
			else
			{
				print(enemyStatus[i],70-16+i1,191.5+15*i,,,,,,,c_gray);
			}
			
			// Magic Action Text
			if (sel_priority[op.menuPep] == -1) { print(magicActionText,147,191.5+15*i,,,,,,,op.party[op.menuPep]._actionColor); }
		}
		++i;
	}
}

// People Select (Draw)
if (page == "people_select")
{
	res_i();
	repeat(array_length(op.party))
	{
		print(op.party[i]._infoText[0],40,191.5+15*i,,,,,,,,,,,,["menu","soul1","people_select",i]);
		
		draw_ext(sPixel,0,200,190+15*i,50.5,8,,c_maroon);
		draw_ext(sPixel,0,200,190+15*i,50.5*(op.hp[i]/op.hpMax[i]),8,,c_lime);
		++i;
	}
}

// Act/Magic Select (Draw)
if (page == "act_select" or page == "magic_select")
{
	tpShow[2]=grab[cursor]._tp;
	
	res_i();
	repeat(array_length(grab))
	{
		i4=c_white; if (grab[i]._isPacify and canTired) { i4=make_color_rgb(0,178,255); }
		if (page == "magic_select")
		{
			if (i < array_length(op.battle_magicActions[clamp(op.party[op.menuPep]._numberExistence,0,array_length(op.battle_magicActions)-1)])) { i4=op.party[op.menuPep]._actionColor; }
		}
		
		if (array_contains(grab2,i) or tp < grab[i]._tp) { i4=c_gray; }
		
		i1=15; i2=191.5+floor(i/2)*15;
		if (i mod 2) { i1+=115; }
		i3=0; repeat(array_length(grab[i]._partyHelp)) { draw_ext(op.party[existence_to_numb(grab[i]._partyHelp[i3])]._UIface,1,i1+15*i3,i2-4,0.5,0.5); ++i3; }
		print(grab[i]._infoText[0],i1,i2,,,,,,,i4,,,,,["partyHelp","menu","soul2","act_select","magic_select",i]);
		++i;
	}
	
	if (array_length(grab[cursor]._infoText) > 2) or (page == "act_select" and array_length(grab[cursor]._infoText) > 1 and cursor != 0)
	{
		sideText[0]=grab[cursor]._infoText[array_length(grab[cursor]._infoText)-1];
		if (grab[cursor]._tp > 0) { sideText[1]=string(grab[cursor]._tp)+"% TP"; }
	}
	
	//print(grab[cursor]._partyHelp,0,0);
	//print(op.spells[0][0]._partyHelp,0,20);
}

// Item Select (Draw)
if (page == "item_select")
{
	res_i();
	repeat(array_length(op.item))
	{
		i1=15; i2=191.5+floor(i/2)*15;
		if (i mod 2) { i1+=115; }
		if (i < 6 and cursor < 6) or (i >= 6 and cursor >= 6) { print(op.item[i]._infoText[0],i1,i2-(cursor > 5)*45,,,,,,,,,,,,["menu","soul2","item_select",i]); }
		++i;
	}
	
	if (array_length(op.item) > 6)
	{
		if (cursor < 6) { draw_ext(sMenu,13,235,230+round(dsin(op.time*10)*2)/2,0.5,-0.5); }else{ draw_ext(sMenu,13,235,190+round(dsin(op.time*10)*2)/2,0.5,0.5); }
	}
	
	sideText[0]="";
	res_j(); j=false;
	if (array_length(op.item[cursor]._infoText) > 2) { if (op.item[cursor]._infoText[2] == -1) { j=true; } }
	
	if (array_length(op.item[cursor]._infoText) <= 2 or j)
	{
		sideText[0]=drText[1]+string(op.item[cursor]._heal[0])+drText[2];
		
		if (array_length(op.item[cursor]._heal) > 1) { sideText[0]=drText[3]; }
		
		if array_contains(op.item[cursor]._seed,"everyone") { sideText[0]=drText[4]+string(op.item[cursor]._heal[0])+drText[2]; }
	}
	else
	{
		sideText[0]=string(op.item[cursor]._infoText[2]);
	}
}

//
//
// Side Text (Draw)
print(sideText[0],250,191.5,,16,60,,,,c_gray);
print(sideText[1],250,191.5+32,,,,,,,c_orange);

//
//
// Draw TP bar

if (pastTP != tp) { tpShow[1]=tp-pastTP; }
tpShow[0]+=(tp-tpShow[0])/3;
tpShow[1]+=(0-tpShow[1])/5;

if (!array_contains(enemyHere,true) and handlerCounter == 0 and priority == -2) { tpX=clamp(tpX-4,-100,0); }else{ tpX=clamp(tpX+4,-100,0); }

if (!surface_exists(surfTP)) { surfTP=surface_create(320,240); }

surface_set_target(surfTP);
draw_clear_alpha(c_white,0);

draw_ext(sTP,1,0,0);
gpu_set_colorwriteenable(1,1,1,0);

res_i(); i1=c_orange; if (round(tpShow[0]) == 100) { i1=make_color_rgb(255,208,32); }
draw_ext(sPixel,0,3,192,18,-(tp/100)*186,,i1);
i1=c_white; if (tpShow[1] < 0) { i1=c_red; }
draw_ext(sPixel,0,3,192-(tp/100)*186,18,(tpShow[1]/100)*186,,i1);
if (tp != 100) { draw_ext(sPixel,0,3,192-((tp-tpShow[1])/100)*186,18,2,,c_white); }
draw_ext(sPixel,0,3,192-((tp-tpShow[1])/100)*186,18,(tpShow[2]/100)*186,,c_white,0.5+abs(sin(op.ti/20))*0.5);

gpu_set_colorwriteenable(1,1,1,1);
draw_ext(sTP,0,0,0);

surface_reset_target();

draw_surface_ext(surfTP,19+tpX,20,0.5,0.5,0,c_white,1);

draw_ext(sTP,2,4+tpX,37.5);
if (round(tpShow[0]) < 100)
{
	print(floor(tpShow[0]+0.1),4+tpX,59);
	print("%",6.5+tpX,71.5);
}
else
{
	print("M",5+tpX,59,,,,,,,c_yellow);
	print("A",7+tpX,69,,,,,,,c_yellow);
	print("X",9+tpX,79,,,,,,,c_yellow);
}

//
//
//

draw_ext(sPixel,0,0,0,-999,999,,0);
draw_ext(sPixel,0,320,0,999,999,,0);

//
/*
print("alongside: "+string(alongside)+" faimd: "+string(faimd),0,3+8*0,,,,0.5,0.5,,,,,,,["bc2"]);
print("saveCur: "+string(saveCur),0,3+8*1,,,,0.5,0.5,,,,,,,["bc2"]);

print("button: "+string(sel_button),0,3+8*3,,,,0.5,0.5,,,,,,,["bc2"]);
print("priority: "+string(sel_priority),0,3+8*4,,,,0.5,0.5,,,,,,,["bc2"]);
print("enemy/person selected: "+string(sel_person),0,3+8*5,,,,0.5,0.5,,,,,,,["bc2"]); 
print("object: "+string(sel_object),0,3+8*6,,,,0.5,0.5,,,,,,,["bc2"]);
//print("item: "+string(sel_item),0,3+8*6,,,,0.5,0.5,,,,,,,["bc2"]);



print(sel_person,0,3+8*1,,,,0.5,0.5,,,,,,,["bc2"]);
