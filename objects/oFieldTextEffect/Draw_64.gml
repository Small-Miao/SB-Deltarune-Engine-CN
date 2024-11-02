if (!surface_exists(surf)) { surf=surface_create(320,240); }

surface_set_target(surf);

draw_ext(sNote,0,_x-1,_y,,,,make_color_rgb(17,31,151));
draw_ext(sNote,0,_x+1,_y,,,,make_color_rgb(17,31,151));
draw_ext(sNote,0,_x,_y-1,,,,make_color_rgb(17,31,151));
draw_ext(sNote,0,_x,_y+1,,,,make_color_rgb(17,31,151));

draw_ext(sNote,0,_x,_y);

print(text,_x+24,_y,fFeild,,,,,,,,,,,["bc4"]);

surface_reset_target();



draw_surface_ext(surf,x+offset,y,1,1,0,c_white,alpha);



++time;

if (time < 90)
{
	offset+=(0-offset)/5;
	alpha+=(1-alpha)/5;
}

if (time > 90)
{
	grav+=0.1;
	offset-=grav;
	alpha-=1/20;
}