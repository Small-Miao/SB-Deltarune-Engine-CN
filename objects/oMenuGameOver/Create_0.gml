time=0;

op.dodge_hit=0; op.hudY=125;
op.mode="dead";

reset_keys();
reset_cursor();
master_reset();

XY=[oSoul.x-op.x,oSoul.y-op.y];
alpha=[0,0];

soulXY=[160,190];

moveSoul=function(_x,_y)
{
	soulXY[0]+=(_x-soulXY[0])/3;
	soulXY[1]+=(_y-soulXY[1])/3;
}

stop=false;
stopAlpha=0;

//
//
//

drText=get_text("t_menuGameOver");