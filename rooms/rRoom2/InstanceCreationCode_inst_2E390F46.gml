func=function()
{
	char_animate(0,30,1,,,irandom_range(40,280),irandom_range(30,60));
	char_animate(1,30,1,,,irandom_range(40,280),irandom_range(30,60));
	char_animate(2,30,1,,,irandom_range(40,280),irandom_range(30,60),,function(){ op.mode="overworld"; party_lerp(); });
}