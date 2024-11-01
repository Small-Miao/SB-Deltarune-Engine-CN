//declaring values for party members aka people
//check the notes for more info
function pep_base() constructor
{
	_infoText=["Name","Title"];
	
	
	//sprites
	_spriteWalk=an_kris_walk();
	
	_spriteGlide=sKris_Glide;
	_spriteEnterBattle=sKris_Fight;
	_spriteVictory=sKris_Victory;
	
	_spriteIdle=sKris_Idle;
	_spriteDead=sKris_Dead;
	
	_spriteFight=sKris_Fight;
	_spriteAct=[sKris_ActWind,sKris_Act];
	_spriteItem=[sKris_Item];
	_spriteDefend=sKris_Defend;
	_spriteMagic=[sKris_ActWind,sKris_Act];
	
	_spriteUnAct=sKris_UnAct;
	_spriteSlash=sKris_Slash;
	
	
	
	_spriteDEjump=sKris_JumpLight;
	_spriteDEfallBack=sKris_FallBackLight;
	_spriteDEfallRotate=sKris_FallRotateLight;
	_spriteDEfall=sKris_FallLight;
	_spriteDEfallDark=sKris_Fall;
	_spriteDEcurl=sKris_Curl;
	
	_spriteBall=sKris_Ball;
	_spriteRise=sKris_Rise;
	
	_spriteSlide=sKris_Slide;
	
	
	
	//Kris = 0  , Susie = 1 , Ralsei = 2 and so on... (Any newly added character need to have a different (_NumberExistence) number from everyone else)
	_numberExistence=0;
	
	_isDarkner=false;
	
	//fake stats
	_attributeText=["AAA","BBB"];
	_attributeImage=[2,2];
	_attributeValue=[10,20];
	_attributeSymbols=[0,0];
	
	_seed=[];
	
	_greedText=["Weapon (NO)","Armor (NO)"];
	
	
	
	//battle
	
	_UIcolor=c_red;
	_UIface=sKris_Face;
	
	_buttons=[0,1,2,3,4];
	
	_damageColor=c_red;
	_actionColor=c_red;
	
	
	
	//overworld
	_soulOffset=14;
	_drawPower=-1;
	
	
	
	//you can pick the choice for the party member and they do this action all the time instead
	_lockSpell=-1;
	//(0 for select enemy [ex: hit or spare])   (1 for select party member [ex: heal prayer])
	_lockToType=0;
	
	
	
	//encounter kills data change
	_killChange=[
		function(_numb) { op.hpMax[_numb]+=3; }
		,function(_numb){ op.attack[_numb]+=10; }
		,function(_numb){ op.defense[_numb]+=20; }
		,-1
	];
}