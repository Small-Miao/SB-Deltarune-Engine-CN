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



//特殊数学函数
func_spaceAdd=function(_string,_mult=1)
{
	var _step=0;
	
	if (proportional)
	{
		return(string_width(_string)+info._xOffset*string_length(_string));
	}
	else
	{
		// 动态计算字符宽度，支持中英文混合
		var totalWidth = 0;
		var chineseFont = fCNFont;
		
		// 中文字符检测函数
		static isChineseChar = function(_char) {
			var code = ord(_char);
			return (code >= 0x4E00 && code <= 0x9FFF) ||  // 基本汉字
				   (code >= 0x3400 && code <= 0x4DBF) ||  // 扩展A
				   (code >= 0x20000 && code <= 0x2A6DF);  // 扩展B
		};
		
		// 计算每个字符的宽度
		for (var i = 1; i <= string_length(_string); i++) {
			var _char = string_char_at(_string, i);
			var isChinese = isChineseChar(_char);
			
			if (isChinese) {
				// 中文字符使用中文字体计算宽度
				draw_set_font(chineseFont);
				totalWidth += string_width(_char);
			} else {
				// 英文字符使用原字体计算宽度
				_step = variant_font(font);
				totalWidth += _step;
			}
		}
		
		return(totalWidth + info._xOffset * _mult);
	}
}

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