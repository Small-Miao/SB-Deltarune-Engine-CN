//declares keyboard variables
function reset_keys() {
	keyUp=false; tymeUp=2; tapUp=false;
	keyDown=false; tymeDown=2; tapDown=false;
	keyLeft=false; tymeLeft=2; tapLeft=false;
	keyRight=false; tymeRight=2; tapRight=false;
	keyConfirm=false; tymeConfirm=2; tapConfirm=false;
	keyCancel=false; tymeCancel=2; tapCancel=false;
	keyMenu=false; tymeMenu=2; tapMenu=false;
	
	menuSound=true;
}

//allows for keyboard inputs
function use_keys(_sound=false) {
	
	menuSound=_sound;
	
	if (op.keybinds[0][0] == 0) { keyDown=keyboard_check(op.keybinds[0][1]);    }else{ keyDown=keyboard_check(ord(op.keybinds[0][1])); }
	if (op.keybinds[1][0] == 0) { keyRight=keyboard_check(op.keybinds[1][1]);   }else{ keyRight=keyboard_check(ord(op.keybinds[1][1])); }
	if (op.keybinds[2][0] == 0) { keyUp=keyboard_check(op.keybinds[2][1]);      }else{ keyUp=keyboard_check(ord(op.keybinds[2][1])); }
	if (op.keybinds[3][0] == 0) { keyLeft=keyboard_check(op.keybinds[3][1]);    }else{ keyLeft=keyboard_check(ord(op.keybinds[3][1])); }
	if (op.keybinds[4][0] == 0) { keyConfirm=keyboard_check(op.keybinds[4][1]); }else{ keyConfirm=keyboard_check(ord(op.keybinds[4][1])); }
	if (op.keybinds[5][0] == 0) { keyCancel=keyboard_check(op.keybinds[5][1]);  }else{ keyCancel=keyboard_check(ord(op.keybinds[5][1])); }
	if (op.keybinds[6][0] == 0) { keyMenu=keyboard_check(op.keybinds[6][1]);    }else{ keyMenu=keyboard_check(ord(op.keybinds[6][1])); }
	
	
	
	if (keyboard_check(vk_enter)) { keyConfirm=true; }
	if (keyboard_check(vk_shift)) { keyCancel=true; }
	if (keyboard_check(vk_control)) { keyMenu=true; }

	if (keyUp)      { tymeUp+=1;      }else{ tymeUp=0; }
	if (keyDown)    { tymeDown+=1;    }else{ tymeDown=0; }
	if (keyLeft)    { tymeLeft+=1;    }else{ tymeLeft=0; }
	if (keyRight)   { tymeRight+=1;   }else{ tymeRight=0; }
	if (keyConfirm) { tymeConfirm+=1; }else{ tymeConfirm=0; }
	if (keyCancel)  { tymeCancel+=1;  }else{ tymeCancel=0; }
	if (keyMenu)    { tymeMenu+=1;    }else{ tymeMenu=0; }

	if (keyUp and tymeUp == 1)           { tapUp=true;      }else{ tapUp=false; }
	if (keyDown and tymeDown == 1)       { tapDown=true;    }else{ tapDown=false; }
	if (keyLeft and tymeLeft == 1)       { tapLeft=true;    }else{ tapLeft=false; }
	if (keyRight and tymeRight == 1)     { tapRight=true;   }else{ tapRight=false; }
	if (keyConfirm and tymeConfirm == 1) { tapConfirm=true; }else{ tapConfirm=false; }
	if (keyCancel and tymeCancel == 1)   { tapCancel=true;  }else{ tapCancel=false; }
	if (keyMenu and tymeMenu == 1)       { tapMenu=true;    }else{ tapMenu=false; }
}

//hold keys input
function key_up() { return(keyUp); }
function key_down() { return(keyDown); }
function key_left() { return(keyLeft); }
function key_right() { return(keyRight); }
function key_confirm() { return(keyConfirm); }
function key_cancel() { return(keyCancel); } 
function key_menu() { return(keyMenu); }

//tap keys input
function tap_up(_cursor=-1) { if (_cursor == -1) { if (tapUp) { tapUp=false; return(true); }else{ return(false); } }else{  if (tapUp and _cursor == cursor) { tapUp=false; return(true); }else{ return(false); }  } }
function tap_down(_cursor=-1) { if (_cursor == -1) { if (tapDown) { tapDown=false; return(true); }else{ return(false); } }else{  if (tapDown and _cursor == cursor) { tapDown=false; return(true); }else{ return(false); }  } }
function tap_left(_cursor=-1) { if (_cursor == -1) { if (tapLeft) { tapLeft=false; return(true); }else{ return(false); } }else{  if (tapLeft and _cursor == cursor) { tapLeft=false; return(true); }else{ return(false); }  } }
function tap_right(_cursor=-1) { if (_cursor == -1) { if (tapRight) { tapRight=false; return(true); }else{ return(false); } }else{  if (tapRight and _cursor == cursor) { tapRight=false; return(true); }else{ return(false); }  } }
function tap_confirm(_cursor=-1,_sound=true) { if (_cursor == -1) { if (tapConfirm) { if (_sound and menuSound) { sound(snd_select); } tapConfirm=false; tapCancel=false; tapMenu=false; frame=true; return(true); }else{ return(false); } }else{  if (tapConfirm and _cursor == cursor) { if (_sound and menuSound) { sound(snd_select); } tapConfirm=false; tapCancel=false; tapMenu=false; return(true); }else{ return(false); }  } }
function tap_cancel(_cursor=-1,_sound=true) { var _s=snd_menumove; if (op.mode == "menuOverworld") { _s=snd_smallswing; } if (_cursor == -1) { if (tapCancel) { if (_sound and menuSound) { sound(_s); } tapConfirm=false; tapCancel=false; tapMenu=false; return(true); }else{  return(false); } }else{  if (tapCancel and _cursor == cursor) { if (_sound and menuSound) { sound(_s); } tapConfirm=false; tapCancel=false; tapMenu=false; return(true); }else{  return(false); }  } }
function tap_menu(_cursor=-1,_sound=true) { if (_cursor == -1) { if (tapMenu) { if (_sound and menuSound) { sound(snd_menumove); } tapConfirm=false; tapCancel=false; tapMenu=false; return(true); }else{ return(false); } }else{  if (tapMenu and _cursor == cursor) { if (_sound and menuSound) { sound(snd_menumove); } tapConfirm=false; tapCancel=false; tapMenu=false; return(true); }else{ return(false); }  } }