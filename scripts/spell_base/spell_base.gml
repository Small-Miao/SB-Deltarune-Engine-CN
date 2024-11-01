//declaring values for spells
function spell_base() constructor
{
	_infoText=["Name","Skip line 1",-1];
	
	//cost
	_tp=0;
	//who do you need help from to do this action? ([], [1], [2] or [1,2])
	_partyHelp=[];
	// 0 == instant | 1 == enemy | 2 == party
	_selectType=2;
	_isPacify=false;
	
	_object=oSpell_Template;
}