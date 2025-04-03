var info=[];
var order=[];
var i=0, i1=0, checkY=0;



with(oChar)
{
	array_push(info,[sprite_index,image_index,x+extraX+shakeX,y+extraY+shakeY,xscale,1,0,image_blend,1,bright,walkSprites]);
}

i=0; i1=0;
while (array_length(info) != 0)
{
	i=0; checkY=9999;
	repeat(array_length(info))
	{
		if (info[i][3] < checkY) { checkY=info[i][3]; i1=i; }
		++i;
	}
	array_push(order,info[i1]);
	array_delete(info,i1,1);
}



if (op.showHitboxes and !forceHide) { draw_self(); }



if (!surface_exists(surf)) { surf=surface_create(room_width,room_height); }

surface_set_target(surf);

draw_clear_alpha(c_white,0);

//draw chars
i=0;
repeat(array_length(order))
{
	if (order[i][2] >= x and order[i][2] < x+image_xscale*20 and order[i][3] >= y and order[i][3] < y+image_yscale*20)
	{
		draw_ext(order[i][0],order[i][1],order[i][2],order[i][3]-3,order[i][4],-order[i][5]*draw_yscale,order[i][6],order[i][7],order[i][8],order[i][9]);
	}
	++i;
}

surface_reset_target();

draw_surface_ext(surf,0,0,1,1,0,c_white,draw_alpha);



if (draw != -1) { draw(); }