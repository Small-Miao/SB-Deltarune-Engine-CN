//destroy menu and stop player from moving
if (op.mode == "overworld") { op.mode="cutscene"; }
with (oMenuOverworld) { endMenu=true; }



//declare keys & other things
reset_keys();
time=0;
surf=-1;



	//the struct
info=-1;

done=false;
proportional=false;
autoConfirm=false;



//struct info
dialogue=-1;

x_=-1;
y_=-1;
xScale=-1;
yScale=-1;

face=-1;
faceAnimate=-1; faceExtraImage=0;

font=-1;
voice=-1;
textSpeed=1;

hideBox=0;

box=-1;
arrow=-1;
color=-1; colorCount=0; colorOn=0; colorRepeat=0; colorDraw=c_white; colorDraw2=c_white; textAlpha=1;
jump=-1; jumpForce=false;

textOffsetXY=[17,18];



//shop Variables
shopSprite=-1;
asteriskFace=-1; asteriskCount=0;



//math info
line=-1; proceedLine=true; proceedAnimate=-1; proceedAuto=-1; proceedTime=0;
dialogueSplit=-1; currentAt=0; currentLength=0; edges=[];
currentAtL=0;

xOffset=0; yOffset=0; currentAtLetter=0; showText=""; currentLetter="";

addLetter=""; colorFirst=-1; colorMain=c_white; colorMain2=c_white; printSeed=[];
surfMult=1;



//special math functions
func_spaceAdd=function(_string,_mult=1)
{
	var _step=0;
	
	if (proportional)
	{
		return(string_width(_string)+info._xOffset*string_length(_string));
	}
	else
	{
		_step=variant_font(font);
		
		return((_step+info._xOffset)*_mult);
	}
}

	//Matches voices to the face being used
func_match=function()
{
	if (face != -1) { variant_face_match(face[0]); }
}

	//if set to false then the symbol below will not be automaticaly white
forceWhiteSymbols=true;

func_forceWhiteSymbols=function()
{
	if (forceWhiteSymbols)
	{
		var _check=variant_white_symbols();
		if (array_contains(_check,currentLetter)) { colorDraw=colorFirst; colorDraw2=colorFirst; }
	}
}

noVoice=variant_novoice_symbols();



//more math
setup=[]; setupCounter=0;
command=[]; commandCount=0; commandDid=[];

cutText=false; cutSpace=false; cutSpeed=true;

delay=0;



colorRandom=[]; repeat(10) { array_push(colorRandom,make_color_rgb(irandom_range(0,255),irandom_range(0,255),irandom_range(0,255))); }
colorRandomCounter=0;

currentFunc=0;



auto = -1;