#include <macro.h>
/*
	File: fn_adminDebugCon.sqf
	Author: ColinM9991
	
	Description:
	Opens the Debug Console.
*/
if(__GETC__(life_adminlevel) == 0) exitWith {closeDialog 0;};


createDialog "RscDisplayDebugPublic";
//[[0,format["Admin %1 ha aperto la console",profileName]],"life_fnc_broadcast",nil,false] spawn life_fnc_MP;