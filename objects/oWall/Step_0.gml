if (op.showHitboxes and !forceHide) { image_alpha=1; }else{ image_alpha=0; }

if (func != -1) { func(); }



//destroy wall if hooked oChar is gone
if (charData != -1)
{
	charGone=true;
	
	with (oChar)
	{
		if (wallRandom == other.charData) { other.charGone=false; }
	}
	
	if (charGone) { instance_destroy(); }
}