function spell_standard() : spell_base() constructor
{
	_infoText=["ACT-Action","Standard"];
	if (op.party[op.menuPep]._numberExistence == 0) { _infoText[0]="K-Action"; }
	if (op.party[op.menuPep]._numberExistence == 1) { _infoText[0]="S-Action"; }
	if (op.party[op.menuPep]._numberExistence == 2) { _infoText[0]="R-Action"; }
	
	_object=oSpell_Template;
} 