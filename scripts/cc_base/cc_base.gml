//声明对话和过场动画的值
function cc_base() constructor
{
	/*
	从csv文档获取文本（该函数返回一个数组）
	查看此链接：
		https://docs.google.com/spreadsheets/d/1hj0DLNNkepahaFvXPdy9alGS68qjq8zwKMC-3khYpx0/edit?usp=sharing
	并在最左侧查找名为 "t_bakesale" 的realText
	*/
	
	
	
	_dialogue=get_text("t_bakesale");
	
	_x=[12];
	if (op.y < op.playerY-20) { _y=[1]; }else{ _y=[156]; }
	_xScale=[296.5];
	_yScale=[83.5];
	
	//[[FACE.SUSIE,1],-1,[FACE.RALSEI,5]]
	_face=[-1];
	//(0 == 前后切换)
	_faceAnimate=[-1];
	
	_font=[fDetermination];
	_voice=[txt_text];
	_textSpeed=[1];
	
	//暂停所有内容并在指定时间内隐藏对话框
	_hideBox=[0];
	
	_seed=[];
	
	//如果为真，当使用Susie的头像时会自动使用Susie的声音，对其他角色也是如此。
	//(在对象oDialogue的create事件底部声明此变量)
	_match=true;
	
	
	//(-1 == 无对话框) // (0 == 世界地图对话框) // (1 == 战斗文本气泡)
	_box=[0];
	//(0 == 右侧) // (1 == 左侧)
	_arrow=[-1];
	
	//[[[ 已过时，保留 ]]]
	_color=[];
	_jump=[];
	
	
	
	_shopSprite=[-1];
	//[[sprite1,sprite2,sprite3],-1,[sprite1,sprite3]]
	_asteriskFace=[-1];
	
	//[["aaa"],["bbb"],["ccc"]]
	_printSeed=-1;
	//对话结束时执行。
	_func=-1;
	if (op.locationCCcheck) { _func=function(){ op.locationCCcheck=false; op.locationCC=-1; instance_create_depth(0,0,-9999,oMenuSave); } }
	//每次新行开始时执行。
	_funcLine=[];
	//使用{func}命令执行，每次使用命令时移动到下一个函数。
	_funcAny=[];
	
	_boxOffsetXY=[17,18];
	//增加到等宽字体宽度
	_xOffset=0;
	//空间不足时跳转的距离
	_yOffset=18;
	//如果为真，场景结束后玩家可以移动
	_moveAfter=true;
	//转到下一行的样式。可以设置为(-1或"fade")
	_proceedAnimate=-1;
	//设置为大于0的任何值（这是为了在几帧后自动按确认键的随机遭遇）
	_proceedAuto=0;
	//设置为大于-1的任何值以在行打印完成后自动按确认键（它会等待你替换-1的帧数）
	_autoSkipText=[-1];
	//将绘制你有多少钱和物品栏空间
	_moneyBox=false;
	
	
	
	
	
	
	//在战斗中时更改基础值
	if (op.mode == "battle")
	{
		_box=[-1];
		_x=[-2];
		_y=[156+18+op.stackFix*14];
		_xScale=[296];
		
		if (oMenuBattle.stackJump != 0) { ++op.stackFix; }
		
		_yOffset=14;
		_moveAfter=false;
		
		if (op.continueOrders) { op.continueOrders=false; _func=function(){ continue_orders(); } }
		
		
		
		if (oMenuBattle.mode == "talk")
		{
			_font=[fDotum]; _yOffset=20; _boxOffsetXY=[11,12];
			_x=[160]; _y=[120]; _xScale=[150]; _yScale=[36];
			_box=[1]; _arrow=[0];
		}
	}
	
	
	
	
	
	
	//在商店中时更改基础值
	if (op.mode == "shop")
	{
		_x=[0];
		_y=[120];
		_xScale=[320];
		_yScale=[120];
		_box=[-1];
		
		_moveAfter=false;
		
		if (op.continueOrders) { _func=function(){ oMenuShop.dialogueDone=true; } }
	}
}