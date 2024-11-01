depth=-room_height;

//fade in battle start
if (op.mode == "battle")
{
	if (image_alpha < 1) { image_alpha+=1/15; }
}
else
{
	if (image_alpha > 0) { image_alpha-=1/15; }
	if (image_alpha <= 0) { instance_destroy(); }
}