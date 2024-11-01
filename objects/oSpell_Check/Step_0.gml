//sets the cc_anything dialouge to the text in the enemy structs (_checkText) array
op.textCC=op.battle_enemy[numb_to]._checkText;

start_cutscene("cc_anything",10,true);

instance_destroy();