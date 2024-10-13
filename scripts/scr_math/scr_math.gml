function pos_to_ang(_x1,_y1,_x2,_y2,_returnNumb=false)
{
	var angle=point_direction(_x1,_y1,_x2,_y2);
	
	if (angle < 45+0 or angle > 45+270)    { if (_returnNumb) { return(3); }else{ return("right"); } }
	if (angle < 45+90 and angle > 45+0)    { if (_returnNumb) { return(0); }else{ return("up"); } }
	if (angle < 45+180 and angle > 45+90)  { if (_returnNumb) { return(2); }else{ return("left"); } }
	if (angle < 45+270 and angle > 45+180) { if (_returnNumb) { return(1); }else{ return("down"); } }
	
	return(0);
}

//

function existence_to_numb(__numberExistence=0)
{
	var counter=0;
	repeat(array_length(op.party))
	{
		if (op.party[counter]._numberExistence == __numberExistence) { return(counter); }
		++counter;
	}
	return(-1);
}

//

function string_to_color(_string="red")
{
	switch (_string)
	{
		case "aqua"    : return(c_aqua);    break;
		case "black"   : return(c_black);   break;
		case "blue"    : return(c_blue);    break;
		case "dkgray"  : return(c_dkgray);  break;
		case "fuchsia" : return(c_fuchsia); break;
		case "gray"    : return(c_gray);    break;
		case "green"   : return(c_green);   break;
		case "lime"    : return(c_lime);    break;
		case "ltgray"  : return(c_ltgray);  break;
		case "maroon"  : return(c_maroon);  break;
		case "navy"    : return(c_navy);    break;
		case "olive"   : return(c_olive);   break;
		case "orange"  : return(c_orange);  break;
		case "purple"  : return(c_purple);  break;
		case "red"     : return(c_red);     break;
		case "silver"  : return(c_silver);  break;
		case "teal"    : return(c_teal);    break;
		case "white"   : return(c_white);   break;
		case "yellow"  : return(c_yellow);  break;
		
		case "alex" : return(make_color_rgb(128,0,70)); break;
	}
}
 
function hex_to_dec(_hex) 
{
    var dec = 0;
 
    var dig = "0123456789ABCDEF";
    var len = string_length(_hex);
    for (var pos = 1; pos <= len; pos += 1) {
        dec = dec << 4 | (string_pos(string_char_at(_hex, pos), dig) - 1);
    }
 
    return dec;
}

function get_keybind(_numb)
{
	if (op.keybinds[_numb][0] == 0)
	{
		if (op.keybinds[_numb][1] == vk_down) { return("Down"); }
		if (op.keybinds[_numb][1] == vk_right) { return("Right"); }
		if (op.keybinds[_numb][1] == vk_up) { return("Up"); }
		if (op.keybinds[_numb][1] == vk_left) { return("Left"); }
	}else{ return(op.keybinds[_numb][1]); }
}

//
//
//

//
//
//

function ability_amount(_ability)
{
	var i=0, j=0, found=0;
	repeat(array_length(op.party))
	{
		j=0;
		repeat(3) { if (op.ability[i][j] == _ability) { ++found; } ++j; }
		++i;
	}
	
	return(found);
}