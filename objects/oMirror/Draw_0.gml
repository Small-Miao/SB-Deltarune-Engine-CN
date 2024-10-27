++time;
if (time == 1)
{
	if (wall) { with(instance_create_depth(x,y,0,oWall)) { forceHide=true; image_xscale=other.image_xscale; image_yscale=-other.image_yscale; } }
}

var info=[];
var order=[];
var i=0, i1=0, checkY=0;

//

with(oChar)
{
	array_push(info,[sprite_index,image_index,x+extraX,y+extraY,xscale,1,0,image_blend,1,bright,walkSprites]);
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
order=array_reverse(order);

//

if (op.showHitboxes and !forceHide) { draw_self(); }

//

i=0;
repeat(array_length(order))
{
	if (order[i][2] >= x and order[i][2] < x+image_xscale*20)
	{
		var check=true;
		if (array_length(order[i][10]) > 3)
		{
			if (order[i][0] == order[i][10][0] and check) { check=false; order[i][0]=order[i][10][1]; }
			if (order[i][0] == order[i][10][1] and check) { check=false; order[i][0]=order[i][10][0]; }
		}
		
		draw_ext(order[i][0],order[i][1],order[i][2],(y*2)-order[i][3],order[i][4],order[i][5],order[i][6],order[i][7],order[i][8]*draw_alpha,order[i][9]);
	}
	++i;
}

//

if (draw != -1) { draw(); }