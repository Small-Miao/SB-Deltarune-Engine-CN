//function an_kris_walk() { return([sKris_Up,sKris_Down,sKris_Left,sKris_Right,sKris_UpLight,sKris_DownLight,sKris_LeftLight,sKris_RightLight]); }
function an_kris_walk()
{
	if (!has_progress("has_jacket"))
	{
		return([sKris_Up,sKris_Down,sKris_Left,sKris_Right,sKris_UpLight,sKris_DownLight,sKris_LeftLight,sKris_RightLight]);
	}
	else
	{
		return([sKris_UpLight,sKris_DownLight,sKris_LeftLight,sKris_RightLight]);
	}
}

function an_susie_walk() { return([sSusie_Up,sSusie_Down,sSusie_Left,sSusie_Right,sSusie_UpLight,sSusie_DownLight,sSusie_LeftLight,sSusie_RightLight]); }

function an_ralsei_walk() { return([sRalsei_Up,sRalsei_Down,sRalsei_Left,sRalsei_Right]); }



function an_noelle_walk() { return([sNoelle_Up,sNoelle_Down,sNoelle_Left,sNoelle_Right]); }

function an_queen_walk() { return([sQueen_Up,sQueen_Down,sQueen_Left,sQueen_Right]); }

function an_lancer_walk() { return([sLancer_Up,sLancer_Down,sLancer_Left,sLancer_Right]); }



function draw_ene_test()
{
	//draw_ext(sPixel,0,x,y,10,10,,c_red);
}



function draw_ene_jevil()
{
	if (sprite_index == sEB_Idle)
	{ draw_ext(sJevil_Idle,op.time/3,x,y-3+dsin(op.time*5)*3); }
}