//the code here was coppied and modified from deltarune

//spec = 0
delaytimer = 0
delay = 2
//active = 0
damage = round(random(600))
bounces = 0
type = -1
stretch = 0.2
stretchgo = 1
//lightf = merge_color(c_purple, c_white, 0.6)
//lightb = merge_color(c_aqua, c_white, 0.5)
//lightg = merge_color(c_lime, c_white, 0.5)
//lighty = merge_color(c_yellow, c_white, 0.3)
init = 0
kill = 0
killtimer = 0
killactive = 0
with (oNumberEffect)
{
    if (type != 3)
        killtimer = 0
}
//specialmessage = 0
//stayincamera = 1
//xx = 0
message_sprite = 0

type=5;



color=c_white;
font=-1;

_message=0;

depth=-12000;