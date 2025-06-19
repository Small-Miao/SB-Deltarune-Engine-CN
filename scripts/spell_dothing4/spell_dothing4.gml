function spell_dothing4() : spell_base() constructor
{
	_infoText=["Do thing 4","t1\nt2"];
	
	_tp=10;
	_partyHelp=[1,2];
	
	if (room == rRoom11)
	{
		_extraHeads = [0];
	}
	
	_object=oSpell_Action;
	
	_alert = true;
}