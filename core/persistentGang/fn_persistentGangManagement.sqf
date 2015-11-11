/*
	File: fn_persistentGangManagement.sqf
	Author: Mario2002
	
	Description:
	Main initialization for the persistent gang 'management' menu.
*/
private["_group", "_gang", "_owner", "_ownerID", "_dialog", "_members", "_data", "_units", "_gang"];
disableSerialization;

_group = life_persistent_gang;

if(isNull _group) exitWith {closeDialog 0;};

_gang = player getVariable ["persistent_gang", []];
_units = units (group player);
waitUntil {!isNull (findDisplay 8600)};
_dialog = findDisplay 8600;
_members = _dialog displayCtrl 8601;
lbClear _members;

ctrlShow[8602,false];
ctrlShow[8603,false];
ctrlShow[8604,false];
ctrlShow[8605,false];
ctrlShow[8607,false];
ctrlShow[8608,false];
ctrlShow[8609,true];
ctrlShow[10211,false];

if((_gang select 3) > 1) then {
    
	ctrlShow[8603,true]; // kick
	ctrlShow[8604,true]; // invite
};

if((_gang select 3) > 2) then {
    
    ctrlEnable [8609, false];  //leave
    ctrlShow[10211,true]; // captcha
    ctrlShow[8605,true]; // delete
    ctrlEnable [8605, false];  //delete
	ctrlShow[8607,true]; // promote
	ctrlShow[8608,true]; // degrade
};

ctrlSetText[8606, format ["[%1]", _gang select 1]];

[[player, (_gang select 0), playerSide], "GANG_fnc_queryMembers", false, false] spawn life_fnc_MP;

