fileVer = 2;
load = true;

mainMenuRoom = rMainMenu;


//调试变量
showHitboxes=false;
debug=false;

noclip=false;

//将使保存菜单和其他相关内容看起来像第一章中的样子
chapter1style=false;



//设置，从精灵创建字体，世界时间和语言
//你当前在哪个文件上 (0, 1 或 2)
fileOn=0;

display_set_gui_size(320,240);
window_set_fullscreen(false); window_set_size(320*4,240*4); window_center();
instance_create_depth(0,0,0,oPlayerCol);

reset_keys(); time=0; ti=0;
seconds=0; minutes=0;

variant_csv();
	//从csv文件中获取文本的行
language=3;

option_volume=60;
option_simplifyVFX=false;
option_autoRun=false;
keybinds=[[0,vk_down],[0,vk_right],[0,vk_up],[0,vk_left],[1,"Z"],[1,"X"],[1,"C"]];
gamepadBinds = [gp_padd,gp_padr,gp_padu,gp_padl,gp_face1,gp_face2,gp_face4];
config_load();
audio_group_set_gain(audiogroup_default,op.option_volume/100,0);

fontHP=font_add_sprite_ext(sFontHP,"1234567890-",true,1);
fontDamage=font_add_sprite_ext(sFontDamage,"1234567890-+%",true,0);
fontGold=font_add_sprite_ext(sFontGold,"1234567890-+%/",true,0);

textFadeAlpha=0;



//完成的变量（你不必使用或设置这些）
image_alpha=0; reset_keys(); reset_cursor(); cursor=-1;

#region

boxImage=3; boxImageSpeed=0.1; stackFix=0;
battleSticks=[1,3,7]; battleRaise=[0,0,0]; hudY=0;
battleTime=0; forceTextWait=0;
retryBattleTimer=0; menuPrompt=[0,0,0,0];
inputWait=true; dogRandom=0; setFollowerNumb=-1;
shortcutDoorRoom=-1; quitTime=0; dodgeTimer=0;
fountainON=false;
soul4XY=[0,0];
dieSprite=-1;
forceNotMove=false; canMoveAfter=true;
resetPartyPosTimer=0;
partyGuaranteeFunc=-1;

une=0;
dead=false;
darkEntranceRoom=-1; darkEntranceX=[0,0,0]; darkEntrancFast=false;
debugSave=[0,0,0];

promptCursor=0;
structAt=0;
previousRoom=-1;

#endregion



//special variables
transitionInfo=[];
overworldMenuSaveCursor=[0,0,0];

	//you can set these variables and then run start_cutscene("cc_anything"); if you just want some small dialouge and not a whole cutscene
	//check the cc_anything struct for more info
textCC=[];
funcCC=-1;
faceCC=-1;

ccImage=0; ccLine=0;

	//is automaticaly set to true if the corresponding inventory is full
fullJustItem=false;
fullItem=false;
fullWeapon=false;
fullArmor=false;

	//这个变量（通常应该）自动设置为你在任何场景中选择的队员
partyOn=0;



//控制变量
world="dark";
mode=0;
movement="overworld";

//查看脚本类别scr_camera了解相机控制
cameraMode="overworld"; camOffsetX=0; camOffsetY=0;
camShakeX=0;
camShakeY=0;
camShake=[0,0];
camMove=[0,0,0,0,0,0,0,0,0,0];

	//有控制音乐和声音的自定义音频函数。查看脚本类别scr_sound
currentMusic=-1;
pastMusic=-1;

	//在oCreate对象中，无论你设置什么文本都将是
locationText="Skip";
locationCC=-1;
locationCCcheck=false;



//声明和重置数据
declare_gamestats();



//世界地图
partyPos=[[0,0,"down",0,"overworld"]]; pastXY=[0,0];

playerX=x;
playerY=y;
playerSubimg=0;
playerDirection="down";

walkSpeed=2;
walkMult=1;
runTimer=0;
walkTimeOut=0;
moving=false;

wallCounter=0;
wallCheck=true;

forceRun=0;

checkpointProgress=[];



//战斗变量
continueOrders=false;
isBoss=false;
endCC=-1;

battle_enemyTouchInfo=[];

battle_enemyString=[];
battle_enemy=[];

battle_enemyXY=[];
battle_partyXY=[];

battle_magicActions=[];

battle_enemyHP=[0,0,0];
battle_enemySpare=[0,0,0];
battle_enemyTired=[false,false,false];

battle_background=[false,false];
battle_music=-1;
battle_flavourText="A";
battle_seed=[];

battle_tpMult = 1;

battle_enemysLeft=0;

menuPep=0;
save_partyXY=[];
gainMoney=0;

	//任何战斗开始时设置为false。当你在战斗中杀死至少一个敌人时设置为true。（对boss无效）
killedAny=false;

oldEnemyXY=[];



//世界地图闪避变量
dodge=false;
dodge_applyShaders=true;
dodge_alpha=0; dodge_hideParty=false;
dodge_hit=0;

//额外
slopesAmount = 0; slopeTouch = 0;