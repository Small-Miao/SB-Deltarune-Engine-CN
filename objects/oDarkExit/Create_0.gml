//set r to what room you want this to take you to
//set targetXY to where in the next room you want to put the player
//func will be run when you step into the light

r=room;
targetXY=[100,100];
func=-1;



res_i(); res_j();

image_alpha=1; depth=-(y);

check=true;
length=0;

timer=0;
grav=1;

isFloor=false;
time=0;



//uncomment to make ralsei move up and wave every time

/*
func=function()
{
	if (array_length(op.party) > 2)
	{
		if (op.party[2]._isDarkner)
		{
			char_animate(2,20,1,,,160,60);
			char_animate(2,1,1,sRalsei_WaveWind,,,,,,["subnumber"]);
			char_animate(2,1,1,sRalsei_Wave,,,,,,["autooff"]);
		}
	}
}
*/