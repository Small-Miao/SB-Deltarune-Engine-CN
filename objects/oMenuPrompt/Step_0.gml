use_keys();



if (cursor == -1)
{
	if (array_length(func) == 2)
	{
		if tap_left() { cursor=0; }
		if tap_right() { cursor=1; }
	}
	
	if (array_length(func) == 3 or array_length(func) == 4)
	{
		if tap_up() { cursor=0; }
		if tap_left() { cursor=1; }
		if tap_right() { cursor=2; }
	}
	
	if (array_length(func) == 4)
	{
		if tap_down() { cursor=3; }
	}
}



if (cursor == 0)
{
	if (array_length(func) == 2)
	{
		if tap_right() { cursor=1; }
	}
	
	if (array_length(func) == 3 or array_length(func) == 4)
	{
		if tap_left() { cursor=1; }
		if tap_right() { cursor=2; }
	}
	
	if (array_length(func) == 4)
	{
		if tap_down() { cursor=3; }
	}
}



if (cursor == 1)
{
	if (array_length(func) == 2)
	{
		if tap_left() { cursor=0; }
	}
	
	if (array_length(func) == 3 or array_length(func) == 4)
	{
		if tap_up() { cursor=0; }
		if tap_right() { cursor=2; }
	}
	
	if (array_length(func) == 4)
	{
		if tap_down() { cursor=3; }
	}
}



if (cursor == 2)
{
	if (array_length(func) == 3 or array_length(func) == 4)
	{
		if tap_up() { cursor=0; }
		if tap_left() { cursor=1; }
	}
	
	if (array_length(func) == 4)
	{
		if tap_down() { cursor=3; }
	}
}



if (cursor == 3)
{
	if tap_up() { cursor=0; }
	if tap_left() { cursor=1; }
	if tap_right() { cursor=2; }
}



if (cursor != -1 and tap_confirm())
{
	op.promptCursor=cursor;
	if (func[cursor] != -1) { func[cursor](); }
	instance_destroy();
}