//销毁菜单并阻止玩家移动
if (op.mode == "overworld") { op.mode="cutscene"; }
with (oMenuOverworld) { endMenu=true; }

//声明按键和其他内容
reset_keys();
time=0;
surf=-1;

//结构体
info=-1;
done=false;
proportional=false;
autoConfirm=false;

//结构体信息
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

//商店变量
shopSprite=-1;
asteriskFace=-1; asteriskCount=0;

//数学信息
line=-1; proceedLine=true; proceedAnimate=-1; proceedAuto=-1; proceedTime=0;
dialogueSplit=-1; currentAt=0; currentLength=0; edges=[];
currentAtL=0;
xOffset=0; yOffset=0; currentAtLetter=0; showText=""; currentLetter="";
addLetter=""; colorFirst=-1; colorMain=c_white; colorMain2=c_white; printSeed=[];
surfMult=1;

//text_typer集成 - 完全使用text_typer
text_typer_instance = noone;

//将声音与使用的头像匹配
func_match=function()
{
	if (face != -1) { variant_face_match(face[0]); }
}

//如果设置为false，则下面的符号不会自动变为白色
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

//更多数学
setup=[]; setupCounter=0;
command=[]; commandCount=0; commandDid=[];

cutText=false; cutSpace=false; cutSpeed=true;

delay=0;

colorRandom=[]; repeat(10) { array_push(colorRandom,make_color_rgb(irandom_range(0,255),irandom_range(0,255),irandom_range(0,255))); }
colorRandomCounter=0;

currentFunc=0;

//text_typer初始化函数
func_init_text_typer = function(_x,_y) {
	if (instance_exists(text_typer_instance)) {
		instance_destroy(text_typer_instance);
	}
	
	text_typer_instance = instance_create_depth(_x,_y, depth-1000, text_typer);
	text_typer_instance.text = dialogue;
	//text_typer_instance._speed = textSpeed;
	text_typer_instance._gui = true;
	text_typer_instance.voice = voice;
	text_typer_instance.font = font;
	text_typer_instance.scale_x = 1;
	text_typer_instance.scale_y = 1;
	text_typer_instance.skippable = true;
	text_typer_instance.instant = false;
	
	// 设置颜色
	text_typer_instance.color_text[0] = colorDraw;
	text_typer_instance.color_text[1] = colorDraw;
	text_typer_instance.color_text[2] = colorDraw;
	text_typer_instance.color_text[3] = colorDraw;
	
	// 设置阴影
	text_typer_instance.shadow = true;
	text_typer_instance.shadow_x = 0.5;
	text_typer_instance.shadow_y = 0.5;
	
	// 设置透明度
	text_typer_instance.alpha = textAlpha;
	text_typer_instance.alpha_text = textAlpha;
}