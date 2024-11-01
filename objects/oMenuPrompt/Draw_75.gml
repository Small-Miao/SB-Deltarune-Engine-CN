if (op.mode != "battle")
{
	draw_box(op.menuPrompt[0],op.menuPrompt[1],op.menuPrompt[2],op.menuPrompt[3],["red"]);
}

res_i();
repeat (array_length(func))
{
	i1="A";
	if (fa[i] == "C") { i1="fa_center"; }
	if (fa[i] == "R") { i1="fa_right"; }
	
	print(text[i],op.menuPrompt[0]+xy[i][0],op.menuPrompt[1]+xy[i][1],,,width[i],,,,,,,,,[i1,"menu_yellow","soul3",i,"start"]);
	++i;
}

if (cursor == -1)
{
	draw_ext(sSoul2,0,op.menuPrompt[0]+(op.menuPrompt[2]/2)+(op.mode == "battle")*15,op.menuPrompt[1]+(op.menuPrompt[3]/2)-(op.mode == "battle")*3,0.5,0.5);
}