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

ctrlShow[8651,true]; // cash
ctrlShow[8652,true]; // edit
ctrlShow[8653,true]; // list box
ctrlShow[8654,true]; // deposite     
ctrlShow[8655,false]; // withdraw
ctrlShow[8656,false]; // transfer
    
if((_gang select 3) > 1) then {
    
	ctrlShow[8652,true]; // edit
	ctrlShow[8653,true]; // list box
	ctrlShow[8654,true]; // deposite 
};

if((_gang select 3) > 2) then {
    
    ctrlShow[8655,true]; // withdraw
	ctrlShow[8656,true]; // transfer
};

//ctrlSetText[8606, format ["[%1]", _gang select 1]];

[[player, (_gang select 0), playerSide], "GANG_fnc_queryGangs", false, false] spawn life_fnc_MP;

