reset_keys();
reset_cursor(); page="start";
master_reset();

op.mode="debug";



extra=[];
options=["noclip","room_goto","main menu","save","destroy battle","place editor"];

repeat (array_length(options)) { array_push(extra,""); }