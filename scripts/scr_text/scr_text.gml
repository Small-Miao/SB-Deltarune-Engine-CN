//在绘制事件中绘制比例文本
function print(_text="Skip",_x=0,_y=0,_font=fDetermination,_sep=12,_width=320,_xscale=1,_yscale=1,_angle=0,_c1=c_white,_c2=c_white,_c3=c_white,_c4=c_white,_alpha=1,_seed=[],_sprites=-1)
{	
    //正常数据
    superStringWidth = 0;
    
    var xOffset=0, yOffset=0;
    
    if (_font == fDetermination) { yOffset=-4; }
    if (_font == fMars) { yOffset=-1; }
    
    // 新增：中文字体定义
    var chineseFont = fCNFont;
    var chineseYOffset = -2;
    
    // 新增：中文字符检测函数
    static isChineseChar = function(_char) {
        var code = ord(_char);
        return (code >= 0x4E00 && code <= 0x9FFF) ||  // 基本汉字
               (code >= 0x3400 && code <= 0x4DBF) ||  // 扩展A
               (code >= 0x20000 && code <= 0x2A6DF);  // 扩展B
    };
    
    // 移除原语言切换逻辑，改为混合字体渲染
    draw_set_halign(fa_left);
    
    if array_contains(_seed,"fa_center") { draw_set_halign(fa_center); }
    if array_contains(_seed,"fa_right") { draw_set_halign(fa_right); }
    
    //绘制图像
    if (_sprites != -1)
    {
        if (string_length(_sprites) < 8)
        {
            _text = string_replace(_text,"#",_sprites);
        }
        else
        {
            var _splitImageData = string_split(_sprites,":");
            var _splitForImage = string_split(_text,"#");
            _text = string_replace(_text,"#","      ");
            
            // 动态计算图像位置，支持中英文混合
            var imageOffset = 0;
            var textWidth = 0;
            var chineseFont = fCNFont;
            
            // 计算图像前的文本宽度
            for (var i = 1; i <= string_length(_splitForImage[0]); i++) {
                var _char = string_char_at(_splitForImage[0], i);
                var isChinese = isChineseChar(_char);
                
                if (isChinese) {
                    draw_set_font(chineseFont);
                    imageOffset += string_width(_char);
                } else {
                    draw_set_font(_font);
                    imageOffset += string_width(_char);
                }
            }
            
            // 计算整个文本的宽度
            for (var i = 1; i <= string_length(_text); i++) {
                var _char = string_char_at(_text, i);
                var isChinese = isChineseChar(_char);
                
                if (isChinese) {
                    draw_set_font(chineseFont);
                    textWidth += string_width(_char);
                } else {
                    draw_set_font(_font);
                    textWidth += string_width(_char);
                }
            }
            
            draw_ext(asset_get_index(_splitImageData[0]),real(_splitImageData[1]),_x + imageOffset + (draw_get_halign() == fa_center) * (textWidth/-2) + (draw_get_halign() == fa_right) * (-textWidth),_y -2,,,,_c1);
        }
        
        // 计算超级字符串宽度
        superStringWidth = textWidth + (draw_get_halign() == fa_center) * (textWidth/-2) + (draw_get_halign() == fa_right) * (-textWidth);
    }
    
    //菜单模式
    if (array_contains(_seed,"menu") or array_contains(_seed,"menu_yellow"))
    {
        if (array_contains(_seed,page) and array_contains(_seed,cursor))
        {
            var soulOffset=0;
            // 动态计算菜单偏移，支持中英文混合
            var totalWidth = 0;
            var chineseFont = fCNFont;
            
            // 计算文本总宽度
            for (var i = 1; i <= string_length(_text); i++) {
                var _char = string_char_at(_text, i);
                var isChinese = isChineseChar(_char);
                
                if (isChinese) {
                    draw_set_font(chineseFont);
                    totalWidth += string_width(_char);
                } else {
                    draw_set_font(_font);
                    totalWidth += string_width(_char);
                }
            }
            
            if array_contains(_seed,"fa_right") { soulOffset=totalWidth; }
            if array_contains(_seed,"fa_center") { soulOffset=totalWidth/2; }
            
            if array_contains(_seed,"menu_yellow") { _c1=c_yellow; }
            if array_contains(_seed,"soul1") { draw_ext(sSoul,0,_x+xOffset-soulOffset-8.5,_y+yOffset+9,0.5,0.5); }
            if array_contains(_seed,"soul2") { draw_ext(sSoul,0,_x+xOffset-soulOffset-6,_y+yOffset+9,0.5,0.5); }
            if array_contains(_seed,"soul3") { draw_ext(sSoul2,0,_x+xOffset-soulOffset-7.5,_y+yOffset+9,0.5,0.5); }
            if array_contains(_seed,"soul4")
            {
                op.soul4XY[0]+=((_x+xOffset-soulOffset-5)-op.soul4XY[0])/2;
                op.soul4XY[1]+=((_y+yOffset+3.5)-op.soul4XY[1])/2;
            }
        }
    }
    
    //在战斗中当头像绘制在旁边时移动文本
    if array_contains(_seed,"partyHelp") { _x+=15*partyHelp; }
    
    //如果只有第一个颜色被修改，则将所有其他颜色设置为第一个颜色
    if (_c1 != c_white and _c2 == c_white and _c3 == c_white and _c4 == c_white) { 
        _c2=_c1; _c3=_c1; _c4=_c1; 
    }
    
    // 使用原字体绘制文本背景
    draw_set_font(_font);
    
    //绘制文本背景
    if array_contains(_seed,"bc1")
    {
        var _c1d=0, _c2d=0, _c3d=0, _c4d=0;
        if (_c1 == c_white and _c2 == c_white and _c3 == c_white and _c4 == c_white) { 
            _c1d=make_color_rgb(42*1.5,42*1.5,86); 
            _c2d=_c1d; 
            _c3d=make_color_rgb(0,0,128); 
            _c4d=_c3d; 
        } else { 
            _c1d=merge_colour(_c1,c_black,0.75); 
            _c2d=merge_colour(_c2,c_black,0.75); 
            _c3d=merge_colour(_c3,c_black,0.75); 
            _c4d=merge_colour(_c4,c_black,0.75); 
        }
        
        // 使用原字体绘制背景，支持换行符
        draw_set_font(_font);
        draw_text_ext_transformed_color(_x+xOffset+0.5,_y+yOffset+0.5,_text,_sep,_width,_xscale,_yscale,_angle,_c1d,_c2d,_c3d,_c4d,_alpha);
    }
    if array_contains(_seed,"bc2") { 
        draw_set_font(_font);
        draw_text_ext_transformed_color(_x+xOffset+1*_xscale,_y+yOffset+1*_yscale,_text,_sep,_width,_xscale,_yscale,_angle,0,0,0,0,_alpha); 
    }
    if array_contains(_seed,"bc3") { 
        _c1d=make_color_rgb(51,32,51); 
        draw_set_font(_font);
        draw_text_ext_transformed_color(_x+xOffset+1*_xscale,_y+yOffset+1*_yscale,_text,_sep,_width,_xscale,_yscale,_angle,_c1d,_c1d,_c1d,_c1d,_alpha); 
    }
    
    if array_contains(_seed,"bc4")
    {
        _c1d=make_color_rgb(17,31,151);
        draw_set_font(_font);
        draw_text_ext_transformed_color(_x+xOffset-1,_y+yOffset,_text,_sep,_width,_xscale,_yscale,_angle,_c1d,_c1d,_c1d,_c1d,_alpha);
        draw_text_ext_transformed_color(_x+xOffset+1,_y+yOffset,_text,_sep,_width,_xscale,_yscale,_angle,_c1d,_c1d,_c1d,_c1d,_alpha);
        draw_text_ext_transformed_color(_x+xOffset,_y+yOffset-1,_text,_sep,_width,_xscale,_yscale,_angle,_c1d,_c1d,_c1d,_c1d,_alpha);
        draw_text_ext_transformed_color(_x+xOffset,_y+yOffset+1,_text,_sep,_width,_xscale,_yscale,_angle,_c1d,_c1d,_c1d,_c1d,_alpha);
    }
    
    if array_contains(_seed,"bc5")
    {
        draw_set_font(_font);
        draw_text_ext_transformed_color(_x+xOffset-0.5,_y+yOffset,_text,_sep,_width,_xscale,_yscale,_angle,0,0,0,0,_alpha);
        draw_text_ext_transformed_color(_x+xOffset+0.5,_y+yOffset,_text,_sep,_width,_xscale,_yscale,_angle,0,0,0,0,_alpha);
        draw_text_ext_transformed_color(_x+xOffset,_y+yOffset-0.5,_text,_sep,_width,_xscale,_yscale,_angle,0,0,0,0,_alpha);
        draw_text_ext_transformed_color(_x+xOffset,_y+yOffset+0.5,_text,_sep,_width,_xscale,_yscale,_angle,0,0,0,0,_alpha);
        
        draw_text_ext_transformed_color(_x+xOffset+0.5,_y+yOffset+0.5,_text,_sep,_width,_xscale,_yscale,_angle,0,0,0,0,_alpha);
        draw_text_ext_transformed_color(_x+xOffset+0.5,_y+yOffset-0.5,_text,_sep,_width,_xscale,_yscale,_angle,0,0,0,0,_alpha);
        draw_text_ext_transformed_color(_x+xOffset-0.5,_y+yOffset+0.5,_text,_sep,_width,_xscale,_yscale,_angle,0,0,0,0,_alpha);
        draw_text_ext_transformed_color(_x+xOffset-0.5,_y+yOffset-0.5,_text,_sep,_width,_xscale,_yscale,_angle,0,0,0,0,_alpha);
    }
    
    //绘制淡入淡出效果
    if array_contains(_seed,"fade")
    {
        xOffset+=dcos(op.time*10)*0.5; 
        yOffset+=dsin(op.time*10)*0.5;
    }
    
    // =====================================================
    // 主文本绘制 - 混合字体渲染
    // =====================================================
    
    // 检查是否为单个字符（对话系统的情况）
    if (string_length(_text) == 1) {
        var _curchar = _text;
        var isChinese = isChineseChar(_curchar);
        
        // 确定当前字符的字体
        var charFont = isChinese ? chineseFont : _font;
        var charYOffset = isChinese ? chineseYOffset : yOffset;
        
        draw_set_font(charFont);
        
        // 直接绘制单个字符
        draw_text_transformed_color(
            _x + xOffset,
            _y + charYOffset,
            _curchar,
            _xscale,
            _yscale,
            _angle,
            _c1,
            _c2,
            _c3,
            _c4,
            _alpha
        );
    } else {
        // 多字符文本的混合字体渲染
        var totalWidth = 0;
        var charList = [];
        var charWidths = [];
        var charFonts = [];
        var charOffsets = [];
        var charPositions = []; // 新增：存储每个字符的位置信息
        
        // 1. 分析每个字符的字体和位置，处理换行符
        var currentLine = 0;
        var currentXInLine = 0;
        var lineHeight = _sep; // 使用_sep作为行高
        
        for (var i = 1; i <= string_length(_text); i++) {
            var _curchar = string_char_at(_text, i);
            
            // 检查是否为换行符
            if (_curchar == "\n") {
                // 换行符：移动到下一行
                currentLine++;
                currentXInLine = 0;
                
                // 存储换行符信息（宽度为0，但需要记录位置）
                charList[i-1] = _curchar;
                charWidths[i-1] = 0;
                charFonts[i-1] = _font; // 换行符使用默认字体
                charOffsets[i-1] = yOffset;
                charPositions[i-1] = [currentXInLine, currentLine * lineHeight];
                continue;
            }
            
            var isChinese = isChineseChar(_curchar);
            
            // 确定当前字符的字体
            var charFont = isChinese ? chineseFont : _font;
            var charYOffset = isChinese ? chineseYOffset : yOffset;
            
            // 获取字符宽度
            draw_set_font(charFont);
            var width = string_width(_curchar);
            
            // 对于中文字符，可能需要调整宽度计算
            if (isChinese) {
                // 中文字符的宽度可能需要特殊处理
                width = string_width(_curchar);
            }
            
            // 存储字符信息
            charList[i-1] = _curchar;
            charWidths[i-1] = width;
            charFonts[i-1] = charFont;
            charOffsets[i-1] = charYOffset;
            charPositions[i-1] = [currentXInLine, currentLine * lineHeight];
            
            // 更新当前行位置
            currentXInLine += width;
            totalWidth = max(totalWidth, currentXInLine);
        }
        
        // 2. 计算起始位置（考虑对齐）
        var startX = _x + xOffset;
        if (draw_get_halign() == fa_center) {
            startX -= totalWidth / 2;
        } else if (draw_get_halign() == fa_right) {
            startX -= totalWidth;
        }
        
        // 3. 绘制每个字符
        for (var i = 0; i < array_length(charList); i++) {
            var cur_char = charList[i];
            var charFont = charFonts[i];
            var charYOffset = charOffsets[i];
            var charWidth = charWidths[i];
            var charPos = charPositions[i];
            
            // 跳过换行符的绘制
            if (cur_char == "\n") {
                continue;
            }
            
            draw_set_font(charFont);
            
            // 绘制主字符
            draw_text_transformed_color(
                startX + charPos[0],
                _y + charYOffset + charPos[1],
                cur_char,
                _xscale,
                _yscale,
                _angle,
                _c1,
                _c2,  // 使用所有颜色参数
                _c3,
                _c4,
                _alpha
            );
        }
    }
    // =====================================================
    
    //绘制淡入淡出效果
    if array_contains(_seed,"fade")
    {
        var _fadeAlpha=0;
        xOffset-=dcos(op.time*10)*0.5; 
        yOffset-=dsin(op.time*10)*0.5;
        
        // 使用原字体绘制fade效果
        draw_set_font(_font);
        repeat(6)
        {
            draw_text_ext_transformed_color(
                _x+xOffset+(_fadeAlpha*2)+op.textFadeAlpha,
                _y+yOffset+(_fadeAlpha*2)+op.textFadeAlpha,
                _text,
                _sep,
                _width,
                _xscale,
                _yscale,
                _angle,
                _c1,
                _c2,
                _c3,
                _c4,
                (_alpha-((_fadeAlpha+op.textFadeAlpha/2)/6))/2
            );
            ++_fadeAlpha
        }
    }
    
    //绘制模糊文本
    if array_contains(_seed,"blur")
    { 
        var _blurAlpha=(0.3 + (sin(op.time / 14)) * 0.1) * 0.75;
        
        // 使用原字体绘制blur效果
        draw_set_font(_font);
        draw_text_ext_transformed_color((_x+xOffset + 1), _y+yOffset, _text,_sep,_width,_xscale,_yscale,_angle,_c1,_c2,_c3,_c4,_alpha*_blurAlpha);
        draw_text_ext_transformed_color((_x+xOffset - 1), _y+yOffset, _text,_sep,_width,_xscale,_yscale,_angle,_c1,_c2,_c3,_c4,_alpha*_blurAlpha);
        draw_text_ext_transformed_color(_x+xOffset, (_y+yOffset + 1), _text,_sep,_width,_xscale,_yscale,_angle,_c1,_c2,_c3,_c4,_alpha*_blurAlpha);
        draw_text_ext_transformed_color(_x+xOffset, (_y+yOffset - 1), _text,_sep,_width,_xscale,_yscale,_angle,_c1,_c2,_c3,_c4,_alpha*_blurAlpha);
        
        _blurAlpha=(0.08 + (sin(op.time / 14)) * 0.04) * 0.75;
        draw_text_ext_transformed_color((_x+xOffset + 1), (_y+yOffset + 1), _text,_sep,_width,_xscale,_yscale,_angle,_c1,_c2,_c3,_c4,_alpha*_blurAlpha);
        draw_text_ext_transformed_color((_x+xOffset - 1), (_y+yOffset - 1), _text,_sep,_width,_xscale,_yscale,_angle,_c1,_c2,_c3,_c4,_alpha*_blurAlpha);
        draw_text_ext_transformed_color((_x+xOffset - 1), (_y+yOffset + 1), _text,_sep,_width,_xscale,_yscale,_angle,_c1,_c2,_c3,_c4,_alpha*_blurAlpha);
        draw_text_ext_transformed_color((_x+xOffset + 1), (_y+yOffset - 1), _text,_sep,_width,_xscale,_yscale,_angle,_c1,_c2,_c3,_c4,_alpha*_blurAlpha);
        draw_set_alpha(1);
    }
}



//生成所有类型的对话框和过场动画
function start_cutscene(_struct_text,_forceTextWait=0,_continueOrders=false)
{
	//使你在指定的帧数内无法按确认键继续
	op.forceTextWait=_forceTextWait;
	//在战斗中如果为真，对话结束后将使下一个选定的玩家动作发生
	op.continueOrders=_continueOrders;
	
	
	
	//生成oDialogue对象
	with (instance_create_depth(0,0,-9999,oDialogue))
	{
		struct(_struct_text);
		info=str;
	}
	
	
	
	//特殊精灵更新修复
	if (op.resetPartyPosTimer > 0) {  }
}

//不要为新的过场动画创建新的结构体，直接在代码中完成
function anything_cutscene(_dialogue=["Test"],_func=-1,_face=[-1])
{
	op.textCC = _dialogue;
	
	op.funcCC = _func;
	
	op.faceCC = _face;
	
	start_cutscene("cc_anything");
}



//从csv文档返回一个数组
function get_text(_realText){
	var i=0, array=[];
	
	while (op.csvText[# 0,i] != _realText) { i++; }
	array_push(array,op.csvText[# op.language,i]); i++;
	
	while (op.csvText[# 0,i] == "" and op.csvText[# op.language,i] != "") { array_push(array,op.csvText[# op.language,i]); i++; }
	return (array);
}

//从csv文档返回单个字符串
function get_text_string(_realText){
	var i=0;
	while (op.csvText[# 0,i] != _realText) { i++; }
	
	return op.csvText[# op.language,i];
}