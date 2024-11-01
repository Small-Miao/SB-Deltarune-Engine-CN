//make the camera move to certian cordinates or change the cameras offset or both
function camera_move(_delay=30,_camX="x",_camY="x",_camExtraX="x",_camExtraY="x",_funcEnd=-1)
{
	if (_camX != "x" or _camY != "x") { op.cameraMode=0; }
	op.camMove=[_delay,_delay,_camX,op.x,_camY,op.y,_camExtraX,op.camOffsetX,_camExtraY,op.camOffsetY,false,_funcEnd];
}

//makes the camera automaticaly go back to the player
function camera_reset(_delay=10,_camX=clamp(op.playerX,160,room_width-160),_camY=clamp(op.playerY-20,120,room_height-120),_funcEnd=-1)
{
	op.camMove=[_delay,_delay,_camX,op.x,_camY,op.y,0,op.camOffsetX,0,op.camOffsetY,true,_funcEnd];
}



//shakes the camera
function camera_shake(_time,_power)
{
	op.camShake=[_time,_power];
}