form=0; key=false;

if (get != -1)
{
	struct(get);
	
	form=0;
	if (str._attack > 0 or str._defense > 0 or str._magic > 0) { form=2; }
	if (str._numberExistence != -1) { form=1; }
	if (str._isKeyitem) { form=0; key=true; }
}

if (money != -1) { form=3; get=money; }



//spawn oInteract in place of this object
with (instance_create_depth(x,y,-y,oInteract))
{
	res_i(); i1=[other.form,other.get,other.key];
	res_j(); j=string(op.une)+"="+string(room)+"chest"; ++op.une;
	
	func=function()
	{
		if (i1[2]) { i1[0]=0; }
		
		if (i1[0] == 3) { i3="$"+string(i1[1]); }else{ struct(i1[1]); i3=str._infoText[0]; }
		
		i2="* (You opened the treasure chest.) {delay:9} {jump} * (Inside was {color:yellow} "+i3+".)";
		
		if has_progress(j)
		{
			op.textCC=[["* (The chest is empty.)"],0,-1];
		}
		else
		{
			sound(snd_locker);
			
			op.textCC[0]=[i2]; /* Text */
			op.textCC[1]=string_length(i3); /* Color */
			/* func */
			if (i1[0] == 0) { if (!op.fullItem or i1[2]) { add_progress(j); } op.textCC[2]=function(){ add_item(i1[1],i1[2],true); } }
			if (i1[0] == 1) { if (!op.fullWeapon) { add_progress(j); } op.textCC[2]=function(){ add_weapon(i1[1],true); } }
			if (i1[0] == 2) { if (!op.fullArmor) { add_progress(j); } op.textCC[2]=function(){ add_armor(i1[1],true); } }
			if (i1[0] == 3) { add_progress(j); op.textCC[2]=function(){ add_money(i1[1],true); } }
		}
		
		start_cutscene("cc_itemChest");
	}
	
	draw=function()
	{
		if has_progress(j) { check=true; }
		draw_ext(sChest,0+check,x,y);
	}
}

instance_destroy();