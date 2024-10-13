function spell_healPrayer() : spell_base() constructor
{
	_infoText=["Heal Prayer","Heavenly light restores a little HP to\none party member. Depends on Magic.","Heal\nAlly"];
	
	_tp=32;
	_selectType=2;
	
	_object=oSpell_HealPrayer;
}