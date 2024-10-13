function enemy_jevil() : enemy_base() constructor
{
	_name="Jevil";
	
	//
	
	_spriteWalk=sJevil_Sad;
	_spriteTouch=sJevil_Smile;
	_spriteGlide=sJevil_Smile;
	
	_spriteIdle=sEB_Idle;
	_spriteHappy=sJevil_Smile;
	_spriteDamage=sJevil_Smile;
	
	_drawFunc="draw_ene_jevil";
	
	//
	
	_textRandom=[];
	
	_flavourRandom=["Flavour Jevil 0","Flavour Jevil 1","Flavour Jevil 2"];
	_flavourTired="Flavour Jevil Tired";
	_flavourSpare="Flavour Jevil Spare";
	
	_checkText=["This is Jevil test."];
	
	_boubleOffsetXY=[-40,-20];
	_slashOffsetXY=[0,-20];
	
	// Overworld exclamation wait time
	_reactionTime=0;
	_exclamationOffset=-50;
	
	//
	
	// Act options:
	_spells=["spell_plus","spell_dothing1","spell_dothing2","spell_dothing3","spell_dothing4"];
	
	_hp=125;
	_attack=15;
	_defense=3;
	_money=1000;
	
	_handler=oHandler_Jevil;
	_patterns=[];
	
	// Recruit Stuff
	_recRequiredAmount=1;
	_recChapter=0;
	_recLV=10;
	_recElement="CARD";
	
	_infoText=[
		"It's Jevil wow this is amazing I never though I'd see the day waow isn't this crazy it is really him!"
		,"CHAOS"
		,"ORDER"
	];
	
	_recSprite=sJevil_Idle;
	_recDivide=3;
}