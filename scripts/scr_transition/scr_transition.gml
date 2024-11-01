//spawn transition
function transition(_mode="fade",_func=-1,_func2=-1)
{
	with (instance_create_depth(0,0,-9999,oTransition))
	{
		mode=_mode;
		
		func=_func;
		func2=_func2;
	}
}