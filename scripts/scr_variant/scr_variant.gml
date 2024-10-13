function variant_face()
{
	// Faces exists
	enum FACE
	{
		SUSIE = 49,
		RALSEI = 47,
		RALSEIHAT = 48,
		LANCER = 46
	}
}

//

function variant_match(_face)
{
	// You can also set font's or any other value here:
	if (_face == FACE.SUSIE) { voice=txt_sus; }
	
	if (_face == FACE.RALSEI or _face == FACE.RALSEIHAT) { voice=txt_ral; }
		
	if (_face == FACE.LANCER) { voice=txt_lan; }
}

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