updatestruct_items(); updatestruct_party();

reset_keys();
reset_cursor(); page="start"; cursor=op.overworldMenuSaveCursor[0];
master_reset();

op.mode="menuOverworldLight";

time=0;

//

sound(snd_menumove);

//
//
//

drText=get_text("t_menuOverworldLight");