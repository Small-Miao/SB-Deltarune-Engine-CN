if (delay == 0)
{
	print(confirmText[0]+" # : "+confirmText[1],pos[0],pos[1],,,,,,,,,,,,seed,get_keybind(4,,,true));
	
	
	
	cancelColor = make_color_rgb(255,255-(exitTime/15)*255,255-(exitTime/15)*255);
	
	if (target == 0)
	{
		cancelColor = c_white;
		exitTime = 0;
	}
	
	print(cancelText[0]+" # : "+cancelText[1],pos[2],pos[3],,,,,,,cancelColor,,,,,seed,get_keybind(5,,,true));
	draw_ext(sTimer,(exitTime/15)*28,pos[2]+3+superStringWidth,pos[3]-3,,,,cancelColor,exitTime/2);
	
	
	
	print(menuText[0]+" # : "+menuText[1],pos[4],pos[5],,,,,,,,,,,,seed,get_keybind(6,,,true));
}