// Declaring values for items
function item_base() constructor
{
	_infoText=["Item Name","Overworld title","Battle title","Ability Name"];
	//_infoText=["Item Name","Overworld title"];
	_lightName="LIGHTNAME";
	_shopDescription="Shop Description";
	
	_reactionText=[
		"",
		"(Susie item Text)",
		"(Ralsei item text)"
	];
	// or
	_reactionText=auto_kris_reaction(["(Susie item Text)","(Ralsei item text)"]);
	
	_customBattleText=-1;
	
	// sword = 0 , axe = 1 , scarf = 2 , ring...
	_numberExistence=-1;
	
	_attack=0;
	_defense=0;
	_magic=0;
	
	_ability=-1;
	_abilityImage=5;
	
	//
	
	_heal=[100];
	_tp=0;
	
	_isKeyitem=false;
	_seed=[];
	
	//
	
	_price=100;
	_canSelect=true;
	_canSell=true;
	_cantHave=[]; /* What person can't ware this item */
	_forceReact=[];
	_removeItem=true;
	_sound=-1;
	
	//_func=function() { start_cutscene("cc_test1"); }
	_func=-1;
	
	// Light:
	_info=-1;
	_drop=-1;
}