if (time > 0)
{
	draw_ext(sPixel,,0,0-introY*40,320,40,,0);
	
	draw_party_hud();
	
	if (introY <= 0.1)
	{
		res_i();
		repeat (array_length(op.party))
		{
			if (reactionAlpha[i] > 0) { reactionAlpha[i]-=0.1; }
			print(reactionText[i],(106*i)+(53)*(3-array_length(op.party)),232,,,,0.5,0.5,,,,,,reactionAlpha[i]);
			++i;
		}
	}
	
	
	
	if (top)
	{
		//draw top left text
		draw_ext(sMenu,op.overworldMenuSaveCursor[0],11,13-introY*40);
		
		//draw top soul & top buttons
		res_i(); repeat (4) { draw_ext(sMenu,5+i*2+(op.overworldMenuSaveCursor[0] == i),60+i*50,10-introY*40); if (page == 0) { draw_ext(sMenu,4,60+cursor*50,10-introY*40,,,,c_red); } ++i; }
	
		print("D$ "+string(op.money),260,14-introY*40); 
	}
	
	if (!endMenu)
	{
		//page item
		if (page == "item1" or page == "itemUSE" or page == "itemTOSS" or page == "itemKEY" or page == "itemUSEUSE" or page == "itemTOSSUSE")
		{
			res_i();
			draw_box(30,40,260,145,["bc"]);
			if (page != "item1") { if (saveCur[0] == 0) { i=make_color_rgb(255,160,64); }else{ i=c_gray; } }else{ i=c_white; } print(drText[0],90,59,,,,,,,i,,,,,["menu","soul1","item1",0]);
			if (page != "item1") { if (saveCur[0] == 1) { i=make_color_rgb(255,160,64); }else{ i=c_gray; } }else{ i=c_white; } print(drText[1],90+60,59,,,,,,,i,,,,,["menu","soul1","item1",1]);
			if (page != "item1") { if (saveCur[0] == 2) { i=make_color_rgb(255,160,64); }else{ i=c_gray; } }else{ i=c_white; } print(drText[2],90+120,59,,,,,,,i,,,,,["menu","soul1","item1",2]);
		}
	
		//page itemUSE & itemTOSS
		if (page == "itemUSE" or page == "itemTOSS" or page == "itemUSEUSE" or page == "itemTOSSUSE") or (page == "item1" and saveCur[0] < 2)
		{
			res_i();
			repeat (array_length(op.item))
			{
				i1=73; i2=80+floor(i/2)*15;
				if (i mod 2) { i1+=105; }
				if (page == "itemUSE" or page == "itemTOSS" or page == "itemUSEUSE" or page == "itemTOSSUSE") { i3=c_white; }else{ i3=c_gray; }
				print(op.item[i]._infoText[0],i1,i2,,,,,,,i3,,,,,["bc3","menu","soul1","itemUSE","itemTOSS",i]);
				++i;
			}
		}
	
		//page itemKEY
		if (page == "itemKEY") or (page == "item1" and saveCur[0] == 2)
		{
			res_i();
			repeat (array_length(op.itemKey))
			{
				i1=73; i2=80+floor(i/2)*15;
				if (i mod 2) { i1+=105; }
				if (page == "itemKEY") { i3=c_white; }else{ i3=c_gray; } print(op.itemKey[i]._infoText[0],i1,i2,,,,,,,i3,,,,,["bc3","menu","soul1","itemKEY",i]);
				++i;
			}
		}
	
		//top left text
		if (page == "itemUSE" or page == "itemTOSS" or page == "itemUSEUSE" or page == "itemTOSSUSE")
		{
			print(op.item[saveCur[1]]._infoText[1],10,9-introY*40,,16);
		}
	
		if (page == "itemKEY")
		{
			print(op.itemKey[saveCur[2]]._infoText[1],10,9-introY*40,,16);
		}
	}
	
	
	
	if (page == "equip1" or page == "equipped" or page == "equipped" or page == "weaarm")
	{
		draw_box(25,40,270,170,["bc"]);
		draw_ext(sMenuBig,0+(saveCur[0] > 0),25,40);
		
		//left-up side (Equip)
		print(op.party[op.overworldMenuSaveCursor[2]]._infoText[0],67.5,57.5);
		if (page == "equip1") { draw_ext(sSoul,0,58+cursor*25,74.5,0.5,0.5); draw_ext(sSoulArrows,op.time/10,58+cursor*25,74.5,0.5,0.5); }
		
		res_i();
		repeat (array_length(op.party))
		{
			draw_ext(sHeads,op.party[i]._numberExistence,58+i*25,99,,,,,1-(i != op.overworldMenuSaveCursor[2])*(0.5+0.5/4));
			++i;
		}
		
		//right-up side (Equip)
		if (page == "equipped") { draw_ext(sSoul,0,158,65+cursor*15,0.5,0.5); }
		
		res_i(); repeat (3) { i1=2-i; if (i == 0) { i1=2+op.party[op.overworldMenuSaveCursor[2]]._numberExistence; } if !(page == "equipped" and cursor == i) { draw_ext(sSymbols1,i1,151,55+i*15); } ++i; }
		if (op.equipped[op.overworldMenuSaveCursor[2]][0] != -1) { draw_ext(sSymbols2,op.party[op.overworldMenuSaveCursor[2]]._numberExistence,171.5,60); }
		if (op.equipped[op.overworldMenuSaveCursor[2]][1] != -1) { draw_ext(sSymbols3,0,171.5,75); }
		if (op.equipped[op.overworldMenuSaveCursor[2]][2] != -1) { draw_ext(sSymbols3,0,171.5,90); }
		
		res_i();
		repeat (3)
		{
			if (op.equipped[op.overworldMenuSaveCursor[2]][i] == -1) { print(drText[3],182.5,60+i*15,,,,,,,c_dkgray); }else{ print(op.equipped[op.overworldMenuSaveCursor[2]][i]._infoText[0],182.5,60+i*15); }
			++i;
		}
		
		//right-down side (Equip)
		res_i(); res_j();
		if (saveCur[0] == 0) { j1=op.weapon; j2=saveCur[5]; }else{ j1=op.armor; j2=saveCur[6]; }
		
		if (page == "weaarm")
		{
			draw_ext(sSoul,0,176,124-j2*13.5+cursor*13.5,0.5,0.5);
			draw_ext(sPixel,,277.5,130,3,59.5,,c_dkgray);
			draw_ext(sPixel,,277.5,130+(j2/42)*57,3,3);
			
			if (j2 != 0) { draw_ext(sMenu,13,275.5,116.5+round(sin(op.ti/40)*3)/2,0.5,0.5); }
			if (j2 != 42) { draw_ext(sMenu,13,275.5,200.5-round(sin(op.ti/40)*3)/2,0.5,-0.5); }
		}
		repeat (48)
		{
			if (i >= j2 and i < j2+6)
			{
				if (j1[i] != -1)
				{
					i2=c_white; if (op.party[op.overworldMenuSaveCursor[2]]._numberExistence != j1[i]._numberExistence and saveCur[0] == 0) or (array_contains(j1[i]._cantHave,op.party[op.overworldMenuSaveCursor[2]]._numberExistence)) { i2=c_gray; }
					if array_contains(op.party[op.overworldMenuSaveCursor[2]]._seed,"greed")
					{
						if (saveCur[0] == 0 and j1[cursor] != -1 and i2 == c_white) { if (j1[cursor]._attack < op.equipped[op.overworldMenuSaveCursor[2]][0]._attack) { i2=c_gray; } }
					}
					
					print(j1[i]._infoText[0],192,119-j2*13.5+i*13.5,,,,,,,i2);
					if (saveCur[0] == 0) { draw_ext(sSymbols2,j1[i]._numberExistence,182,119-j2*13.5+i*13.5,,,,i2); }else{ draw_ext(sSymbols3,0,182,119-j2*13.5+i*13.5,,,,i2); }
				}
				else
				{ 
					print("---------",192,119-j2*13.5+i*13.5,,,,,,,c_dkgray);
				}
			}
			++i;
		}
		
		//left-down side (Equip)
		draw_ext(sSymbols2,op.party[op.overworldMenuSaveCursor[2]]._numberExistence,37,119);
		draw_ext(sSymbols3,0,37,119+13.5);
		draw_ext(sSymbols3,1,37,119+13.5*2);
		
		print(drText[4],50,119);
		print(drText[5],50,119+13.5);
		print(drText[6],50,119+13.5*2);
		
		res_i();
		i1=[op.attack[op.overworldMenuSaveCursor[2]],op.defense[op.overworldMenuSaveCursor[2]],op.magic[op.overworldMenuSaveCursor[2]]];
		i2=[op.attack[op.overworldMenuSaveCursor[2]],op.defense[op.overworldMenuSaveCursor[2]],op.magic[op.overworldMenuSaveCursor[2]]];
		if (page == "weaarm")
		{
			if (saveCur[0] == 0)
			{
				if (j1[cursor] != -1)
				{
					if (op.party[op.overworldMenuSaveCursor[2]]._numberExistence == op.weapon[cursor]._numberExistence)
					{
						i1[0]+=(op.weapon[cursor]._attack-op.equipped[op.overworldMenuSaveCursor[2]][0]._attack);
						i1[1]+=(op.weapon[cursor]._defense-op.equipped[op.overworldMenuSaveCursor[2]][0]._defense);
						i1[2]+=(op.weapon[cursor]._magic-op.equipped[op.overworldMenuSaveCursor[2]][0]._magic);
					}
				}
			}
			else
			{
				if (op.armor[cursor] != -1)
				{
					i1[0]+=op.armor[cursor]._attack;
					i1[1]+=op.armor[cursor]._defense;
					i1[2]+=op.armor[cursor]._magic;
				}
				
				if (op.equipped[op.overworldMenuSaveCursor[2]][saveCur[0]] != -1)
				{
					i1[0]-=op.equipped[op.overworldMenuSaveCursor[2]][saveCur[0]]._attack;
					i1[1]-=op.equipped[op.overworldMenuSaveCursor[2]][saveCur[0]]._defense;
					i1[2]-=op.equipped[op.overworldMenuSaveCursor[2]][saveCur[0]]._magic;
				}
			}
		}
		
		i4=""; if (i1[0] == i2[0]) { i3=c_white; } if (i1[0] > i2[0]) { i3=c_yellow; i4="(+"+string(i1[0]-i2[0])+")"; } if (i1[0] < i2[0]) { i3=c_red; i4="("+string(i1[0]-i2[0])+")"; } print(string(i1[0])+i4,115,119,,,,,,,i3);
		i4=""; if (i1[1] == i2[1]) { i3=c_white; } if (i1[1] > i2[1]) { i3=c_yellow; } if (i1[1] < i2[1]) { i3=c_red; } print(string(i1[1]),115,119+13.5,,,,,,,i3);
		i4=""; if (i1[2] == i2[2]) { i3=c_white; } if (i1[2] > i2[2]) { i3=c_yellow; } if (i1[2] < i2[2]) { i3=c_red; } print(string(i1[2]),115,119+13.5*2,,,,,,,i3);
		
		res_i(); i1=[]; i2=[]; i3=[];
		res_j();
		
		repeat (3)
		{
			j1=false; if (op.equipped[op.overworldMenuSaveCursor[2]][i] == -1) { j1=true; }else{ if (op.equipped[op.overworldMenuSaveCursor[2]][i]._ability == -1) { j1=true; } }
			if (j1) { i1[i]="(No ability.)"; i2[i]=c_dkgray; i3[i]=-1; }else{ i1[i]=op.equipped[op.overworldMenuSaveCursor[2]][i]._infoText[3]; i2[i]=c_white; i3[i]=op.equipped[op.overworldMenuSaveCursor[2]][i]._abilityImage; }
			if (saveCur[0] != i and page == "weaarm") { i2[i]=c_dkgray; }
			++i;
		}
		
		if (page == "weaarm")
		{
			i=0; res_j(); if (saveCur[0] == 0) { j=op.weapon; }else{ j=op.armor; }
			repeat (3)
			{
				if (saveCur[0] == i) {
					j1=false; if (op.equipped[op.overworldMenuSaveCursor[2]][i] == -1) { j1=true; }else{ if (op.equipped[op.overworldMenuSaveCursor[2]][i]._ability == -1) { j1=true; } }
					j2=false; if (j[cursor] == -1) { j2=true; }else{ if (j[cursor]._ability == -1) { j2=true; } }
					j3=true; if (saveCur[0] == 0) { if (j[cursor] == -1) { j3=false; }else{ if (op.equipped[op.overworldMenuSaveCursor[2]][i]._numberExistence != j[cursor]._numberExistence) { j3=false; } } }
				
					if (j3) { i2[i]=c_white; if (j2) { if (!j1) { i1[i]="(No ability.)"; i2[i]=c_red; i3[i]=-1; } }else{ i1[i]=j[cursor]._infoText[3]; i2[i]=c_yellow; i3[i]=j[cursor]._abilityImage; } }else{ i2[i]=c_dkgray; }
				}
				++i;
			}
		}
		
		i=0; repeat (3) { if (i3[i] != -1) { draw_ext(sSymbols3,i3[i],37,159.5-(page == "weaarm")*4+13.5*i,,,,c_orange); } print(i1[i],50,159.5+13.5*i,,,,,,,i2[i]); ++i; }
		
		//top text
		if (page == "equipped" or page == "weaarm")
		{
			res_k(); k=["",""];
			if (page == "equipped" and op.equipped[op.overworldMenuSaveCursor[2]][cursor] != -1) { k=[op.equipped[op.overworldMenuSaveCursor[2]][cursor]._infoText[1]]; }
			if (page == "weaarm") { if (saveCur[0] == 0) { if (op.weapon[cursor] != -1) { k=[op.weapon[cursor]._infoText[1]]; } }else{ if (op.armor[cursor] != -1) { k=[op.armor[cursor]._infoText[1]]; } } }
			print(k[0],10,9-introY*40,,16);
		}
	}
	
	
	
	if (page == "power1" or page == "spells")
	{
		draw_box(25,40,270,170,["bc"]);
		draw_ext(sMenuBig,2,25,40);
		draw_ext(sMenu,14,170.5,113,0.5,0.5,,c_gray);
		
		print(drText[7]+string(op.level[op.overworldMenuSaveCursor[2]])+" "+op.party[op.overworldMenuSaveCursor[2]]._infoText[1],160,56.5,,16);
		
		//top text
		if (page == "spells")
		{
			print(op.spells[op.overworldMenuSaveCursor[2]][cursor]._infoText[1],10,9-introY*40,,16);
		}
		
		//top side (Power)
		print(op.party[op.overworldMenuSaveCursor[2]]._infoText[0],67.5,57.5);
		if (page == "power1") { draw_ext(sSoul,0,58+cursor*25,74.5,0.5,0.5); draw_ext(sSoulArrows,op.time/10,58+cursor*25,74.5,0.5,0.5); }
		if (page == "spells") { draw_ext(sSoul,0,164,124+cursor*12.5,0.5,0.5); }
		
		res_i();
		repeat (array_length(op.party))
		{
			draw_ext(sHeads,op.party[i]._numberExistence,58+i*25,99,,,,,1-(i != op.overworldMenuSaveCursor[2])*(0.5+0.5/4));
			++i;
		}
		
		//right-down (Power)
		res_i();
		repeat (array_length(op.spells[op.overworldMenuSaveCursor[2]]))
		{
			i1=op.spells[op.overworldMenuSaveCursor[2]][i]._infoText[0];
			if (array_contains(op.party[op.overworldMenuSaveCursor[2]]._seed,"act")) { if (i == 0) { i1="ACT"; } }
			print(i1,205,119+12.5*i,,,,,,,c_gray);
			print(string(op.spells[op.overworldMenuSaveCursor[2]][i]._tp)+"%",170,119+12.5*i,,,,,,,c_gray);
			++i;
		}
		
		//left-down (Power)
		res_i(); i1=op.party[op.overworldMenuSaveCursor[2]];
		print(drText[4],50,119); print(op.attack[op.overworldMenuSaveCursor[2]],115,119); draw_ext(sSymbols2,op.party[op.overworldMenuSaveCursor[2]]._numberExistence,37,119);
		print(drText[5],50,119+12.5); print(op.defense[op.overworldMenuSaveCursor[2]],115,119+12.5); draw_ext(sSymbols3,0,37,119+12.5);
		print(drText[6],50,119+12.5*2); print(op.magic[op.overworldMenuSaveCursor[2]],115,119+12.5*2); draw_ext(sSymbols3,1,37,119+12.5*2);
		
		if (i1._attributeText[0] != -1) { print(i1._attributeText[0],50,119+12.5*3); if (i1._attributeSymbols[0] == 0) { print(i1._attributeValue[0],115,119+12.5*3); }else{ res_j(); repeat (i1._attributeSymbols[0]) { draw_ext(sSymbols3,i1._attributeImage[0],115+10*j,119+12.5*3); ++j; } } draw_ext(sSymbols3,i1._attributeImage[0],37,119+12.5*3); }else{ print("???",50,119+12.5*3,,,,,,,c_dkgray); }
		if (i1._attributeText[1] != -1) { print(i1._attributeText[1],50,119+12.5*4,,,,0.8); if (i1._attributeSymbols[1] == 0) { print(i1._attributeValue[1],115,119+12.5*4); }else{ res_j(); repeat (i1._attributeSymbols[1]) { draw_ext(sSymbols3,i1._attributeImage[1],115+10*j,119+12.5*4); ++j; } } draw_ext(sSymbols3,i1._attributeImage[1],37,119+12.5*4); }else{ print("???",50,119+12.5*4,,,,,,,c_dkgray); }
		
		print(drText[8],50,119+12.5*5); draw_ext(sSymbols3,2,37,119+12.5*5); res_j(); repeat (op.guts[op.overworldMenuSaveCursor[2]]) { draw_ext(sSymbols3,2,95+10*j,119+12.5*5); ++j; }
		
		if (i1._drawPower != -1) { i1._drawPower(); }
	}
	
	
	
	if (page == "config1" or page == "volume" or page == "mainMenuRoom") { draw_box(25,40,270,170,["bc"]); }
	if (page == "config1" or page == "volume")
	{
		print(drText[9],135,54);
		i2=c_white; if (page == "volume") { i2=c_yellow; } print(string(op.option_volume)+"%",215,79,,,,,,,i2);
		if (op.option_simplifyVFX) { i2=drText[10]; }else{ i2=drText[11]; } print(i2,215,114);
		if (window_get_fullscreen()) { i2=drText[10]; }else{ i2=drText[11]; } print(i2,215,131.5);
		if (op.option_autoRun) { i2=drText[10]; }else{ i2=drText[11]; } print(i2,215,149);
		
		res_i();
		repeat (7)
		{
			i2=c_white; if (page == "volume" and i == 0) { i2=c_yellow; }
			print(drTextSettings[i],85,79+i*17.5,,,,,,,i2,,,,,["menu","soul1","config1","volume",i]);
			++i;
		}
	}
	
	if (page == "controls" or page == "bind")
	{
		draw_box(25,40,270,170,["bc"]);
		
		print(drText[12],52.5,54); print(drText[13],162.5,54);
		
		res_i();
		repeat (9)
		{
			i2=c_white; if (cursor == i) { i2=c_aqua; if (page == "bind") { i2=c_red; } }
			print(drTextBind[i],52.5,74+i*14,,,,,,,i2,,,,,["menu","soul1","controls","bind",i]);
			
			if (i < 7)
			{
				print(get_keybind(i),162.5,74+i*14,,,,,,,i2);
			}
			
			++i;
		}
		
		print(drTextBind[7],52.5,74+7*14,,,,,,,c_yellow,,,,keybindGlow);
	}
}