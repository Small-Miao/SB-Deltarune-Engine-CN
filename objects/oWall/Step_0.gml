if (op.showHitboxes and !forceHide) { image_alpha=1; }else{ image_alpha=0; }

if (func != -1) { func(); }



//char connection
if (charData != -1)
{
	charGone=true;
	
	with (oChar)
	{
		if (ranUne == other.charData)
		{
			other.charGone=false;
			other.x=x;
			other.y=y;
			other.sprite_index=sprite_index;
			other.image_index=image_index;
		}
	}
	
	if (charGone) { instance_destroy(); }
}