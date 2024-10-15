if (brightMode == 0) { bright=0; }
if (brightMode == "fade") { bright-=0.1; if (bright <= 0) { bright=0; brightMode=0; } }
if (brightMode == "glowUp") { if (bright != 1) { bright+=0.1; } }
if (brightMode == "flash") { bright=0.5+dsin(op.time*10)*0.5; }

colorFlash[0]+=(0-colorFlash[0])/10; colorFlash[1]+=(0-colorFlash[1])/10; colorFlash[2]+=(0-colorFlash[2])/10;

//

if (time > 0 and drawON)
{
	if (path != -1 and op.mode != "battle" and op.debug) { draw_set_color(c_white); draw_set_alpha(1); draw_path(path,startX,startY,false); }
	
	if (type == "enemy")
	{
		if !(time mod 20) { array_insert(red,0,0); }
		
		if !(!reaction[0] and reaction[1] == 0) and (op.mode != "battle")
		{
			gpu_set_blendmode(bm_add);
			res_u();
			repeat(array_length(red))
			{
				draw_ext(sprite_index,image_index,x+extraX,y+extraY,xscale*(1+red[u]/4),(1+red[u]/4),,c_red,(1-red[u]/2));
				red[u]+=0.02;
				++u;
			}
			gpu_set_blendmode(bm_normal);
			
			if (array_length(red) > 10) { array_delete(red,10,999); }
		}
	}
	
	// Draw self
	if (bright == 0) and (colorFlash[0] != 0 or colorFlash[1] != 0 or colorFlash[2] != 0)
	{
		shader_set(sha_rgb);
	
		shader_set_uniform_f(shader_get_uniform(sha_rgb,"col_r"),colorFlash[0]);
		shader_set_uniform_f(shader_get_uniform(sha_rgb,"col_g"),colorFlash[1]);
		shader_set_uniform_f(shader_get_uniform(sha_rgb,"col_b"),colorFlash[2]);
		shader_set_uniform_f(shader_get_uniform(sha_rgb,"col_a"),bright);
	}
	
	//
	//
	//
	if (op.fountainON)
	{
		gpu_set_fog(true,oFountain.color,0,0);
		draw_ext(sprite_index,image_index,x+extraX,y+extraY-2,xscale,,,image_blend,,bright);
		gpu_set_fog(false,0,0,0);
		draw_ext(sprite_index,image_index,x+extraX,y+extraY-4,xscale,-3,,0,,bright);
		image_blend=0;
	}else{ image_blend=c_white; }
	
	// Draw normal
	draw_ext(sprite_index,image_index,x+extraX,y+extraY,xscale,,,image_blend,,bright);
	//
	//
	//
	
	if (type == "pep" or type == "follower") and (op.dodge_alpha > 0)
	{
		if (numb == 0)
		{
			shader_set(sha_rgb);
			
			shader_set_uniform_f(shader_get_uniform(sha_rgb,"col_r"),1);
			shader_set_uniform_f(shader_get_uniform(sha_rgb,"col_g"),-1);
			shader_set_uniform_f(shader_get_uniform(sha_rgb,"col_b"),-1);
			shader_set_uniform_f(shader_get_uniform(sha_rgb,"col_a"),bright);
		
			draw_ext(sprite_index,image_index,x+extraX-1,y+extraY,xscale,,,,0.8*op.dodge_alpha);
			draw_ext(sprite_index,image_index,x+extraX+1,y+extraY,xscale,,,,0.8*op.dodge_alpha);
			draw_ext(sprite_index,image_index,x+extraX,y+extraY-1,xscale,,,,0.8*op.dodge_alpha);
			draw_ext(sprite_index,image_index,x+extraX,y+extraY+1,xscale,,,,0.8*op.dodge_alpha);
		
			shader_reset();
			
			draw_ext(sprite_index,image_index,x+extraX,y+extraY,xscale);
			
			gpu_set_fog(true, merge_color(c_black, c_dkgray, .5), 0,0);
			draw_ext(sprite_index,image_index,x+extraX,y+extraY,xscale,,,,0.8*op.dodge_alpha);
			gpu_set_fog(false,0,0,0);
		}
		else
		{
			draw_ext(sprite_index,image_index,x+extraX,y+extraY,xscale,,,c_gray,op.dodge_alpha);
		}
	}
	
	shader_reset();
	
	if (type == "pep" and op.mode == "battle" and op.battleTime > 60)
	{
		if (op.hp[numb] <= 0) and (oMenuBattle.mode == "talk" or oMenuBattle.mode == "dodge") { if (deadAlpha < 1) { deadAlpha+=0.1; } }else{ if (deadAlpha > 0) { deadAlpha-=0.1; } }
		draw_ext(sprite_index,image_index,x+extraX,y+extraY,xscale,,,,(0.5+0.25/2)*deadAlpha,-1);
	}
	
	//
	if (type == "enemy")
	{
		//Bright Shader
		#region
		shader_set(sha_rgb);
	
		shader_set_uniform_f(shader_get_uniform(sha_rgb,"col_r"),bright);
		shader_set_uniform_f(shader_get_uniform(sha_rgb,"col_g"),bright);
		shader_set_uniform_f(shader_get_uniform(sha_rgb,"col_b"),bright);
		shader_set_uniform_f(shader_get_uniform(sha_rgb,"col_a"),0);
		#endregion
		if (str._drawFunc != -1) { if (time <= 1) { draw=asset_get_index(str._drawFunc); } draw(); }
		shader_reset();
	}
	//
	
	if (reaction[0] and reaction[1] != 0) { draw_ext(sExclamation,0,x,y+str._exclamationOffset); }
}