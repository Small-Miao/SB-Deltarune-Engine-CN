var _gamepad = async_load[? "pad_index"];

switch (async_load[? "event_type"])
{
	case "gamepad discovered":
		array_push(global.gamepads,_gamepad);
		gamepad_set_axis_deadzone(_gamepad,0.2);
	break;
	
	case "gamepad lost":
		var _array_index = array_get_index(global.gamepads,_gamepad);
		if (_array_index >= 0)
		{
			array_delete(global.gamepads,_array_index,1);
		}
	break;
}

if (array_length(global.gamepads) > 0)
{
	global.gamepad_main = global.gamepads[0];
	
	global.gamepad="xbox";
	
	if (string_pos("PS",gamepad_get_description(global.gamepads[0])) != 0)
		global.gamepad = "ps";
	
	
	
	if (global.gamepad == "xbox")
	{
		global.gamepad_sprite = sButtons_PS4;
		global.gamepad_spriteText = "sButtons_PS4";
	}
	
	if (global.gamepad == "ps")
	{
		global.gamepad_sprite = sButtons_PS4;
		global.gamepad_spriteText = "sButtons_PS4";
	}
}
else
{
	global.gamepad_main = undefined;
	global.gamepad = 0;
}