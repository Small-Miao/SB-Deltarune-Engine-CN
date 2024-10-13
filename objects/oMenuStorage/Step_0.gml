use_keys(true);
use_cursor();

if (page == "start")
{
	wide_cursor(12); saveCur[0]=cursor;
	
	if tap_confirm() { page="storage"; cursor=saveCur[1]; }
	
	if tap_cancel() { instance_destroy(); op.mode="overworld"; }
}

//

if (page == "storage")
{
	if (cursor mod 2) and (tapRight) { if (storagePage == 0) { storagePage=1; }else{ storagePage=0; } }
	if !(cursor mod 2) and (tapLeft) { if (storagePage == 0) { storagePage=1; }else{ storagePage=0; } }
	
	wide_cursor(12); saveCur[1]=cursor;
	
	if tap_confirm()
	{
		res_i();
		if (saveCur[0] >= array_length(op.item))     { i1=-1; }else{ struct(instanceof(op.item[saveCur[0]]));               i1=str; }
		if (op.storage[cursor+storagePage*12] == -1) { i2=-1; }else{ struct(instanceof(op.storage[cursor+storagePage*12])); i2=str; }
		
		if !(i1 == -1 and i2 == -1)
		{
			if (i1 != -1 and i2 != -1)
			{
				array_delete(op.item,saveCur[0],1);
				array_insert(op.item,saveCur[0],i2);
				op.storage[cursor+storagePage*12]=i1;
			}
			
			if (i1 == -1 and i2 != -1)
			{
				array_push(op.item,i2);
				op.storage[cursor+storagePage*12]=-1;
			}
			
			if (i1 != -1 and i2 == -1)
			{
				array_delete(op.item,saveCur[0],1);
				op.storage[cursor+storagePage*12]=i1;
			}
		}
		
		force_undo(1);
	}
}