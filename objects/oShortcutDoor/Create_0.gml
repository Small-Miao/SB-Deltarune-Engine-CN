with(instance_create_depth(x-20,y-20,-(y-20),oInteract))
{
//
image_xscale=2; image_yscale=1; _id="shortcutDoor";
doorImage=0;

//

options=[[],[]];
op.shortcutDoorRoom=[];

function addPlace(_room=-1,_text)
{
	array_push(op.shortcutDoorRoom,_room);
	
	array_push(
	options[0],
	function()
	{
		if (op.shortcutDoorRoom[op.promptCursor] == room)
		{
			op.textCC=["* (Amazingly, {delay:10} you are already there.)"];
			op.funcCC=function(){ op.mode="overworld"; }
		}
		else
		{
			with (oInteract) { if (_id == "shortcutDoor") { doorImage=1; } }
			
			sound(snd_dooropen);
			
			op.textCC=["* (The door opened...)"];
			op.funcCC=function()
			{
				sound(snd_doorclose);
				
				music_stop();
				transition("shortcut",function(){ room_goto(op.shortcutDoorRoom[op.promptCursor]); master_reset(); },function()
				{
					op.mode="overworld"; op.cameraMode="overworld"; op.locationCCcheck=false;
					op.playerX=room_width/2; op.playerY=room_height/2; op.playerDirection="down";
					with (oInteract) { if (_id == "shortcutDoor") { op.playerX=x+20; op.playerY=y+30; } }
					reset_party_position();
					
					sound(snd_dooropen);
				});
			}
		}
		
		start_cutscene("cc_anything");
	});
	
	array_push(options[1],_text);
}

//
//
//

//
//
// Set Shortcut Rooms

variant_shortcutdoor();

//
//
//

//
//
//

if (array_length(options[0]) != 4)
{
	i=array_length(options[0]);
	if (array_length(options[0]) == 2) { i=0; }
	
	array_insert(options[0],i,function(){ op.textCC=["* (You doorn't)"]; op.funcCC=function(){ op.mode="overworld"; } start_cutscene("cc_anything"); });
	array_insert(options[1],i,"Cancel");
	array_insert(op.shortcutDoorRoom,i,-1);
}

func=function()
{
	if (array_length(options[0]) == 1)
	{
		op.textCC=["* (It's a lone doorframe.) {delay:10} {jump} * (But for some reason, {delay:10} you can't see through it...)"];
		op.funcCC=-1;
	}
	else
	{
		op.textCC=["* (It's a door.) {delay:3} {jump} * (Where will you go?)"];
		op.funcCC=function()
		{
			prompt(options[0],options[1]);
		}
	}
	
	start_cutscene("cc_anything");
}

//

draw=function()
{
	if (array_length(options[0]) == 1) { doorImage=2; }
	if (doorImage == 0) { draw_ext(sShortcutDoorFire,op.time*0.125,x+20,y+16); }
	draw_ext(sShortcutDoor,doorImage,x+20,y+20);
}
//
}

instance_destroy();