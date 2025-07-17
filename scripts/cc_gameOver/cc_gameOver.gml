//game over scene
function cc_gameOver() : cc_base() constructor
{
	_dialogue=["这不是你的命运!","请, {jump} {delay:60}不要放弃"];
	
	_x=[74]; _y=[154];
	_xScale=[190,230];
	_boxOffsetXY=[0,0];
	_box=[-1];
	_printSeed=[[]];
	_xOffset=4; _yOffset=20;
	_voice=[-1];
	_textSpeed=[3];
	_moveAfter=false;
	
	_func=function()
	{
		oMenuGameOver.page="sel";
		instance_destroy(oSoulBreakEffect);
	}
}