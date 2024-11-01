use_keys(true);
use_cursor();

if (page == "start")
{
	saveCur=[0,0,0,0,0,0,0,0,0];
	
	vertical_cursor(4);
	
	if (cursor != 3)
	{
		op.fileOn=cursor;
		if tap_confirm() { file_load(); }
	}
	else
	{
		if tap_confirm()
		{
			declare_gamestats();
			
			with (instance_create_depth(0,0,0,oRun))
			{
				persistent=true;
				step=function()
				{
					if (time == 1) { master_reset(); reset_party_position(); persistent=false; instance_destroy(); }
				}
			}
			op.x=160; op.y=120; op.playerX=100; op.playerY=100; op.mode="overworld";
			room_goto(rRoom1);
		}
	}
	
	if tap_confirm(0) { page="options"; cursor=0; }
}