//Spawns Noelle:
create_char(0,"n",160,210,an_noelle_walk());

//Spawns Queen:
create_char(0,"q",200,210,an_queen_walk());

//Spawns Toriel Thing:
create_char(0,"t",70,210,sToriel_Chair,["wall"]);



//Spawns lancer:
create_char(0,"s",60,60,an_lancer_walk(),["wall","look","defaultUp"],function(){ start_cutscene("cc_base"); });