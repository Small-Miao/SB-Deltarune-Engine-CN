updatestruct_items(); updatestruct_party();

reset_keys();
reset_cursor(); page="start"; cursor=op.overworldMenuSaveCursor[0];
master_reset();

sound(snd_menumove);

time=0;

op.mode="menuOverworldLight";



drText=get_text("t_menuOverworldLight");