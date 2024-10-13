// Declaring values for dialogue
function cc_base() constructor
{
	_dialogue=get_text("t_bakesale");
	
	//_dialogue=["A B C A A A B C A A A B C A A A B C A A A B C A A A B C A A A B C A A A B C A A A B C A A A B C A A A B C A A A B C A A A B C A A A B C A A A","DEF"];
	
	_x=[12];
	if (op.y < op.playerY-20) { _y=[1]; }else{ _y=[156]; }
	_xScale=[296.5];
	_yScale=[83.5];
	
	// [[FACE.SUSIE,1],-1,[FACE.RALSEI,5]]
	_face=[-1];
	// (0 == Shuffle back and fourth)
	_faceAnimate=[-1];
	
	_font=[fDetermination];
	_voice=[txt_text];
	_textSpeed=[1];
	
	// Pause eveything and hide the box for a short time
	_hideBox=[0];
	
	_seed=[];
	
	// if true will automaticaly use susie's voice if susie's face is being used and etcetera for other characters.
	// (Declare this in object oDialouge create event bottom)
	_match=true;
	
	
	// (-1 == no box) // (0 == overworld box) // (1 == battle text bubble)
	_box=[0];
	// (0 == right side) // (1 == left side)
	_arrow=[-1];
	// [ [letter number,duration,c_color],[],[] ],[ [],[],[] ] and so on...
	_color=[];
	// [ [3,5],[7,9] ]
	_jump=[];
	
	_shopSprite=[-1];
	// [[sprite1,sprite2,sprite3],-1,[sprite1,sprite3]]
	_asteriskFace=[-1];
	
	// [["aaa"],["bbb"],["ccc"]]
	_printSeed=-1;
	// Executes when dialouge is over.
	_func=-1;
	if (op.locationCCcheck) { _func=function(){ op.locationCCcheck=false; op.locationCC=-1; instance_create_depth(0,0,-9999,oMenuSave); } }
	// Execute every time a new line begins.
	_funcLine=[];
	// Execute with {func} command, moves a step every time you do. ///////// [1,2,3] {func} == 1 , {func} == 2 , {func} == 3
	_funcAny=[];
	
	_boxOffsetXY=[17,18];
	_xOffset=0;
	_yOffset=18;
	_moveAfter=true;
	_proceedAnimate=-1;
	// Set to anything more than 0
	_proceedAuto=0;
	
	_moneyBox=false;
	
	//
	//
	//
	
	//
	//
	//
	
	if (op.mode == "battle")
	{
		_box=[-1]; _x=[-2]; _y=[156+18+oMenuBattle.stackJump*14]; _xScale=[296];
		_yOffset=14; _moveAfter=false;
		
		if (op.continueOrders) { op.continueOrders=false; _func=function(){ continue_orders(); } }
		
		//
		
		if (oMenuBattle.mode == "talk")
		{
			_font=[fDotum]; _yOffset=20; _boxOffsetXY=[11,12];
			_x=[160]; _y=[120]; _xScale=[150]; _yScale=[36];
			_box=[1]; _arrow=[0];
		}
	}
	
	//
	//
	//
	
	if (op.mode == "shop")
	{
		_x=[0]; _y=[120]; _xScale=[320]; _yScale=[120];
		_box=[-1];
		
		_moveAfter=false;
		
		if (op.continueOrders) { _func=function(){ oMenuShop.dialogueDone=true; } }
	}
	
	//
}