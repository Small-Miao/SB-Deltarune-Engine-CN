reset_keys();
reset_cursor(); page="start";
master_reset();

op.soul4XY=[72.5,76];

rec=[];

//
//struct(op.recruits[0][0]); op.recruits=[]; repeat(15) { array_push(op.recruits,[instanceof(str),10,1]); }
//

res_i();
repeat(array_length(op.recruits))
{
	struct(op.recruits[i][0]);
	array_push(rec,str);
	++i;
}

res_i();

//
//
//
//
//

function draw_boxColor(_x,_y)
{
	boxC=variant_recruits(rec[cursor]._recChapter);
	
	draw_ext(sPixel,0,_x,_y,208/2,153/2);
	draw_rectangle_color(_x+0.5,_y+0.5,_x+0.5+204/2,_y+0.5+149/2,0,0,boxC,boxC,false);
	draw_ext(rec[cursor]._recSprite,op.time/rec[cursor]._recDivide,_x+round(208/4),_y-8+round(153/2));
}

//
//
//

drText=get_text("t_menuRecruits");