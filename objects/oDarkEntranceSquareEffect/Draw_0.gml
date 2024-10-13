++time;
if (time > 22-op.darkEntrancFast*11 and image_alpha < 1) { image_alpha+=0.1+op.darkEntrancFast*0.1; }

draw_ext(sDarkSquare,0,x,y,image_xscale,image_yscale,image_angle,,1);
draw_ext(sDarkSquare,0,x,y,image_xscale,image_yscale,image_angle,0,image_alpha);

image_xscale+=(0.25+0.25/2)+op.darkEntrancFast*(0.25+0.25/2);
image_yscale+=(0.25+0.25/2)+op.darkEntrancFast*(0.25+0.25/2);
image_angle+=(0.1)+op.darkEntrancFast*0.1;