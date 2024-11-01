//declaring values for enemys
function enemy_base() constructor
{
	//display name
	_name="Skip Name";
	
	
	
	//standard sprites
	_spriteWalk=sEB_Walk;
	_spriteTouch=sEB_Touch;
	_spriteGlide=sEB_Glide;
	
	_spriteIdle=sEB_Idle;
	_spriteHappy=sEB_Happy;
	_spriteDamage=sEB_Damage;
	
	_drawFunc=-1;
	
	
	
	//random encounter bouble text
	_textRandom=[["Text Random 0",100],["Text Random 1",125],["Text Random 2",150],["Text Random 3",150],["Text Random 4",150],["Text Random 5",150]];
	
	//random encounter auto flavour text
	_flavourRandom=["Flavour random 0","Flavour random 1","Flavour random 2"];
	_flavourTired="Flavour Tired";
	_flavourSpare="Flavour Spare";
	
	//check text
	_checkText=["Check text default."];
	
	_boubleOffsetXY=[-40,-20];
	_slashOffsetXY=[0,-20];
	
	
	
	//overworld physical encounter
	_reactionDistance=40;
	_reactionTime=30;
	_runSpeed=3;
	_exclamationOffset=-50;
	
	
	
	//act options:
	_spells=["spell_dothing1","spell_dothing2","spell_dothing3","spell_dothing4"];
	
	_hp=300;
	_attack=10;
	_defense=0;
	_money=100;
	
	_handler=oHandler_Basic;
	_patterns=[pattern1,pattern2,pattern3];
	
	//recruit info
	_recRequiredAmount=5;
	_recChapter=0;
	_recLV=3;
	_recElement="CAT";
	
	_infoText=[
		"(Description)",
		"attribute (LIKE)",
		"attribute (DISLIKE)"
	];
	
	_recSprite=sKris_Down;
	_recDivide=5;
}