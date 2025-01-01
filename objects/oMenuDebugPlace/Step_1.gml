use_keys();

if key_cancel()
{
	mouseX=round((0+mouse_x)/10)*10;
	mouseY=round((5+mouse_y)/10)*10;
}
else
{
	mouseX=mouse_x;
	mouseY=mouse_y;
}

depth=-mouseY;


if (op.mode != "overworld") { instance_destroy(); }



if tap_confirm()
{
	text=clipboard_get_text();
	
	sprite=asset_get_index(text);
}



if mouse_check_button_pressed(mb_left)
{
	with (instance_create_depth(mouseX,mouseY,-mouseY,oNothing))
	{
		sprite_index=other.sprite;
		image_index=0;
		image_speed=1;
		
		func=function()
		{
			draw_self();
			print("["+string(x)+","+string(y)+"]",x,y+2,fDotum,,,0.5,0.5,,,,,,,["bc2","fa_center"]);
		}
	}
}