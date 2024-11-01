//this is the standard spell for all S-Action & R-Action for all enemys
enemy=op.battle_enemyString[numb_to];
numberExistenceFrom=op.party[numb_from]._numberExistence;

counter=0;



/*
you can use
	if (enemy == "enemyStructName") {  }
to have different stuff happen based on what enemy you use the action on.
*/



//the stuff inside this region is just temporary stuff to make every enemy have an S-Action & R-Action, you should replace it when you make multiple enemys with different rections to the actions.
#region

op.textCC=[name_from+" the thing!"];

if (oMenuBattle.singleStack)
{
	if (numberExistenceFrom == 1) { array_push(op.textCC,"* Susie did this.");  op.faceCC=[-1,[FACE.SUSIE,1]]; }
	if (numberExistenceFrom == 2) { array_push(op.textCC,"* Ralsei did this."); op.faceCC=[-1,[FACE.RALSEIHAT,8]]; }
}

start_cutscene("cc_anything",,true);



if (op.isBoss)
{
	enemy_mercy(numb_to,10);
}
else
{
	enemy_mercy(numb_to,100);
	enemy_spare(numb_to);
}

#endregion



instance_destroy();