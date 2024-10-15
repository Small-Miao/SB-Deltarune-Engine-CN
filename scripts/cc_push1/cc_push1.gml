function cc_push1() : cc_base() constructor
{
	_moveAfter=false;
	
	_dialogue=[
		"* Hey look it's Lancer!"
		,"* What's up {color:blue} CLOWNS? {jump} {delay:10} {color:yellow} * DID YOU MISS ME? {func}"
		,"* NO I HATE {color:blue} >>>LANCER!<<<"
		,"* WHY DID YOU DO THAT!"
		
		,"* Okay so get this"
		,"* He is dead!"
	];
	
	_y=[156,1];
	
	_face=[
		[FACE.SUSIE,23]
		,[FACE.LANCER,2]
		,[FACE.RALSEI,34]
		,[FACE.SUSIE,33]
		
		,[FACE.RALSEI,5]
		,[FACE.RALSEI,21]
	];
	
	_hideBox=[0,30,0,125,0,0];
	
	_funcLine=[
		-1
		,function()
		{
			camera_move(30,220,180);
			char_animate(0,30,1,,,180,240,,,["faceUp"]);
			char_animate(1,30,1,,,220,230,,,["faceUp"]); 
			char_animate(2,30,1,,,260,240,,,["faceUp"]);
			
			char_animate("followerN",30,1,,,220,280,,,["faceUp"]);
		}
		,-1
		,function()
		{
			char_animate(2,5,2,,,260,190);
			char_animate(2,5,2,,,240,190);
			
			repeat(30) { char_animate(2,2,,,,,,function(){ effect_badexplosion(220+irandom_range(-10,10),175+irandom_range(-10,10)); }); }
			
			char_animate(2,30,1,,,260,240,function(){ instance_destroy(char("lan")); },function(){ char_animate(0,,,,,,,,,["faceRight"]); char_animate(1,,,,,,,,,["faceRight"]); },["faceLeft"]);
		}
		,-1
		,function(){ sound(snd_won); }
	];
	
	_funcAny=[
		function(){ effect_smallface(FACE.SUSIE,33,"YES",150,42); }
	];
	
	_func=function(){ camera_reset(30,,,function(){ set_mode(); }); }
}