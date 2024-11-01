use_keys(true);



if (tapUp and page == "start") or (tapLeft and page == "more")
{
	--offsetPress;
	if (offsetPress < 0) { offsetPress=0; --offset; }
	if (cursor == 0) { cursor=array_length(rec); offsetPress=8; offset=array_length(rec)-9; }
}

if (tapDown and page == "start") or (tapRight and page == "more")
{
	++offsetPress;
	if (offsetPress > 8) { offsetPress=8; ++offset; }
	if (cursor == array_length(rec)-1) { cursor=-1; offsetPress=0; offset=0; }
}

if (array_length(rec) < 10) { offsetPress=0; offset=0; }



if (page == "start")
{
	vertical_cursor(array_length(rec));
	
	if tap_confirm() { page="more"; }
	
	if tap_cancel() { instance_destroy(); op.mode="overworld"; }
}



if (page == "more")
{
	horizontal_cursor(array_length(rec));
	
	if tap_confirm() { force_undo(0); }
	
	if tap_cancel() { page="start"; }
}