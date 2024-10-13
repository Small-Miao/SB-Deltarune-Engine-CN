function item_amberCard() : item_base() constructor
{
	_infoText=["Amber Card","afdasdf","adsfadf","asdfasd"];
	
	_attack=1;
	_defense=1;
	_magic=1;
}



function item_whiteRibbon() : item_base() constructor
{
	_infoText=["White Ribbon","adwedf","adfafd","Cuteness"];
	
	_attack=3;
	_defense=3;
	_magic=3;
	
	_ability="cute";
	
	_cantHave=[1];
}