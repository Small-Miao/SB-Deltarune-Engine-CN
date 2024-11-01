menu_room(); op.mode="shop";

time=0; sstr=-1; strText="";
reset_keys();
reset_cursor(); page="start"; sellType=0; sellArray=[]; offSetFill=[-1,-1,-1,-1,-1];
master_reset();

surf=-1; boxY=0;

checkOtherMenu=false;
items=[]; itemType=0;

spawnFlavour=true;
spawnThin=false; textThin=[];

talkChecks=[0,0,0,0];
while has_progress(string(talkChecks[0])+"="+string(talkChecks[talkChecks[0]])+"="+string(room)+"talk") { ++talkChecks[0]; }
while has_progress(string(talkChecks[1])+"="+string(talkChecks[talkChecks[1]])+"="+string(room)+"talk") { ++talkChecks[1]; }
while has_progress(string(talkChecks[2])+"="+string(talkChecks[talkChecks[2]])+"="+string(room)+"talk") { ++talkChecks[2]; }
while has_progress(string(talkChecks[3])+"="+string(talkChecks[talkChecks[3]])+"="+string(room)+"talk") { ++talkChecks[3]; }



dialogueDone=false;



sprite=sPixel; image=0;
nudge=0;



drText=get_text("t_menuShop");