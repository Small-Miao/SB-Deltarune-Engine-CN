updatestruct_items(); updatestruct_party();

reset_keys();
reset_cursor(); cursor=op.overworldMenuSaveCursor[0];

op.mode="menuOverworld";

time=0;



endMenu=false;
introY=1;
top=true;
keybindWait=false;
keybindGlow=0;

op.menuPep=-1;



reactionText=["","",""];
reactionAlpha=[0,0,0];

reactionSet=function(_text)
{
	reactionText[op.overworldMenuSaveCursor[2]]=_text;
	reactionAlpha[op.overworldMenuSaveCursor[2]]=6;
}



drText=get_text("t_menuOverworld");
drTextSettings=get_text("t_menuOverworldSettings");
drTextBind=get_text("t_menuOverworldBind");