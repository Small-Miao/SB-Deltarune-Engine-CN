// Declaring values for spells
function spell_base() constructor
{
	_infoText=["Skip","Skip line 1",-1];
	
	_tp=0;
	_partyHelp=[];
	// 0 == instant | 1 == enemy | 2 == party
	_selectType=2;
	_isPacify=false;
	
	_object=oSpell_Template;
}