// intro / outro

if (counter > 0)
{
	if (counter == delay)
	{
		startXY=[x,y];
		if (oMenuBattle.exists_box) { targetXY=[oBattleBox.x,oBattleBox.y]; }else{ targetXY=[(op.x),(op.y)]; }
		if (oMenuBattle.timer == 0) { targetXY=[char(0).x,char(0).y-15]; instance_destroy(oGraze); }
	}
	
	x+=(targetXY[0]-startXY[0])/delay;
	y+=(targetXY[1]-startXY[1])/delay;
	--counter;
	
	if (counter == 0)
	{
		if (oMenuBattle.timer <= 0) { effect_fade(sHeartFade,0,x,y,0.5,0.25,,,,-9999,["expand1"]); instance_destroy(); }
	}
}

//
//
// damage

if (iframes == iframesMax)
{
	res_i(); i1=true;
	
	if (op.mode == "battle")
	{
		if (oMenuBattle.target != "all")
		{
			if (op.mode == "battle") { if (oMenuBattle.target != -1) { i=oMenuBattle.target; i1=false; } }
			if (op.hp[i] < 1) { res_i(); i1=true; }
	
			while(op.hp[i] < 1 or i1) { i1=false; i=irandom_range(0,array_length(op.party)-1); }
		}
		if (damage == -1) { damage=op.battle_enemy[enemyNumb]._attack*5; }
	}
	
	i2=clamp(array_length(op.party)/2,1,999); i3=false;
	if (op.mode == "battle") { if (oMenuBattle.target == "all") { i3=true; } }else{ i2=1; }
	
	if (op.mode != "battle") or (i3)
	{
		i=0;
		repeat(array_length(op.party)) { party_damage(i,round(damage/i2)); ++i; }
	}
	else
	{
		party_damage(i,damage);
	}
}
if (iframes > 0) { --iframes; if !(iframes mod 5) { flash*=-1; } }
if (iframes == 0) { flash=1; }
if (flash == 1) { image_blend=c_white; }else{ image_blend=c_gray; }

//
//
//

if (op.mode == "battle") { if (counter == 0 and oMenuBattle.timer > 0)
{
//

use_keys(false);

if (mode == "red")
{
	image_index=0;
	
	walkSpeed=2;
	if key_cancel() { walkSpeed/=2; }

	if key_up() { y-=walkSpeed; }
	if key_down() { y+=walkSpeed; }
	if key_left() { x-=walkSpeed; }
	if key_right() { x+=walkSpeed; }
}


if (oMenuBattle.exists_box)
{
	x=clamp(x,(oBattleBox.x-oMenuBattle.boxScaleXY[0]/2)+6,(oBattleBox.x+oMenuBattle.boxScaleXY[0]/2)-6);
	y=clamp(y,(oBattleBox.y-oMenuBattle.boxScaleXY[1]/2)+6,(oBattleBox.y+oMenuBattle.boxScaleXY[1]/2)-6);
}
else
{
	x=clamp(x,op.x-160+5,op.x+160-5);
	y=clamp(y,op.y-120+5,op.y+120-5);
}
oGraze.x=x; oGraze.y=y;



//
} }

//
//
//

if (op.mode == "overworld")
{
	x=op.playerX; y=op.playerY-op.party[0]._soulOffset; image_alpha=op.dodge_alpha*0.8;
}