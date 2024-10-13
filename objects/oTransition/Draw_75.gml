if (mode == "fade" or mode == "shortcut")
{
	draw_ext(sPixel,,,,320,240,,0,image_alpha);
}

if (mode == "darkExit")
{
	gpu_set_blendmode(bm_add);
	
	draw_ext(sPixel,,,,320,240,,make_color_rgb(i,i,i));
	
	gpu_set_blendmode(bm_normal);
}