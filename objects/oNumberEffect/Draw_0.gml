//the code here was coppied and modified from deltarune

if (delaytimer < delay)
{
    with (oNumberEffect)
        killtimer = 0
}
delaytimer += 1
if (delaytimer == delay)
{
    vspeed = (-5 - random(2))/2
    hspeed = 10/2
	//if (message_sprite != -1) { hspeed*=2; }
    vstart = vspeed
    //flip = 90
}
if (delaytimer >= delay)
{
    draw_set_color(color);
    draw_set_font(font);
	
    if (hspeed > 0)
        hspeed -= 1
    if (hspeed < 0)
        hspeed += 1
    if (abs(hspeed) < 1)
        hspeed = 0
    if (init == 0)
    {
        damagemessage = string(damage)
        if (font == op.fontGold)
            damagemessage = "+" + string(damage) + "%"
        init = 1
    }
    
	if (_message == 0)
    {
		draw_set_alpha(1 - kill)
	    draw_set_halign(fa_right)
	
	    draw_text_transformed((x + 30), y, damagemessage, (2 - stretch), (stretch + kill), 0)
	
	    draw_set_halign(fa_left)
	    draw_set_alpha(1) 
	}
	else
	{
		draw_sprite_ext(sMessageSprite, message_sprite, (x + 30), y, (2 - stretch), (stretch + kill), 0, draw_get_color(), (1 - kill))
	}
	
    if (bounces < 2)
        vspeed += 1/2
    if (y > ystart && bounces < 2 && killactive == 0)
    {
        y = ystart
        vspeed = vstart / 2
        bounces += 1
    }
    if (bounces >= 2 && killactive == 0)
    {
        vspeed = 0
        y = ystart
    }
    if (stretchgo == 1)
        stretch += 0.4
    if (stretch >= 1.2)
    {
        stretch = 1
        stretchgo = 0
    }
    killtimer += 1
    if (killtimer > 35)
        killactive = 1
    if (killactive == 1)
    {
        kill += 0.08
        y -= 4/2
    }
    if (kill > 1)
        instance_destroy()
}
