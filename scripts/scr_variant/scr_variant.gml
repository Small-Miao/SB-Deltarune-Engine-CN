//加载包含的csv文档
function variant_csv()
{
	op.csvText=load_csv("DR text.csv");
	
	// 检查CSV文件是否成功加载
	if (op.csvText == -1) {
		// 如果CSV加载失败，创建一个空的默认ds_grid
		op.csvText = ds_grid_create(1, 1);
		ds_grid_set(op.csvText, 0, 0, "");
		return;
	}
	
	// 处理CSV中的换行符，将 \\n 转换为实际的换行符
	var rows = ds_grid_height(op.csvText);
	var cols = ds_grid_width(op.csvText);
	
	for (var row = 0; row < rows; row++) {
		for (var col = 0; col < cols; col++) {
			var cellValue = ds_grid_get(op.csvText, col, row);
			if (cellValue != "") {
				// 将 \\n 替换为实际的换行符 \n
				ds_grid_set(op.csvText, col, row, string_replace(cellValue, "\\n", "\n"));
			}
		}
	}
}



//根据当前使用的头像自动设置语音
function variant_face_match(_face)
{
	//你也可以设置字体或任何其他值
	if (_face == sFace_Susie) { voice=txt_sus; }
	
	if (_face == sFace_Ralsei or _face == sFace_RalseiHat) { voice=txt_ral; }
		
	if (_face == sFace_Lancer) { voice=txt_lan; }
}

//你可以在这里偏移对话头像，如果需要的话也可以在战斗中永久偏移
function variant_face_offset()
{
	faceXY=[0,0];
	if (face[0] == sFace_Susie) { faceXY=[-5,-5]; }
		
	if (op.mode == "battle")
	{
		if (face[0] == sFace_Ralsei or face[0] == sFace_RalseiHat) { faceXY=[-5,-5]; }
	}
}

//如果你使用颜色命令{color:yellow}，这些符号仍将是白色
function variant_white_symbols()
{
	return ["*",".",",",":",";","(",")","[","]","!","?"];
}

//在对话期间这些符号不会播放声音效果
function variant_novoice_symbols()
{
	return [" ","^","!",".","?",",",":","/","\\","|","*"];
}

//设置字体在对话框中使用时的等宽宽度。
function variant_font(_font)
{
	if (_font == fDetermination) { return(8); }
	if (_font == fDotum) { return(9); }
}



//决定招募背景颜色
function variant_recruits(_chapter)
{
	
	var color=c_gray;
	
	if (_chapter == 1) { color=c_purple; }
	if (_chapter == 2) { color=c_aqua; }
	
	return(color);
}



//战斗头像偏移（为什么这个存在toby 为什么???????????????????????????）
function variant_fightheads()
{
	//j是numberExistence
	
	if (j == 0) { j1=[0,0]; } //Kris
	if (j == 1) { j1=[-2,-1]; } //Susie
	if (j == 2) { j1=[-6,-3]; } //Ralsei
}



//设置快捷门选项
function variant_shortcutdoor()
{
	addPlace(rRoom6,"Gizmo Test");
	addPlace(rRoom7,"Music Test");
	addPlace(rPush,"Push");
}