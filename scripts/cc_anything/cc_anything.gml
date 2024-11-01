//you can use this for quick dialouge boxes by setting the values before activating the scene 
function cc_anything() : cc_base() constructor
{
	_dialogue=op.textCC;
	
	if (op.funcCC != -1) { _func=op.funcCC; }
	
	if (op.faceCC != -1) { _face=op.faceCC; }
}