//spawns bouncy battle text
function effect_number(_number=100,_x,_y,_color=c_white,_font=op.fontDamage,_spriteImage=-1,_seed=[])
{
	if (op.battleTime > 40) { _x+=(op.x-160); _y+=(op.y-120); }
	
	with (instance_create_depth(_x,_y,-9999,oNumberEffect))
	{
		damage=_number;
		
		color=_color;
		font=_font;
		
		killtimer=0;
		
		if (_spriteImage != -1) { _message=1; message_sprite=_spriteImage; }
	}
}



//spawns a sprites that fades out and then deletes itself
function effect_fade(_sprite,_subimg=0,_x=x,_y=y,_xscale=1,_yscale=1,_rot=0,_col=c_white,_bright=0,_depth=-y,_seed=[],_startFunc=-1)
{
	with(instance_create_depth(_x,_y,-_y,oFadeEffect))
	{
		sprite_index=_sprite;
		image_index=_subimg;
		image_xscale=_xscale;
		image_yscale=_yscale;
		image_angle=_rot;
		image_blend=_col;
		
		image_speed=0;
		bright=_bright;
		
		depth=_depth;
		
		seed=_seed;
		startFunc=_startFunc;
		
		startScale=[_xscale,_yscale];
	}
}



//spawns a star effect that fades out after a while (used when healing)
function effect_star(_x,_y,_seed)
{
	with (instance_create_depth(_x,_y,-9999,oStarEffect))
	{
		seed=_seed;
	}
}



//spawns a sprite that animates untuil it reaches the final frame and then it deletes itself
function effect_subnumber(_sprite,_subimg=0,_x=x,_y=y,_xscale=1,_yscale=1,_rot=0,_col=c_white,_bright=0,_depth=-y,_seed=[])
{
	with(instance_create_depth(_x,_y,-_y,oSubnumberEffect))
	{
		sprite_index=_sprite;
		image_index=_subimg;
		image_xscale=_xscale;
		image_yscale=_yscale;
		image_angle=_rot;
		image_blend=_col;
		
		bright=_bright;
		
		depth=_depth;
		
		seed=_seed;
		
		startScale=[_xscale,_yscale];
		
		image_speed=1;
	}
}



//spawns the text that apears over party members UI when they eat food
function effect_textpop(_text="Skip",_x=200,_y=200,_font=fDetermination,_sep=12,_width=320,_xscale=1,_yscale=1,_angle=0,_c1=c_white,_c2=c_white,_c3=c_white,_c4=c_white,_alpha=1,_seed=[])
{
	with(instance_create_depth(_x,_y,-9999,oTextPopEffect))
	{
		text=_text;
		font=_font;
		sep=_sep;
		width=_width;
		xscale=_xscale;
		yscale=_yscale;
		angle=_angle;
		c1=_c1; c2=_c2; c3=_c3; c4=_c4;
		alpha=_alpha;
		seed=_seed;
	}
}



//this effect transitions usualy susie and kris when they are falling into the dark world. It masks their sprites and turns them from light world to dark world sprites.
function effect_darkentrance(_numb)
{
	with(instance_create_depth(0,0,-9999,oDarkEntranceEffect))
	{
		numb=_numb;
	}
}



//spawns the small faces that can apear in text boxes
function effect_smallface(_face=sFace_Susie,_image=1,_text="Skip",_x=150,_y=42,_font=fDetermination,_sep=12,_width=320,_angle=0,_c1=c_white,_c2=c_white,_c3=c_white,_c4=c_white,_alpha=1,_seed=[])
{
	--_image;
	
	with(instance_create_depth(_x+op.menuPrompt[0],_y+op.menuPrompt[1],-9999,oSmallFaceEffect))
	{
		face=_face;
		image=_image;
		
		text=_text;
		font=_font;
		sep=_sep;
		width=_width;
		angle=_angle;
		c1=_c1;
		c2=_c2;
		c3=_c3;
		c4=_c4;
		alpha=_alpha;
		seed=_seed;
	}
}



//spawns the numbers that apear when you recruit an enemy
function effect_recruit(_enemyNumb,_recruitNumb = -1,_image=5)
{
	var _x=op.battle_enemyXY[_enemyNumb][0];
	var _y=op.battle_enemyXY[_enemyNumb][1];
	
	if (op.battleTime > 40) { _x+=(op.x-160); _y+=(op.y-120); }
	
	with(instance_create_depth(_x,_y,-9999,oRecruitEffect))
	{
		if (_recruitNumb != -1)
		{
			numb=_recruitNumb;
			text=string(op.recruits[_recruitNumb][2])+"/"+string(op.recruits[_recruitNumb][1]);
		}
		
		image = _image;
	}
}



//spawns a bunch of Z's before pacifying the enemy
function effect_pacify(_enemyNumb)
{
	var _x=op.battle_enemyXY[_enemyNumb][0];
	var _y=op.battle_enemyXY[_enemyNumb][1];
	
	if (op.battleTime > 40) { _x+=(op.x-160); _y+=(op.y-120); }
	
	instance_create_depth(_x,_y,0,oPacifyEffect);
}



//spawns the rude buster effect (can be used outside of battle)
function effect_rudebuster(_x,_y,_targetX,_targetY)
{
	with (instance_create_depth(_x,_y,0,oRudeBusterEffect)) { targetXY=[_targetX,_targetY]; }
}

//spawns the bad explotion effect
function effect_badexplosion(_x=x,_y=y,_depth=-9999,_image_speed=1,_sound=snd_badexplosion,_xscale=1,_yscale=1)
{
	if (_sound != -1) { sound(_sound); }
	
	with (instance_create_depth(_x,_y,_depth,oBadExplosionEffect))
	{
		image_speed=_image_speed;
		image_xscale=_xscale;
		image_xscale=_yscale;
	}
}



//spawns the dust that apears when you slide down a cliff
function effect_slidedust(_x=x,_y=y)
{
	instance_create_depth(_x,_y,-_y,oSlideDustEffect);
}



//spawns text in the upper right corner of the screen akin to the "feild of hopes and dreams" text that only apears once in chapter 1
function effect_fieldtext(_text="Song title goes here",_x=0,_y=0)
{
	with (instance_create_depth(_x,_y,-9999,oFieldTextEffect))
	{
		text=_text;
	}
}

//spawns text instructions
function effect_puzzleText(_confirmText=["text1z","text2z"],_confirmPos=[-120,223-30,8,223-30],_cancelText=["Hold","Exit"],_cancelPos=[-120,223-15,8,223-15],_menuText=["text1c","text2c"],_menuPos=[-120,223,8,223],_delay=15,_exitFunc=function(){ camera_reset(15,,,function(){ set_mode(); }); },_textSeed=[])
{
	with (instance_create_depth(0,0,-9999,oEffectPuzzleText))
	{
		confirmText = _confirmText;
		confirmPos = _confirmPos;
		cancelText = _cancelText;
		cancelPos = _cancelPos;
		menuText = _menuText;
		menuPos = _menuPos;
		
		exitFunc = _exitFunc;
		
		seed = ["bc5"];
		repeat (array_length(_textSeed))
		{
			array_push(seed,_textSeed[0]);
			array_delete(_textSeed,0,1);
		}
		
		pos = [_confirmPos[0],_confirmPos[1],_cancelPos[0],_cancelPos[1],_menuPos[0],_menuPos[1]];
		delay = _delay; endTime = _delay;
	}
}