function item_cellPhone() : item_base() constructor
{
	_infoText=["Cell Phone","It can be used to make calls."];
	
	_isKeyitem=true;
	
	_func=function()
	{
		start_cutscene("cc_cellPhone");
	}
}



function item_ballOfJunk() : item_base() constructor
{
	_infoText=["Ball of Junk"];
	
	_func=function()
	{
		op.textCC=["* You looked at the junk ball in admiration. {delay:10} {jump} * Nothing happened."];
		start_cutscene("cc_anything");
	}
	
	_info=function()
	{
		op.textCC=["* A small ball of accumulated things in your pocket."];
		start_cutscene("cc_anything");
	}
	
	_drop=function()
	{
		op.textCC=[
			"* You took it from your pocket. {delay:10} {jump} * You have a {color:yellow} very, {delay:5} very, {delay:5} bad feeling {color:white} about throwing it away.",
			"* Throw it away anyway?"
		];
		op.funcCC=function()
		{
			prompt(
			[
			function()
			{
				array_delete(op.itemLight,op.structAt,1);
				op.item=[];
				op.weapon=array_create(48,-1);
				op.armor=array_create(48,-1);
				
				sound(snd_bageldefeat);
				
				op.textCC=[
					"* Hand shaking, {delay:10} you dropped the ball of junk on the ground.",
					"* It broke into pieces.",
					"* You felt bitter."
				];
				start_cutscene("cc_anything");
			}
			,function()
			{
				op.textCC=["* You felt a feeling of relief."];
				start_cutscene("cc_anything");
			}
			],["Yes","No"]);
		}
		start_cutscene("cc_anything");
	}
}