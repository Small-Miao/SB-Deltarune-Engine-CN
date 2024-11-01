//when the room starts set (op.locationText) to a string in order to name the room when you save
//when the room starts set op.locationCC to the string of a cutscene struct if you want there to be a text box before you accses the save menu 

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