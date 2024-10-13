if (op.showHitboxes) { image_alpha=1; }else{ image_alpha=0; }

if (whole) { x=0; y=0; image_xscale=9999; image_yscale=9999; image_alpha=0; }

if (place_meeting(x,y,oPlayerCol) and op.mode == "overworld" and op.movement == "overworld")
{
	if !(round(op.playerSubimg) mod 2) and (can and time == 0)
	{
		if is_array(s)
		{
			sound(s[count]);
			++count; if (count >= array_length(s)) { count=0; }
		}
		else
		{
			sound(s);
		}
		can=false;
		time=5;
	}
	if !(round(op.playerSubimg+1) mod 2) and (!can) { can=true; }
}

if (time > 0) { --time; }