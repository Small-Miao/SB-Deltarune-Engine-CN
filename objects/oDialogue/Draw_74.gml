
if (line > -1 and array_length(info._dialogue) > 0 and hideBox == 0)
{
	//draw box
	if (box != -1)
	{
		//draw standard white or darkworld box
		if (box == 0) { draw_box(x_,y_,xScale,yScale); }
		
		//enable surface and draw bouble box
		if (box == 1)
		{
			if (!surface_exists(surf)) { surf=surface_create(320*4,240*4); }
			
			surface_set_target(surf);
			draw_clear_alpha(c_white,0);
			draw_ext(sBox,7,x_*2,y_*2,xScale/32,yScale/32);
			draw_ext(sBoxArrows,0+(array_length(edges) > 0),(x_*2)+xScale,(y_*2)+yScale/2,1,1);
		}
		
		//draw transparent box from Toriel car intro
		if (box == 2) { draw_ext(sBox,8,x_,y_,xScale/32,yScale/32); }
	}
	
	//reset values
	xOffset=0; if (face != -1) { xOffset+=58+58*(box == 1); }
	yOffset=0;
	
	currentAt=0;
	currentAtLetter=0;
	
	colorMain=colorFirst;
	colorCount=0;
	colorOn=0;
	colorRepeat=0;
	
	cutText=false;
	cutSpace=false;
	colorRandomCounter=0;
	
	asteriskCount=0;
	
	
	//draw bubble surface
	if surface_exists(surf) { surface_reset_target(); draw_surface_ext(surf,0,0,0.5,0.5,0,c_white,1); }
	
	if (face != -1)
	{
		//face adjust and stuff
		variant_face_offset();
		
		if (faceAnimate == -1) { faceExtraImage=0; }
		if (faceAnimate == 0) and !(time mod 8) { if (faceExtraImage == 0) { faceExtraImage=1; }else{ faceExtraImage=0; } }
		
		if (showText == dialogue) { faceExtraImage=0; }
		
		//draw face
		draw_ext(face[0],face[1]-1+faceExtraImage,x_+5.5+faceXY[0],y_+7+faceXY[1]);
	}
}



//draw money and inventory space
if (info._moneyBox)
{
	draw_box(172,94,265/2,121/2);
	print("$"+string(op.money),184,108);
	print("HELD SPACE: "+string(12-array_length(op.item)),184,121);
	res_i(); repeat(array_length(op.storage)) { if (op.storage[i] == -1) { ++i1; } ++i; }
	print("STORAGE SPACE: "+string(i1),184,134);
}