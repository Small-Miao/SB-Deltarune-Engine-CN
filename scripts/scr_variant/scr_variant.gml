function variant_csv()
{
	op.csvText=load_csv("DR text.csv");
}

//
//
//

function variant_face()
{
	// Faces exists
	enum FACE
	{
		SUSIE = 50,
		RALSEI = 48,
		RALSEIHAT = 49,
		LANCER = 47
	}
}

function variant_face_match(_face)
{
	// You can also set font's or any other value here:
	if (_face == FACE.SUSIE) { voice=txt_sus; }
	
	if (_face == FACE.RALSEI or _face == FACE.RALSEIHAT) { voice=txt_ral; }
		
	if (_face == FACE.LANCER) { voice=txt_lan; }
}

function variant_face_offset()
{
	faceXY=[0,0];
	if (face[0] == FACE.SUSIE) { faceXY=[-5,-5]; }
		
	if (op.mode == "battle")
	{
		if (face[0] == FACE.RALSEI or face[0] == FACE.RALSEIHAT) { faceXY=[-5,-5]; }
	}
}

//
//
//

function variant_font(_font)
{
	// Declare font space
	if (_font == fDetermination) { return(8); }
	if (_font == fDotum) { return(9); }
}

//
//
//

function variant_recruits(_chapter)
{
	// Recruits background color
	var color=c_gray;
	
	if (_chapter == 1) { color=c_purple; }
	if (_chapter == 2) { color=c_aqua; }
	
	return(color);
}

//
//
//

function variant_shortcutdoor()
{
	// Set shortcut door options
	addPlace(rRoom6,"Gizmo Test");
	addPlace(rRoom7,"Music Test");
	addPlace(rPush,"Push");
	//addPlace(rRoom1,"Room 1");
}