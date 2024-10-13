function cc_test1() : cc_base() constructor
{
	//_dialogue=[]; repeat(30) { array_push(_dialogue,string(irandom_range(0,99999999999999999999))+" "+string(irandom_range(0,99999999999999999999))+" "+string(irandom_range(0,99999999999999999999))); }
	
	/*
	_color=[
		[[3,50,c_yellow],[15,7,c_blue],[30,3,c_red]],
		[[3,5,c_red],[15,7,c_red],[30,3,c_red]],
		[[3,5,c_red],[15,7,c_red],[30,3,c_red]]
	];
	*/
	
	if (op.mode == "battle") { _func=function(){ continue_orders(); } }
	
	_face=[[FACE.RALSEI,1]];
	_faceAnimate=[0];
	_proceedAnimate="fade";
	_printSeed=[["blur"]];
	
	_funcLine=[
		function(){ effect_smallface(,,,100,15); }
		,-1
	];
	
	//
	//_moveAfter=false;
	
	//_func=function(){ prompt([-1],["The First"]); }
	//_func=function(){ prompt([-1,-1],["The First","The Second"]); }
	//_func=function(){ prompt([-1,-1,-1],["The First","The Second","The Third"]); }
	//_func=function(){ prompt([function(){ start_cutscene("cc_test1"); },-1,-1,-1],["The First","The Second","The Third","The Fourth"]); }
}