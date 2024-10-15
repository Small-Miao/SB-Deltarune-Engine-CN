draw_ext(sPixel,0,0,0,320,240,,0);



if (!surface_exists(surf)) { surf=surface_create(100*2,140*2); }

surface_set_target(surf);



draw_clear_alpha(c_white,0);

draw_ext(sFountain,2,100,280-upY*2,2,2,,0);
draw_ext(sFountain,2,100,280+280-upY*2,2,2,,0);

gpu_set_colorwriteenable(1,1,1,0);

draw_sprite_tiled_ext(sFountainMask,0,-time,-time,2,2,merge_color(c_white,c_black,showFountain),1);
draw_sprite_tiled_ext(sFountainMask,0,time,time,2,2,merge_color(c_white,c_black,showFountain),0.5);

gpu_set_colorwriteenable(1,1,1,1);



surface_reset_target();



draw_surface_ext(surf,110,0,0.5,0.5,0,color,1);

draw_ext(sFountain,1,160,140-upY,,,,color);
draw_ext(sFountain,1,160,280-upY,,,,color);

draw_ext(sFountain,1,160+dsin(time*4)*6,140-upY,,,,color,0.5);
draw_ext(sFountain,1,160+dsin(time*4)*6,280-upY,,,,color,0.5);

draw_ext(sFountain,1,160-dsin(time*4)*6,140-upY,,,,color,0.5);
draw_ext(sFountain,1,160-dsin(time*4)*6,280-upY,,,,color,0.5);

draw_ext(sFountain,2,160,140-upY,,,,,showWhite);
draw_ext(sFountain,2,160,280-upY,,,,,showWhite);


draw_ext(sFountain,0,160,140,,,,color);

mergeColor=merge_colour(color,c_black,clamp(showColor+0.75+dsin(time*3)*0.25,0,1));
draw_rectangle_color(100,140,220,240,mergeColor,mergeColor,mergeColor,mergeColor,false);

if (showWhite != 0)
{
	mergeColor=make_color_rgb(255*showWhite,255*showWhite,255*showWhite);
	draw_rectangle_color(100,140,220,240,mergeColor,mergeColor,mergeColor,mergeColor,false);
}