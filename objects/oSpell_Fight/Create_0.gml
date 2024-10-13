reset_keys();

bright=0;
limit=30;
done=false; doneTime=0;
image_alpha=1;

//

go=[false,false,false];

stickOffset=[-1,-1,-1];
canPress=false; forceNext=false;
res_i(); repeat(array_length(op.party)) { if (oMenuBattle.sel_priority[i] == 4) { go[i]=true; } ++i; }

//
//
//

while (stickOffset[0] == stickOffset[1] and stickOffset[0] == stickOffset[2])
{
	stickOffset=[irandom_range(0,2),irandom_range(0,2),irandom_range(0,2)];
	if (!go[0]) { stickOffset[0]=-1; } if (!go[1]) { stickOffset[1]=-1; } if (!go[2]) { stickOffset[2]=-1; }
}
while (!array_contains(stickOffset,0)) { --stickOffset[0]; --stickOffset[1]; --stickOffset[2]; }
//if (!array_contains(stickOffset,1) and array_contains(stickOffset,0) and array_contains(stickOffset,2)) { res_i(); repeat(array_length(op.party)) { if (stickOffset[i] == 2) { --stickOffset[i] } ++i; } }

stickOffset[0]=clamp(stickOffset[0],-1,2); stickOffset[1]=clamp(stickOffset[1],-1,2); stickOffset[2]=clamp(stickOffset[2],-1,2);

//stickOffset=[0,0,2];
stickX=[(84/2)+120+stickOffset[0]*48,(84/2)+120+stickOffset[1]*48,(84/2)+120+stickOffset[2]*48];

//
//
//

accuracy=0;