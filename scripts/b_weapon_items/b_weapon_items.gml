function item_maneAx() : item_base() constructor
{
	_infoText=["Mane Ax","werwer","ertert","WHAT"];
	_numberExistence=1;
}



function item_redScarf() : item_base() constructor
{
	_infoText=["Red Scarf","werwer","asdfd","WHAT"];
	_numberExistence=2;
}



function item_sharpAx() : item_base() constructor
{
	_infoText=["Sharp Ax","werwer","ertert","WHAT"];
	_numberExistence=1;
	_reactionText[_numberExistence]="WTF 999 DAMAGE??!??!?!";
	
	_attack=999;
}



function item_sharpBlade() : item_base() constructor
{
	_infoText=["Sharp Blade","adfasdf","afds","+SHARP+"];
	_numberExistence=0;
	
	_attack=2;
	_defense=2;
	_magic=2;
	
	_ability="morecut";
}



function item_woodBlade() : item_base() constructor
{
	_infoText=["Wood Blade","adfadf","adsfadf","adsfadsf"];
	_numberExistence=0;
	
	_attack=4;
	_defense=1;
	_magic=6;
}