if (op.showHitboxes) { image_alpha=1; }else{ image_alpha=0; }

if (place_meeting(x,y,oPlayerCol))
{
	if (run) { op.forceRun=2; }
	if (hideParty) { op.dodge_hideParty=true; }
}