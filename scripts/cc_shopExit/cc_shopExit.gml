function cc_shopExit() : cc_base() constructor
{
	_dialogue=oMenuShop.sstr._textLeave;
	
	_voice=[oMenuShop.sstr._voice];
	
	_func=function()
	{
		op.mode="overworld"; op.playerDirection="down";
		with(instance_create_depth(op.playerX-400,op.playerY-400,0,oDoor)) { r=op.previousRoom; image_xscale=999; image_yscale=999; }
	}
}