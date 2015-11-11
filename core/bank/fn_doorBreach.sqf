	

	if !(fed_bank getVariable "bank_block") then{
		 fed_bank setVariable ["osa_h1f",1,true];
		 fed_bank setVariable ["h1f_forced",1,true];
		 fed_bank animate ["h1fAnim",0] ; 
		 fed_bank animate ["h1bAnim",1]; 
		 fed_bank setObjectTextureGlobal [1,"\il_bank\textures\unlocked.paa"];
		 [_this select 3] spawn life_fnc_startRobbery;
		 deletevehicle _this select 0;
	 };