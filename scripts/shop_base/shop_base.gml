//declaring values for shop
function shop_base() constructor
{
	_textMain=["Buy","Sell","Talk","Exit"];
	_textExit=["Exit","Return","Exit"];
	
	_textFlavour=[
		"* Flavour text enter shop.",
		"* Flavour text exit back to main page."
	];
	
	_textBuy=[
		"What would you like to buy?",
		"Take your time.",
		"Thank you for purchase",
		"You don't have enough money.",
		"You are carrying too much stuff."
	];
	
	_textSell=[
/*0*/	"Pick sell text.",
/*1*/	"Pick sell item text.",
/*2*/	"Pick sell weapon text.",
/*3*/	"Pick sell armor text.",
/*4*/	"It seems you don't have any.",
/*5*/	"You just sold everything you held.",
/*6*/	"Changed your mind?",
/*7*/	"Thanks for the item!",
/*8*/	"You can't sell empty space.",
/*9*/	"I don't want that."
	];
	
	_textTalk="Let's talk about stuff.";
	
	_textLeave=["* See you later goodbye everyone.","* You can add more lines if text if you want.","* {color:red} Bye"];
	
	_textTalkOptions=[["Talk 0","Talk 0(2)"],["Talk 1"],["Talk 2"],["Talk 3"]];
	
	
	
	_cutsceneTalk=[["cc_base","cc_test1"],["cc_base"],["cc_test1"],["cc_base"]];
	
	
	
	_items=["item_burger","item_sharpAx","item_whiteRibbon","item_cellPhone"];
	_soldOut=[false,false,true,false];
	_music=mus_sneaking;
	
	
	//(0 == buy) (1 == sell) (2 == talk)
	_mainButtons=[0,1,2];
	_voice=txt_text;
	_seed=[];
	
	
	
	_spriteIdle=sSeam1;
	
	_spriteFlavour=[-1,-1];
	_spriteBuy=[-1,-1,-1,-1,-1];
	_spriteSell=[-1,-1,-1,-1,-1,-1,-1,-1,-1,-1];
	
	
	
	_draw=function()
	{
		face=oMenuShop.sprite;
		
		image=oMenuShop.image;
		
		_x=160+oMenuShop.nudge;
		
		
		
		draw_ext(face,image,_x,120);
	}
}