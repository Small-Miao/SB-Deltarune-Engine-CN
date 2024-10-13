with (instance_create_depth(x,y+10,-y,oInteract))
{
	sprite_index=sSavepoint
	image_yscale=0.5;
	
	func=function()
	{
		sound(snd_heal);
		
		if (op.locationCC == -1)
		{
			instance_create_depth(0,0,-9999,oMenuSave);
		}
		else
		{
			op.locationCCcheck=true;
			start_cutscene(op.locationCC);
		}
	}
	
	draw=function()
	{
		draw_ext(sprite_index,image_index,x,y-10);
	}
}

instance_destroy();