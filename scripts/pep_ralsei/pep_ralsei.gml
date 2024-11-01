function pep_ralsei() : pep_base() constructor
{
	_infoText=["Ralsei","Dark Prince\nDark-World being.\nHas friends now."];
	
	_spriteWalk=an_ralsei_walk();
	
	_spriteGlide=sRalsei_Right;
	_spriteEnterBattle=sRalsei_Spin;
	_spriteVictory=sRalsei_Victory;
	
	_spriteIdle=sRalsei_Idle;
	_spriteDead=sRalsei_Dead;
	
	_spriteFight=sRalsei_Fight;
	_spriteAct=[sRalsei_Act];
	_spriteItem=[sRalsei_Item];
	_spriteDefend=sRalsei_Defend;
	_spriteMagic=[sRalsei_MagicWind,sRalsei_Magic];
	
	_spriteUnAct=sRalsei_UnAct;
	_spriteSlash=sRalsei_Slash;
	
	_spriteBall=sRalsei_Ball;
	_spriteSlide=sRalsei_Slide;
	
	
	
	_numberExistence=2;
	
	_isDarkner=true;
	
	_attributeText=["Sweetness","Fluffiness"];
	_attributeImage=[6,7];
	_attributeValue=[97,0];
	_attributeSymbols=[0,2];
	
	
	
	_UIcolor=make_color_rgb(0,255,0);
	_UIface=sRalsei_Face;
	
	_buttons=[0,5,2,3,4];
	
	_damageColor=merge_color(c_lime,c_white,0.5);
	_actionColor=make_color_rgb(128,255,128);
}