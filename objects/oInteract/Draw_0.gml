if (draw == -1 or drawSelf) { draw_self(); }
//if (drawSelf) { draw_self(); }

if (draw != -1)
{
	depth=-y;
	draw();
}