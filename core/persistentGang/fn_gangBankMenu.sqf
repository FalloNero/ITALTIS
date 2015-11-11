/*
	File: fn_gangBankMenu.sqf
	Author: Mario2002
	
	Description:
	Checks whether the player is a gang
*/

_gang = player getVariable ["persistent_gang", []];

if (count _gang == 0) exitWith {
 	hint "You are not in a gang, boy!";
};

createDialog "life_gang_bank_account";