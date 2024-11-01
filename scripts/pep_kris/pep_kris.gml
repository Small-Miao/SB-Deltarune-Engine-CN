function pep_kris() : pep_base() constructor
{
	_infoText=["Kris","Tactician\nCommands the party\nby ACTs. Sometimes."];
	
	
	
	_numberExistence=0;
	
	_attributeText=[-1,-1];
	_attributeImage=[0,0];
	_attributeValue=[0,0];
	_attributeSymbols=[0,0];
	
	_seed=["act"];
	
	
	
	_UIcolor=make_color_rgb(0,255,255);
	_UIface=sKris_Face;
	
	_buttons=[0,1,2,3,4];
	
	_damageColor=merge_color(c_aqua,c_white,0.5);
	
	
	
	_drawPower=function()
	{
		if (op.dogRandom >= 97)
		{
			draw_ext(sPixel,0,50,156.5,90,12,,0);
			draw_ext(sDogSleeping,(-op.time)/30,110,155);
			print("Dog:",50,156.5);
		}
	}
}