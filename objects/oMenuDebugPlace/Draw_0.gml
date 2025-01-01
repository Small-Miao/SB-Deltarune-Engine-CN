if key_cancel()
{
	draw_sprite_tiled_ext(sTile10,0,0,0,1,1,c_white,0.25);
}

draw_ext(sprite,op.time/5,mouseX,mouseY,1,1,,,,1/2+sin(op.ti/20)/2);