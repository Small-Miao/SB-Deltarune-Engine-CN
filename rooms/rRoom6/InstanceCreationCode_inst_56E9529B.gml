func=function()
{
	with(instance_create_depth(0,0,-9999,oMenuWriter))
	{
		funcBack=function(){ op.mode="overworld"; }
		funcEnd=function(){ op.mode="overworld"; op.name_=type; }
	}
}