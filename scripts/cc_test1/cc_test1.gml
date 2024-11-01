function cc_test1() : cc_base() constructor
{
	if (op.mode == "battle") { _func=function(){ continue_orders(); } }
	
	_face=[[FACE.RALSEI,1]];
	_faceAnimate=[-1];
	_proceedAnimate="fade";
	_printSeed=[["fade"]];
	
	_funcLine=[
		function(){ effect_smallface(,,,100,15); },
		-1
	];
}