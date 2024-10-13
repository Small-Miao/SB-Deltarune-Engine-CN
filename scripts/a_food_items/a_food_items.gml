function item_burger() : item_base() constructor
{
	_infoText=["Hamburger","This is a Hamburger.\nHeals a lot.",-1];
	_heal=[60,100];
	_price=110;
	
	_customBattleText="YUM YUM BURGER";
}

function item_pinecone() : item_base() constructor
{
	_infoText=["Pinecone","Don't eat it's not food."];
	_reactionText=[
		"",
		"YUM",
		"Not that bad"
	];
	
	_forceReact=[[2,"WHY?????"]];
	
	_heal=[3];
	_price=56;
}