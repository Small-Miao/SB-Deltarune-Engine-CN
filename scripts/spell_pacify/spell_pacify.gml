function spell_pacify() : spell_base() constructor
{
	_infoText=["Pacify","SPARE a tired enemy by putting them to sleep.","Spare\nTIRED foe"];
	
	_tp=16;
	
	_selectType=1;
	
	_isPacify=true;
	
	_object=oSpell_Pacify;
}