draw_box(op.menuPrompt[0],op.menuPrompt[1],op.menuPrompt[2],op.menuPrompt[3]);

i = 0;
repeat (length)
{
	print(numbers[i],160.5 + -(length-1)*8 + i*16,op.menuPrompt[1]+36,,,,,,,textColor,,,,,["fa_center"]);
	i++;
}

//draw arrows
if (state == 0)
{
	c1 = c_gray; if key_up() { c1 = c_white; }
	c2 = c_gray; if key_down() { c2 = c_white; }

	draw_ext(sArrow,0,160 -(length-1)*8 + cursor*16,op.menuPrompt[1]+36-9,1,1,,c1);
	draw_ext(sArrow,0,160 -(length-1)*8 + cursor*16,op.menuPrompt[1]+36+18,1,-1,,c2);
}