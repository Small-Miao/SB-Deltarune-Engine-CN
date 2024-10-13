sprite_index=op.party[numb]._spriteDEfallDark;
image_index=char(numb).image_index;
x=char(numb).x+0.5-sprite_width/2; y=char(numb).y-sprite_height;

if (counter < sprite_height) { char(numb).drawON=false; }
else
{
	char(numb).sprite_index=sprite_index;
	char(numb).image_index=image_index;
	char(numb).drawON=true;
	instance_destroy();
}

//

draw_sprite_part(char(numb).sprite_index,image_index,0,0,sprite_width,sprite_height-counter,x,y);
draw_sprite_part(sprite_index,image_index,0,sprite_height-counter,sprite_width,sprite_height,x,y+sprite_height-counter);

if (counter < sprite_height)
{
	gpu_set_fog(true,c_white,0,1);
	draw_sprite_part(sprite_index,image_index,0,sprite_height-counter,sprite_width,1,x,y+sprite_height-counter);
	gpu_set_fog(false,0,0,0);
	
	effect_fade(sPixel,0,x+irandom_range(0+3,sprite_width-3),y+sprite_height-counter,2,2,,,,-20000,["drawEnd","fallUp"]);
}

//

if (counter < sprite_height) { counter+=0.5+op.darkEntrancFast*1.5; }