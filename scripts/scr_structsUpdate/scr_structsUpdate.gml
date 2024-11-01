//updates all the structs in all item arrays (makes it so you can put if checks in the structs)
function updatestruct_items()
{
	var i=0;
	i=0; repeat(array_length(op.item)) { struct(instanceof(op.item[i])); op.item[i]=str; ++i; }
	i=0; repeat(array_length(op.itemKey)) { struct(instanceof(op.itemKey[i])); op.itemKey[i]=str; ++i; }
	i=0; repeat(array_length(op.itemLight)) { struct(instanceof(op.itemLight[i])); op.itemLight[i]=str; ++i; }
	i=0; repeat(array_length(op.cell)) { struct(instanceof(op.cell[i])); op.cell[i]=str; ++i; }
}

//updates all the structs in the party arrays (makes it so you can put if checks in the structs)
function updatestruct_party()
{
	var i=0;
	repeat(array_length(op.party)) { struct(instanceof(op.party[i])); op.party[i]=str; ++i; }
}