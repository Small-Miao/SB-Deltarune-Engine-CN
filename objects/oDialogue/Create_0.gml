if (op.mode == "overworld") { op.mode="cutscene"; }
with (oMenuOverworld) { endMenu=true; }

time=0;
reset_keys();

info=-1; done=false;
proportional=false;

autoConfirm=false;

surf=-1;

//

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

shopSprite=-1;
asteriskFace=-1; asteriskCount=0;

//

line=-1; proceedLine=true; proceedAnimate=-1; proceedAuto=-1; proceedTime=0;
dialogueSplit=-1; currentAt=0; currentLength=0; edges=[];
currentAtL=0;

xOffset=0; yOffset=0; currentAtLetter=0; showText=""; currentLetter="";

addLetter=""; colorFirst=-1; colorMain=c_white; colorMain2=c_white; printSeed=[];
surfMult=1; textOffsetXY=[17,18];

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

func_match=function()
{
	if (face != -1) { variant_match(face[0]); }
}

forceWhiteSymbols=true;
func_forceWhiteSymbols=function()
{
	if (forceWhiteSymbols)
	{
		var _check=["*",".",",",":",";","(",")","[","]","!","?"];
		if (array_contains(_check,currentLetter)) { colorDraw=colorFirst; colorDraw2=colorFirst; }
	}
}

noVoice=[" ","^","!",".","?",",",":","/","\\","|","*"];

//
//
//

setup=[]; setupCounter=0;
command=[]; commandCount=0; commandDid=[];

cutText=false; cutSpace=false; cutSpeed=true;

delay=0;

//

colorRandom=[]; repeat(10) { array_push(colorRandom,make_color_rgb(irandom_range(0,255),irandom_range(0,255),irandom_range(0,255))); }
colorRandomCounter=0;

currentFunc=0;