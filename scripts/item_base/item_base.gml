//declaring values for items
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
	
	//sword = 0 , axe = 1 , scarf = 2
	_numberExistence=-1;
	
	//stats
	_attack=0;
	_defense=0;
	_magic=0;
	
	_heal=[100];
	//gives tp in battle when you use it
	_tp=0;
	//how much it costs at shops
	_price=100;
	
	//which image index to use from sSymbols3 (-1 means 0 and 0 means 0)
	_imageIndex = -1;
	
	
	
	//ability
	_ability=-1;
	_abilityImage=5;
	
	
	
	_isKeyitem=false;
	_seed=[];
	//_seed=["everyone"]; <<< would make it so that everyone on the team is effected by the item
	
	
	
	//special stats
	_canSelect=true;
	_canSell=true;
	//what person can't ware this item
	_cantHave=[];
	_forceReact=[];
	_removeItem=true;
	_sound=-1;
	
	
	
	//triggers a function when you use the item
	//_func=function() { start_cutscene("cc_test1"); }
	_func=-1;
	
	//light trig
	_info=-1;
	_drop=-1;
}