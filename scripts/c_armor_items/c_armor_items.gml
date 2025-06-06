function item_amberCard() : item_base() constructor
{
	_infoText=["Amber Card","This card\nis sticky"];
	
	_attack=1;
	_defense=1;
	_magic=1;
}



function item_whiteRibbon() : item_base() constructor
{
	_infoText=["White Ribbon","the item you find\nin that maze from chapter 1","a","Cuteness"];
	
	_attack=3;
	_defense=3;
	_magic=3;
	
	_ability="cute";
	
	//susie doesn't want to equip this
	_cantHave=[1];
}

function item_sparkle() : item_base() constructor
{
	_infoText=["Sparkle","different icon in\narmore menu","a","a"];
	
	_defense=10;
	_magic=1;
	
	_armorImageIndex = 1;
}