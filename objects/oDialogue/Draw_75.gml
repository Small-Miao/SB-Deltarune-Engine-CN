if (line > -1 and array_length(info._dialogue) > 0 and hideBox == 0)
{
	if (box != -1)
	{
		if (box == 0) { draw_box(x_,y_,xScale,yScale); }
		if (box == 1)
		{
			if (!surface_exists(surf)) { surf=surface_create(320*4,240*4); }
			
			surface_set_target(surf);
			draw_clear_alpha(c_white,0);
			draw_ext(sBox,7,x_*2,y_*2,xScale/32,yScale/32);
			draw_ext(sBoxArrows,0+(array_length(edges) > 0),(x_*2)+xScale,(y_*2)+yScale/2,1,1);
		}
	}
	
	xOffset=0; if (face != -1) { xOffset+=58+58*(box == 1); } yOffset=0;
	currentAt=0; currentAtLetter=0;
	
	colorMain=colorFirst;
	colorCount=0; colorOn=0; colorRepeat=0;
	
	//
	
	cutText=false; cutSpace=false;
	colorRandomCounter=0;
	
	asteriskCount=0;
	
	repeat(string_length(showText))
	{
		++currentAtLetter;
		currentLetter=string_char_at(showText,currentAtLetter);
		
		if (currentLetter == "{") { cutText=true; cutSpace=false; command=[""]; commandCount=0; }
		
		//
		
		if !(cutText or cutSpace) and (currentLetter != "#")
		{ //
		
		if (colorRepeat == 0) { colorDraw=colorMain; colorDraw2=colorMain2; }else{ if (string_char_at(showText,currentAtLetter) != " ") { --colorRepeat; } } if (line < array_length(color)) { if (string_char_at(showText,currentAtLetter) != " " and colorOn < array_length(color[line])) { ++colorCount; if (color[line][colorOn][0] == colorCount) { colorRepeat=color[line][colorOn][1]-1; colorDraw=color[line][colorOn][2]; ++colorOn; } } }
		if (box == 1 or op.world == "light") { colorDraw2=colorDraw; }
		func_forceWhiteSymbols();
		
		//
		//
		//
		print(string_char_at(showText,currentAtLetter),info._boxOffsetXY[0]+xOffset+(x_*surfMult),info._boxOffsetXY[1]+yOffset+(y_*surfMult),font,,,,,,colorDraw2,colorDraw2,colorDraw,colorDraw,textAlpha,printSeed);
		//
		//
		//
		
		if (asteriskFace != -1)
		{
			if (string_char_at(showText,currentAtLetter) == "*" and asteriskCount < array_length(asteriskFace)) { if (asteriskFace[asteriskCount] != -1) { draw_ext(asteriskFace[asteriskCount],(showText != dialogue)*time/5,info._boxOffsetXY[0]+5,info._boxOffsetXY[1]+yOffset+(y_*surfMult)-6); } ++asteriskCount; }
		}
		
		xOffset+=func_spaceAdd(string_char_at(showText,currentAtLetter));
		
		} //
		
		//
		
		if (string_char_at(showText,currentAtLetter) == " ")
		{
			++currentAt;
			if array_contains(edges,currentAt)
			{
				xOffset=func_spaceAdd("* ",2);
				if (string_char_at(dialogue,1) != "*") { xOffset=0; }
				if (line < array_length(jump)) { if array_contains(jump[line],currentAt) { xOffset=0; } }
				if (face != -1) { xOffset+=58+58*(box == 1); }
				yOffset+=info._yOffset;
			}
		}
		
		//
		//
		// Command
		cutSpace=false;
		if (cutText and !(currentLetter == "{" or currentLetter == "}")) { if (currentLetter != ":") { command[commandCount]+=currentLetter; }else{ ++commandCount; array_push(command,""); } }
		if (currentLetter == "}" or currentLetter == "#")
		{
			//
			//
			//
			cutText=false; cutSpace=true;
			if (currentLetter == "#") { cutSpace=false; command=[]; setupCounter=0; repeat(array_length(setup)) { array_push(command,setup[setupCounter]); ++setupCounter; } }
			
			if (command[0] == "setup") { setup=[]; setupCounter=1; repeat(array_length(command)-1) { array_push(setup,command[setupCounter]); ++setupCounter; } }
			//
			
			if (command[0] == "color")
			{
				if (command[1] == "rng")
				{
					colorMain=colorRandom[colorRandomCounter]; ++colorRandomCounter; if (colorRandomCounter == array_length(colorRandom)) { colorRandomCounter=0; }
				}
				else
				{
					if (array_length(command) == 4) { colorMain=make_color_rgb(real(command[1]),real(command[2]),real(command[3])); }else{ colorMain=string_to_color(command[1]); }
				}
			}
			if (command[0] == "hex") { colorMain=hex_to_dec(command[1]); }
			
			if (command[0] == "jump") { xOffset=0; if (face != -1) { xOffset+=58+58*(box == 1); } }
			
			//
			//
			// Only once
			if !array_contains(commandDid,currentAtLetter)
			{
				array_push(commandDid,currentAtLetter);
				//
				if (command[0] == "func") { if (info._funcAny[currentFunc] != -1) { info._funcAny[currentFunc](); } currentFunc++; }
				
				if (command[0] == "delay") { delay=real(command[1]); }
			}
		}
	}
	
	//
	//
	//
	
	if surface_exists(surf) { surface_reset_target(); draw_surface_ext(surf,0,0,0.5,0.5,0,c_white,1); }
	
	if (face != -1)
	{
		// Face adjust and stuff
		
		faceXY=[0,0];
		if (face[0] == FACE.SUSIE) { faceXY=[-5,-5]; }
		
		if (op.mode == "battle")
		{
			if (face[0] == FACE.RALSEI or face[0] == FACE.RALSEIHAT) { faceXY=[-5,-5]; }
		}
		
		if (faceAnimate == -1) { faceExtraImage=0; }
		if (faceAnimate == 0) and !(time mod 8) { if (faceExtraImage == 0) { faceExtraImage=1; }else{ faceExtraImage=0; } }
		
		if (showText == dialogue) { faceExtraImage=0; }
		
		draw_ext(face[0],face[1]-1+faceExtraImage,x_+5.5+faceXY[0],y_+7+faceXY[1]);
	}
}

//
//
//

//
//
//

// Draw money box
if (info._moneyBox)
{
	draw_box(172,94,265/2,121/2);
	print("$"+string(op.money),184,108);
	print("HELD SPACE: "+string(12-array_length(op.item)),184,121);
	res_i(); repeat(array_length(op.storage)) { if (op.storage[i] == -1) { ++i1; } ++i; }
	print("STORAGE SPACE: "+string(i1),184,134);
}