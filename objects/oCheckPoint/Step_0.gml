if (op.showHitboxes) { image_alpha=1; }else{ image_alpha=0; }

if (place_meeting(x,y,oPlayerCol) and !array_contains(op.checkpointProgress,i))
{
	array_push(op.checkpointProgress,i);
	file_save("overworld");
}



if array_contains(op.checkpointProgress,i) { image_blend=c_gray; }else{ image_blend=c_white; }