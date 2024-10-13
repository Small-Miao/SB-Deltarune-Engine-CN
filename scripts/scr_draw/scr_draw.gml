function draw_ext(_sprite,_subimg=0,_x=0,_y=0,_xscale=1,_yscale=1,_rot=0,_col=c_white,_alpha=1,_bright=0)
{
	if (_bright != 0)
	{
		shader_set(sha_rgb);
	
		shader_set_uniform_f(shader_get_uniform(sha_rgb,"col_r"),_bright);
		shader_set_uniform_f(shader_get_uniform(sha_rgb,"col_g"),_bright);
		shader_set_uniform_f(shader_get_uniform(sha_rgb,"col_b"),_bright);
		shader_set_uniform_f(shader_get_uniform(sha_rgb,"col_a"),0);
	}
	
	draw_sprite_ext(_sprite,_subimg,_x,_y,_xscale,_yscale,_rot,_col,_alpha);
	
	if (_bright != 0)
	{
		shader_reset();
	}
}

//
//
//

function draw_box(_x,_y,_xscale=32,_yscale=32,_seed=[])
{
	var color=c_white;
	
	if array_contains(_seed,"light") {  _x-=4; _y-=4; _xscale+=8; _yscale+=8; }
	
	if array_contains(_seed,"bc") { draw_ext(sBox,5,_x,_y,_xscale/32,_yscale/32); }
	
	if array_contains(_seed,"red") { color=c_white; }
	
	//
	
	if (op.world == "dark") and (!array_contains(_seed,"light")) { draw_ext(sBox,clamp(op.boxImage,0,4),_x,_y,_xscale/32,_yscale/32,,color); }
	if (op.world == "light") or (array_contains(_seed,"light")) { draw_ext(sBox,6,_x,_y,_xscale/32,_yscale/32,,color); }
}

//
//
//

//
//
//

//
//
//

function draw_party_hud()
{
	draw_ext(sPixel,0,0,162.5+op.hudY,320,100,,0); if (op.mode == "battle") { draw_ext(sPixel,0,0,162.5+op.hudY,320,1,,make_color_rgb(51,32,51)); }

	res_i();
	repeat(array_length(op.party))
	{
		if (op.menuPep == i and op.mode == "battle") { if (op.battleRaise[i] < 9) { op.battleRaise[i]-=2; }else{ op.battleRaise[i]-=5; } }else{ op.battleRaise[i]+=7; }
		op.battleRaise[i]=clamp(op.battleRaise[i],0,16);
		
		i1=[0+106.5*i+(3-array_length(op.party))*53,146.5+op.battleRaise[i]+op.hudY];
		if (op.mode == "battle") { i3=0; }else{ i3=1; }
		
		draw_ext(sPixel,0,i1[0],i1[1],106.5,17.5-(op.mode != "battle")*16.5,,make_color_rgb(51,32,51));
	
		if (op.menuPep == i or op.menuPep == "all") { draw_ext(sPixel,0,i1[0],i1[1],106.5,100-(op.mode != "battle")*99,,op.party[i]._UIcolor); }
		draw_ext(sPixel,0,i1[0]+1,i1[1]+19.5,104.5,100,,0);
		
		if (op.menuPep == i)
		{
			if (op.mode == "battle")
			{
				// Draw waves
				res_j();
				repeat(3)
				{
					draw_ext(sPixel,0,i1[0]-1+round(op.battleSticks[j]*2)/2,i1[1]+19.5,1,100,,op.party[i]._UIcolor,(20-op.battleSticks[j])/20);
					draw_ext(sPixel,0,i1[0]+106.5-round(op.battleSticks[j]*2)/2,i1[1]+19.5,1,100,,op.party[i]._UIcolor,(20-op.battleSticks[j])/20);
					++j;
				}
			}
		}
		else
		{
			draw_ext(sPixel,0,i1[0],i1[1]+17-op.battleRaise[i],1,100,,0);
			draw_ext(sPixel,0,i1[0]+105.5,i1[1]+17-op.battleRaise[i],1,100,,0);
		}
		
		if (op.battleRaise[i] != 16) { draw_ext(sPixel,0,i1[0]+1,i1[1]+18.5,104.5,1,,0); }
		if (i == 0) { draw_ext(sPixel,0,0,181+op.hudY,320,100,,0); if (op.mode == "battle") { draw_ext(sPixel,0,0,181+op.hudY,320,1.5,,make_color_rgb(51,32,51)); } }
		draw_ext(sPixel,0,i1[0],181+op.hudY,106.5,100,,0); if (op.mode == "battle") { draw_ext(sPixel,0,i1[0],181+op.hudY,106.5,1.5,,make_color_rgb(51,32,51)); }
		
		if (op.mode == "battle")
		{
			// Draw buttons
			res_j();
			repeat(array_length(op.party[i]._buttons))
			{
				draw_ext(sButtons,(op.party[i]._buttons[j]*3)+(j == faimd[op.menuPep] and op.menuPep == i),i1[0]+10+j*17.5+(5-array_length(op.party[i]._buttons))*9,i1[1]+20-op.battleRaise[i],0.5,0.5);
				if (op.menuPep == i) and ( (oMenuBattle.canSpare and op.party[i]._buttons[j] == 3) or (oMenuBattle.canTired and op.party[i]._buttons[j] == 5 and array_contains(oMenuBattle.pacify[0],i)) )
				{
					draw_ext(sButtons,(op.party[i]._buttons[j]*3)+(2),i1[0]+10+j*17.5+(5-array_length(op.party[i]._buttons))*9,i1[1]+20-op.battleRaise[i],0.5,0.5,,,0.5+sin(op.ti/20)*0.5);
				}
				++j;
			}
		}
		
		draw_ext(sPixel,0,i1[0]+1,i1[1]+18.5-op.battleRaise[i],104.5,1,,op.party[i]._UIcolor);
	
		draw_ext(sPixel,0,i1[0]+1,i1[1]+1,104.5,17.5,,0);
		
		i4=1;
		if (op.mode != "battle") and (page == "itemUSEUSE" or page == "itemTOSSUSE") and (op.menuPep == i or op.menuPep == "all") { i4=3; }
		if (op.mode == "battle")
		{
			i4=oMenuBattle.faceImage[i];
		}
		draw_ext(op.party[i]._UIface,i4,i1[0]+6.5,i1[1]+5.5+i3,0.5,0.5);
		
		draw_ext(sNames,op.party[i]._numberExistence,i1[0]+25.5,i1[1]+7+i3,0.5,0.5);
		draw_ext(sMenu,15,i1[0]+55,i1[1]+11+i3,0.5,0.5); draw_ext(sMenu,16,i1[0]+80.5,i1[1]+4.5+i3,0.5,0.5);
	
		i2=c_white; if (op.hp[i] < 31) { i2=c_yellow; } if (op.hp[i] < 1) { i2=c_red; }
		print(string(op.hp[i]),i1[0]+80,i1[1]+4.5+i3,op.fontHP,,,,,,i2,,,,,["fa_right"]);
		print(string(op.hpMax[i]),i1[0]+102.5,i1[1]+4.5+i3,op.fontHP,,,,,,i2,,,,,["fa_right"]);
	
		draw_healthbar(i1[0]+64,i1[1]+11+i3,i1[0]+101,i1[1]+14.5+i3,(op.hp[i]/op.hpMax[i])*100,make_color_rgb(128,0,0),op.party[i]._UIcolor,op.party[i]._UIcolor,0,true,false);
	
		++i;
	}
}