#include <macro.h>
/*
	File: fn_adminMenu.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Opens the admin menu, sorry nothing special in here. Take a look for yourself.
*/
if(__GETC__(life_adminlevel) == 0) exitWith {closeDialog 0;};

private["_display","_list","_side"];
disableSerialization;
waitUntil {!isNull (findDisplay 2900)};
_display = findDisplay 2900;
_list = _display displayCtrl 2902;
if(__GETC__(life_adminlevel) == 0) exitWith {closeDialog 0;};

//if (getPlayerUID player in["76561198051383457","76561198147698560","76561198129538621","76561198009485143","76561197998842543"]) then
//{
switch(__GETC__(life_adminlevel)) do
{
	case 1: {ctrlShow [2904,false];ctrlShow [2908,false];ctrlShow [2909,false];ctrlShow [2910,false];ctrlShow [2911,false];ctrlShow [2912,false];};
	case 2: {ctrlShow [2904,false];ctrlShow [2908,false];ctrlShow [2909,false];ctrlShow [2910,false];ctrlShow [2911,false];ctrlShow [2912,false];};
	case 3: {ctrlShow [2904,true];ctrlShow [2905,true];ctrlShow [2906,true];ctrlShow [2907,true];ctrlShow [2908,true];ctrlShow [2909,true];ctrlShow [2910,true];ctrlShow [2911,true];ctrlShow [2912,true];ctrlShow [9800,true];};
};
//}else{
//	ctrlShow [2904,false];ctrlShow [2905,false];ctrlShow [2906,false];ctrlShow [2907,false];ctrlShow [2908,false];ctrlShow [2909,false];ctrlShow [2910,false];ctrlShow [2911,false];
//};

//if (getPlayerUID player in["76561198033275427"]) then
//{
//ctrlShow [2904,true];ctrlShow [2905,true];ctrlShow [2906,true];ctrlShow [2907,true];ctrlShow [2908,true];ctrlShow [2909,true];ctrlShow [2910,true];ctrlShow [2911,true];ctrlShow [2912,true];ctrlShow [9800,true];
//};

//Purge List
lbClear _list;

{
	_side = switch(side _x) do {case west: {"CopA"}; case east: {"CopM"}; case civilian : {"Civ"}; case independent : {"Med"}; default {"Unknown"};};
	_list lbAdd format["%1 - %2", _x getVariable["realname",name _x],_side];
	_list lbSetdata [(lbSize _list)-1,str(_x)];
} foreach playableUnits;

if(__GETC__(life_adminlevel) == 0) exitWith {closeDialog 0;};