if (op.mode == "battle") { instance_create_depth(x,y,-9999,oGraze); }

reset_keys();

image_xscale=0.5;
image_yscale=0.5;
depth=-(room_height+2000);

if (op.mode == "battle") { effect_fade(sHeartFade,0,x,y,0.5,0.25,,,,-9999,["expand1"]); }

startXY=[x,y];
targetXY=[0,0];

delay=10;
counter=0;

if (op.mode == "battle") { counter=delay; }



walkSpeed=2;

iframesMax=30;
iframes=0;

flash=1;
enemyNumb=0;
graze=0;

damage=-1;

mode="red";