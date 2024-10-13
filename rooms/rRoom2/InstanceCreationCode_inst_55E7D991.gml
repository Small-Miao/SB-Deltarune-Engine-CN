func=function()
{
	sound(snd_jump);
	
	char_animate(0,20,1,sKris_Ball,0,160,120,,function(){ op.mode="overworld"; party_lerp(); },["jump","jumpOffset","fadeEffect","faceDown"]);
	char_animate(1,20,1,sSusie_Ball,0,160-30,120,,,["jump","jumpOffset","fadeEffect","faceDown"]);
	char_animate(2,20,1,sRalsei_Ball,0,160+30,120,,,["jump","jumpOffset","fadeEffect","faceDown"]);
}