//fullscreen swap
if keyboard_check_pressed(vk_f4)
{
	if window_get_fullscreen()
	{
		window_set_fullscreen(false);
		window_set_size(320*4,240*4);
		window_center();
	}
	else
	{
		window_set_fullscreen(true);
	}
}



//spawn debug menu
if (keyboard_check_pressed(vk_f1) and debug)
{
	instance_destroy(oMenuDebug);
	instance_create_depth(0,0,-9999,oMenuDebug);
}



//camera math
displaySizeX=320;
displaySizeY=240;

view_enabled=true;
view_visible[0]=true;

view_wport[0]=displaySizeX*2;
view_hport[0]=displaySizeY*2;

surface_resize(application_surface,view_wport[0],view_hport[0]);

var cam_id=view_camera[0];
var cam_width=camera_get_view_width(cam_id);
var cam_height=camera_get_view_height(cam_id);

if (cameraMode == "overworld")
{
	x=playerX; y=playerY-20;

	x=clamp(x,0+160,room_width-160);
	y=clamp(y,0+120,room_height-120);
}


//move and animate camera with camera functions in scr_camera
if (camMove[0] != 0)
{
	if (camMove[2] != "x") { x+=(camMove[2]-camMove[3])/camMove[1]; }
	if (camMove[4] != "x") { y+=(camMove[4]-camMove[5])/camMove[1]; }
	if (camMove[6] != "x") { camOffsetX+=(camMove[6]-camMove[7])/camMove[1]; }
	if (camMove[8] != "x") { camOffsetY+=(camMove[8]-camMove[9])/camMove[1]; }
	
	--camMove[0];
	if (camMove[0] == 0)
	{
		if (camMove[10]) { cameraMode="overworld"; }
		if (camMove[11] != -1) { camMove[11](); }
	}
}


	//camera shake with function camera_shake
if (camShake[0] > 0)
{
	--camShake[0];
	camShakeX=0;
	camShakeY=0;
	
	while (camShakeX+camShakeY == 0)
	{
		camShakeX=irandom_range(-camShake[1],camShake[1]);
		camShakeY=irandom_range(-camShake[1],camShake[1]);
	}
}
else
{
	camShakeX=0;
	camShakeY=0;
}



//set camera position and size
camera_set_view_pos(cam_id,x+camOffsetX+camShakeX-cam_width/2,y+camOffsetY+camShakeY-cam_height/2);
camera_set_view_size(cam_id,displaySizeX,displaySizeY);



//global values are fixed (can ignore)
textFadeAlpha+=0.5;
if (textFadeAlpha >= 2) { textFadeAlpha=0; }

boxImage+=boxImageSpeed;
if (boxImage >= 4.5 or boxImage <= 0.5) { boxImageSpeed*=-1; }

if (mode == "overworld" or mode == "cutscene") { if (dodge_hit > 30) { hudY+=(46-hudY)/2; }else{ if (dodge_hit > 0) { hudY+=(125-hudY)/3; }else{ hudY+=(125-hudY)/2; } } }

if (mode == "battle")
{
	++battleTime;
	
	//animates the fading lines in the party battle UI
	res_i();
	repeat (3)
	{
		battleSticks[i]*=1.05;
		if (battleSticks[i] > 20) { battleSticks[i]=1; }
		++i;
	}
}
else
{
	battleTime=0;
}

if (retryBattleTimer > 0) { --retryBattleTimer; }
if (menuRoomTime > 0) { --menuRoomTime; }