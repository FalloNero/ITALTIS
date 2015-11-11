#include "macro.hpp"
/*
	File: fn_initWeaponStorage.sqf
	Author: Mario2002
	
	Description:
	creates the markers for player houses locally
*/
private["_house", "_weaponStorage", "_houseCfg", "_weaponCargo", "_magazineCargo", "_itemCargo", "_backpackCargo"];
waitUntil {!isNull (findDisplay 8700)};
disableSerialization;

WS_filter = ["weapons", "weapons"];
_house = cursorTarget;
_display = findDisplay 8700;

[] call life_fnc_updateLoad;

[(WS_filter select 0)] call life_fnc_updateWeaponStorage;
[(WS_filter select 1)] call life_fnc_updatePlayerGear;



