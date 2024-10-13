use_keys();

if (page == "start")
{
	if (alpha < 1) { alpha+=0.1; }
	
	if (!is_string(cursor))
	{
		if tap_left() { --cursor; }
		if tap_right() { ++cursor; }
	
		if tap_up() { cursor-=10; }
		if tap_down() { cursor+=10; }
		
		if (!is_string(cursor))
		{
			if (cursor > 25 and cursor <= 35) { cursor-=30; }
			
			if (cursor < -4) { cursor+=30; }
		}
		
		if (tap_confirm() and string_length(type) != typeLength) { type+=string_char_at(bet,cursor+1); }
		
		if tap_cancel()
		{
			if (string_length(type) == 0)
			{
				page="endBack";
			}
			else
			{
				res_i(); i1="";
				repeat(string_length(type)-1) { ++i; i1+=string_char_at(type,i); }
				type=i1;
			}
		}
	}
	
	if (cursor == -4 or cursor == -3) { cursor="back"; }
	if (cursor == -2 or cursor == -1) { cursor="end"; }
	
	if (cursor == "back")
	{
		if tap_up() { cursor=16; }
		if tap_down() { cursor=6; }
		if tap_left() { cursor=25; }
		if tap_right() { cursor="end"; }
		
		if tap_confirm()
		{
			if (string_length(type) == 0)
			{
				page="endBack";
			}
			else
			{
				res_i(); i1="";
				repeat(string_length(type)-1) { ++i; i1+=string_char_at(type,i); }
				type=i1;
			}
		}
	}
	
	if (cursor == "end")
	{
		if tap_up() { cursor=18; }
		if tap_down() { cursor=8; }
		if tap_left() { cursor="back"; }
		if tap_right() { cursor=20; }
		
		if (tap_confirm() and string_length(type) > 0)
		{
			page="end";
		}
	}
}

//

if (page == "end")
{
	alpha-=0.1;
	if (alpha == 0) { if (funcEnd != -1) { funcEnd(); } instance_destroy(); }
}

if (page == "endBack")
{
	alpha-=0.1;
	if (alpha == 0) { if (funcBack != -1) { funcBack(); } instance_destroy(); }
}