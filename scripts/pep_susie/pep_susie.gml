function pep_susie() : pep_base() constructor
{
	_infoText=["Susie","Dark Knight\nDoes damage using\ndark energy."];
	
	_spriteWalk=an_susie_walk();
	
	_spriteGlide=sSusie_Right;
	_spriteEnterBattle=sSusie_Fight;
	_spriteVictory=sSusie_Victory;
	
	_spriteIdle=sSusie_Idle;
	_spriteDead=sSusie_Dead;
	
	_spriteFight=sSusie_Fight;
	_spriteAct=[sSusie_Act];
	_spriteItem=[sSusie_ItemWind,sSusie_Item];
	_spriteDefend=sSusie_Defend;
	_spriteMagic=[sSusie_MagicWind,sSusie_Magic];
	
	_spriteUnAct=sSusie_UnAct;
	_spriteSlash=sSusie_Slash;
	
	//
	
	_spriteDEjump=sSusie_JumpLight;
	_spriteDEfallBack=sSusie_FallBackLight;
	_spriteDEfallRotate=sSusie_FallRotateLight;
	_spriteDEfall=sSusie_FallLight;
	_spriteDEfallDark=sSusie_Fall;
	_spriteDEcurl=sSusie_Curl;
	
	_spriteBall=sSusie_Ball;
	_spriteRise=sSusie_Rise;
	_spriteSlide=sSusie_Slide;
	
	//
	
	_numberExistence=1;
	
	_attributeText=["Rudeness","Purple"];
	_attributeImage=[5,5];
	_attributeValue=[89,"Yes"];
	_attributeSymbols=[0,0];
	
	_seed=["greed"];
	
	//
	
	_greedText=["I'm too GOOD for that.","Hey, hands off!"];
	
	// Battle
	
	_UIcolor=make_color_rgb(255,0,255);
	_UIface=sSusie_Face;
	
	_buttons=[0,5,2,3,4];
	
	_damageColor=merge_color(c_purple,c_white,0.6);
	_actionColor=make_color_rgb(255,128,255);
	
	_soulOffset=21;
}