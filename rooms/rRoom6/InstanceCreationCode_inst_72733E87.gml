op.showHitboxes=true;
op.debug=true;

music(mus_deltabasement);

//

setup_battle(["enemy_viro","enemy_ambu","enemy_ambu"]);

//

create_char_enemy("ene0",320,410,"enemy_viro",,,["oblivious"]); 
create_char_enemy("ene1",570,60,"enemy_ambu",,,["oblivious"]);

create_char_enemy("ene0",150,360,"enemy_viro");