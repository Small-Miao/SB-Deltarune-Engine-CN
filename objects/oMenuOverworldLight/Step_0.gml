use_keys(true); if (page == -1) { reset_keys(); }
use_cursor();

if (page == "start")
{
	vertical_cursor(3); op.overworldMenuSaveCursor[0]=cursor;
	
	if (tap_cancel() or tap_menu()) { op.mode="overworld"; instance_destroy(); }
	
	if tap_confirm(0) { if (array_length(op.itemLight) == 0) { force_undo(0); }else{ page="item" cursor=0; } }
	if tap_confirm(1) { page="stat" cursor=0; }
	if tap_confirm(2) { if (array_length(op.cell) == 0) { force_undo(0); }else{ page="cell" cursor=0; } }
}



if (page == "item")
{
	vertical_cursor(array_length(op.itemLight)); op.structAt=cursor;
	
	if tap_confirm() { saveCur[0]=cursor; page="item2" cursor=0; }
}

if (page == "item2")
{
	horizontal_cursor(3);
	
	if tap_confirm(0) { if (op.itemLight[saveCur[0]]._func != -1) { if (op.itemLight[saveCur[0]]._sound != -1) { sound(op.itemLight[saveCur[0]]._sound); } op.itemLight[saveCur[0]]._func(); } page=-1; }
	if tap_confirm(1) { if (op.itemLight[saveCur[0]]._info != -1) { op.itemLight[saveCur[0]]._info(); } page=-1; }
	if tap_confirm(2) { if (op.itemLight[saveCur[0]]._drop != -1) { op.itemLight[saveCur[0]]._drop(); } page=-1; }
	
}



if (page == "stat")
{
	if tap_confirm() { force_undo(0); }
}



if (page == "cell")
{
	vertical_cursor(array_length(op.cell));
	
	if tap_confirm() { if (op.itemLight[cursor]._func != -1) { op.itemLight[cursor]._func(); } page=-1; }
}