if (delay == 0)
{
	print(confirmText[0]+" ["+get_keybind(4)+"] : "+confirmText[1],pos[0],pos[1],,,,,,,,,,,,seed);
	
	
	
	cancelTextShow = cancelText[0]+" ["+get_keybind(5)+"] : "+cancelText[1];
	cancelColor = make_color_rgb(255,255-(exitTime/15)*255,255-(exitTime/15)*255);
	
	if (target == 0)
	{
		cancelColor = c_white;
		exitTime = 0;
	}
	
	print(cancelTextShow,pos[2],pos[3],,,,,,,cancelColor,,,,,seed);
	draw_ext(sTimer,(exitTime/15)*28,pos[2]+3+string_width(cancelTextShow),pos[3]-3,,,,cancelColor,exitTime/2);
	
	
	
	print(menuText[0]+" ["+get_keybind(6)+"] : "+menuText[1],pos[4],pos[5],,,,,,,,,,,,seed);
}