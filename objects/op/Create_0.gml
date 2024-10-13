variant_face();

//
//
//

//
//
//

//
//
//

showHitboxes=true;
debug=true;

//

noclip=false;

//
//
//

fileVer=1;
fileOn=0;

display_set_gui_size(320,240);
window_set_fullscreen(false); window_set_size(320*4,240*4); window_center();
instance_create_depth(0,0,0,oPlayerCol);

reset_keys(); time=0; ti=0;
seconds=0; minutes=0;
locationText="Skip"; locationCC=-1; locationCCcheck=false;

csvText=load_csv("DR text - Blad1.csv");
language=1;

option_volume=60;
option_simplifyVFX=false;
option_autoRun=false;
keybinds=[[0,vk_down],[0,vk_right],[0,vk_up],[0,vk_left],[1,"Z"],[1,"X"],[1,"C"]];
config_load();
audio_group_set_gain(audiogroup_default,op.option_volume/100,0);

fontHP=font_add_sprite_ext(sFontHP,"1234567890-",true,1);
fontDamage=font_add_sprite_ext(sFontDamage,"1234567890-+%",true,0);
fontGold=font_add_sprite_ext(sFontGold,"1234567890-+%/",true,0);

textFadeAlpha=0;

//
//
// Finished Variables
image_alpha=0; reset_keys(); reset_cursor(); cursor=-1;

boxImage=3; boxImageSpeed=0.1; stackFix=0;
battleSticks=[1,3,7]; battleRaise=[0,0,0]; hudY=0;
battleTime=0; forceTextWait=0;
retryBattleTimer=0; menuPrompt=[0,0,0,0];
inputWait=true; dogRandom=0; setFollowerNumb=-1;
shortcutDoorRoom=-1; quitTime=0; dodgeTimer=0;
soul4XY=[0,0];

une=0;
dead=false;
darkEntranceRoom=-1; darkEntranceX=[0,0,0]; darkEntrancFast=false;

promptCursor=0;
structAt=0;
previousRoom=-1;

//
//
//

transitionInfo=[];
overworldMenuSaveCursor=[0,0,0];

textCC=[]; funcCC=-1; faceCC=-1;
ccImage=0; ccLine=0;

fullJustItem=false; fullItem=false; fullWeapon=false; fullArmor=false;

// // // Variables
world="dark";
mode=0;
movement="overworld";

cameraMode="overworld"; camOffsetX=0; camOffsetY=0;
camShakeX=0; camShakeY=0; camShake=[0,0];
camMove=[0,0,0,0,0,0,0,0,0,0];
partyFollow=[0,1,2];

currentMusic=-1; pastMusic=-1;

//

partyOn=0;

//
//
//

// Data
declare_gamestats();

//
//
//

// Overworld
partyPos=[[0,0,"down",0,"overworld"]]; pastXY=[0,0];

playerX=x; playerY=y; playerSubimg=0; playerDirection="down"; walkSpeed=2; walkMult=1; runTimer=0; walkTimeOut=0; moving=false;
wallCounter=0; wallCheck=true;
forceRun=0;

checkpointProgress=[];

//
//
//

continueOrders=false;
isBoss=false;
endCC=-1;
dieSprite=-1;

battle_enemyTouchInfo=[];

battle_enemyString=[];
battle_enemy=[];
battle_enemyXY=[]; battle_partyXY=[]; battle_magicActions=[];
battle_enemyHP=[0,0,0]; battle_enemySpare=[0,0,0]; battle_enemyTired=[false,false,false];

battle_background=[false,false];
battle_music=-1;
battle_flavourText="A";
battle_seed=[];

menuPep=0;
save_partyXY=[];
gainMoney=0;

oldEnemyXY=[]; killedAny=false;

//
//
//

dodge=false;
dodge_applyShaders=true;
dodge_alpha=0;
dodge_hit=0;